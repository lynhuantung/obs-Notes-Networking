---
type: synthesis
tags:
  - research
  - bao-hiem
  - hrm
  - misa
  - bhxh
  - bhyt
  - bao-hiem-tu-nguyen
date-created: 2026-04-26
date-updated: 2026-04-26
research-topic: Nghiệp vụ Bảo hiểm trong FIT-HRM
sources-wiki: 5 trang
sources-raw: 7 file thô
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/H-VnPay-INS-05082025]]"
  - "[[wiki/projects/VnPay-Project]]"
---

# Nghiên cứu: Nghiệp vụ Bảo hiểm trong FIT-HRM

> Nghiên cứu tổng hợp từ 5 nguồn wiki + 7 file thô | 2026-04-26  
> Dự án tham chiếu: LTG, FIT, UNIS, TBV, Karcher, VnPay (2024–2025)

---

## Tóm tắt điều hành

Phân hệ Bảo hiểm (INS) trong FIT-HRM bao gồm hai nhánh chính: **(1) Bảo hiểm bắt buộc** (BHXH/BHYT/BHTN) với các quy trình chứng từ, phân tích bảo hiểm, trích nộp và báo cáo tăng/giảm; và **(2) Bảo hiểm tự nguyện** cho phép nhân viên đăng ký qua portal. Điểm phức tạp nhất trong triển khai là **logic nghỉ 14 ngày** (tính công theo phần tử BH, không theo ca) và **tích hợp MISA AMIS** (tờ khai 600, 01-HSB, đồng bộ ngược trạng thái hồ sơ). Tích hợp MISA là dependency ngoài kiểm soát — cần milestone rõ ràng và buffer thời gian. Chu kỳ bảo hiểm có thể phải tách thành 15-14 (không trùng tháng dương lịch) tùy yêu cầu cơ quan BHXH địa phương.

---

## 1. Bối cảnh & Phạm vi

**Phân hệ**: INS — Bảo hiểm  
**Hệ thống**: FIT-HRM (VnResource)  
**Dự án tham chiếu**:

| Dự án | Năm | Chủ đề bảo hiểm |
|-------|-----|----------------|
| LTG | 2024 | Chứng từ BHXH, logic nghỉ 14 ngày, ngày nghỉ hàng tuần/ngày lễ |
| FIT | 2024 | Chu kỳ bảo hiểm 15-14, tách thiết lập theo chế độ |
| UNIS | 2024 | Bảo hiểm tự nguyện (portal, người thân, gói BH) |
| TBV | 2024 | Trích nộp, Ốm đau-Thai sản, tích hợp AMIS 01-HSB |
| Karcher | 2024 | Enum công thức nghỉ 14 ngày khi không mua module Công |
| VnPay | 2025 | Tích hợp MISA AMIS mốc 600/630, lộ trình T9/2025 |

---

## 2. Findings — Những gì tìm thấy

### 2.1 Cấu trúc Phân hệ Bảo hiểm (INS)

**Fact** (nguồn: [[wiki/concepts/HRM-Modules]]):

FIT-HRM định nghĩa phân hệ Bảo hiểm gồm:
- **BHXH** — Bảo hiểm xã hội
- **BHYT** — Bảo hiểm y tế
- **BHTN** — Bảo hiểm thất nghiệp
- **Khai báo cơ quan bảo hiểm**

Ngoài ra, qua các dự án thực tế, phân hệ INS còn bao gồm:
- **Bảo hiểm tự nguyện** (UNIS, 2024) — đăng ký qua portal, dành cho người thân phụ thuộc
- **Tích hợp MISA AMIS** (TBV, VnPay) — đồng bộ tờ khai điện tử

---

### 2.2 Chứng từ BHXH

**Fact** (nguồn: `H-LTG-INS-080724.md`):

Hệ thống có 2 màn hình liên quan:
- **Màn hình Chứng từ BHXH** — chứa dữ liệu chính thức đã duyệt
- **Màn hình Ngày nghỉ Chờ Chứng từ** — bảng tạm trước khi duyệt

**Luồng nghiệp vụ nút Duyệt:**
```
Ngày nghỉ chờ CT BHXH  
  + Bảng lưu tạm chứng từ  
        ↓ [Nút Duyệt]  
  Bảng Chứng từ BHXH (chính thức)
```

