---
Mã: "25114505-01"
aliases: 
date: "2025-11-05"
time: "17:34"
Week: "45"
tags:
  - daily
---

## 🧠 I. PHÂN TÍCH LUỒNG TRUY VẤN CHÍNH

### 1️⃣ Đầu tiên: các bảng chính truy cập nhiều nhất

|Bảng|Vai trò|Cách lọc|
|---|---|---|
|`Sys_UserInfo`|Xác định user hiện tại (`UserLogin = @UserName`)|`WHERE UserLogin = @UserName AND IsDelete IS NULL`|
|`Sys_DataPermission`|Bảng quyền dữ liệu|`WHERE IsDelete IS NULL AND UserID = sui.ID`|
|`Sys_GroupPermission2`|Gắn quyền theo nhóm|`WHERE GroupID = sdp.GroupID AND PrivilegeNumber > 0 AND IsDelete IS NULL`|
|`Sys_Resource`|Tên resource (module / màn hình)|`WHERE ResourceName = @ObjName AND IsDelete IS NULL`|
|`Hre_Profile`|Bảng nhân viên (bảng cực lớn)|`WHERE IsDelete IS NULL AND StatusSyn IN (...)` + JOIN các Cat_*|
|`Cat_*` (OrgStructure, Position, EmployeeType...)|Danh mục|`JOIN ... ON hp.xxxID = cat.xxx.ID` + `cat.IsDelete IS NULL`|

---

## 🧩 II. ĐỀ XUẤT INDEX TỐI ƯU THEO MỖI BẢNG

---

### 🏷️ **1. Bảng `Sys_UserInfo`**

**Truy vấn:**

```sql
WHERE UserLogin = @UserName AND IsDelete IS NULL
```

✅ **Đánh index:**

```sql
CREATE NONCLUSTERED INDEX IX_Sys_UserInfo_UserLogin
ON dbo.Sys_UserInfo (UserLogin)
INCLUDE (ID, ProfileID)
WHERE IsDelete IS NULL;
```

→ giúp lọc nhanh theo `UserLogin` (thay vì full scan).

---

### 🧱 **2. Bảng `Sys_DataPermission`**

**Truy vấn:**

```sql
WHERE UserID = sui.ID AND IsDelete IS NULL
```

✅ **Đánh index:**

```sql
CREATE NONCLUSTERED INDEX IX_Sys_DataPermission_UserID
ON dbo.Sys_DataPermission (UserID)
INCLUDE (GroupID, OrgStructure, EmployeeType, Position, JobTitle, Company)
WHERE IsDelete IS NULL;
```

→ giảm mạnh chi phí khi join lấy các quyền dữ liệu.

---

### 🧱 **3. Bảng `Sys_GroupPermission2`**

**Truy vấn:**

```sql
WHERE GroupID = sdp.GroupID AND PrivilegeNumber > 0 AND IsDelete IS NULL
```

✅ **Đánh index:**

```sql
CREATE NONCLUSTERED INDEX IX_Sys_GroupPermission2_Group_Privilege
ON dbo.Sys_GroupPermission2 (GroupID, PrivilegeNumber)
INCLUDE (ResourceID)
WHERE IsDelete IS NULL;
```

---

### 🧱 **4. Bảng `Sys_Resource`**

**Truy vấn:**

```sql
WHERE ResourceName = @ObjName AND IsDelete IS NULL
```

✅ **Đánh index:**

```sql
CREATE NONCLUSTERED INDEX IX_Sys_Resource_ResourceName
ON dbo.Sys_Resource (ResourceName)
WHERE IsDelete IS NULL;
```

---

### 🧱 **5. Bảng `Hre_Profile`**

Đây là bảng **nặng nhất** — được join nhiều nơi và có WHERE động:

```sql
WHERE hp.IsDelete IS NULL
  AND hp.StatusSyn IN ('E_HIRE', 'E_LONG_SUSPENSE', ... )
  [AND hp.DateQuit >= ...]
```

✅ **Đánh index 1 — lọc nhân viên đang hoạt động:**

