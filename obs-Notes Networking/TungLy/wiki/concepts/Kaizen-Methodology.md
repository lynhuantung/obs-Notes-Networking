---
type: concept
domain: ins
tags:
  - kaizen
  - phuong-phap
  - quy-trinh
  - ux-improvement
  - 5s
  - root-cause-analysis
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/sources/INS-Kaizen-08]]"
  - "[[wiki/sources/INS-Kaizen-08-Cards]]"
  - "[[wiki/sources/INS-FishBone-Analysis]]"
  - "[[wiki/sources/INS-TruyNguyenNhan]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# Kaizen — Phương Pháp Cải Tiến Liên Tục

## Định nghĩa

**Kaizen** (改善) là triết lý cải tiến liên tục của Nhật Bản: *"Cải tiến từng bước nhỏ đều đặn hàng ngày, về lâu dài sẽ tích lũy thật nhiều tạo thành thay đổi lớn."*

Trong ngữ cảnh VnResource HRM, Kaizen được áp dụng từ **2017** để ghi nhận và giải quyết các vấn đề lặp lại trong phân hệ Bảo hiểm và hệ thống.

---

## Thứ tự Kaizen (3 cấp)

### 1. Kaizen công việc
- Tự hỏi: tại sao luôn bận rộn? Liệu có làm quá sức không?
- Đã chuẩn hoá chưa? Làm sao để bất kỳ ai cũng làm được?
- **5S** (tập trung 2S đầu tiên):
  - **Sàng lọc**: Phân biệt chức năng *cần* và *không cần* → lưu hoặc loại bỏ
  - **Sắp xếp**: Cho biết vị trí, lấy ở đâu trả về đâu — bất kỳ ai cũng nắm được

### 2. Kaizen màn hình
- Hướng dẫn công việc tại mỗi màn hình phần mềm
- Kaizen theo 3 cách:
  - **Chẩn đoán** (Troubleshooting) — tìm nguyên nhân
  - **Chữa trị** — fix vấn đề
  - **Tu sửa dự phòng** — kiểm tra hàng ngày để ngăn tái phát

### 3. Kaizen công đoạn
- **Công đoạn trước = ân nhân** (đảm nhiệm phần ta không làm được)
- **Công đoạn sau = khách hàng** (sẽ tiếp nối công việc của ta)
- Ưu tiên kaizen cho **công đoạn sau** (QC, PE, khách hàng) hơn chính mình

---

## 4 Phương pháp Kaizen

| Phương pháp | Mô tả | Ví dụ trong HRM |
|------------|-------|-----------------|
| **Cộng (+)** | Thêm đặc tính có giá trị | Thêm nút Help, thêm cảnh báo RAM |
| **Trừ (−)** | Loại bỏ đặc tính gây hại / lãng phí | Bỏ textbox nhập công thức → combobox |
| **Nhân (×)** | Nhân rộng kaizen cho toàn công ty | Chia sẻ thẻ Kaizen INS cho module khác |
| **Chia (÷)** | Chia nhỏ thành kaizen thật nhỏ, dễ thực hiện | Mỗi thẻ chỉ 1 vấn đề, 1 giải pháp |

---

## Nguyên tắc Trực quan hoá

> "Khi xảy ra vấn đề hãy tìm nguyên nhân gốc thay vì truy cứu trách nhiệm"

> "Dừng ngay lập tức khi gặp vấn đề — giúp thấy vấn đề để đề xuất kaizen"

> "5S chính là giai đoạn cơ bản của Kaizen. Khi không gian làm việc sạch sẽ, các vấn đề sẽ lộ diện."

---

## Mẫu thẻ Kaizen chuẩn

### Mẫu đề xuất (1 dòng)

```
[Vấn đề]       — Mô tả dưới 25 từ
[Giải pháp]    — Phương án
[Hiệu quả]     — Kết quả kỳ vọng
```

*Chỉ 1 dòng / mục — buộc người viết phải súc tích.*

### Mẫu thực hiện `[ModuleKey_STT][Date]`

| Trường | Nội dung |
|--------|---------|
| **Tiêu đề** | Vấn đề cần kaizen |
| **Page** | Đường dẫn màn hình |
| **Trước kaizen** | Mô tả / ảnh hiện trạng |
| **Sau kaizen** | Mô tả / ảnh sau cải tiến |
| **Kết quả** | Khảo sát thực tế sau triển khai |
| **Tên + ID + Phòng ban + Ngày** | `InsXXXX` — Ins = module, XXXX = số thứ tự |

---

## Liên kết với RCA

Kaizen và Root Cause Analysis (RCA) bổ trợ nhau:

```
Kaizen    → Phát hiện vấn đề → đề xuất cải tiến nhỏ → đo lường
RCA/5 Whys → Phân tích nguyên nhân gốc → ngăn tái phát
```

- Kaizen tập trung **cải thiện UX** ngay lập tức (ngắn hạn)
- RCA tập trung **loại bỏ nguyên nhân gốc** (dài hạn)

Trong thực tế VnResource, kết quả 5 Whys (như [[wiki/sources/INS-Kaizen-08]]) trở thành input để thiết kế thẻ Kaizen cụ thể (như [[wiki/sources/INS-Kaizen-08-Cards]]).

---

## Ứng dụng thực tế trong HRM BH (2017)

Kết quả áp dụng Kaizen tháng 09/2017:

| Chỉ số | Tháng 08/2017 | Tháng 09/2017 | Giảm |
|--------|--------------|--------------|------|
| Bug | 59 | **21** | **−64%** |
| Won't Fix | 27 | **6** | **−78%** |

**Nguyên tắc Pareto trong Kaizen BH**: *"Tập trung vào 2 nhóm — Phân tích BH + Báo cáo D02 — sẽ giải quyết 70% bug."*

---

## Liên kết

- [[wiki/sources/INS-Kaizen-08]] — Nhật ký Kaizen #08: 5 Whys, kế hoạch Pareto, FAQ 4M
- [[wiki/sources/INS-Kaizen-08-Cards]] — 11 thẻ Kaizen thực thi (Ins0001–Ins0011)
- [[wiki/sources/INS-FishBone-Analysis]] — FishBone 4M (kế thừa từ Kaizen)
- [[wiki/sources/INS-TruyNguyenNhan]] — 5 Whys CAPA matrix (mở rộng từ Kaizen)
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ HRM