**Các loại chứng từ được hỗ trợ:**
- Ốm ngắn ngày
- Ốm dài ngày (có thể chuyển đổi loại)
- Thai sản (load ngày dự sinh từ quá trình thai sản)
- Sẩy thai
- Nghỉ dưỡng bệnh

**Fact** (nguồn: `H-TBV-INS-160924.md`):
- Ngày nghỉ ốm không có chứng từ → **không** cần quản lý ở màn hình chứng từ
- Mỗi loại chứng từ có **mức hưởng tối đa** riêng trong năm; quá mức → không quản lý nữa
- Khi thay đổi loại chứng từ (VD: từ ốm ngắn ngày → dài ngày) → **không** thay đổi ngày nghỉ đã đăng ký

---

### 2.3 Logic Nghỉ 14 Ngày — Điểm phức tạp nhất

**Fact** (nguồn: `H-LTG-INS-080724.md`):

Vấn đề phát sinh: Nhân viên làm ca 24h/ngày → 1 tháng chỉ đi làm 12 ngày → **không bao giờ nghỉ quá 14 ngày** theo cách đếm thông thường.

**Giải pháp** (LTG): Tính số ngày làm việc **từ phần tử bảo hiểm** (module Bảo hiểm), không dùng ca làm việc (module Công).

**Fact** (nguồn: `H-Karcher-INS-281124.md`):
- Thêm **enum công thức nghỉ 14 ngày** — cho phép cấu hình cách tính số ngày
- Áp dụng khi khách hàng **không mua module Công**
- Nghỉ thai sản và nghỉ dài ngày → hệ thống đã hỗ trợ sẵn

**Fact** (nguồn: `H-TBV-INS-160924.md`):
- Nhân viên nghỉ việc sau ngày 15, trước đó có ngày nghỉ (bệnh/không lương) nhiều hơn 14 ngày → tính là **nghỉ không lương**

---

### 2.4 Chu kỳ Bảo hiểm

**Fact** (nguồn: `H-FIT-INS-250624.md`):

FIT (dự án 2024) yêu cầu chu kỳ **15-14** (từ ngày 15 tháng này đến ngày 14 tháng sau) thay vì chu kỳ tháng dương lịch thông thường.

**Lý do:**
1. Cơ quan BHXH tỉnh ngoài Hà Nội yêu cầu chu kỳ 15-14
2. Giảm rủi ro điều chỉnh truy thu BH tháng sau

**Giải pháp thiết kế:**
- Tách chu kỳ bảo hiểm → cấu hình trong **Chế độ Bảo hiểm** (không phải toàn hệ thống)
- Điều kiện 1 (nghỉ 14 ngày) được thiết lập riêng theo chế độ

---

### 2.5 Quy trình Trích nộp Bảo hiểm

**Fact** (nguồn: `H-TBV-INS-160924.md`):

**Các tình huống đặc biệt:**

| Tình huống                         | Xử lý                                                |
| ---------------------------------- | ---------------------------------------------------- |
| NV không đủ lương để đóng BH       | Trừ toàn bộ vào tháng sau                            |
| NV nghỉ không lương **full tháng** | Vẫn đóng BHYT (4.5% NLĐ)                             |
| Chốt dữ liệu phân tích BH          | Xác nhận dòng → **khóa**, không chỉnh sửa lại        |
| Nơi đóng BH mặc định               | Cấu hình theo huyện/quận (VD: BHXH huyện Long Thành) |

---

### 2.6 Quy trình Ốm đau — Thai sản

**Fact** (nguồn: `H-TBV-INS-160924.md`):

**Cảnh báo tự động:**
- Nghỉ **> 180 ngày** → cảnh báo nghỉ dài ngày
- Khám thai **> 5 lần/thai kỳ** → cảnh báo vượt mức

**Chức năng cần có:**
- Nhập số tiền và kết quả thanh toán từ cơ quan BH
- Có thể thay đổi loại chứng từ (ngắn ngày ↔ dài ngày) nhưng không đổi ngày nghỉ

---

### 2.7 Báo cáo Tăng/Giảm BHYT

**Fact** (nguồn: `H-TBV-INS-160924.md`):

Tình huống: NV nghỉ ốm/không lương, sau đó đi làm lại trong kỳ bảo hiểm:

