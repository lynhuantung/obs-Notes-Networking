---
type: source
tags:
  - system
  - kiem-nhiem
  - phan-quyen
  - ltg
  - meeting
  - archived-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "1. Projects/LTG/H-LTG-SYS-290724.md + Leader_Meeting/H-LTG-SYS-310724.md"
related:
  - "[[wiki/entities/LTG]]"
  - "[[wiki/projects/LTG-Project]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
description: "Biên bản 2 cuộc họp hệ thống LTG 07/2024: nghiệp vụ kiêm nhiệm đa pháp nhân và mở rộng hàm phân quyền core."
---

# LTG — Họp Hệ Thống: Kiêm Nhiệm Đa Pháp Nhân (07/2024)

## Tóm tắt

2 biên bản họp kỹ thuật về nghiệp vụ **kiêm nhiệm đa pháp nhân** — yêu cầu đặc thù của LTG Group. Một nhân viên có thể làm việc đồng thời tại nhiều công ty con trong group, mỗi công ty có phụ cấp và quyền riêng. Đây là thách thức kỹ thuật phức tạp cần mở rộng hàm phân quyền core.

**Họp 29/07/2024** — TungLy, NganNguyen, TienDang, BaoTran
**Họp 31/07/2024** — TungLy, SonVo, TungTran, TinNguyen, BaoTran, HienPham, NganNguyen, TienDang

## Key Takeaways

### Nghiệp vụ kiêm nhiệm
- 1 profile nhân viên — kiêm nhiệm tại nhiều pháp nhân (công ty con khác nhau)
- VD: 10 phụ cấp tổng, 3 phụ cấp công ty 1, 7 phụ cấp công ty 2
- Dữ liệu có 2 loại: **dùng chung** (toàn group) và **dùng riêng** (từng pháp nhân)

### Kịch bản tạo hợp đồng kiêm nhiệm
1. Tạo mới HĐ → bắt buộc chọn pháp nhân (nếu 1 pháp nhân: auto load; nếu nhiều: user chọn)
2. Xét kiêm nhiệm theo 2 điều kiện: phân quyền (*) + nhân viên (**)
3. Lấy QTCT theo pháp nhân có hiệu lực → lưu xuống bảng chính
4. Hàm phân quyền đọc từ bảng chính HĐ, không đọc qua profile

### Giải pháp kỹ thuật — Store mới
- **Giải pháp chốt**: Join 2 lần (không join 1 lần):
```sql
SELECT * FROM Sal_BasicSalary sb 
  JOIN Get_Data_Permission_New p ON p.id = sb.ProfileID
  JOIN Get_Data_PermissionConCurrent_New kp ON kp.id = sb.CompanyID
```
- Viết store mới: `Get_Data_PermissionConCurrent_New(UserLogin, TableName)` → trả ra danh sách CompanyID
- Sửa `Get_Data_Permission_New()` → nếu có cấu hình kiêm nhiệm: union thêm danh sách profileID kiêm nhiệm
- **Lưu ý**: Chỉ apply cho một số nghiệp vụ cần thiết, không apply toàn bộ

### Cấu hình
- Thêm cấu hình xử lý kiêm nhiệm vào **Cấu hình chung** hệ thống

## Trích dẫn quan trọng

> "Get_Permission_New(userLogin, TableName) => trả ra danh sách ProfileID có quyền. Mong muốn: trả ra danh sách ProfileID của bảng cần check VÀ profileID của bảng kiêm nhiệm"

> "Chỉ apply 1 số nghiệp vụ cần (ko apply tất cả nghiệp vụ)"

## Bài học

- Kiêm nhiệm đa pháp nhân là pattern đặc thù của tập đoàn lớn — cần hỏi sớm về cấu trúc pháp nhân ngay từ đầu dự án
- Mở rộng hàm phân quyền core (`Get_Data_Permission_New`) là thay đổi ảnh hưởng rộng — cần kiểm tra kỹ tất cả store đang dùng hàm này

## Liên kết

- [[wiki/entities/LTG]]
- [[wiki/concepts/HRM-Security-Config]]
- [[wiki/concepts/HRM-SQL-Troubleshooting]]
