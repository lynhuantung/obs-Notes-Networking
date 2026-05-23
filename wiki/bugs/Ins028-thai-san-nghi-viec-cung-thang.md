---
description: "Bug INS028: Nhân viên thai sản và nghỉ việc cùng tháng bị tính sai 14 ngày BH, phân tích và cách xử lý."
type: bug
code: b7ts
status: resolved
tags:
  - "bug"
  - "ins"
  - "thai-san"
  - "nghi-viec"
  - "14-days"
domain: ins
created: 2026-05-04
updated: 2026-05-04
related:
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
  - "[[wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang]]"
---

## Ins028 — T4 tick cả Thai sản + Nghỉ việc, T5 trống (NV nghỉ TS + NV cùng tháng, ≥14 ngày)

- **Status**: `resolved`
- **Date**: 2026-05-04
- **Affected**: `InsuranceServices.cs` → `SetLeave14Days` (~line 2590–2662); NV có Thai sản kết thúc + Nghỉ việc trong cùng tháng, `IsQuitLeave14Days = true`, nghỉ ≥ 14 ngày

### Hiện trạng

**NV ST1183**: Nghỉ thai sản đến 19/4/2026, nghỉ việc 20/4/2026.

- T4/2026: phân tích BH hiển thị cả `IsPregnant = true` lẫn `IsQuit = true` trên cùng 1 dòng ❌
- T5/2026: không có dòng phân tích (trống hoàn toàn) ❌

**Kỳ vọng:**
- T4: chỉ `IsPregnant = true` (Thai sản ưu tiên)
- T5: `IsQuit = true` (Nghỉ việc tháng tiếp theo)

### Nguyên nhân (Root Cause)

**BUG 1 — T4 tick cả 2:**
- `SetIsHaveInsurnceByProfileByMonth` (Step 3) set `IsPregnant = true` đúng
- `SetLeave14Days` (Step 4) — block ≥14 ngày: khi `IsQuitLeave14Days = true` + `DateQuit` trong tháng + nghỉ ≥14 ngày → set `IsQuit = true` rồi `continue` **mà không kiểm tra `IsPregnant`** → ghi đè trạng thái Thai sản

**BUG 2 — T5 trống:**
- Không có block tạo dòng 2 (`IsAnalyzeForNextMonth`) cho case ≥14 ngày + `IsPregnant`
- Case <14 ngày đã có tạo dòng 2 nhưng case ≥14 ngày bị `continue` sớm, bỏ qua hoàn toàn

### Khắc phục

**File:** `HRM12-GIT\Main\Source\Business\HRM.Business.Insurance.Domain\InsuranceServices.cs`

**Edit 1** — Thêm guard `IsPregnant != true` tại block ≥14 ngày (~line 2590):
```csharp
if (_IsQuitLeave14Days != null && _IsQuitLeave14Days.Value
    && profile.DateQuit != null
    && _beginMonth <= profile.DateQuit && profile.DateQuit <= _endMonth
    && profile.IsPregnant != true) //[Fix Case3]: Thai sản ưu tiên
```

**Edit 2** — Thêm block tạo dòng T+1 `IsQuit` khi ≥14 ngày + `IsPregnant` (sau ~line 2642):
```csharp
if (profile.IsPregnant == true
    && _IsQuitLeave14Days != null && _IsQuitLeave14Days.Value
    && profile.DateQuit != null
    && _beginMonth <= profile.DateQuit && profile.DateQuit <= _endMonth)
{
    // CopyData → profileNextMonth với IsQuit=true, IsPregnant=false, IsAnalyzeForNextMonth=true
}
```

**Edit 3** — Wrap `IsPregnant = false` tại block <14 ngày (~line 2662):
```csharp
if (profile.IsPregnant != true) { profile.IsPregnant = false; }
```

### Lưu ý config

- `Cat_InsuranceGrade (BH-VN).IsQuitLeave14Days` tại Bitex = `false` → Edit 2 không kích hoạt. Cần bật để T5 tự sinh dòng Nghỉ việc.

### Phòng tránh

- Khi sửa logic `SetLeave14Days`, **luôn kiểm tra `IsPregnant`** trước khi set `IsQuit` — vì Step 3 đã chạy trước.
- Khi thêm case đặc biệt vào block ≥14 ngày, kiểm tra xem có cần block tạo dòng T+1 không (tương tự pattern case <14 ngày).
- Không cần check `PriorityPrenancy` trong guard — `IsPregnant` đã phản ánh kết quả PriorityPrenancy.

### Links

- RCA chi tiết: [[wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang]]
- Nghiệp vụ Thai sản: [[wiki/sources/INS-NghiThaiSan]]
- Nghiệp vụ Nghỉ 14 ngày: [[wiki/sources/INS-Nghi14Ngay]]
- Config: [[wiki/sources/INS-Config-FAQ]]
- Luồng BH: [[wiki/flows/Flow-BaoHiem-Monthly]]
- Bug tương tự: [[wiki/bugs/Ins026-nghi14ngay-total-days-qpvn]]