```
Bước 1: Vẫn báo TĂNG trong kỳ (để duy trì thẻ BHYT)
Bước 2: Sau đó báo GIẢM trong kỳ (khi chắc chắn đi làm lại)
```

→ Đảm bảo NV không bị mất thẻ BHYT trong thời gian chờ xác nhận.

---

### 2.8 Ngày nghỉ trong Bảo hiểm (Chuẩn hóa)

**Fact** (nguồn: `H-LTG-INS-250724.md`):

Vấn đề: Hệ thống đang tính ngày nghỉ hàng tuần theo **ca làm việc** của nhân viên, và ngày nghỉ lễ dựa vào bảng `Cat_DayOff`.

**Yêu cầu chuẩn:**
- Ngày nghỉ hàng tuần → cố định: **Thứ 7, Chủ nhật**
- Ngày nghỉ lễ → **không** dùng `Cat_DayOff` (dùng quy định pháp luật cố định)

---

### 2.9 Bảo hiểm Tự nguyện

**Fact** (nguồn: `H-UNIS-INS-100624.md`, `H-UNIS-INS-200824.md`):

Áp dụng tại dự án UNIS (2024) — bảo hiểm sức khỏe tự nguyện cho giáo viên (cả người Việt Nam và nước ngoài).

**Luồng nghiệp vụ:**
```
Portal Nhân viên: đăng ký BH cho bản thân + người thân phụ thuộc
     ↓ (chọn gói BH từ danh mục)
Main (Nhân sự): Phê duyệt đăng ký
     ↓
Theo dõi tình trạng + phân tích BH tự nguyện
```

