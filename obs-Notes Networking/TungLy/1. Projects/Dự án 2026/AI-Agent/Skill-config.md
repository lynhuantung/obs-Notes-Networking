
---
description: Use this skill to configure database connection (HrmSqlConnection) across Identity and all WebSettings files in HRM system before running or deploying the application.
---

## Core Domain: Database Configuration (Cấu hình Database)

The Database Configuration Domain is responsible for managing and synchronizing the connection string (`HrmSqlConnection`) across all services in the HRM system when switching environments (DEV, UAT, PROD).

This ensures:
- All services connect to the same database
- No mismatch configuration between Identity, API, and Portal
- System runs correctly after deployment

---

## Key Components

1. **Identity Configuration (appsettings.json)** (Tâm điểm cấu hình)
   - File:  
     `..\Projects\HRM.ServiceCenter\Services\HRM.SC.Service.Identity\appsettings.json`
   - Chứa cấu hình kết nối database cho IdentityServer.
   - Key cần cập nhật:
     ```json
     "HrmSqlConnection"
     ```
   - Password phải theo chuẩn mã hóa của:
     ```
     HRM.SC.NetCore.Utilities.Encryption
     ```
   - Sai cấu hình tại đây sẽ làm:
     - Login fail
     - Token không sinh được
     - Toàn hệ thống không xác thực được

---

2. **Web Configuration (WebSettings.json)** (Các service liên quan)
   - Danh sách file:
     - `..\Presentation\HRM.Presentation.EmpPortal\WebSettings.json`
     - `..\Presentation\HRM.Presentation.Hr.Service\WebSettings.json`
     - `..\Presentation\HRM.Presentation.HrmSystem.Service\WebSettings.json`
     - `..\Presentation\HRM.Presentation.Main\WebSettings.json`
     - `..\Presentation\HRM.SC.Service.Api\WebSettings.json`
   - Key cần cập nhật:
     ```json
     "HrmSqlConnection"
     ```
   - Password sử dụng cơ chế:
     ```
     VnResource.Helper.Data.DataHelper.Decrypt()
     ```
   - Nếu sai:
     - API không connect DB
     - Portal lỗi dữ liệu
     - Service crash

---

3. **Connection String Builder** (Logic cốt lõi)

Format chuẩn:
Data Source={Server};
Initial Catalog={Database};
User ID={UserId};
Password={Password};
TrustServerCertificate=True
Input bắt buộc:
- Server
- Database
- UserId
- Password

---

## Important Context & Rules

- **Phân biệt Encryption (CRITICAL)**:
  - Identity và WebSettings sử dụng 2 cơ chế khác nhau
  - Không được dùng chung
  - Sai → hệ thống không hoạt động

- **Single Source of Truth**:
  - Tất cả service phải dùng cùng 1 connection string
  - Không được lệch database giữa các service

- **Atomic Update**:
  - Phải cập nhật đồng thời tất cả 6 file
  - Tránh trạng thái “nửa hệ thống chạy, nửa không”

---

## Execution Rules

1. Nhận input:
   - Server
   - Database
   - UserId
   - Password

2. Build connection string theo format chuẩn

3. Duyệt toàn bộ file:
   - 1 file Identity
   - 5 file WebSettings

4. Với mỗi file:
   - Load JSON
   - Tìm key `HrmSqlConnection`
   - Replace value
   - Save lại file

5. Nếu file không tồn tại:
   - Bỏ qua an toàn (không throw exception)

---

## Common Issues

- **Sai Password**
  - Nguyên nhân: chưa mã hóa hoặc sai format
  - Hậu quả: không connect DB

- **Sai Encryption Layer**
  - Identity ≠ WebSettings
  - Hậu quả: login fail / API fail

- **Thiếu File**
  - Một số service không deploy
  - Cần skip an toàn

- **Mismatch Database**
  - Các service trỏ DB khác nhau
  - Gây lỗi dữ liệu không đồng bộ

---

## Safety Rules

- Chỉ được update:
HrmSqlConnection

- Không sửa key khác
- Không thay đổi format JSON
- Nên backup trước khi update

---

## Repository hints

- Identity:

HRM.SC.Service.Identity


- Web:

HRM.Presentation.*


- Encryption:

HRM.SC.NetCore.Utilities
HRM.Infrastructure.Utilities


---

## Suggested Usage

Use this skill when:
- Switching database environment
- Deploying new system
- Running local development with new DB
- Fixing connection mismatch issue