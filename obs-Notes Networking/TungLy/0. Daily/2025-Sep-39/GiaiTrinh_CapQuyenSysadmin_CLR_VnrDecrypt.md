---
Mã: 25093925-01
aliases:
date: 2025-09-25
time: 10:19
Week: "39"
tags:
  - daily
  - "#security"
Related:
  - "[[Trả lời mã hóa sql]]"
---
### **GIẢI TRÌNH VỀ VIỆC CẤP QUYỀN SYSADMIN TRONG SQL SERVER**

**1. Mục đích:**  
Trong quá trình triển khai hệ thống, một số thao tác kỹ thuật như **bật tính năng CLR**, **tạo Assembly mã hóa dữ liệu**, và **ký xác thực bằng chứng chỉ** yêu cầu thay đổi cấu hình ở **cấp độ máy chủ SQL Server**, không thể thực hiện bằng tài khoản thông thường (`db_owner`).

---

**2. Giai đoạn sử dụng quyền SYSADMIN:**  
Quyền **sysadmin** chỉ được sử dụng trong các trường hợp đặc biệt, cụ thể:

- **Giai đoạn cài đặt hoặc nâng cấp hệ thống:**
    
    - Thực hiện cấu hình server: `sp_configure 'clr enabled'`, `RECONFIGURE`, `CREATE ASSEMBLY`.
        
    - Tạo hoặc ký xác thực chứng chỉ/asymmetric key để đảm bảo an toàn cho assembly.
        
    - Đăng ký và xác nhận hàm mã hóa/giải mã dữ liệu (như `dbo.VnrDecrypt`).
        
- **Giai đoạn khôi phục cơ sở dữ liệu (restore database):**
    
    - Sau khi restore, cần bật lại CLR (`sp_configure 'clr enabled', 1`) và nạp lại assembly để đảm bảo các hàm CLR hoạt động.
        

➡️ **Sau khi các bước trên hoàn tất, quyền sysadmin sẽ được thu hồi.**

---

**3. Giai đoạn vận hành (user thông thường):**

- Sau khi assembly và các hàm CLR đã được tạo và xác thực, người dùng ứng dụng chỉ cần quyền **EXECUTE** để sử dụng các hàm này.
    
- Ví dụ:
    
    ```sql
    GRANT EXECUTE ON dbo.VnrDecrypt TO [AppUser];
    ```
    
- Người dùng thường (không có sysadmin) vẫn có thể truy vấn và sử dụng hàm mã hóa/giải mã bình thường trong các nghiệp vụ hằng ngày.
    

---

**4. Cam kết bảo mật:**  
Chúng tôi cam kết:

- Không cấp quyền sysadmin cho người dùng ứng dụng.
    
- Chỉ cấp quyền sysadmin tạm thời cho tài khoản triển khai trong giai đoạn cài đặt hoặc khôi phục.
    
- Ghi log toàn bộ thao tác có quyền sysadmin và thu hồi ngay sau khi hoàn tất.
    
- Tuân thủ nguyên tắc **“Least Privilege”** (chỉ cấp quyền tối thiểu cần thiết).
    

---

**5. Căn cứ Microsoft Docs:**  
Các yêu cầu kỹ thuật nêu trên được căn cứ theo tài liệu chính thức của Microsoft:

|Chủ đề|Đường dẫn tài liệu Microsoft|
|---|---|
|**CLR strict security** – yêu cầu chứng chỉ tin cậy cho assembly|[https://learn.microsoft.com/en-us/sql/relational-databases/clr-integration/clr-strict-security](https://learn.microsoft.com/en-us/sql/relational-databases/clr-integration/clr-strict-security)|
|**CREATE ASSEMBLY** – quyền yêu cầu khi tạo assembly|[https://learn.microsoft.com/en-us/sql/t-sql/statements/create-assembly-transact-sql](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-assembly-transact-sql)|
|**Server Configuration (sp_configure)** – chỉ sysadmin mới có thể thay đổi|[https://learn.microsoft.com/en-us/sql/database-engine/configure-windows/server-configuration-options-sql-server](https://learn.microsoft.com/en-us/sql/database-engine/configure-windows/server-configuration-options-sql-server)|
|**Principle of Least Privilege** – khuyến nghị cấp quyền tối thiểu|[https://learn.microsoft.com/en-us/sql/relational-databases/security/best-practices-for-securing-sql-server](https://learn.microsoft.com/en-us/sql/relational-databases/security/best-practices-for-securing-sql-server)|
