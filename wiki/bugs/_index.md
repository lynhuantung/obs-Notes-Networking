---
description: "Index bugs HRM: Open (ưu tiên đọc) + Resolved theo module — Root cause 1 dòng để không suy đoán lại."
type: sub-index
domain: bugs
date-updated: 2026-05-05

---

# Bugs Index

> Scan **Open trước** — nếu triệu chứng khớp, đọc file chi tiết. Resolved có root cause 1 dòng — thường không cần mở file.

---

## 🔴 Open

| Trang | Module | Triệu chứng | Ngày |
|-------|--------|-------------|------|
| _(chưa có bug open)_ | — | — | — |

---

## ✅ Resolved

| Trang | Module | Triệu chứng | Root cause (1 dòng) | Ngày |
|-------|--------|-------------|---------------------|------|
| [[wiki/bugs/Ins029-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed]] | INS | Phân tích N+1 xóa nhầm dòng NV nghỉ việc đã E_CONFIRMED | `DeleteInsuranceMonthly` thiếu guard `Status != E_CONFIRMED` ở 2 nhánh | 2026-05-05 |
| [[wiki/bugs/Ins028-thai-san-nghi-viec-cung-thang]] | INS | T4 tick Thai sản + Nghỉ việc cùng tháng, T5 trống | `SetLeave14Days` không guard `IsPregnant` khi ≥14 ngày | 2026-05-04 |
| [[wiki/bugs/Ins027-phan-tich-bh-expression-expected-phan-tu-bh]] | INS | Phân tích BH lỗi `Expression expected` | `ElementList` rỗng — thiếu phần tử BH trong danh mục | 2026-05-02 |
| [[wiki/bugs/Ins026-nghi14ngay-total-days-qpvn]] | INS | Phân tích BH không hiển thị tổng ngày nghỉ ốm/không lương | Golive dùng `Formula14DayIns` không phân loại loại nghỉ | 2026-05-02 |
| [[wiki/bugs/Sys025-iis-oom-vnpay]] | SYS | IIS App Pool VnPay crash OOM lúc 8h sáng | Thiếu recycle schedule + không monitor memory | 2026-05-01 |
