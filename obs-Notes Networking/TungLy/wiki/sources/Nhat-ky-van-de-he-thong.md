---
type: source
tags:
  - hrm
  - iis
  - sql-server
  - troubleshooting
  - system
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 0. Daily/2026-Apr-17/Nhat-ky-van-de-he-thong.md
related:
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
- "[[wiki/concepts/HRM-Log-Monitoring]]"
- "[[wiki/concepts/HRM-Security-Config]]"
- "[[wiki/concepts/HRM-Network-Check]]"
---

# Nhật Ký Vấn Đề Hệ Thống — FIT-HRM

> Nguồn: `0. Daily/2026-Apr-17/Nhat-ky-van-de-he-thong.md` | 22 vấn đề kỹ thuật hệ thống (Sys000–Sys022)

## Tóm tắt

Tài liệu ghi nhận 22 vấn đề kỹ thuật phát sinh trong quá trình triển khai và vận hành FIT-HRM, được đội SE tích lũy từ 2022–2025. Mỗi vấn đề trình bày theo cấu trúc: Hiện trạng → Nguyên nhân → Phương án. Các vấn đề tập trung vào 4 nhóm chính: IIS/Pool, SQL Server, Log & Monitoring, và Network/Security.

## Key Takeaways

**Nhóm IIS & Pool:**
- `Sys001`: Lỗi 405 → webconfig Main cần xóa dòng sai
- `Sys002`: IIS_IUSRS access denied → cần đặt Anonymous Auth về Application Pool Identity trước khi phân quyền
- `Sys003`: OutOfMemory → `Enable 32-bit Application = false` để dùng đủ RAM 64-bit
- `Sys010`: Lỗi 403.14 sau upbuild → xóa `PrecompiledApp.config` + tất cả thư mục `bin` trước khi giải nén build mới

**Nhóm SQL Server:**
- `Sys005`: Login 500 Sys_GetData/GetEnum → SQL CLR chưa enable + DB chưa TRUSTWORTHY ON
- `Sys014`: Không xóa được Memory Optimized Filegroup → phải drop bảng cache trước (Sys_CacheDataPermission, Sys_TablePermissionCache), sau đó detach → repair → remove filegroup
- `Sys015`: Shrink log DB → cần xóa Memory Optimized Filegroup trước, sau đó SHRINKFILE về 1MB
- `Sys021`: Sysadmin chỉ cần tạm thời (cài đặt/restore) → sau đó thu hồi; vận hành chỉ cần `EXECUTE` trên hàm CLR
- `Sys022`: SQL chậm do MAXDOP=1 → tăng lên 8 nhân

**Nhóm Log & Monitoring:**
- `Sys000`: Toolkit chẩn đoán lỗi: Log Review, Log Request, Event Viewer, IIS Log, Remote Server (lang_vn_spec.xml)
- `Sys006`: Tắt IIS log khi dung lượng quá lớn (sau nhiều năm)
- `Sys007`: Export Event Viewer log về máy để team kỹ thuật kiểm tra offline
- `Sys011`: SQLite.Interop.dll error → cài Visual C++ 2010–2022 (cả x86 + x64)
- `Sys012`: Log request không ghi → stop tất cả pool trước khi upbuild; xóa/backup folder RequestInformation
- `Sys016`: Tự động xóa log sau 30 ngày → dùng Task Scheduler + ForFiles

**Nhóm Network & Security:**
- `Sys004`: Link HRM từ Google Chat bị lỗi → add `AllowOrigin` key vào webconfig
- `Sys008`: Portal login fail → ConnectString Database trong webSettings.json của Portal sai
- `Sys013`: HRM không vào được → `lang_vn.spec.xml` trùng key → dùng tool kiểm tra key trùng
- `Sys017`: Permission cache không refresh → thiếu key `Hrm_APICenter_Web` trong WebSettings.json Main
- `Sys018`: Chẩn đoán mạng → `Test-NetConnection`: DNS, TCP port, local config
- `Sys020`: VnrDecrypt — mật khẩu giải mã nhúng cứng trong DLL, không thể đổi sau khi có dữ liệu
- `App019`: Lỗi loại tài khoản Portal V2 — không fix V2, V3 đã xử lý

## Trích dẫn quan trọng

> Khi upload files với dung lượng lớn sẽ ảnh hưởng hệ thống. Cấu hình `maxRequestLength` trong webConfig không được vượt quá 20MB. (Sys009)

> Mật khẩu được gắn cứng trong DLL và đi theo từng source. Nếu thay đổi mật khẩu thì toàn bộ dữ liệu đã mã hoá trước đó sẽ không còn giải mã được, dẫn đến mất toàn vẹn dữ liệu. (Sys020)

> SQL Server từ phiên bản 2017 trở đi bật mặc định `clr strict security = 1`, yêu cầu mọi assembly phải được ký chứng chỉ tin cậy hoặc được nạp bởi sysadmin. (Sys021)

> Khi MAXDOP = 1, SQL chạy đơn luồng → các truy vấn tổng hợp, JOIN hoặc báo cáo lớn sẽ chạy chậm rõ rệt do không tận dụng được đa nhân CPU. (Sys022)

## Liên kết

- [[wiki/concepts/HRM-IIS-Troubleshooting]] — chi tiết từng lỗi IIS Pool
- [[wiki/concepts/HRM-SQL-Troubleshooting]] — CLR, Memory Optimized, MAXDOP
- [[wiki/concepts/HRM-Log-Monitoring]] — toolkit chẩn đoán, Event Viewer, Task Scheduler
- [[wiki/concepts/HRM-Security-Config]] — VnrDecrypt, AllowOrigin, sysadmin policy
- [[wiki/concepts/HRM-Network-Check]] — Test-NetConnection, webSettings.json
