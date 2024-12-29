

- 0179578: [TB: W26] Lỗi hiển thị alert của trình duyệt khi xuất excel có xem trước [Phát sinh từ task 0178766]
- User superadmin giữa main và portal chỉ cấu hình 1 webSetting.json cho đồnng nhất
- Chức năng tìm kiếm toàn hệ thống gặp lỗi không ra dữ liệu
	- Bước 1: bấm tìm kiếm all
	- Bước 2: chọn dk mã đã tồn tại ở trang 1
	- Bước 3: bấm chọn trang 2 => kết quả không ra dữ liệu
	- Nguyên nhân : khi bấm trang 2 không gọi hàm readgrid('tenGrid')