---
description: "Tổng cảnh dự án LTG 01/05/2026: kiến trúc đa pháp nhân, kiêm nhiệm, bảo hiểm và phân quyền — tổng hợp từ nhiều cuộc họp 2024."
type: tong-hop
code: p5nt
tags:
  - "ltg"
  - "ins"
  - "tal"
  - "sys"
  - "kiem-nhiem"
  - "phan-quyen"
  - "archived-2024"
sources-wiki:
  - "wiki/projects/LTG-Project"
  - "wiki/entities/LTG"
  - "wiki/sources/LTG-INS-Meetings-2024"
  - "wiki/sources/LTG-TAL-Meetings-2024"
  - "wiki/sources/LTG-SYS-Meetings-2024"
  - "wiki/sources/LTG-TAL-Supplement-Jul2024"
created: 2026-05-01
updated: 2026-05-01
related:
  - "[[wiki/projects/LTG-Project]]"
  - "[[wiki/entities/LTG]]"
  - "[[wiki/sources/LTG-INS-Meetings-2024]]"
  - "[[wiki/sources/LTG-TAL-Meetings-2024]]"
  - "[[wiki/sources/LTG-SYS-Meetings-2024]]"
  - "[[wiki/sources/LTG-TAL-Supplement-Jul2024]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# Toàn Cảnh Dự Án LTG Phase 3

## Document History

| Ngày | Phiên bản | Mô tả | Người tạo |
|------|-----------|-------|-----------|
| 01/05/2026 | 1.0.0 | Tạo tài liệu tổng hợp LTG Phase 3 | Tung.Ly |

---

## Nội dung – Content

