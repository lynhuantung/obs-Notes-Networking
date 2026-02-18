---
title: "Modify [Bitex-AKW21] - REC Thêm logic và cột tại Định biên nhân sự và Định biên nhân sự chờ duyệt Portal v3 - Tài liệu PE/CS - Confluence"
source: "https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=75340563"
created: 2025-10-03
tags:
  - "clippings"
like: false
---
<span style="float: right; color: #757575; font-size: 14px;">Fri 03/10/2025 08:51</span>
# Modify [Bitex-AKW21] - REC Thêm logic và cột tại Định biên nhân sự và Định biên nhân sự chờ duyệt Portal v3 - Tài liệu PE/CS - Confluence
---

## Tổng quan

Cập nhật chức năng định biên nhân sự và phê duyệt định biên nhân sự trên Portal v3 để đáp ứng các yêu cầu mới từ phía khách hàng, bao gồm việc thêm các cột tính toán mới, khả năng chỉnh sửa hàng loạt, xuất Excel tùy chỉnh và quyền xem dữ liệu. 

## Mục đích

- Tối ưu hóa quy trình quản lý định biên nhân sự.
- Nâng cao khả năng theo dõi và phân tích dữ liệu định biên.
- Cung cấp công cụ linh hoạt cho người dùng trong việc quản lý và phê duyệt.

## Nội dung chi tiết

### 1. Cập nhật màn hình \\"Định biên nhân sự\\" (Portal v3)

- **Thêm các cột mới:**
  - `Định biên năm cũ`: Người dùng nhập tay khi thêm mới.
  - `Tổng định biên`: `Hiện hữu` + Sum(`T1` đến `T12`).
  - `Tăng/ giảm`: `Tổng định biên` - `Hiện hữu`.
  - `Tăng/ giảm năm cũ`: `Tổng định biên` - `Định biên năm cũ`.
- **Logic tính cột Hiện hữu:** Sao chép logic tính cột HH trên Main.
- **Chức năng Export Excel:** Cho phép tạo mẫu và cấu hình template.
- **Thêm key quyền:** Admin có thể xem tất cả dữ liệu của các phòng ban.
- **Phân tích HC:** Tích hợp nút \\"Phân tích HC\\" với các bộ lọc theo năm, kỳ định biên, phòng ban, chức danh, chức vụ.
- **Lưu trữ và Gửi yêu cầu:** Hỗ trợ lưu tạm và lưu & gửi yêu cầu, gọi mẫu mail tương ứng.

### 2. Cập nhật màn hình \\"Duyệt Định biên nhân sự\\" (Portal v3)

- **Chia 3 Tab:** Chờ duyệt, Đã duyệt, Từ chối.
- **Load lưới:** Bao gồm các cột tương tự màn hình \\"Định biên nhân sự\\" và thêm các cột chi tiết phê duyệt/từ chối.
- **Chức năng Export Excel:** Cho phép tạo mẫu và cấu hình template.
- **Khả năng chỉnh sửa hàng loạt:** Cho phép chỉnh sửa dữ liệu ngoài lưới và lưu vết kết quả cũ.
- **Thêm nút \\"Xuất Excel\\":** Cho phép tạo mẫu và cấu hình template.
- **Thêm logic cột `Total`:** Lấy cột `SL hiện hữu` + 12 tháng định biên.
- **Thêm cột `Định biên năm cũ`.
- **Thêm cột `Tăng/ giảm`:** `Total` - `Hiện hữu`.
- **Thêm cột `Tăng/ giảm năm cũ`:** `Total` - `Định biên năm cũ`.
- **Nút bấm:** Duyệt tất cả/Từ chối tất cả, Duyệt/Từ chối.
- **Quy trình xử lý:** Cập nhật trạng thái, lưu người duyệt/từ chối, ghi chú, gọi mẫu mail.

### 3. Chức năng \\"Xem thêm\\" (trong nút 3 chấm)

- **Chỉnh sửa:** Cho phép chỉnh sửa dữ liệu (T1-T12) trên lưới và lưu lại lịch sử thay đổi.
- **Sao chép:** Tự động sao chép giá trị điều chỉnh cho các cột tháng tiếp theo.
- **Lịch sử thay đổi:** Hiển thị lịch sử chỉnh sửa chi tiết theo thời gian, bao gồm lý do thay đổi.

<p align="right"><a href="https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=75340563">Nguồn</a></p> 

# Câu hỏi suy ngẫm
---
- Liệu việc cho phép người dùng chỉnh sửa dữ liệu định biên nhân sự trực tiếp trên lưới màn hình phê duyệt có tiềm ẩn rủi ro sai sót hoặc thao túng dữ liệu hay không, và làm thế nào để giảm thiểu rủi ro này?
- Làm thế nào để đảm bảo tính nhất quán và chính xác của dữ liệu định biên nhân sự giữa các màn hình \\"Định biên nhân sự\
