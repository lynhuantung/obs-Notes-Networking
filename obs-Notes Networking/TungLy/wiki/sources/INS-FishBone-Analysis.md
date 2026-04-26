---
type: source
tags:
  - bao-hiem
  - fishbone
  - root-cause-analysis
  - 4M
  - troubleshooting
  - phan-tich-nguyen-nhan
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/FishBone_PTBH.png + 4M_FishBone.png + TruyNguyenNhan.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/sources/INS-InsurancePayback]]"
  - "[[wiki/sources/INS-InsuranceRecordDayCount]]"
  - "[[wiki/sources/INS-iBHXH-Analyze]]"
  - "[[wiki/concepts/HRM-Log-Monitoring]]"
---

# INS — Phân Tích Nguyên Nhân Gốc Rễ Lỗi Bảo Hiểm (FishBone & 4M)

## Tóm tắt

Ba tài liệu `FishBone_PTBH.png`, `4M_FishBone.png`, và `TruyNguyenNhan.png` tạo thành một bộ công cụ phân tích nguyên nhân gốc rễ (Root Cause Analysis — RCA) cho các lỗi trong phân hệ Bảo hiểm HRM. FishBone (xương cá) theo framework 4M (Man, Machine, Method, Material) giúp hệ thống hóa mọi nguyên nhân tiềm ẩn, còn `TruyNguyenNhan` là sơ đồ truy vết từng lỗi cụ thể về đến nguyên nhân gốc.

## Key Takeaways

### Framework FishBone 4M cho BH HRM

**Đầu cá (Effect/Vấn đề)**: Số liệu BH trên hệ thống sai / D02 bị từ chối / C70 không cân

**Xương cá 1 — Man (Con người)**:
- Kế toán nhập sai mức lương đóng BH
- SE hiểu sai nghiệp vụ (tháng tham gia, tháng hoàn trả)
- BA đặc tả thiếu edge case (sinh đôi, nghỉ giữa tháng)
- Người dùng không cập nhật biến động nhân sự kịp thời

**Xương cá 2 — Machine (Hệ thống)**:
- Logic `InsuranceMonthJoin` sai → tính sai tháng
- `InsuranceRecordDayCount` overflow khi có overlap bản ghi
- Cắt bản ghi BH khi nhân viên nghỉ ốm/thai sản → sai hoàn toàn
- Lỗi transaction khi rollback hoàn trả nhiều tháng

**Xương cá 3 — Method (Quy trình)**:
- Không có checklist kiểm tra D02 trước khi upload iBHXH
- Không đối soát C70 vs D02 trước khi chốt bảng lương
- Không có quy trình xử lý khi iBHXH từ chối hồ sơ
- Thiếu test case cho các trường hợp biên (vào/ra ngày 1, ngày cuối tháng)

**Xương cá 4 — Material (Dữ liệu)**:
- Mã số BHXH nhân viên nhập sai / không khớp cơ sở BHXH
- Ngày sinh, họ tên không khớp với hồ sơ BHXH
- Mức lương đóng BH không cập nhật khi tăng lương
- Lịch sử bản ghi BH có khoảng trống / overlap

### TruyNguyenNhan — Phương pháp 5 Whys

Sơ đồ `TruyNguyenNhan` áp dụng **5 Whys** cho một lỗi điển hình:

```
Vấn đề: D02 bị từ chối bởi iBHXH
  → Why 1: Mã số BHXH nhân viên sai
    → Why 2: Kế toán nhập từ hồ sơ giấy cũ
      → Why 3: Không có quy trình verify mã BHXH khi onboard
        → Why 4: HRM không tích hợp với cơ sở dữ liệu BHXH để validate real-time
          → Why 5 (Root): Không có API lookup mã BHXH từ cơ quan BHXH
```

**Root cause**: Thiếu cơ chế validation mã BHXH tự động → giải pháp: lookup API hoặc import từ file BHXH cung cấp.

## Trích dẫn quan trọng

> FishBone không phải để đổ lỗi — mà để tìm đúng chỗ cần fix trong hệ thống.

> 4M giúp phân loại: nếu nguyên nhân là "Man" → cần training; "Machine" → cần fix code; "Method" → cần thêm checklist; "Material" → cần clean dữ liệu.

> 5 Whys: dừng lại khi câu trả lời đã actionable — "không có API" là root cause, không cần hỏi thêm why.

## Bảng tóm tắt lỗi → nguyên nhân → giải pháp

| Lỗi | Nguyên nhân (RCA) | Giải pháp |
|-----|-------------------|-----------|
| Tính sai tháng BH | `InsuranceMonthJoin` logic sai | Fix unit test + code |
| D02 sai số | C70 không đối soát trước upload | Thêm bước validate |
| Bản ghi BH bị cắt khi nghỉ ốm | Hiểu sai nghiệp vụ | Fix logic + BA review |
| iBHXH từ chối | Mã BHXH sai | Thêm validation nhập liệu |
| Hoàn trả sai số | Không rollback đúng transaction | Fix transaction scope |

## Liên kết

- [[wiki/sources/INS-InsuranceMonthJoin]] — Lỗi logic xác định tháng (Machine)
- [[wiki/sources/INS-InsuranceRecordDayCount]] — Lỗi đếm ngày (Machine)
- [[wiki/sources/INS-InsurancePayback]] — Lỗi hoàn trả (Machine + Method)
- [[wiki/sources/INS-iBHXH-Analyze]] — Lỗi tích hợp iBHXH (Material + Machine)
- [[wiki/concepts/HRM-Log-Monitoring]] — Toolkit chẩn đoán lỗi hệ thống
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
