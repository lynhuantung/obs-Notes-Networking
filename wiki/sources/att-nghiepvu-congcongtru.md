---
type: source
code: atn04
domain: att
description: "Công cộng, công trừ, công chuẩn: công thức nghiệp vụ tính công thực nhận và các trường hợp trừ công."
tags:
  - att
  - cong-cong
  - cong-tru
  - cong-chuan
  - tinh-cong
created: 2026-05-10
updated: 2026-05-10
source-file: raw/Nghiệp vụ HRM/ATT/ATT-CongCongCongTru.md
related:
  - "[[wiki/concepts/ATT-ChamCong]]"
  - "[[wiki/sources/att-nghiepvu-tinhcong]]"
  - "[[wiki/sources/att-db-attendancetable]]"
---

# Source: ATT – Công cộng và công trừ

## Tóm tắt

Tài liệu giải thích cơ chế xác định **công thực nhận** từ 3 thành phần: công cộng (ngày đi làm + nghỉ hưởng lương), công trừ (đi trễ/về sớm, nghỉ không lương), và công chuẩn (mốc đối chiếu). Đây là nền tảng để hệ thống tính lương, phụ cấp chuyên cần và đánh giá vi phạm.

## Key Takeaways

- **Công thức**: `Công thực nhận = (Công đi làm + Nghỉ hưởng lương) - (Công trừ + Nghỉ không lương + Vi phạm)`
- **Công cộng**: đi làm đủ ca (+1), làm nửa ngày (+0.5), nghỉ phép/lễ/cưới/chế độ công ty (vẫn +1 công)
- **Công chuẩn**: số công chuẩn kỳ lương (VD: tháng 5 = 26 công, tháng 2 = 24 công) — mốc tính thiếu công, phụ cấp chuyên cần
- **Công trừ**: đi trễ 15 phút → -0.25 công; nghỉ không lương → -N công; về sớm → ghi nhận KPI
- Hệ thống sinh: bảng công tổng hợp + dữ liệu lương + báo cáo công + thống kê vi phạm

## Trích dẫn quan trọng

> Công thực nhận = (Công đi làm + Nghỉ hưởng lương) - (Công trừ + Nghỉ không lương + Vi phạm)

> Dù không đi làm nhưng nghỉ phép năm vẫn được tính công, vẫn được tính lương.

> Trong thực tế, module tính công phức tạp vì chỉ cần đổi ca giữa tháng, OT qua đêm, nghỉ thai sản, hoặc đi trễ vài phút là rule tính công có thể thay đổi hoàn toàn.

## Liên kết

- [[wiki/concepts/ATT-ChamCong]]
- [[wiki/sources/att-nghiepvu-tinhcong]]
- [[wiki/sources/att-db-attendancetable]]