```sql
CREATE NONCLUSTERED INDEX IX_Hre_Profile_IsDelete_StatusSyn
ON dbo.Hre_Profile (IsDelete, StatusSyn)
INCLUDE (DateQuit, OrgStructureID, EmpTypeID, EmployeeGroupID, WorkPlaceID, PositionID, JobTitleID);
```

✅ **Đánh index 2 — lọc theo `DateQuit` (nếu @Days hoặc @TypeAction dùng nhiều):**

```sql
CREATE NONCLUSTERED INDEX IX_Hre_Profile_DateQuit
ON dbo.Hre_Profile (DateQuit)
INCLUDE (StatusSyn, IsDelete);
```

---

### 🧱 **6. Bảng `Cat_OrgStructure`, `Cat_Position`, `Cat_EmployeeType`, ...**

Store luôn join với điều kiện:

```sql
AND cat.IsDelete IS NULL
AND CHARINDEX(',' + CONVERT(NVARCHAR(20), cat.OrderNumber) + ',', ',' + @Param + ',') > 0
```

⚠️ Vì `CHARINDEX()` không thể dùng index, nhưng bạn vẫn nên có index để tránh full table scan.

✅ **Đánh index gợi ý (mẫu chung):**

```sql
CREATE NONCLUSTERED INDEX IX_Cat_OrgStructure_OrderNumber
ON dbo.Cat_OrgStructure (OrderNumber)
WHERE IsDelete IS NULL;
```

Tương tự cho các bảng:

- `Cat_EmployeeType(OrderNumber)`
    
- `Cat_Position(OrderNumber)`
    
- `Cat_JobTitle(OrderNumber)`
    
- `Cat_Country(OrderNumber)`
    
- `Cat_SalaryClass(OrderNumber)`
    
- `Cat_PayrollGroup(OrderNumber)`
    
- `Cat_UnitStructure(OrderNumber)`
    
- `Cat_Company(OrderNumber)`
    

---

## ⚙️ III. TỔNG HỢP CÁC INDEX QUAN TRỌNG NHẤT

|STT|Bảng|Index đề xuất|Mục tiêu|
|---|---|---|---|
|1|`Sys_UserInfo`|`(UserLogin)` INCLUDE (ID, ProfileID)|Tìm user nhanh|
|2|`Sys_DataPermission`|`(UserID)` INCLUDE (GroupID, OrgStructure, ...)|Lọc quyền|
|3|`Sys_GroupPermission2`|`(GroupID, PrivilegeNumber)`|Join group–permission|
|4|`Sys_Resource`|`(ResourceName)`|Xác định resource|
|5|`Hre_Profile`|`(IsDelete, StatusSyn)` INCLUDE (DateQuit, OrgStructureID, ...)|Lọc nhân viên đang làm việc|
|6|`Hre_Profile`|`(DateQuit)` INCLUDE (StatusSyn, IsDelete)|Lọc theo thời gian nghỉ|
|7|`Cat_*`|`(OrderNumber)` WHERE IsDelete IS NULL|Join danh mục nhanh|

---

## 🧮 IV. Kiểm tra sau khi tạo index

Sau khi tạo xong, chạy:

```sql
SET STATISTICS IO ON;
EXEC Get_Data_Permission_New @UserName = 'abc', @ObjName = 'Hre_Profile';
```

→ So sánh “logical reads” **trước và sau khi đánh index** — bạn sẽ thấy giảm đáng kể.

---

## ✅ TÓM TẮT

- Ưu tiên index cho **các bảng nhỏ**: `Sys_*`, `Cat_*`
    
- Index tập trung **lọc dữ liệu lớn**: `Hre_Profile`
    
- Không index trên **bảng tạm** (`@TabPermission`, `@TabGroupID`) vì chỉ nằm trong RAM
    
- Sau khi đánh index, nên **rebuild định kỳ** (hàng tuần)
    

---

Nếu bạn muốn, mình có thể viết cho bạn **script auto-generate toàn bộ index này (có check tồn tại trước)** để bạn chạy 1 lần, không bị lỗi “index already exists”.  
Bạn muốn mình tạo luôn không?