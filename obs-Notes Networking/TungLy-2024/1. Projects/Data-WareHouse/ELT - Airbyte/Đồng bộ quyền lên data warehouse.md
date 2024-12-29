---
aliases: 
date: 2024-11-02
tags:
  - daily
---
Bảng so sánh hai giải pháp với thông tin bổ sung về **quyền thay đổi rất thường xuyên**:

| Tiêu chí                                | Giải pháp 1: Đồng bộ quyền sang database đích                            | Giải pháp 2: Chỉ đồng bộ dữ liệu tổng hợp, lấy quyền trực tiếp từ database nguồn của HRM |
| --------------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| **Tính cập nhật của quyền**             | Không thể đảm bảo cập nhật tức thì; có độ trễ do quy trình đồng bộ       | Đảm bảo quyền cập nhật tức thì, vì quyền được lấy trực tiếp từ database nguồn            |
| **Tải ETL và đơn giản hóa**             | Tăng tải cho Airbyte; ETL phức tạp hơn do cần đồng bộ quyền thường xuyên | Giảm tải cho Airbyte; quy trình đồng bộ đơn giản và nhanh hơn                            |
| **Phụ thuộc vào database nguồn**        | Không phụ thuộc; quyền đã có sẵn trong database đích                     | Phụ thuộc vào database nguồn mỗi lần truy vấn; nếu mất kết nối, có thể ảnh hưởng Redash  |
| **Hiệu suất database nguồn**            | Ít ảnh hưởng đến database nguồn do không cần truy vấn liên tục           | Tăng tải cho database nguồn do truy vấn quyền thường xuyên                               |
| **Quản lý quyền thay đổi thường xuyên** | Không tối ưu; khó duy trì dữ liệu quyền chính xác nếu thay đổi liên tục  | Phù hợp; quyền được lấy từ nguồn ngay khi cần, phản ánh chính xác thay đổi               |

### Khuyến nghị:
- **Giải pháp 1**: Phù hợp nếu tần suất thay đổi quyền không quá cao và cần tốc độ truy vấn trong Redash.
- **Giải pháp 2**: **Khuyến nghị sử dụng** vì quyền thay đổi thường xuyên; đảm bảo tính cập nhật và linh hoạt cho hệ thống trực quan hóa trong Redash.


Nếu dùng **Giải pháp 2** , câu lệnh như sau:
```sql
DECLARE @tblPermission TABLE (id uniqueidentifier primary key )
INSERT INTO @tblPermission EXEC [HRM12_ITL].dbo.Get_Data_Permission_New 'vnr','Hre_Profile';
select * from @tblPermission
```

![[Pasted image 20241102101741.png]]