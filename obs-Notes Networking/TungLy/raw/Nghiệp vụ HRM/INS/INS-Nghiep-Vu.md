---
type: concept
tags: [HRM, Insurance, BHXH, BHYT, BHTN, nghiep-vu, tang-giam, D02]
date-updated: 2026-04-26
related:
  - "[[INS-Thiet-Ke-Chuc-Nang]]"
  - "[[INS-Bieu-Mau]]"
  - "[[INS-IBHXH]]"
  - "[[INS-EBHXH]]"
  - "[[INS-Database-Tables]]"
  - "[[INS-BC-D02]]"
---

# Nghiệp Vụ Bảo Hiểm — Tăng / Giảm / Điều Chỉnh

> Nguồn: VnResource HRM Pro 8 — Tài liệu thiết kế chức năng Bảo Hiểm
> Liên kết tổng quan: [[INS-Thiet-Ke-Chuc-Nang]]

## 1. Nghiệp Vụ Tăng Lao Động (TM)

### 1.1 Tăng mới hoàn toàn (kể cả NV đã có sổ BHXH)
- Phải lập danh sách **D02-TS**
- Phải lập tờ khai cấp sổ BHXH (**Mẫu A01-TS**) cho NV mới

**Tăng lao động kịp thời trong tháng:**
> Đơn vị phát sinh tăng LĐ tháng 02/2014 → báo tăng tháng 02/2014

**Tăng lao động có đóng bổ sung tháng trước:**
> Đơn vị phát sinh tăng LĐ tháng 01/2014 nhưng báo tháng 02/2014
> → Thời gian từ-đến: 01/2014 → 02/2014

### 1.2 Tăng mới cho NV Thai sản / Nghỉ ốm đi làm lại
> Ví dụ: NV A nghỉ thai sản 10/2013 → 04/2014 đi làm lại
> → Người dùng phải **báo tăng lại** và ghi rõ lý do tăng

### 1.3 Tăng tham gia BHTN
> NV đã tham gia BHXH, BHYT nhưng chưa đủ điều kiện BHTN
> → Đến tháng 02/2014 đủ điều kiện: báo tăng đóng BHTN từ 02/2014

---

## 2. Nghiệp Vụ Tăng Mức Đóng (DC)

### 2.1 Tăng lương, phụ cấp kịp thời
Ghi rõ **mức lương cũ và mức lương mới** thay đổi như thế nào.

### 2.2 Tăng lương có truy nộp BHXH, BHYT, BHTN
> Ví dụ: Tăng lương tháng 01/2014 nhưng quên không đóng kịp
> → Tháng 02/2014 ghi nhận tăng lương **từ 01/2014 đến 02/2014**

### 2.3 Điều chuyển lao động
Trường hợp điều chuyển LĐ có **thay đổi chức danh** → ghi nhận trong nghiệp vụ điều chỉnh mức đóng.

---

## 3. Nghiệp Vụ Giảm

### 3.1 Giảm kịp thời, có thu hồi thẻ BHYT
> Phát sinh giảm tháng 02/2014, thẻ BHYT có giá trị 01/01/2012 → 31/03/2014

### 3.2 Giảm kịp thời, không thu hồi thẻ BHYT
> Phát sinh giảm tháng 02/2014, nhân viên **không trả thẻ** cho công ty

### 3.3 Giảm lao động, truy giảm các tháng trước, có thu hồi thẻ
> Phát sinh giảm tháng 01/2014 nhưng báo tháng 02/2014, có thu hồi thẻ BHYT

### 3.4 Giảm lao động, truy giảm các tháng trước, không thu hồi thẻ
> Phát sinh giảm tháng 01/2014 nhưng báo tháng 02/2014, không thu hồi thẻ

---

## 4. Nghiệp Vụ Mẫu D02

### 4.1 Phần lao động tăng
Đưa vào các trường hợp:
- Lao động tăng mới
- Tăng sau ốm, thai sản, nghỉ không lương
- Điều chỉnh tăng mức đóng
- Truy thu BHXH, BHYT, BHTN

### 4.2 Phần lao động giảm
Đưa vào các trường hợp:
- Lao động nghỉ việc (chấm dứt HĐ)
- Nghỉ ốm, nghỉ thai sản, nghỉ không lương
- Điều chỉnh giảm mức đóng
- Thoái thu BHXH, BHYT, BHTN

---

## 5. Logic Lấy Số Quyết Định (Các loại D02)

| Loại | DateStart | DateEnd | DecisionNo | DecisionType | DateSigned |
|------|-----------|---------|-----------|--------------|-----------|
| **TM** (Tăng mới) | `Hre_Contract.DateStart` | Null | `Hre_Contract.ContractNo` | `Hre_Contract.ContractTypeID` | `Hre_Contract.DateSigned` |
| **AD** (Truy thu nguyên lương) | `Ins_InsuranceSalaryPayback.FromMonthEffect` | `.ToMonthEffect` | Null | Null | Null |
| **ON** (Đi làm lại), **TD**, **TT**, **TN** | `Ins_ReportD02.DateMonth` | Null | Null | Null | Null |
| **DC** (Điều chỉnh lương), **CD** (Điều chỉnh chức danh) | `Hre_ContractExtend.DateStart` | `.DateEnd` | `.AnnexCode` | `.AppendixContractTypeID` | `.DateSignedAppendixContract` |
| **GH** (Giảm hẳn) | `Hre_Profile.DateQuit` | Null | `Hre_Profile.ResignNo` | Null | `Hre_Profile.DateQuitSign` |
| **SB** (Bổ sung giảm nguyên lương) | `Ins_InsuranceSalaryPayback.FromMonthEffect` | `.ToMonthEffect` | Null | Null | Null |
| **OF_1**, **OF_2**, **GD**, **TU**, **GN**, **KL** | `Ins_ReportD02.DateMonth` | Null | Null | Null | Null |
| **DC** (Giảm mức đóng) | `Hre_ContractExtend.DateStart` | `.DateEnd` | `.AnnexCode` | `.AppendixContractTypeID` | `.DateSignedAppendixContract` |
| **TS** (Nghỉ thai sản đủ điều kiện) | `Hre_Profile.DateStartPregnant` | `Hre_Profile.DateEndPregnant` | Null | Null | Null |

---

## Liên kết

- [[INS-Thiet-Ke-Chuc-Nang]] — Tổng quan tài liệu
- [[INS-Bieu-Mau]] — Biểu mẫu D02-TS, C70A
- [[INS-IBHXH]] — Mã IBHXH tăng/giảm
- [[INS-EBHXH]] — Mã EBHXH tăng/giảm/điều chỉnh
- [[INS-Database-Tables]] — Bảng `Ins_ReportD02`, `Ins_ReportD02Item`
- [[INS-BC-D02]] — Vấn đề BC D02 thực tế
