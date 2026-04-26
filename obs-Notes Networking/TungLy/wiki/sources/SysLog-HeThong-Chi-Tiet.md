---
type: source
tags:
  - iis
  - sql
  - troubleshooting
  - he-thong
  - nhat-ky-van-de
date-ingested: 2026-04-26
category: syslog
project: general
date-updated: 2026-04-26
source-file: 0. Daily/2026-Apr-17/Sys000–Sys022 (23 file)
related:
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
- "[[wiki/concepts/HRM-Log-Monitoring]]"
- "[[wiki/concepts/HRM-Security-Config]]"
- "[[wiki/concepts/HRM-Network-Check]]"
- "[[wiki/concepts/HRM-Deploy-Checklist]]"
---

# SysLog Hệ Thống — Chi Tiết Từng Lỗi (Sys000–Sys022)

> 23 file lỗi hệ thống (IIS/SQL/Log/Network) từ thư mục `0. Daily/2026-Apr-17/`.  
> Mỗi file ghi theo cấu trúc: Vấn đề → Hiện trạng → Nguyên nhân → Phương án.  
> Nguồn gốc tham khảo: Confluence VnResource.

---

## Tóm tắt

Bộ 23 issue log hệ thống ghi lại các lỗi thực tế phát sinh trong quá trình triển khai, vận hành HRM tại khách hàng — từ năm 2022 đến 2026. Bao gồm 3 nhóm chính: **IIS** (quyền, pool, build, upload), **SQL Server** (CLR, memory, log, MAXDOP), và **Log/Monitoring** (Event Viewer, log request, Task Scheduler). Mỗi issue có mã định danh (Sys000–Sys022), ngày phát sinh và liên kết chéo với issue liên quan.

---

## Key Takeaways

- **Sys000** — Checklist chẩn đoán lỗi: Log Review (superadmin), Log Request, Event Viewer, IIS Request (Worker Processes), IIS Log
- **Sys001** — Lỗi 405: do webconfig Main chưa xóa dòng gây block HR Service
- **Sys002** — Không có quyền IIS_IUSRS: copy source từ IIS khác → phải dùng "Application Pool Identity" trong Anonymous Authentication
- **Sys003** — OutOfMemory: "Enable 32 Bit Application = true" giới hạn RAM 4GB → đặt false
- **Sys004** — Link ngoài (Google Chat) bị lỗi răng cưa: thiếu key `AllowOrigin` trong webconfig
- **Sys005** — Login 500 GetEnum/CLR: chưa enable CLR + chưa SET TRUSTWORTHY ON → cần chạy SQL script cài CLR
- **Sys006** — Dung lượng IIS Log quá cao sau 4 năm: vào IIS → Logging → Disable
- **Sys007** — Lấy log Event Viewer: vào Windows Logs\Application → chọn lỗi → Save → gửi bộ phận kỹ thuật
- **Sys008** — Portal không login: ConnectString Database trong webSettings.json của Portal sai (khác với Main)
- **Sys009** — Upload quá 20MB: cấu hình `maxRequestLength` trong webConfig (max 20MB = 20480)
- **Sys010** — Lỗi 403.14 sau upbuild: còn file PrecompiledApp.config cũ → xóa file đó + thư mục bin → giải nén lại
- **Sys011** — Không xem log request (SQLite.Interop.dll): thiếu Visual C++ 2010–2022 (cả X86+X64)
- **Sys012** — Log request không ghi: không stop pool trước khi update build → phải stop pool, cut thư mục RequestInformation ra ngoài, start lại
- **Sys013** — Không vào HRM (lang_vn_spec.xml): trùng key trong file lang → dùng tool kiểm tra key trùng
- **Sys014** — Không xóa được Memory Optimized Filegroup: phải drop table cache (`Sys_CacheDataPermission`, `Sys_TablePermissionCache`) → detach → tạo db mới → chỉnh path → repair → remove filegroup
- **Sys015** — Shrink log database: SET RECOVERY SIMPLE → DBCC SHRINKFILE → SET RECOVERY FULL
- **Sys016** — Log không tự xóa 30 ngày: tạo Task Scheduler dùng ForFiles với `-30` days
- **Sys017** — Portal không nhận key quyền sau phân quyền: thiếu key `Hrm_APICenter_Web` trong webSettings.json của WebMain
- **Sys018** — Kiểm tra kết nối mạng: dùng PowerShell `Test-NetConnection [host] [-Port 80]`
- **App019** — Loại tài khoản portal sai (V2): đã fix trên V3, V2 không hỗ trợ
- **Sys020** — Mật khẩu VnrDecrypt: nhúng cứng trong DLL (SHA2-512), không thể đổi vì sẽ mất dữ liệu đã mã hóa
- **Sys021** — Giải trình SYSADMIN: chỉ cần khi cài/restore (bật CLR, tạo Assembly) → thu hồi ngay sau khi xong; vận hành chỉ cần `EXECUTE`
- **Sys022** — SQL chậm MAXDOP=1: tăng lên 8 bằng `sp_configure 'max degree of parallelism', 8`

