---
aliases: 
date: 2024-08-07
tags:
  - daily
  - "#phanquyen"
---
Những phân quyền khác nhau dựa trên nghiệp vụ từng chức năng trong hệ thống quản lý nhân sự. Dưới đây là cách anh có thể tổ chức và hạn chế việc sửa hàm chung phân quyền:

### Phân Quyền Nhân Viên

- **Nghiệp Vụ**: Thấy được danh sách nhân viên có quyền (phòng ban, chức vụ, v.v.).
- **Tần Suất Sử Dụng**: Toàn hệ thống.
- **Output**: List profile IDs.
- **Ghi chú**: Đây là phân quyền chính và áp dụng cho toàn bộ hệ thống.

### Phân Quyền Ứng Viên

- **Nghiệp Vụ**: Thấy được danh sách ứng viên có quyền (phòng ban, chức vụ, v.v.).
- **Tần Suất Sử Dụng**: Vài màn hình ứng viên.
- **Output**: List candidate IDs.
- **Ghi chú**: Đây là nghiệp vụ riêng cho các màn hình liên quan đến ứng viên.

### Phân Quyền Kiêm Nhiệm

- **Nghiệp Vụ**: Thấy được danh sách nhân viên kiêm nhiệm có quyền (công ty).
- **Tần Suất Sử Dụng**: Vài màn hình kiêm nhiệm.
- **Output**: List concurrent job IDs.
- **Ghi chú**: Đây là nghiệp vụ riêng cho các màn hình liên quan đến kiêm nhiệm.

### Phân Quyền Định Biên

- **Nghiệp Vụ**: Thấy được danh sách định biên có quyền (phòng ban, chức vụ, v.v.).
- **Tần Suất Sử Dụng**: Vài màn hình định biên.
- **Output**: List staffing IDs.
- **Ghi chú**: Đây là nghiệp vụ riêng cho các màn hình liên quan đến định biên.

### Phân Quyền Hợp Đồng

- **Nghiệp Vụ**: Thấy được danh sách hợp đồng có quyền (phòng ban, chức vụ, v.v.).
- **Tần Suất Sử Dụng**: Vài màn hình hợp đồng.
- **Output**: List contract IDs.
- **Ghi chú**: Đây là nghiệp vụ riêng cho các màn hình liên quan đến hợp đồng.

### Phân Loại Nghiệp Vụ và Phân Quyền

Các phân quyền trên đa số là nghiệp vụ riêng lẻ và không phải là phân quyền chung cho toàn hệ thống. Do đó, để tránh việc sửa hàm chung phân quyền, có thể tổ chức lại các hàm phân quyền như sau:

1. **Hàm Phân Quyền Chính**:    
    - Đây là hàm chung, chỉ áp dụng cho phân quyền nhân viên toàn hệ thống.
    - Hàm này sẽ kiểm tra quyền truy cập của người dùng trên toàn hệ thống.
2. **Hàm Nghiệp Vụ Riêng**:    
    - Tạo các hàm riêng biệt cho từng nghiệp vụ cụ thể (ứng viên, kiêm nhiệm, định biên, hợp đồng).
    - Các hàm này sẽ được gọi từ các màn hình tương ứng và thực hiện việc kiểm tra quyền truy cập chỉ trong phạm vi của nghiệp vụ đó.

Bên dưới là store phát thảo về lấy dữ liệu quyền theo từng nghiệp vụ
```sql
CREATE PROCEDURE sp_GetPermissionNew
    @UserLogin varchar(50),
    @TableName varchar(50),
    @EntityType NVARCHAR(50), -- Loại nghiệp vụ (Employee, Candidate, ConcurrentJob, Staffing, Contract)    
    
AS
BEGIN
	IF @EntityType = 'Profile'
	BEGIN
			-- Goi store phan quyen cho nhân viên
			-- output : ProfileIds	        
	END
    ELSE IF @EntityType = 'Candidate'
    BEGIN
		-- Goi store phan quyen cho ứng  viên
		-- output : candidateIds
        
    END
    ELSE IF @EntityType = 'ConcurrentJob'
    BEGIN
        -- Goi store phan quyen cho kiêm nhiệm
		-- output : ConcurrentIds
    END    
    ELSE IF @EntityType = 'Contract'
    BEGIN
        -- Goi store phan quyen cho hợp đồng
		-- output : ContractIds
    END
END

```

### Lợi Ích

- **Tách biệt trách nhiệm**: Mỗi hàm sẽ chịu trách nhiệm kiểm tra quyền truy cập cho một nghiệp vụ cụ thể, giảm thiểu sự phức tạp trong hàm phân quyền chính.
- **Dễ bảo trì và mở rộng**: Khi có thay đổi về nghiệp vụ, anh chỉ cần sửa trong hàm nghiệp vụ tương ứng mà không ảnh hưởng đến các phần khác của hệ thống.
- **Tối ưu hóa hiệu suất**: Kiểm tra quyền truy cập chỉ trong phạm vi cần thiết, tránh kiểm tra toàn bộ hệ thống không cần thiết.

### Kết Luận

Bằng cách tổ chức lại hàm phân quyền như trên, có thể hạn chế việc sửa hàm chung phân quyền và giữ cho hệ thống dễ bảo trì và mở rộng. Các phân quyền nghiệp vụ sẽ được tách biệt rõ ràng, giúp  dễ dàng quản lý và kiểm soát quyền truy cập trong hệ thống.

> [!Câu hỏi]
> 
> - đặt ra câu hỏi là có cần thiết phát sinh những nghiệp vụ phân quyền đó không? 
> 
> - Những xử lý đó là phân quyền hay là nghiệp vụ? 
> 
> - Hay do store phân quyền đang nhiều chổ gọi, nên đang quy vô sửa vô đó để sau này khỏi sửa? 
> 
> - Có cần tách biệt những tính năng nào là nghiệp vụ , những tính năng nào là phân quyền




### Liên kết:
[[Phân quyền định biên]]
