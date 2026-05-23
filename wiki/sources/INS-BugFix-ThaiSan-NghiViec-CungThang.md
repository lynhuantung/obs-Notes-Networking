---
type: source
description: "Bug fix INS: xung đột thứ tự xử lý thai sản và nghỉ việc cùng tháng trong SetLeave14Days."
code: b7ts
domain: ins
tags:
  - "bug-fix"
  - "ins"
  - "thai-san"
  - "nghi-viec"
  - "14-days"
  - "SetLeave14Days"
created: 2026-05-04
updated: 2026-05-04
source-file: "raw/Nghiệp vụ HRM/INS/2026-05-04-phan-tich-bh-thai-san-nghi-viec-cung-thang.md"
related:
  - "[[wiki/bugs/Ins028-thai-san-nghi-viec-cung-thang]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
---

# Source: Bug Fix — Thai sản + Nghỉ việc cùng tháng (T4 tick 2, T5 trống)

## Tóm tắt

Bug fix ngày 2026-05-04 cho case NV nghỉ thai sản đến 19/4/2026, nghỉ việc 20/4/2026. Phân tích BH T4/2026 tick cả `IsPregnant` lẫn `IsQuit` trên 1 dòng (sai); T5/2026 không có dòng nào (sai). Nguyên nhân: hàm `SetLeave14Days` trong `InsuranceServices.cs` set `IsQuit=true` khi `IsQuitLeave14Days=true` + `DateQuit` trong tháng + nghỉ ≥14 ngày, **nhưng không kiểm tra `IsPregnant`**, đồng thời không có block tạo dòng T+1 cho case ≥14 ngày + Thai sản. Fix gồm 3 edit tại hàm `SetLeave14Days`, verified bởi người dùng.

## Key Takeaways

- **Thai sản ưu tiên tuyệt đối trong tháng N**: Khi `IsPregnant = true`, không được set `IsQuit = true` cùng tháng — dù `IsQuitLeave14Days = true` và nghỉ ≥14 ngày.
- **Step 3 → Step 4 không có guard**: `SetIsHaveInsurnceByProfileByMonth` (Step 3) set `IsPregnant/IsQuit` độc lập trước; `SetLeave14Days` (Step 4) không kiểm tra lại `IsPregnant` khi set `IsQuit`, dẫn đến ghi đè.
- **Gap thiết kế — dòng T+1**: Case <14 ngày đã có block tạo `IsAnalyzeForNextMonth`; case ≥14 ngày chưa có — cần bổ sung riêng cho các case đặc biệt.
- **`IsQuitLeave14Days` config**: Tại Bitex (`Cat_InsuranceGrade BH-VN`) = `false` → logic dòng 2 T+1 không kích hoạt. Cần bật để T5 tự sinh dòng Nghỉ việc.
- **`IsPregnant` đã phản ánh PriorityPrenancy**: Không cần check `PriorityPrenancy == true` trong guard — `IsPregnant` đã tổng hợp kết quả sau khi PriorityPrenancy được áp dụng.

## Trích dẫn quan trọng

> **Root cause**: Hàm `SetLeave14Days` xử lý case ≥14 ngày nghỉ: khi `IsQuitLeave14Days = true` và `DateQuit` nằm trong tháng, block này set `IsQuit = true` rồi `continue` — không kiểm tra `IsPregnant`, dẫn đến ghi đè trạng thái Thai sản.

> **Gap**: Case ≥14 ngày ban đầu không có block tạo dòng 2 như case <14 ngày — đây là gap thiết kế, cần check tương tự cho các case đặc biệt khác.

> **Fix Edit 1** (guard ≥14 ngày):
> ```csharp
> && profile.IsPregnant != true) //[Fix Case3]: Thai sản ưu tiên
> ```

> **Fix Edit 2** (tạo dòng T+1):
> ```csharp
> if (profile.IsPregnant == true
>     && _IsQuitLeave14Days != null && _IsQuitLeave14Days.Value
>     && profile.DateQuit != null
>     && _beginMonth <= profile.DateQuit && profile.DateQuit <= _endMonth)
> { // → tạo profileNextMonth với IsQuit=true, IsAnalyzeForNextMonth=true }
> ```

> **Fix Edit 3** (giữ IsPregnant trong block <14 ngày):
> ```csharp
> if (profile.IsPregnant != true) { profile.IsPregnant = false; }
> ```

## Liên kết

- Bug entry: [[wiki/bugs/Ins028-thai-san-nghi-viec-cung-thang]]
- Nghiệp vụ Thai sản: [[wiki/sources/INS-NghiThaiSan]] — rule ON/OFF pivot 14/15
- Nghiệp vụ Nghỉ 14 ngày: [[wiki/sources/INS-Nghi14Ngay]] — 2 chế độ đếm
- Config BH: [[wiki/sources/INS-Config-FAQ]] — `isCheck14dayProfileQuitNextMonth`, `IsQuitLeave14Days`
- Luồng BH hàng tháng: [[wiki/flows/Flow-BaoHiem-Monthly]]
- Bug tương tự (nghỉ 14 ngày tổng ngày = 0): [[wiki/bugs/Ins026-nghi14ngay-total-days-qpvn]]