---

## Phân loại theo nhóm

### Nhóm IIS (Sys001–Sys004, Sys006, Sys009–Sys013, Sys017)
| Mã | Vấn đề | Giải pháp nhanh |
|----|--------|-----------------|
| Sys001 | Lỗi 405 | Xóa dòng block trong webconfig Main |
| Sys002 | Không có quyền IIS_IUSRS | Application Pool Identity → phân quyền thư mục |
| Sys003 | OutOfMemory | Enable 32 Bit = false |
| Sys004 | Link ngoài bị chặn | Thêm AllowOrigin vào webconfig |
| Sys006 | IIS Log quá lớn | Disable Logging trong IIS |
| Sys009 | Upload > 20MB | maxRequestLength = 20480 |
| Sys010 | 403.14 sau upbuild | Xóa PrecompiledApp.config + bin → giải nén lại |
| Sys011 | Không xem log request | Cài Visual C++ 2010–2022 (X86+X64) |
| Sys012 | Log request không ghi | Stop pool → cut RequestInformation → start lại |
| Sys013 | Lang trùng key | Dùng tool kiểm tra key trùng trong lang_vn_spec.xml |
| Sys017 | Portal không nhận quyền | Thêm Hrm_APICenter_Web vào webSettings.json |

### Nhóm SQL Server (Sys005, Sys014, Sys015, Sys022)
| Mã | Vấn đề | Giải pháp nhanh |
|----|--------|-----------------|
| Sys005 | Login 500 CLR | Enable CLR + SET TRUSTWORTHY ON |
| Sys014 | Memory Optimized Filegroup | Drop cache tables → detach → repair → remove filegroup |
| Sys015 | Log DB quá lớn | RECOVERY SIMPLE → SHRINKFILE → RECOVERY FULL |
| Sys022 | SQL chậm MAXDOP=1 | sp_configure 'max degree of parallelism', 8 |

### Nhóm Security/Config (Sys008, Sys016, Sys018, Sys020, Sys021)
| Mã | Vấn đề | Giải pháp nhanh |
|----|--------|-----------------|
| Sys008 | Portal login sai | Sửa ConnectString trong webSettings.json của Portal |
| Sys016 | Log không xóa 30 ngày | Task Scheduler + ForFiles -30 days |
| Sys018 | Kiểm tra mạng | Test-NetConnection |
| Sys020 | VnrDecrypt | Giữ nguyên — không thể thay đổi |
| Sys021 | Giải trình SYSADMIN | Cấp tạm thời khi cài, thu hồi ngay sau |

---

## Trích dẫn quan trọng

> **Sys021 — Cam kết bảo mật:**  
> "Không cấp quyền sysadmin cho người dùng ứng dụng. Chỉ cấp sysadmin tạm thời cho tài khoản triển khai. Ghi log toàn bộ thao tác và thu hồi sau khi hoàn tất. Tuân thủ nguyên tắc 'Least Privilege'."

> **Sys022 — MAXDOP:**  
> "Khi đặt MAXDOP = 1, SQL sẽ chạy đơn luồng → các truy vấn tổng hợp, JOIN hoặc báo cáo lớn sẽ chạy chậm rõ rệt do không tận dụng được đa nhân CPU."

> **Sys020 — VnrDecrypt:**  
> "Mật khẩu được gắn cứng trong DLL và đi theo từng source. Nếu thay đổi mật khẩu thì toàn bộ dữ liệu đã mã hoá trước đó sẽ không còn giải mã được, dẫn đến mất toàn vẹn dữ liệu."

> **Sys014 — Repair DB:**  
> "dbcc checkdb(...,repair_allow_data_loss): sửa chữa lỗi, có thể gây mất dữ liệu — dùng như biện pháp cuối cùng."

---

## Liên kết

- [[wiki/concepts/HRM-IIS-Troubleshooting]] — Tổng hợp lỗi IIS
- [[wiki/concepts/HRM-SQL-Troubleshooting]] — Tổng hợp lỗi SQL
- [[wiki/concepts/HRM-Log-Monitoring]] — Công cụ chẩn đoán Log
- [[wiki/concepts/HRM-Security-Config]] — Bảo mật cấu hình
- [[wiki/concepts/HRM-Network-Check]] — Kiểm tra mạng
- [[wiki/concepts/HRM-Deploy-Checklist]] — Checklist deploy
- [[wiki/sources/SysLog-NghiepVu-Chi-Tiet]] — 29 lỗi nghiệp vụ SE song hành
