---
description: "Tài liệu nghiệp vụ nội bộ về hai phân hệ cốt lõi: Chấm công (ATT01–05) quản lý in/out, ngày nghỉ, tăng ca, phép năm và Tính lương (SAL01) trong HRM."
type: source
tags:
  - cham-cong
  - nghiep-vu
  - att
  - sal
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "2. RESOURCE/Nghiep-vu-HRM/ATT/ + SAL/"
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
  - "[[wiki/sources/H-VnPay-Att-17042025]]"
---

# Nghiệp Vụ HRM — Chấm Công (ATT) & Lương (SAL)

## Tóm tắt

Tài liệu nghiệp vụ nội bộ về 2 phân hệ cốt lõi: **Chấm công (ATT)** và **Lương (SAL)**. Được viết theo chuẩn mã hóa ATT01–ATT05 + SAL01. Đây là tài liệu tham chiếu nghiệp vụ, không phải biên bản họp.

## ATT01 — Tổng hợp công

**Định nghĩa**: Gom dữ liệu chấm công (in/out), ngày nghỉ, phép năm, tăng ca → kết quả kỳ công

**Quy trình**:
1. Thu thập in/out từ máy chấm công
2. Ghép danh mục ngày nghỉ lễ + phép năm
3. Cộng tăng ca đã duyệt
4. Ra bảng tổng hợp công (timesheet)

**Ràng buộc**: Phải duyệt đơn tăng ca trước khi cộng OT

**Vấn đề thường gặp**:
- Máy chấm công không đồng bộ → sai lệch
- NV quên check in/out → lệch phép năm

**Output**: Đầu vào cho SAL01 (Tính lương)

## ATT02 — Ngày nghỉ

**Loại ngày nghỉ**: Nghỉ lễ / Nghỉ bù / Nghỉ không lương / Nghỉ cá nhân

**Quy định**:
- Nghỉ lễ theo luật lao động → không trừ phép năm
- Nghỉ bù + nghỉ không lương → cần phê duyệt

**Vấn đề**: Nhập sai loại ngày nghỉ; trùng ngày lễ và ngày phép → tính sai công

## ATT03 — Tăng ca (OT)

Quản lý tăng ca theo đơn đã duyệt, tính vào bảng công

## ATT04 — Phép năm

Theo dõi phép năm theo hợp đồng lao động; tích hợp với bảng công

## ATT05 — In/Out

Dữ liệu raw từ máy chấm công; xử lý trường hợp quên check in/out

## SAL01 — Tính lương

*Template, chưa có nội dung chi tiết*

**Đầu vào từ ATT**: Bảng tổng hợp công (số ngày làm việc, OT, nghỉ phép)

## Liên kết

- [[wiki/concepts/HRM-Modules]]
- [[wiki/flows/Flow-TinhLuong-Monthly]]
- [[wiki/sources/H-VnPay-Att-17042025]] — họp chấm công VnPay
