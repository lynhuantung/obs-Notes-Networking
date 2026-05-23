---
title: "Phân tích BH: T4 tick cả Thai sản + Nghỉ việc, T5 trống khi NV nghỉ thai sản + nghỉ việc cùng tháng"
date: 2026-05-04
code: case3-ins-thaisaн-nghiviec
domain: ins
module: "InsuranceServices / SetLeave14Days"
tags:
  - "bug-fix"
  - "ins"
  - "thai-san"
  - "nghi-viec"
  - "14-days"
verified: yes
related:
  - "[[wiki/projects/HRM-Insurance]]"
---

# Phân tích BH: T4 tick cả Thai sản + Nghỉ việc, T5 trống khi NV nghỉ thai sản + nghỉ việc cùng tháng

## Tóm tắt

Nhân viên ST1183 nghỉ thai sản đến 19/4/2026, nghỉ việc 20/4/2026. Khi phân tích BH tháng 4/2026, hệ thống tick cả **Nghỉ thai sản** lẫn **Nghỉ việc** (sai — phải chỉ hiện Thai sản). Tháng 5/2026 ra trống (sai — phải hiện Nghỉ việc). Config `IsQuitLeave14Days = true`, ngày nghỉ việc nằm trong tháng, tổng ngày nghỉ ≥ 14.

## Triệu chứng

- T4/2026: phân tích BH hiển thị cả `IsPregnant = true` lẫn `IsQuit = true` trên cùng 1 dòng
- T5/2026: không có dòng phân tích nào cho ST1183 (trống hoàn toàn)

**Kỳ vọng:**
- T4: chỉ `IsPregnant = true` (Thai sản ưu tiên)
- T5: `IsQuit = true` (Nghỉ việc tháng tiếp theo)

## Phân tích nguyên nhân

### Root Cause

Hàm `SetLeave14Days` trong `InsuranceServices.cs` xử lý case ≥ 14 ngày nghỉ: khi `IsQuitLeave14Days = true` và `DateQuit` nằm trong tháng, block này set `IsQuit = true` rồi `continue` — **không kiểm tra `IsPregnant`**, dẫn đến ghi đè trạng thái Thai sản. Đồng thời, không tạo dòng T+1 cho trường hợp Thai sản ưu tiên tháng N, nên T5 ra trống.

### Chuỗi nguyên nhân

```
T4 tick cả 2
  ← SetLeave14Days line ~2590: set IsQuit=true khi ≥14 ngày, không guard IsPregnant
    ← IsPregnant đã được set = true bởi SetIsHaveInsurnceByProfileByMonth (Step 3) trước đó
      ← Logic đúng nhưng Step 4 (SetLeave14Days) ghi đè mà không kiểm tra

T5 trống
  ← Không có block tạo dòng 2 (IsAnalyzeForNextMonth) khi case ≥14 ngày + IsPregnant
    ← Case <14 ngày có tạo dòng 2, nhưng case ≥14 ngày bị continue sớm, bỏ qua hoàn toàn
```

## Giải pháp đã áp dụng

**File:** `HRM12-GIT\Main\Source\Business\HRM.Business.Insurance.Domain\InsuranceServices.cs`

### Edit 1 — Guard IsPregnant tại block ≥14 ngày (~line 2590)

```csharp
// TRƯỚC
if (_IsQuitLeave14Days != null && _IsQuitLeave14Days.Value
    && profile.DateQuit != null
    && _beginMonth <= profile.DateQuit && profile.DateQuit <= _endMonth)
{
    profile.IsDecreaseWorkingDays = null;
    profile.IsQuit = true;
    ...
    continue;
}

// SAU
if (_IsQuitLeave14Days != null && _IsQuitLeave14Days.Value
    && profile.DateQuit != null
    && _beginMonth <= profile.DateQuit && profile.DateQuit <= _endMonth
    && profile.IsPregnant != true) //[Fix Case3]: Thai sản ưu tiên
{
    profile.IsDecreaseWorkingDays = null;
    profile.IsQuit = true;
    ...
    continue;
}
```

### Edit 2 — Tạo dòng T+1 IsQuit khi ≥14 ngày + IsPregnant (sau line ~2642)

```csharp
//[Fix Case3]: Thai sản >= 14 ngày + Nghỉ việc trong tháng
//→ Tháng N: ưu tiên Thai sản; Tháng N+1: tạo dòng IsQuit=true
if (profile.IsPregnant == true
    && _IsQuitLeave14Days != null && _IsQuitLeave14Days.Value
    && profile.DateQuit != null
    && _beginMonth <= profile.DateQuit && profile.DateQuit <= _endMonth)
{
    lock (thisLock)
    {
        var profileNextMonth = profile.CopyData<Ins_AnalyzeInsuranceProfileEntity>();
        profileNextMonth.IsPregnant = false;
        profileNextMonth.IsDecreaseWorkingDays = false;
        profileNextMonth.IsHaveInsSocial = false;
        profileNextMonth.IsHaveInsHealth = HasProfileQuitHealth;
        profileNextMonth.IsHaveInsUnEmp = false;
        profileNextMonth.IsQuit = true;
        profileNextMonth.Status = InsuranceProfileMonthly.E_CONFIRMED.ToString();
        profileNextMonth.IsAnalyzeForNextMonth = true;
        if (!lstProfile.Any(m => m.ID == profileNextMonth.ID
            && m.IsAnalyzeForNextMonth != null
            && m.IsAnalyzeForNextMonth.Value))
        {
            lstProfile.Add(profileNextMonth);
        }
    }
}
```

### Edit 3 — Giữ nguyên IsPregnant tại block <14 ngày (~line 2662)

```csharp
// TRƯỚC
profile.IsPregnant = false;

// SAU
// [Fix Case3]: Giữ nguyên IsPregnant nếu tháng N đang là Thai sản
if (profile.IsPregnant != true)
{
    profile.IsPregnant = false;
}
```

## Kết quả kiểm tra

- Verified: yes
- Test trực tiếp ST1183: T4/2026 → chỉ hiện Thai sản ✅; T5/2026 → hiện Nghỉ việc ✅
- Người dùng xác nhận "đã kiểm tra thấy ổn"

## Bài học / Lưu ý

- **Thứ tự Step 3 → Step 4**: `SetIsHaveInsurnceByProfileByMonth` (Step 3) set `IsPregnant/IsQuit` độc lập. `SetLeave14Days` (Step 4) xử lý 14 ngày — phải **luôn kiểm tra `IsPregnant`** trước khi ghi đè, vì Step 3 chạy trước.
- **`IsQuitLeave14Days` config**: Tại Bitex (`Cat_InsuranceGrade BH-VN`) đang `= false` → logic tạo dòng 2 sẽ không kích hoạt. Cần bật nếu muốn T5 tự sinh dòng Nghỉ việc.
- **Pattern dòng 2 (IsAnalyzeForNextMonth)**: Case ≥14 ngày ban đầu không có block tạo dòng 2 như case <14 ngày — đây là gap thiết kế, cần check tương tự cho các case đặc biệt khác.
- **PriorityPrenancy**: Không cần check `PriorityPrenancy == true` trong guard — chỉ cần `profile.IsPregnant == true` là đủ vì `IsPregnant` đã phản ánh kết quả sau khi PriorityPrenancy được áp dụng.

## Liên kết

- `InsuranceServices.cs` — hàm `SetLeave14Days` (~line 2031), hàm `SetIsHaveInsurnceByProfileByMonth` (~line 1613)
- `Processing14DayDatas` (~line 8922) — Builder pattern gọi `SetLeave14Days`
