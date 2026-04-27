---
type: concept
tags: [HRM, Insurance, EBHXH, D02, tang-giam-dieu-chinh]
date-updated: 2026-04-26
related:
  - "[[INS-Thiet-Ke-Chuc-Nang]]"
  - "[[INS-Nghiep-Vu]]"
  - "[[INS-IBHXH]]"
  - "[[INS-Database-Tables]]"
---

# Nghiệp Vụ EBHXH — Tăng, Giảm và Điều Chỉnh

> Nguồn: VnResource HRM Pro 8 — Tài liệu thiết kế chức năng Bảo Hiểm
> Liên kết: [[INS-Thiet-Ke-Chuc-Nang]] | [[INS-IBHXH]]

## EBHXH Tăng

| Mã EBHXH | Trạng thái D02 | Diễn giải |
|----------|----------------|-----------|
| TM | E_TANG_LD | Tăng lao động |
| TD | E_TANG_LD_CHANGE_INSPLACE | Tăng lao động do chuyển nơi đóng BH |
| ON | E_TANG_TS | Tăng thai sản |
| ON | E_TANG_BENH | Tăng bệnh |
| ON | E_TANG_LEAVE_14WORKINGDAYS | Tăng do nghỉ >= 14 ngày |
| DC | E_TANG_LUONG | Tăng mức đóng |
| DC | E_TANG_LUONG_CHANGEJOBNAME | Tăng lương thay đổi chức danh nghề |
| CD | E_CHANGEJOBNAME | Đổi chức danh |
| AD | E_DieuChinhTang | Điều chỉnh tăng |
| TT | E_TANG_BHYT | Tăng BHYT |
| TN | E_TANG_BHTN | Tăng BHTN |

---

## EBHXH Giảm

| Mã EBHXH | Trạng thái D02 | Diễn giải |
|----------|----------------|-----------|
| GH | E_GIAM_LD | Giảm lao động |
| GH | E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS | Nghỉ việc mà trước đó nghỉ >= 14 ngày |
| GH | E_GIAM_TS_QUIT | Nghỉ việc sau khi nghỉ thai sản |
| GH | E_GIAM_QUIT_SUSPENSE | Giảm do nghỉ tạm hoãn |
| GD | E_GIAM_LD_CHANGE_INSPLACE | Giảm lao động do chuyển nơi đóng BH |
| KL | E_GIAM_LEAVE_14WORKINGDAYS | Giảm do nghỉ hơn 14 ngày |
| TS | E_GIAM_TS | Giảm thai sản |
| TS | E_GIAM_PREGNANT_14WORKINGDAYS | Giảm do nghỉ >= 14 ngày sau thai sản |
| SB | E_DieuChinhGiam | Điều chỉnh giảm |
| TU | E_GIAM_LD_BHYT | Giảm lao động trả thẻ BHYT kịp thời |
| TU | E_GIAM_LD_NOT_BHYT | Giảm lao động không trả thẻ |
| TU | E_GIAM_BHYT | Giảm BHYT |
| TU | E_GIAM_LD_BHYT_KOKIPTHOI | Giảm lao động không trả BHYT kịp thời |
| GN | E_GIAM_BHTN | Giảm BHTN |
| OF_1 | E_GIAM_BENH | Giảm bệnh |
| GL | E_GIAM_LD_CHANGE_LEGALENTITY | Giảm LĐ thay đổi pháp nhân |

---

## EBHXH Điều Chỉnh

| Mã EBHXH | Trạng thái D02 | Diễn giải |
|----------|----------------|-----------|
| GH | E_GIAM_LD | Giảm lao động |
| GH | E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS | Nghỉ việc mà trước đó nghỉ >= 14 ngày |
| GH | E_GIAM_TS_QUIT | Nghỉ việc sau khi nghỉ thai sản |
| GH | E_GIAM_QUIT_SUSPENSE | Giảm do nghỉ tạm hoãn |
| GD | E_GIAM_LD_CHANGE_INSPLACE | Giảm lao động do chuyển nơi đóng BH |
| KL | E_GIAM_LEAVE_14WORKINGDAYS | Giảm do nghỉ hơn 14 ngày |
| TS | E_GIAM_TS | Giảm thai sản |
| TS | E_GIAM_PREGNANT_14WORKINGDAYS | Giảm do nghỉ >= 14 ngày sau thai sản |
| SB | E_DieuChinhGiam | Điều chỉnh giảm |
| TU | E_GIAM_LD_BHYT | Giảm lao động trả thẻ BHYT kịp thời |
| TU | E_GIAM_LD_NOT_BHYT | Giảm lao động không trả thẻ |
| TU | E_GIAM_BHYT | Giảm BHYT |
| TU | E_GIAM_LD_BHYT_KOKIPTHOI | Giảm lao động không trả BHYT kịp thời |
| GN | E_GIAM_BHTN | Giảm BHTN |
| OF_1 | E_GIAM_BENH | Giảm bệnh |
| GL | E_GIAM_LD_CHANGE_LEGALENTITY | Giảm mức đóng / Giảm LĐ thay đổi pháp nhân |
| CD | E_CHANGEJOBNAME | Đổi chức danh |

---

## So sánh IBHXH vs EBHXH

| Điểm khác biệt | IBHXH | EBHXH |
|----------------|-------|-------|
| Loại TL (Tăng LĐ thay đổi pháp nhân) | Có | Không có |
| Điều chỉnh (Adjustment) | Không có riêng | Có phần Điều chỉnh riêng biệt |
| Mã GL | Có | Có (nhưng diễn giải khác nhau) |

---

## Liên kết

- [[INS-IBHXH]] — Mã IBHXH tăng/giảm (so sánh)
- [[INS-Nghiep-Vu]] — Nghiệp vụ tổng quan
- [[INS-Database-Tables]] — Bảng `Ins_ReportD02Item`
- [[INS-Thiet-Ke-Chuc-Nang]] — Tổng quan tài liệu
