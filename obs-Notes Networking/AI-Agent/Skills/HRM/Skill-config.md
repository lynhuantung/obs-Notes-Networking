---
Mã: skill-hrm-config
aliases: [Cấu hình Database HRM]
date: 2026-04-19
tags: [skill, hrm, database, config]
domain: HRM
type: skill
status: active
Related:
  - "[[AI-Agent-MOC]]"
  - "[[2-1 Nang cap NET 8]]"
---

# Skill: Cấu hình Database HRM

> **Dùng khi**: Đổi môi trường DB (DEV/UAT/PROD), deploy mới, fix lỗi connection mismatch.

---

## Mô tả
Cập nhật đồng thời `HrmSqlConnection` trên toàn bộ 6 file config của hệ thống HRM để tránh trạng thái nửa chạy nửa không.

---

## Input cần thiết
| Tham số | Mô tả |
|---|---|
| `Server` | Tên SQL Server |
| `Database` | Tên database |
| `UserId` | User đăng nhập DB |
| `Password` | Mật khẩu (chưa mã hóa) |

---

## Các file cần cập nhật
| File | Encryption | Hậu quả nếu sai |
|---|---|---|
| `HRM.SC.Service.Identity/appsettings.json` | `HRM.SC.NetCore.Utilities.Encryption` | Login fail, Token không sinh |
| `HRM.Presentation.EmpPortal/WebSettings.json` | `VnResource.Helper.Data.DataHelper.Decrypt()` | Portal lỗi |
| `HRM.Presentation.Hr.Service/WebSettings.json` | như trên | API fail |
| `HRM.Presentation.HrmSystem.Service/WebSettings.json` | như trên | Service crash |
| `HRM.Presentation.Main/WebSettings.json` | như trên | Main portal lỗi |
| `HRM.SC.Service.Api/WebSettings.json` | như trên | API không connect |

---

## ⚠️ Lưu ý quan trọng
- Identity và WebSettings dùng **2 cơ chế mã hóa khác nhau** — không được nhầm
- Phải update **đồng thời tất cả 6 file**
- Backup trước khi chạy

---

## Liên kết
- [[Skill-Store-sql]] — skill liên quan cùng domain HRM
- [[2-1 Nang cap NET 8]] — context nâng cấp môi trường
