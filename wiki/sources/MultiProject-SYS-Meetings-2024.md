---
description: "Tổng hợp 5 biên bản họp hệ thống 2024 từ các dự án Taisun, FGL, HVN, Toyota, AMIS: pattern khóa đối tượng, tích hợp survey, phân quyền tự động."
type: source
tags:
  - system
  - phan-quyen
  - khoa-doi-tuong
  - kiem-nhiem
  - multi-project
  - archived-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "1. Projects/Taisun/H-TAISUN-SYS-240724.md | 1. Projects/FGL/H-FGL-SYS-240724.md + H-FGL-SUR-160924.md | 1. Projects/HVN/H-HVN-SYS-060924.md | 1. Projects/Toyota/H-TMV-SYS-210924.md | 1. Projects/AMIS/H-AMIS-OTHER-221024.md"
related:
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/concepts/HRM-Code-Quality]]"
  - "[[wiki/entities/LTG]]"
---

# Các Dự Án 2024 — Họp Hệ Thống (SYS/SUR) Tổng Hợp

## Tóm tắt

Tổng hợp 5 biên bản họp hệ thống từ 5 dự án khác nhau (Taisun, FGL, HVN/Toyota HVN, Toyota, AMIS) trong năm 2024. Mỗi dự án đại diện cho 1 pattern kỹ thuật tái sử dụng được.

---

## 1. Taisun — Khóa đối tượng theo nhóm người dùng (07/2024)

**Yêu cầu**: Hiển thị cây phòng ban theo user (để giảm thao tác sai người dùng)

**Giải pháp**:
- Nhóm khóa đối tượng → nhóm người dùng → load cây phòng ban theo nhóm
- Quản lý khóa đối tượng theo nhóm người dùng (3 task: nhóm NV, khóa đối tượng theo nhóm, load cây PB)

---

## 2. FGL — Tích hợp Survey ngoài vào HRM (07 + 09/2024)

**Yêu cầu**: Người dùng click nút khảo sát trên portal HRM → mở link khảo sát của FGL; kiểm tra đăng nhập HRM trước khi vào survey

**Giải pháp chốt** (redirect):
1. User vào web khảo sát → redirect sang HRM kiểm tra đăng nhập
2. Chưa đăng nhập → redirect trang login HRM
3. Đã đăng nhập → redirect về survey kèm token (CodeEmp, ProfileName, OrgstructureName)

```js
location.href = 'https://cs01.../SurveyAuthen/Index?surveyURL=...&urlHRM=...'
```

**Bài học**: Giải pháp API trực tiếp không work vì cross-origin session; redirect + token là cách duy nhất đúng cho tích hợp cross-domain

---

## 3. HVN (Toyota HVN) — Khóa đối tượng theo loại kỳ công (09/2024)

**Yêu cầu**: 1 tháng có 2 kỳ công → cần khóa đối tượng riêng theo từng kỳ

**Giải pháp chốt** (sau 2 lần thay đổi):
- Khi load kỳ công → load loại NV
- Kiểm tra khóa đối tượng: NV → Loại NV → Loại kỳ công → lọc danh sách khóa đối tượng
- Truyền loại kỳ công vào các hàm `saveChange` và `kiểm tra khóa đối tượng`

---

## 4. Toyota — Phân quyền tự động khi điều chuyển phòng ban (09/2024)

**Yêu cầu**: Phân quyền tự động khi (a) tạo NV mới và (b) điều chuyển phòng ban

**Trạng thái**:
- Phân quyền khi tạo NV mới: **đã hỗ trợ** (nhóm portal employee + manager)
- Phân quyền khi điều chuyển phòng ban: **chưa hỗ trợ** → PE kiểm tra lại hệ thống

---

## 5. AMIS — Chuẩn hóa quy trình theo ISO (10/2024)

**Bối cảnh**: MISA hỗ trợ VnResource chuẩn hóa quy trình nội bộ theo tiêu chuẩn ISO

**Mẫu quy trình ISO của MISA**:
- Mục đích → Trách nhiệm → Đầu vào → Các bước → Yêu cầu/Thời gian → Tài liệu liên quan → Đầu ra

**Ưu tiên**: Agile Scrum trước → sau đó các quy trình sản phẩm

---

## Patterns tái sử dụng

| Pattern | Dự án gốc | Áp dụng cho |
|---------|-----------|------------|
| Khóa đối tượng theo nhóm NV | Taisun, HVN | Bất kỳ KH có nhiều nhóm NV |
| Tích hợp survey/portal ngoài qua redirect+token | FGL | Bất kỳ tích hợp cross-domain |
| Phân quyền tự động theo phòng ban | Toyota | KH cần auto-provision |
| Khóa đối tượng theo kỳ công | HVN | KH có 2+ kỳ công/tháng |

## Liên kết

- [[wiki/concepts/HRM-Security-Config]]
- [[wiki/entities/LTG]] — kiêm nhiệm đa pháp nhân (pattern liên quan)
- [[wiki/sources/LTG-SYS-Meetings-2024]]