- [1. Giới thiệu tài liệu](#1-giới-thiệu-tài-liệu)
  - [1.1 Mục tiêu tài liệu](#11-mục-tiêu-tài-liệu)
  - [1.2 Từ viết tắt](#12-từ-viết-tắt)
- [2. Bức tranh toàn cảnh](#2-bức-tranh-toàn-cảnh)
- [3. Các điểm cốt lõi](#3-các-điểm-cốt-lõi)
- [4. Biểu đồ](#4-biểu-đồ)
  - [4.1 Biểu đồ số liệu Charts View](#41-biểu-đồ-số-liệu-charts-view)
- [5. Quy luật & Mâu thuẫn](#5-quy-luật--mâu-thuẫn)
- [6. Khuyến nghị](#6-khuyến-nghị)

---

# 1. Giới thiệu tài liệu

## 1.1 Mục tiêu tài liệu

Tài liệu tổng hợp toàn diện dự án LTG Phase 3 (07/2024) — bao gồm 3 phân hệ INS, TAL, SYS — dành cho SE, BA, PM cần tham chiếu pattern triển khai tập đoàn đa pháp nhân hoặc chuẩn bị dự án tương tự.

## 1.2 Từ viết tắt

| STT | Thuật ngữ | Ý nghĩa |
|-----|-----------|---------|
| 1 | LTG | Long Thành Gaz / LTG Group — tập đoàn sản xuất & phân phối |
| 2 | INS | Phân hệ Bảo Hiểm (Insurance) |
| 3 | TAL | Phân hệ Nhân Tài (Talent Management) |
| 4 | SYS | Phân hệ Hệ Thống (System / Permissions) |
| 5 | HĐ | Hợp đồng lao động |
| 6 | GAP | Khoảng cách năng lực giữa NV và vị trí chủ chốt |
| 7 | Cat_DayOff | Danh mục ngày nghỉ chuẩn của HRM |
| 8 | UAT | User Acceptance Testing |

---

# 2. Bức tranh toàn cảnh

Dự án LTG Phase 3 là giai đoạn post-UAT fix tháng 07/2024, tập trung xử lý 3 nhóm vấn đề phức tạp cùng lúc: (1) logic BH bị phá vỡ hoàn toàn do ca làm việc 24h, (2) triển khai TAL đầy đủ nhất từ trước đến nay trong hệ sinh thái HRM, (3) mở rộng kiến trúc phân quyền core để hỗ trợ nhân viên kiêm nhiệm đa pháp nhân.

Điều đáng chú ý là cả 3 vấn đề này **không phải gap sản phẩm** — chúng là gap giữa giả định thiết kế HRM và thực tế nghiệp vụ tập đoàn. HRM mặc định 1 NV = 1 pháp nhân, 1 ca làm = 8h, ngày nghỉ lễ từ `Cat_DayOff`. LTG vi phạm cả 3 giả định này cùng một lúc, khiến Phase 3 trở thành bài kiểm tra stress test nghiêm khắc nhất cho khả năng custom của nền tảng.

([[wiki/projects/LTG-Project]], [[wiki/entities/LTG]])

---

# 3. Các điểm cốt lõi

| # | Điểm | Nguồn | Độ tin cậy |
|---|------|-------|------------|
| 1 | Ca 24h (12 ngày/tháng) làm logic nghỉ 14 ngày tiêu chuẩn **vô nghĩa** — NV không bao giờ đủ 14 ngày nghỉ dù bệnh cả tháng | [[wiki/sources/LTG-INS-Meetings-2024]] | Dữ kiện |
| 2 | Giải pháp "tính công trước từ phần tử BH" là workaround đặc thù — không thể reuse trực tiếp cho KH khác có ca bình thường | [[wiki/sources/LTG-INS-Meetings-2024]] | Suy luận |
| 3 | `Cat_DayOff` là giả định ngầm trong toàn bộ module INS — LTG là trường hợp đầu tiên không dùng danh mục này, tiềm ẩn lỗi nếu KH khác cũng có ngày nghỉ custom | [[wiki/sources/LTG-INS-Meetings-2024]] | Suy luận |
| 4 | Quy trình duyệt kế thừa 4 bước (B3 bình luận bắt buộc trước B4 duyệt) — pattern kiểm soát quy trình tốt, có thể áp dụng cho các dự án TAL khác | [[wiki/sources/LTG-TAL-Supplement-Jul2024]] | Dữ kiện |
| 5 | Phân quyền tự động theo nhóm nhân viên (3 nhóm thấp → "Nhân viên LTG", còn lại → thêm "Quản lý") — pattern tái sử dụng cao cho tập đoàn đa cấp | [[wiki/sources/LTG-TAL-Meetings-2024]] | Dữ kiện |
| 6 | Mở rộng `Get_Data_Permission_New()` + thêm store `Get_Data_PermissionConCurrent_New()` — **thay đổi hàm core ảnh hưởng rộng**, cần regression test toàn bộ store dùng hàm này | [[wiki/sources/LTG-SYS-Meetings-2024]] | Dữ kiện |
| 7 | Cảnh báo L&D khi NV kế thừa bị kỷ luật — item **chưa có giải pháp** khi archive, là technical debt tiềm ẩn | [[wiki/sources/LTG-TAL-Supplement-Jul2024]] | Dữ kiện |
| 8 | TAL LTG là triển khai đầy đủ nhất (vị trí chủ chốt + khung năng lực + kế thừa + L&D + scheduler + phân quyền tự động) — nên dùng làm baseline reference | [[wiki/sources/LTG-TAL-Meetings-2024]] | Dữ kiện |

---

# 4. Biểu đồ

## 4.1 Biểu đồ số liệu Charts View

#### 📈 Phân bổ effort 3 phân hệ LTG Phase 3 (theo số buổi họp)

> 💡 **Kể chuyện dữ liệu:**
>
> TAL chiếm tới 4/8 buổi họp — gấp đôi INS và SYS cộng lại, cho thấy đây là phân hệ phức tạp nhất, không phải INS như thường thấy ở các dự án khác.
> INS và SYS mỗi phân hệ chỉ 2 buổi, nhưng mỗi buổi xử lý quyết định kiến trúc lớn (workaround 14 ngày, mở rộng hàm phân quyền core).
> TAL nhiều họp không đồng nghĩa nhiều rủi ro — ngược lại, effort cao cho TAL phản ánh việc đây là triển khai đầy đủ đầu tiên của phân hệ này tại VnResource.
> Pattern này ngụ ý: khi KH yêu cầu TAL đầy đủ, cần estimate tối thiểu 4–6 buổi phân tích — không thể rút ngắn.
> Câu hỏi chưa rõ: sau archive, các buổi regression test cho `Get_Data_Permission_New` được thực hiện ở đâu — không thấy trong biên bản?
> Nếu pattern này lặp lại ở dự án tiếp theo có TAL mà không estimate đủ buổi phân tích → UAT sẽ kéo dài.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "TAL (Nhân Tài)"
    value: 4
  - label: "INS (Bảo Hiểm)"
    value: 2
  - label: "SYS (Hệ Thống)"
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
      alias: "Số buổi họp"
```

> 🎯 **Nên làm**: SE lead dự án TAL tiếp theo cần block tối thiểu 4 buổi phân tích vào WBS ngay từ kick-off, không để BA tự quyết định số buổi.

---

#### 📈 Tỉ lệ items đã giải quyết vs còn pending khi archive LTG Phase 3

> 💡 **Kể chuyện dữ liệu:**
>
> 87.5% items đã giải quyết trước khi archive nghe có vẻ tốt — nhưng 1 item còn lại chính xác là item phức tạp nhất (cảnh báo L&D khi NV kế thừa bị kỷ luật), không phải item nhỏ.
> Khoảng cách 87.5% vs 12.5% ẩn chứa rủi ro: item chưa giải quyết liên quan đến 2 bên stakeholder (Bao.Tran + Hoàng.Huynh) chưa chốt — không phải lỗi kỹ thuật mà là gap quyết định.
> Pattern "archive với pending item phụ thuộc stakeholder bên ngoài" là dấu hiệu technical debt sẽ quay lại trong phase support/vận hành.
> Đây không phải cá nhân — là quy trình: không có cơ chế buộc chốt decision trước khi archive.
> Không rõ item này có được ghi vào backlog vận hành hay đơn giản bị bỏ qua sau khi project đóng.
> Nếu LTG Phase 4 (nếu có) không kế thừa context này → cần phân tích lại từ đầu, tốn thêm 1–2 buổi.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Pie

#-----------------#
#- chart data    -#
#-----------------#
data:
  - type: "Đã giải quyết"
    value: 7
  - type: "Còn pending"
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

> 🎯 **Nên làm**: PM/BA cần tạo "Archive Checklist" yêu cầu tất cả pending items phải có owner rõ ràng và deadline trước khi project được đóng chính thức.

---

# 5. Quy luật & Mâu thuẫn

**Quy luật rút ra:**

**Quy luật 1 — "Ca đặc thù phá vỡ nghiệp vụ BH trước khi viết 1 dòng code"**: Logic nghỉ 14 ngày, đếm ngày DayCount, tính ngày nghỉ lễ — tất cả đều giả định ca 8h/ngày, 5 ngày/tuần. Không hỏi ca làm việc từ đầu dự án INS = đảm bảo phát hiện lỗi muộn tại UAT. ([[wiki/sources/LTG-INS-Meetings-2024]])

**Quy luật 2 — "Mở rộng hàm core = rủi ro lan rộng ngầm"**: `Get_Data_Permission_New()` được dùng trong hàng chục store. Sửa hàm này cho LTG có thể ảnh hưởng đến store của KH khác đang chạy song song trên cùng server nếu không isolate cẩn thận. Chỉ apply cho "một số nghiệp vụ cần thiết" là nguyên tắc đúng nhưng cần checklist rõ ràng. ([[wiki/sources/LTG-SYS-Meetings-2024]])

**Quy luật 3 — "TAL đầy đủ = reference blueprint"**: LTG là trường hợp hiếm triển khai TAL với đủ 6 module (vị trí chủ chốt, khung năng lực, kế thừa, L&D, scheduler, phân quyền tự động). Không tài liệu hóa pattern này = mất blueprint cho dự án sau. ([[wiki/sources/LTG-TAL-Meetings-2024]])

**Mâu thuẫn phát hiện:**

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | Workaround "tính công trước từ phần tử BH" cho nghỉ 14 ngày LTG — không được document là config đặc thù, dễ bị SE khác hiểu nhầm là logic chuẩn | SE mới maintain sẽ áp logic này cho KH ca bình thường → sai BH |
| 2 | `Cat_DayOff` không dùng ở LTG nhưng không có cờ config rõ ràng trong hệ thống — logic ngầm hardcode T7+CN | KH khác cũng có ngày nghỉ custom sẽ không biết LTG đã mở tiền lệ, phát hiện muộn |
| 3 | Item cảnh báo L&D khi kỷ luật NV kế thừa — chưa chốt solution, archive với trạng thái "cần chốt với Bao.Tran + Hoàng.Huynh" | Nếu LTG raise lại issue này trong vận hành, team support không có context, tốn thêm thời gian điều tra |

---

# 6. Khuyến nghị

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | SE lead dự án INS mới: **thêm câu hỏi bắt buộc về ca làm việc vào checklist kick-off** (ngày/tuần, giờ/ngày, có dùng Cat_DayOff không) | LTG chứng minh không hỏi sớm = phát hiện muộn tại UAT, tốn 2+ buổi họp fix |
| 🔴 Cao | **Document workaround nghỉ 14 ngày LTG** rõ ràng là "config đặc thù ca 24h" trong comment code và wiki, không để logic ngầm | Tránh SE khác reuse nhầm cho KH ca bình thường |
| 🟡 Trung bình | **Tạo regression test checklist** cho `Get_Data_Permission_New()` trước khi deploy bất kỳ thay đổi nào vào hàm này | Hàm core, ảnh hưởng rộng, không có test → bug lan rộng sang KH khác |
| 🟡 Trung bình | **Dùng TAL LTG làm baseline reference** khi estimate dự án TAL mới — minimum 4 buổi phân tích, 6 module cần confirm scope từ đầu | LTG là triển khai TAL đầy đủ nhất hiện có trong hệ sinh thái HRM |
| 🟢 Thấp | **Theo dõi item cảnh báo L&D kỷ luật NV kế thừa** — xác nhận với LTG còn cần không, nếu cần thì backlog | Pending item chưa có owner, dễ bị mất trong quá trình vận hành |

---

## 💬 3 Câu hỏi suy ngẫm

1. 🧠 **[Giả định]** Chúng ta đang giả định rằng workaround ca 24h của LTG là trường hợp ngoại lệ duy nhất — nhưng liệu còn bao nhiêu KH khác đang chạy ca đặc thù (3 ca, 12h, liên ca) mà chúng ta chưa phát hiện ra logic BH đang sai?

2. 🧪 **[Thí nghiệm]** Nếu áp nguyên pattern "phân quyền tự động theo nhóm nhân viên" của LTG vào dự án QuickPack (QPVN — sản xuất, nhiều loại lao động) thì cần điều chỉnh gì? Mapping nhóm NV → nhóm quyền có đủ linh hoạt hay cần redesign màn hình cấu hình?

3. 🌐 **[Kết nối]** Item pending "cảnh báo L&D khi NV kế thừa bị kỷ luật" của LTG có liên quan trực tiếp đến pattern notification chưa được chuẩn hóa trong HRM — đọc [[wiki/sources/LTG-TAL-Supplement-Jul2024]] và [[wiki/sources/GiaoBan-2026-TongHop]] để xem liệu đây có phải gap sản phẩm cần roadmap hay chỉ là yêu cầu đặc thù LTG.
