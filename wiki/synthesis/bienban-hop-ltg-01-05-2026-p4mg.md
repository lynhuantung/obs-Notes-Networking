---
description: "Biên bản họp LTG 01/05/2026: tổng hợp nghiệp vụ BH, Nhân Tài, kiêm nhiệm và phân quyền từ các cuộc họp 2024 dự án LTG."
type: tong-hop
code: p4mg
tags:
  - ltg
  - bao-hiem
  - nhan-tai
  - kiem-nhiem
  - phan-quyen
sources-wiki:
  - "wiki/sources/LTG-INS-Meetings-2024"
  - "wiki/sources/LTG-TAL-Meetings-2024"
  - "wiki/sources/LTG-SYS-Meetings-2024"
  - "wiki/sources/LTG-TAL-Supplement-Jul2024"
  - "wiki/projects/LTG-Project"
  - "wiki/entities/LTG"
created: 2026-05-01
updated: 2026-05-01
related:
  - "[[wiki/projects/LTG-Project]]"
  - "[[wiki/entities/LTG]]"
  - "[[wiki/sources/LTG-INS-Meetings-2024]]"
  - "[[wiki/sources/LTG-TAL-Meetings-2024]]"
  - "[[wiki/sources/LTG-SYS-Meetings-2024]]"
  - "[[wiki/sources/LTG-TAL-Supplement-Jul2024]]"
---

# Tổng hợp Biên bản Họp LTG 2024

## Document History

| Ngày | Phiên bản | Mô tả | Người tạo |
|------|-----------|-------|-----------|
| 01/05/2026 | 1.0.0 | Tạo tài liệu từ 8 biên bản họp LTG Phase 3 (07/2024) | Tung.Ly |

---

## Nội dung – Content

