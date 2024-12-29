---
aliases: 
date: 2024-08-06
tags:
  - daily
  - "#xoafilegroup"
---

HRM8_Nivea_20141208  (D:\PE-HRM-HCM\MoMo\DB)  => HRM9_MoMo.mdf

FG_MEMORYTABLE (D:\PE-HRM-HCM\MoMo\DB)

HRM8_Nivea_20141208_log (D:\PE-HRM-HCM\MoMo\DB)  => HRM9_MoMo.ldf

![[Pasted image 20240806090219.png]]

### Phương án xóa file group

#### Bước 1: Restore db từ file .bak và kiểm tra có dữ liệu bảng Hre_Profile không?

#### Bước 2: Detach Database

#### Bước 3: Tạo database mới với tên mới : test123

#### Bước 4: Chỉnh sửa thông tin db dẫn đến file mdf,ldf vừa detach

```none
alter database test123 modify file (name='test123' , filename='D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.mdf')
alter database test123 modify file (name='test123_log' , filename='D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.ldf')
```



#### Bước 4.1: restart sql server để cho có dữ liệu bảng Hre_Profile => sau khi có dữ liệu thì tiến hành repair db ở các bước sau.

#### Bước 5: repair db

```none
alter database test123 set emergency
alter database test123 set single_user with ROLLBACK IMMEDIATE;
dbcc checkdb(test123,repair_allow_data_loss)
alter database test123 set multi_user
alter database test123 set online
```

