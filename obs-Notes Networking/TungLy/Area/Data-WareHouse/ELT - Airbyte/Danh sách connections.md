---
aliases: 
date: 2024-11-04
tags:
  - daily
Link: "[[Connection]]"
---
Bên dưới là những thao tác sau khi tạo thành công, để tiến hành đồng bộ bằng tay nếu cần 
# Bước 1: Danh sách connections
Vào airbyte và chọn danh sách connection đã enable
![[Pasted image 20241104140512.png]]

# Bước 2: Đồng bộ data
## Tiến hành đồng bộ
![[Pasted image 20241104140706.png]]
## Nếu đồng bộ thất bại, tiến hành cập nhật token (nếu source là builder gọi từ api)
### Bên dưới là lỗi khi gọi api thất bại do hết hạn token
![[Pasted image 20241104141525.png]]
### Tiến hành gửi token mới 
- Vào trang web api để lấy token
- Sau khi có token sẽ cập nhật vào
	- Vào  check source để cập nhật 
![[Pasted image 20241104141831.png]]
Sau khi test sẽ báo thành công
![[Pasted image 20241104141905.png]]
### Bước 3: Quay lại danh sách connections để tiến hành đồng bộ lại
- Kiểm tra đồng bộ thành công sau khi đã cập nhật token.
![[Pasted image 20241104142121.png]]