**Thông tin người thân phụ thuộc:** Loại quan hệ, độ tuổi, **quốc tịch**  
**Loại BH**: BH sức khỏe (không dùng BH tai nạn)  
**Figma**: [WEB: INS - Bảo hiểm](https://www.figma.com/design/z7kzWPVGsvmDBHjUxOjBBk/)

---

### 2.10 Tích hợp MISA AMIS

**Fact** (nguồn: [[wiki/sources/H-VnPay-INS-05082025]], `H-TBV-INS-160924.md`, `H-VnPay-INS-05082025.md`):

**Trạng thái tích hợp (theo dự án):**

| Tờ khai | TBV (09/2024) | VnPay (08/2025) |
|---------|--------------|----------------|
| Tờ khai 600 (Tăng/giảm/điều chỉnh) | Đang tích hợp | Mốc 600 (đồng bộ danh mục) |
| 01-HSB | Chưa tích hợp | Mốc 630 (danh mục bổ sung) |
| Đồng bộ ngược hồ sơ | Chưa | 30/09/2025 |

**Pattern tích hợp VnPay ↔ MISA:**
```
MISA → cung cấp API danh mục (05/09/2025)
VnR  → sử dụng danh mục, cung cấp API endpoint
MISA → gọi lại API VnR để đồng bộ ngược trạng thái hồ sơ (30/09/2025)
```

**Bảng mapping**: VnResource fields ↔ AMIS Bảo hiểm fields (đã có sẵn, không public ở đây)

**Rủi ro**: Phụ thuộc lịch bàn giao của MISA — dependency ngoài kiểm soát ([[wiki/synthesis/VnPay-Lessons-Learned]])

---

## 3. Phân tích & Nhận định

### Pattern chung: BH là phân hệ có nhiều biến thể theo khách hàng nhất

**Nhận định**: Qua 6 dự án khảo sát, phân hệ BH có mức độ customize cao — mỗi khách hàng đều phát sinh ít nhất 1 yêu cầu riêng (chu kỳ, cách tính ngày, nơi đóng BH, loại tờ khai). Đây là phân hệ cần BA/PM có kinh nghiệm để phân tích GAP kỹ trước khi estimate.

### Tích hợp MISA là rủi ro lặp đi lặp lại

**Fact**: TBV (09/2024) chưa tích hợp 01-HSB; VnPay (08/2025) vẫn đang lên lịch.  
**Nhận định**: Tích hợp MISA AMIS là bài toán chưa được giải hoàn toàn trong bất kỳ dự án nào tính đến thời điểm ghi nhận. Cần theo dõi kết quả VnPay (T9/2025) làm baseline.

### Logic "nghỉ 14 ngày" là điểm hay bị phát sinh sau UAT

**Nhận định**: Xuất hiện ở 3 dự án độc lập (LTG, Karcher, TBV). Pattern giải pháp hội tụ về hướng "tính từ phần tử BH + enum cấu hình" → có thể chuẩn hóa thành tính năng platform.

### Bảo hiểm tự nguyện là nhu cầu ngành giáo dục/dịch vụ

**Nhận định**: UNIS là dự án duy nhất có BH tự nguyện trong tập dữ liệu hiện tại. Có thể xuất hiện ở các dự án dịch vụ tương tự. Figma đã có — có thể tái sử dụng design.

---

## 4. Gaps & Hạn chế

| Gap | Mô tả |
|-----|-------|
| **Kết quả tích hợp MISA VnPay** | Chưa có tài liệu sau 30/09/2025 — chưa biết tích hợp thành công không |
| **01-HSB** | Chưa có dự án nào tích hợp thành công tờ khai 01-HSB |
| **Báo cáo tăng giảm hoàn chỉnh** | Chỉ có thông tin từ TBV — chưa rõ danh sách đầy đủ các báo cáo BH |
| **Quy trình BHTN** | Không có cuộc họp/tài liệu nào đề cập đến BHTN cụ thể |
| **Bảo hiểm tự nguyện ngoài UNIS** | Chỉ 1 dự án — chưa rõ pattern chung |
| **Tờ khai điện tử đầy đủ** | Danh sách đầy đủ tờ khai cần tích hợp với BHXH chưa được liệt kê |
| **Story0724-2-1 trống** | File `3. ARCHIEVED/07-2024 tổng hợp/Story0724-2-1 - Phân hệ bảo hiểm.md` không có nội dung |

---

## 5. Gợi ý hành động

1. **Ingest file thô** — 7 file chưa ingest, đặc biệt ưu tiên:
   - `H-TBV-INS-160924.md` — đầy đủ nhất, nhiều nghiệp vụ quan trọng
   - `H-FIT-INS-250624.md` — chu kỳ 15-14, ít nơi ghi lại

2. **Tạo trang wiki/concepts/BaoHiem-NghiepVu.md** — hiện chỉ có mô tả ngắn trong HRM-Modules; cần trang riêng với đầy đủ nghiệp vụ

3. **Theo dõi VnPay T9/2025** — ingest kết quả tích hợp MISA khi có để bổ sung baseline

4. **Hỏi Thong.Trinh hoặc MinhNguyendat** về:
   - Kết quả tích hợp 01-HSB có dự án nào chưa?
   - Danh sách đầy đủ tờ khai điện tử cần tích hợp với BHXH

5. **Cập nhật wiki/concepts/HRM-Modules.md** — thêm Common Issues cho phân hệ BH từ nghiên cứu này

---

## Nguồn tham khảo

### Wiki
- [[wiki/concepts/HRM-Modules]]
- [[wiki/sources/H-VnPay-INS-05082025]]
- [[wiki/sources/Monthly-07-2024-TongHop]]
- [[wiki/synthesis/VnPay-Lessons-Learned]]
- [[wiki/projects/VnPay-Project]]

### File thô (chưa ingest)
- `3. ARCHIEVED/Dự án 2024/LTG/H-LTG-INS-080724.md` — LTG: Chứng từ BHXH, nút Duyệt, logic 14 ngày
- `3. ARCHIEVED/Dự án 2024/LTG/H-LTG-INS-250724.md` — LTG: Chuẩn hóa ngày nghỉ BH
- `3. ARCHIEVED/Dự án 2024/UNIS/H-UNIS-INS-100624.md` — UNIS: BH tự nguyện (nghiệp vụ)
- `3. ARCHIEVED/Dự án 2024/UNIS/H-UNIS-INS-200824.md` — UNIS: BH tự nguyện (giao diện)
- `Area/Index/FIT/H-FIT-INS-250624.md` — FIT: Chu kỳ BH 15-14
- `3. ARCHIEVED/Dự án 2024/Karcher/H-Karcher-INS-281124.md` — Karcher: Enum nghỉ 14 ngày
- `3. ARCHIEVED/Dự án 2024/TBV/H-TBV-INS-160924.md` — TBV: Trích nộp, Ốm đau-Thai sản, AMIS
- `1. Projects/Dự án 2026/VnPay-Project/Meeting_Notes/H-VnPay-INS-05082025.md` — VnPay: MISA lộ trình
