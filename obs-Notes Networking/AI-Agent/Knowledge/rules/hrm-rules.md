---
Mã: hrm-rules
aliases: [HRM Rules, Quy tắc HRM]
date: 2026-04-19
tags: [rules, hrm]
type: rules
domain: HRM
Related:
  - "[[AI-Agent-MOC]]"
  - "[[Knowledge/_README]]"
---

# 📋 HRM Rules — Quy tắc học được

> Ngắn gọn, hành động rõ ràng. Mỗi rule có nguồn gốc từ case thực tế.

---

## 🔴 Infra Rules

### R-INF-01: Luôn restart Redis sau Windows Update
- **Nguồn**: [[Knowledge/case-studies/hrm/case-hrm-inoac-redis-crash]]
- **Hành động**: `Start-Service Redis` → `redis-cli ping`
- **Pattern**: [[Knowledge/patterns/infra/redis-crash-after-windows-update]]

---

## 🟡 Config Rules

### R-CFG-01: Identity và WebSettings dùng 2 cơ chế mã hóa KHÁC NHAU
- **Nguồn**: [[Skills/HRM/Skill-config]]
- **Identity**: `HRM.SC.NetCore.Utilities.Encryption`
- **WebSettings**: `VnResource.Helper.Data.DataHelper.Decrypt()`
- **Hành động**: Không dùng chung, update đồng thời tất cả 6 file

### R-CFG-02: Phải update đồng thời tất cả 6 file config khi đổi DB
- **Nguồn**: [[Skills/HRM/Skill-config]]
- **Hành động**: Chạy Skill-config, không update từng file lẻ

---

## 🟢 SQL Rules

### R-SQL-01: Không dùng Guid.Empty để query — luôn có filter
- **Nguồn**: Performance case contract evaluation
- **Vì sao**: Load toàn bộ bảng vào memory, gây chậm nghiêm trọng
- **Hành động**: Collect required IDs trước, filter `WHERE ID IN (...)`

### R-SQL-02: Store procedure name chuẩn: `hrm_{module}_sp_get_{TableName}`
- **Nguồn**: [[Skills/HRM/Skill-Store-sql]]
- **Alias**: Lấy chữ cái đầu mỗi phần của tên bảng

---

## 🔵 API Rules

### R-API-01: Email sending phải async — không được block API response
- **Nguồn**: Performance case contract evaluation
- **Hành động**: Wrap trong `Task.Run(() => SendEmail(...))`
- **Pattern**: [[Knowledge/patterns/api/async-email-sending]] *(sắp tạo)*

---

## Cách thêm rule mới

```
### R-{CAT}-{NUM}: {Tên rule ngắn gọn}
- **Nguồn**: [[link tới case/skill liên quan]]
- **Vì sao**: Giải thích ngắn
- **Hành động**: Làm gì cụ thể
```
