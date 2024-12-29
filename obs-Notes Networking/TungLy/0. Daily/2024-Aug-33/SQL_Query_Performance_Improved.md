---
aliases: 
date: 2024-08-17
tags:
  - daily
---

> [!Tóm tắt 5 Ý chính]
> 
> 1. **Thời gian xử lý (SQL Server Execution Times):** Giảm đáng kể sau khi refactor.
> 2. **Đọc ghi I/O (SQL Server I/O Statistics):** Giảm lượt đọc logic trên các bảng quan trọng sau khi refactor.
> 3. **Tối ưu hóa hiệu suất truy vấn:** Việc refactor đã dẫn đến thời gian xử lý và lượt đọc I/O giảm.
> 4. **SQL Server Execution Times**:
> 5. **SQL Server I/O Statistics:** 
>  --- 

### 1. **Thời gian xử lý (SQL Server Execution Times):**

#### **Trước khi refactor:**

- **Thời gian xử lý tổng cộng:**
    
    - CPU time = 38.750 ms
    - Elapsed time = 39.897 ms
    
    Đáng chú ý là có một số lượng lớn các câu lệnh với thời gian xử lý bằng 0 ms, tuy nhiên, một số câu lệnh cuối cùng có thời gian xử lý đáng kể, dẫn đến tổng thời gian CPU là 38.750 ms và tổng thời gian thực tế (elapsed time) là 39.897 ms​.
    

#### **Sau khi refactor:**

- **Thời gian xử lý tổng cộng:**
    
    - CPU time = 672 ms
    - Elapsed time = 425 ms
    
    Thời gian CPU và elapsed time đã giảm đáng kể sau khi refactor, chỉ còn 672 ms và 425 ms tương ứng. Điều này cho thấy sự cải thiện rõ rệt về hiệu suất xử lý​.
    

### 2. **Đọc ghi I/O (SQL Server I/O Statistics):**

#### **Trước khi refactor:**

- **Sys_AllSetting:** 199 logical reads
    
- **Worktable:** 3987 logical reads
    
- **Sys_UserMasterData:** 4 logical reads
    
- **Cat_MasterDataGroupItem:** 1540 logical reads
    
- **Cat_MasterDataGroup:** 60 logical reads
    
- **Sys_CategoryPermission:** 3 logical reads
    
    Tổng cộng có nhiều lượt đọc logic, đặc biệt là trên bảng tạm "Worktable" với 3987 lượt đọc logic​.
    

#### **Sau khi refactor:**

- **Sys_AllSetting:** 159 logical reads (giảm so với trước đó)
    
- **Sys_UserMasterData:** 40 logical reads (tăng so với trước đó)
    
- **Cat_MasterDataGroupItem:** 77 logical reads (giảm so với trước đó)
    
- **Cat_MasterDataGroup:** 3 logical reads (giảm so với trước đó)
    
- **Sys_CategoryPermission:** 3 logical reads (không đổi)
    
- **#MasterDataGroupItems:** 207 logical reads
    
    Sau khi refactor, số lượt đọc logic tổng thể đã giảm, đặc biệt là trên bảng "Sys_AllSetting" và "Cat_MasterDataGroupItem". Điều này cho thấy rằng việc refactor đã tối ưu hóa đáng kể việc truy xuất dữ liệu, làm giảm tải đọc ghi I/O​.
    

### **Tổng kết:**

Việc refactor đã giúp giảm thời gian xử lý tổng thể và cải thiện hiệu suất I/O. Điều này được thể hiện rõ ràng qua thời gian CPU và thời gian thực tế giảm, cùng với số lượng lượt đọc logic giảm đáng kể trên các bảng quan trọng trong truy vấn. Điều này chứng tỏ rằng việc tái cấu trúc mã đã thành công trong việc tối ưu hóa hiệu suất của truy vấn SQL.

### Phương pháp ghi nhận thời gian và đọc ghi I/O trong sql
#### 1. Thống kê thời gian
```sql
set statistics time on
-- xu lý store
set statistics time off
```

#### 2. Thống kê đọc ghi I/O

```sql
set statistics io on
-- xu lý store
set statistics io off
```