- [1. Giới thiệu tài liệu](#1-giới-thiệu-tài-liệu)
  - [1.1 Mục tiêu tài liệu](#11-mục-tiêu-tài-liệu)
  - [1.2 Từ viết tắt](#12-từ-viết-tắt)
- [2. Bức tranh toàn cảnh](#2-bức-tranh-toàn-cảnh)
- [3. Các điểm cốt lõi](#3-các-điểm-cốt-lõi)
- [4. Biểu đồ](#4-biểu-đồ)
- [5. Quy luật & Mâu thuẫn](#5-quy-luật--mâu-thuẫn)
- [6. Khuyến nghị](#6-khuyến-nghị)

---

# 1. Giới thiệu tài liệu

## 1.1 Mục tiêu tài liệu

Tổng hợp toàn bộ 8 biên bản họp dự án LTG Phase 3 (07/2024) trên 3 phân hệ INS, TAL, SYS — dành cho SE/BA cần nắm bối cảnh kỹ thuật và nghiệp vụ đặc thù của LTG Group trước khi xử lý yêu cầu hoặc tái sử dụng giải pháp cho dự án tương tự.

## 1.2 Từ viết tắt

| STT | Thuật ngữ | Ý nghĩa |
|-----|-----------|---------|
| 1 | LTG | Long Thành Gaz / LTG Group |
| 2 | INS | Phân hệ Bảo hiểm (Insurance) |
| 3 | TAL | Phân hệ Nhân tài (Talent Management) |
| 4 | SYS | Phân hệ Hệ thống (System) |
| 5 | GAP | Khoảng cách năng lực giữa NV và yêu cầu vị trí |
| 6 | HĐ | Hợp đồng lao động |
| 7 | QTCT | Quy trình công ty |
| 8 | NV | Nhân viên |
| 9 | L&D | Learning & Development (Đào tạo & Phát triển) |

---

# 2. Bức tranh toàn cảnh

Dự án LTG Phase 3 (07/2024) là giai đoạn post-UAT — xử lý các vấn đề phức tạp nhất bị giữ lại từ Phase trước. Với 8 biên bản họp trong 1 tháng, cường độ làm việc cao và phạm vi chạm đến **3 phân hệ cùng lúc** (INS, TAL, SYS) là dấu hiệu LTG có đặc thù tổ chức phức tạp hơn khách hàng thông thường.

**Điều bất thường đáng chú ý**: Cả 3 phân hệ đều có một vấn đề chung — **giả định mặc định của HRM không khớp với thực tế LTG**:
- INS giả định ca làm việc 5–6 ngày/tuần → LTG chỉ 12 ngày/tháng (ca 24h)
- INS giả định ngày nghỉ lễ lấy từ `Cat_DayOff` → LTG quản lý riêng
- SYS giả định 1 NV thuộc 1 pháp nhân → LTG kiêm nhiệm đa pháp nhân
- TAL giả định quy trình phê duyệt không ràng buộc → LTG yêu cầu bình luận bắt buộc trước duyệt

Đây không phải 4 vấn đề riêng lẻ — đây là **pattern cấu trúc tập đoàn đa pháp nhân** chưa được HRM thiết kế để xử lý sẵn. LTG là khách hàng đầu tiên bộc lộ đầy đủ pattern này.

# 3. Các điểm cốt lõi

> Mỗi điểm được chọn vì có rủi ro triển khai, không phải vì hiển nhiên.

| # | Điểm | Nguồn | Độ tin cậy |
|---|------|-------|------------|
| 1 | Ca 24h/ngày → 12 ngày/tháng → logic nghỉ 14 ngày tiêu chuẩn **không bao giờ đúng** → phải tính công từ phần tử BH thay vì từ ngày lịch | [[wiki/sources/LTG-INS-Meetings-2024]] | Dữ kiện |
| 2 | Ngày nghỉ lễ LTG **không dùng `Cat_DayOff`** — nếu code cứng theo Cat_DayOff sẽ ra kết quả sai và không phát hiện ngay | [[wiki/sources/LTG-INS-Meetings-2024]] | Dữ kiện |
| 3 | Kiêm nhiệm đa pháp nhân yêu cầu **join 2 lần** (profile + company) — join 1 lần thiếu dữ liệu phụ cấp của pháp nhân kiêm nhiệm | [[wiki/sources/LTG-SYS-Meetings-2024]] | Dữ kiện |
| 4 | Store mới `Get_Data_PermissionConCurrent_New` chỉ được apply **một số nghiệp vụ cụ thể**, không phải toàn bộ — rủi ro: developer sau apply nhầm phạm vi | [[wiki/sources/LTG-SYS-Meetings-2024]] | Dữ kiện |
| 5 | Quy trình kế thừa 4 bước: nút Duyệt (B4) phải **bị khóa** cho đến khi có bình luận (B3) — hiện tại chưa enforce, là lỗ hổng quy trình | [[wiki/sources/LTG-TAL-Supplement-Jul2024]] | Dữ kiện |
| 6 | Phân quyền tự động theo **Nhóm nhân viên** (không phải chức danh) là pattern có thể tái sử dụng cho tập đoàn có nhiều cấp NV | [[wiki/sources/LTG-TAL-Meetings-2024]] | Dữ kiện |
| 7 | Cảnh báo L&D khi NV kế thừa bị kỷ luật: **chưa có giải pháp kỹ thuật**, đang pending — rủi ro bị quên nếu không có ticket theo dõi | [[wiki/sources/LTG-TAL-Meetings-2024]], [[wiki/sources/LTG-TAL-Supplement-Jul2024]] | Dữ kiện |
| 8 | Mở rộng `Get_Data_Permission_New()` (hàm core) có **ảnh hưởng toàn bộ store đang dùng hàm** — cần kiểm tra exhaustive trước khi deploy | [[wiki/sources/LTG-SYS-Meetings-2024]] | Suy luận [inference] |

# 4. Biểu đồ

## 4.1 Phân bổ số lượng họp theo phân hệ

> 💡 TAL chiếm nhiều họp nhất (4/8) — cho thấy phân hệ Nhân tài có độ phức tạp cao nhất trong Phase 3 LTG, không phải INS hay SYS như thường gặp ở các dự án khác.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "TAL (Nhân tài)"
    value: 4
  - label: "INS (Bảo hiểm)"
    value: 2
  - label: "SYS (Hệ thống)"
    value: 2

#-----------------#
#- chart options -#
#-----------------#
options:
  xField: "label"
  yField: "value"
  label:
    position: "middle"
  meta:
    value:
      alias: "Số biên bản họp"
```

> 🎯 **Nên làm**: Đặt SE có kinh nghiệm TAL làm kỹ thuật chính khi triển khai cho tập đoàn có hệ thống kế thừa phức tạp.

## 4.2 Phân bổ vấn đề pending vs đã giải quyết

> 💡 7/8 điểm cốt lõi đã có giải pháp kỹ thuật rõ ràng — tỷ lệ tốt cho post-UAT. Tuy nhiên vấn đề cảnh báo L&D vẫn pending và có nguy cơ bị "rơi" nếu không tracking.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Pie

#-----------------#
#- chart data    -#
#-----------------#
data:
  - type: "Đã có giải pháp"
    value: 7
  - type: "Pending chưa giải quyết"
    value: 1

#-----------------#
#- chart options -#
#-----------------#
options:
  angleField: "value"
  colorField: "type"
  radius: 0.8
  label:
    type: "spider"
    content: "{percentage}\n{name}"
  legend:
    layout: "horizontal"
    position: "bottom"
```

> 🎯 **Nên làm**: Tạo ticket theo dõi vấn đề cảnh báo L&D (NV kế thừa bị kỷ luật) và gán owner cụ thể (Bao.Tran / Hoàng.Huynh).

# 5. Quy luật & Mâu thuẫn

**Quy luật rút ra:**

**Quy luật 1 — Hỏi ca làm việc trước khi phân tích BH**
Ca làm việc đặc thù (như 24h/ngày của LTG) làm sai toàn bộ logic nghỉ 14 ngày, tính ngày thực, đếm bản ghi BH. Nếu không biết điều này → sẽ deploy logic chuẩn lên môi trường LTG và không hiểu tại sao kết quả sai. ([[wiki/sources/LTG-INS-Meetings-2024]])

**Quy luật 2 — Giả định ngầm của HRM = bẫy khi triển khai tập đoàn**
HRM có nhiều giả định ngầm (Cat_DayOff, 1 NV = 1 pháp nhân, quy trình phê duyệt không ràng buộc). Tập đoàn đa pháp nhân sẽ phá vỡ tất cả những giả định này cùng lúc. Nếu không biết → tốn 2-3 tuần debug mới phát hiện root cause. ([[wiki/sources/LTG-SYS-Meetings-2024]], [[wiki/sources/LTG-INS-Meetings-2024]])

**Quy luật 3 — Sửa hàm phân quyền core = thay đổi HIGH RISK**
`Get_Data_Permission_New()` được dùng rộng khắp các store. Bất kỳ thay đổi nào đều có blast radius không nhỏ. Không có unit test → phải test manual toàn bộ nghiệp vụ có quyền sau khi sửa. ([[wiki/sources/LTG-SYS-Meetings-2024]])

**Mâu thuẫn phát hiện:**

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | Store kiêm nhiệm chỉ được "apply một số nghiệp vụ cần" nhưng không có danh sách rõ ràng nào được apply | Developer sau sẽ không biết nghiệp vụ nào đang dùng store mới, dễ bỏ sót hoặc apply nhầm |
| 2 | Phân quyền tự động theo "Nhóm nhân viên" nhưng không nêu điều gì xảy ra khi Nhóm NV thay đổi sau khi đã tạo user | NV đổi nhóm (thăng chức) → quyền không tự cập nhật → phải làm thủ công, dễ bỏ quên |
| 3 | Tự động tạo mục tiêu năng lực sau duyệt kế thừa, nhưng không rõ mục tiêu bị xóa/cập nhật ra sao nếu kế thừa bị thu hồi | Dữ liệu mục tiêu mồ côi → gây nhiễu báo cáo đào tạo |

# 6. Khuyến nghị

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | Tạo ticket theo dõi cảnh báo L&D (NV kế thừa bị kỷ luật) — gán owner: Bao.Tran + Hoàng.Huynh, deadline rõ ràng | Vấn đề đang pending không có owner — không có ticket thì biến mất sau cuộc họp |
| 🔴 Cao | Lập danh sách chính xác các store/nghiệp vụ đã áp dụng `Get_Data_PermissionConCurrent_New` | Hiện tại không có danh sách → rủi ro apply nhầm hoặc bỏ sót khi maintain |
| 🟡 Trung bình | Enforce lock nút Duyệt (B4) cho đến khi có bình luận (B3) trong quy trình kế thừa | Hiện tại logic chưa được implement — quy trình 4 bước chỉ là nghiệp vụ, chưa có kỹ thuật đảm bảo |
| 🟡 Trung bình | Viết checklist "đặc thù tập đoàn đa pháp nhân" để hỏi ngay từ kick-off: cấu trúc pháp nhân, ca làm việc, ngày nghỉ lễ, quy trình phê duyệt | LTG là case study điển hình — pattern này sẽ lặp lại ở khách hàng tập đoàn tiếp theo |
| 🟢 Thấp | Tài liệu hóa phân hệ TAL LTG như reference implementation để các dự án khác tham chiếu | LTG TAL là triển khai đầy đủ nhất hiện tại — không tài liệu hóa là lãng phí |

---

## 💬 3 Câu hỏi suy ngẫm

1. 🧠 **[Giả định]** Chúng ta đang giả định rằng "giải pháp kiêm nhiệm chỉ apply một số nghiệp vụ" là đủ — nhưng nếu không có ranh giới rõ ràng được ghi lại, developer 6 tháng sau sẽ dựa vào đâu để biết nghiệp vụ nào đã apply?

2. 🧪 **[Thí nghiệm]** Nếu áp dụng pattern tập đoàn LTG (kiêm nhiệm, phân quyền tự động, ca 24h) vào dự án VnPay (13 services, Kubernetes, 200 users đồng thời) — bottleneck đầu tiên sẽ xuất hiện ở tầng nào: phân quyền, BH, hay TAL?

3. 🌐 **[Kết nối]** Quy luật "hỏi ca làm việc trước khi phân tích BH" của LTG liên kết trực tiếp với [[wiki/sources/INS-InsuranceRecordDayCount]] (logic đếm ngày bản ghi BH) và [[wiki/sources/INS-Nghi14Ngay]] (nghiệp vụ nghỉ 14 ngày) — đọc 2 trang này để hiểu đầy đủ tại sao ca 24h phá vỡ toàn bộ công thức.
