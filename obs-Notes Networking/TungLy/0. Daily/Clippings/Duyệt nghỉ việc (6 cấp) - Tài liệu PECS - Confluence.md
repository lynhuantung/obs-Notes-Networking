---
title: "Duyệt nghỉ việc (6 cấp) - Tài liệu PE/CS - Confluence"
source: "https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=72680778"
created: 2025-08-22
tags:
  - "clippings"
like: false
---
<span style="float: right; color: #757575; font-size: 14px;">Fri 22/08/2025 09:55</span>
# Duyệt nghỉ việc (6 cấp) - Tài liệu PE/CS - Confluence
---
<p align="right"><a href="https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=72680778">Nguồn</a></p> 

**Tổng quan:**
Trang tài liệu mô tả các thay đổi liên quan đến quy trình duyệt nghỉ việc, bao gồm thêm cấp duyệt (5, 6) và các trường liên quan trên các giao diện khác nhau (chế độ duyệt, danh sách đăng ký nghỉ việc, portal, app), cũng như cập nhật mẫu gửi mail.

**Mục đích:**
Cập nhật hệ thống để hỗ trợ thêm hai cấp duyệt mới vào quy trình duyệt nghỉ việc, đảm bảo tính linh hoạt và đầy đủ thông tin.

**Nội dung chi tiết:**
*   **Thêm trường và enum:** Bảng Hre\_StopWorking được thêm các trường thông tin về người duyệt và ghi chú phê duyệt cho cấp 5 và 6. Enum trạng thái duyệt cũng được bổ sung.
*   **Chế độ duyệt:** Thêm cấu hình cho người duyệt 5, 6 tương tự như người duyệt 4.
*   **Giao diện:**
    *   **DS đăng ký nghỉ việc:** Thêm trường người duyệt 5, 6, ghi chú phê duyệt 5, 6 và xử lý logic ẩn hiện theo cấu hình.
    *   **Portal:**
        *   **Đăng ký nghỉ việc:** Thêm trường người duyệt 5, xử lý logic ẩn hiện.
        *   **Duyệt nghỉ việc:** Thêm cột thông tin người duyệt 5, ghi chú phê duyệt 5. Xử lý duyệt và nhập ghi chú phê duyệt.
    *   **App:** Tương tự Portal.
*   **Mẫu gửi mail:** Cập nhật enum trong mẫu gửi mail để bao gồm thông tin người duyệt và ghi chú phê duyệt 5, 6.

**Kết luận:**
Các thay đổi này mở rộng quy trình duyệt nghỉ việc bằng cách thêm hai cấp duyệt mới, đồng thời cập nhật các giao diện và chức năng liên quan để đảm bảo tính nhất quán và đầy đủ thông tin.

# Câu hỏi suy ngẫm
---
- Nếu mục đích cốt lõi của việc thêm hai cấp duyệt mới là gì, và có phương án nào khác hiệu quả hơn để đạt được mục đích đó không?
- Giả sử không có bất kỳ ràng buộc kỹ thuật hay quy trình nào, cách lý tưởng nhất để quản lý và theo dõi quá trình phê duyệt nghỉ việc sẽ như thế nào?

