---
title: "[MODIFY] THÊM LƯƠNG CƠ SỞ CỦA HỆ SỐ 3P ( mh Lương cơ bản và Enum trên bảng lương) - Tài liệu PE/CS"
source: "https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=79552700"
created: 2026-05-05
tags:
  - "document"
like: false
---
## Yêu cầu khách hàng (PE)

- Thêm mức lương cơ sơ vào mh DS Lương cơ bản

## Yêu cầu / Đề xuất giải pháp (PE)

- Thêm field trên màn hình tạo mới /chỉnh sửa/ Cột hiện thị: Lương cơ sở load từ DS hệ số lương 3P
- Khi chọn ngày hiệu lực và Bậc lương ở mh Lương cơ bản thì load mức lương cơ sở 3P theo ngày hiệu ngày hiệu lực
- Thêm enum lương: ( 1 tháng chỉ thay đổi lương 1 lần)
	- Lương cơ sở hiệu lực trước thay đổi lương ( đi theo logic lương cơ bản): Liền kề
		- Lương cơ sở hiệu lực sau thay đổi lương ( đi theo logic lương cơ bản): mới nhất trong kỳ lương
- Màn hình: Hệ số lương 3P

![](https://confluence.vnresource.net:18001/download/attachments/79552700/image-2025-10-20_19-24-47.png?version=1&modificationDate=1760963087350&api=v2)

Màn hình: Lương cơ bản

![](https://confluence.vnresource.net:18001/download/attachments/79552700/image-2025-10-22_16-31-56.png?version=1&modificationDate=1761125516738&api=v2)

**Hiện trạng**

- Chưa có

## Thông tin link test(PE)

| **Link main/Portal/QR App nếu có + Tài khoản User/Pass** | **Thông tin Remote + SQL server** |
| --- | --- |
| Main: [https://pvfcco.vnresource.net:6801/](https://pvfcco.vnresource.net:6801/)  Portal: [https://pvfcco.vnresource.net:6802/](https://pvfcco.vnresource.net:6802/)  Super admin: admin / admin@123  User admin: adminSP / 123 | Remote Server: 202.143.111.14:15973  User: vnr / Uj9s^;&#"U/qJcV^  Password: )Wp7G-EXnqA#9nDJ  SQL server: 202.143.111.14,2968  User: sa / mrzDgMm3@#!  Tên DB: HRM\_PVFCCo |

## Testcase(PE)

**Yêu cầu: đã thiết lập**

b1: Mh Lương cơ bản => Tạo mới > Nhân viên HVT0102 >

chọn Ngày hiệu lực tháng 1/10/2025;

loại ngạch lương;

ngach lương C.01 - Chủ tịch HĐQT kiêm Giám đốc Công ty (QL1)

bậc lương 1

load hệ số lương P1: 24.5

b2: Load mức lương cơ sở: 5 000 000  
b3: Lưu thành công

## Quy trình nghiệp vụ (BA)

- Mô tả quy trình, nghiệp vụ khách hàng

| **Bước** | **Người thực hiện** | **Mô tả** |
| --- | --- | --- |
|  |  |  |
|  |  |  |
|  |  |  |
|  |  |  |

(\*): GAP

## User story 1:

### Phân tích (BA)

- **Stament**:
- **Conversation**:
- **AC:**

### Xử lý <SE>

- Thêm Mức lương cơ sở
	- EN: Base Salary
		- Đường dẫn: Lương > Dữ liệu tính lương > Lương cơ bản > Lương cơ bản > Popup Tạo mới/ Cập nhật lương cơ bản
		- Giao diện
![](https://confluence.vnresource.net:18001/download/attachments/79552700/image-2025-10-24_15-20-16.png?version=1&modificationDate=1761294017344&api=v2)
- - - Mô tả Load Mức lương cơ sở theo hiệu lực (Sal\_BaseSalaryEffect. BaseSalary && Sal\_BaseSalaryEffect.Coefficient3PID (readonly) - Hiện tại đã có logic load lên để tính - SE thêm field để lưu)
- Thêm cột hiển thị, Enum xuất BC Excel
	- Đường dẫn: Lương > Dữ liệu tính lương > Lương cơ bản > Lương cơ bản
		- Thêm "Lương cơ sở" cột hiển thị, Enum xuất BC
			- EN: Base Salary
						- Load: Mức lương cơ sở
- Thêm Enum tính lương
	- Đường dẫn: Lương > Cấu hình tính lương > Phần tử lương > Phần tử tính lương
		- Thêm phần tử tính lương:
			- Mức lương có sở sau thay đổi lương
						- \*\*\* Logic:
				- Bước 1: Tìm dòng lương cơ bản theo điều kiện
					- Cùng nhân viên
										- Ngày bắt đầu tháng tính lương <= Ngày hiệu lực <= Ngày cuối tháng tính lương
										- Là dòng có ngày hiệu lực mới nhất
								- Bước 2: Load lên Mức lương cơ sở của dòng ở bước 1. Nếu ko tìm được trả về 0
						- Mức lương cơ sở trước thay đổi lương:
				- Bước 1: Tìm dòng lương cơ bản theo điều kiện
					- Cùng nhân viên
										- Ngày hiệu lực < Ngày bắt đầu tháng tính lương
										- Là dòng có ngày hiệu lực mới nhất
								- Bước 2: Load lên Mức lương cơ sở của dòng ở bước 1. Nếu ko tìm được trả về 0