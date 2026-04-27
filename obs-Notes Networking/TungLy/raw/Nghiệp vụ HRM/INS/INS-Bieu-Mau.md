---
type: concept
tags: [HRM, Insurance, BHXH, BHYT, bieu-mau, D02, C70A, TK01, TK02]
date-updated: 2026-04-26
related:
  - "[[INS-Thiet-Ke-Chuc-Nang]]"
  - "[[INS-Nghiep-Vu]]"
  - "[[INS-Database-Tables]]"
  - "[[INS-C70-FAQ]]"
---

# Các Biểu Mẫu Bảo Hiểm (INS)

> Nguồn: VnResource HRM Pro 8 — Tài liệu thiết kế chức năng Bảo Hiểm
> Liên kết: [[INS-Thiet-Ke-Chuc-Nang]]

## Mẫu TK01-TS — Tờ khai tham gia BHXH, BHYT

Dùng cho nhân viên **mới tham gia** BHXH, BHYT lần đầu.

### Enum xuất BC mẫu TK01-TS

| Enum | Ý nghĩa |
|------|---------|
| `«PROFILENAME»` | Họ và tên |
| `«GenderView»` | Giới tính |
| `«EthnicGroupName»` | Dân tộc |
| `«VillageBirthCertificate»` | [06.1] Xã (phường, thị trấn) |
| `«ProvinceBirthCertificate»` | Tỉnh (Tp) |
| `«PAddress»` | Số nhà, đường phố, thôn xóm |
| `«PVillageName»` | [07.2] Xã (phường, thị trấn) |
| `«PDistrictName»` | [07.3] Huyện (quận, thị xã, Tp thuộc tỉnh) |
| `«PProvinceName»` | [07.4] Tỉnh (Tp) |
| `«SocialInsOldNo»` | [09] Mã số BHXH (đã cấp) |
| `«CellPhone»` | Số điện thoại liên hệ |
| `«IDNo»` | Số CMND / Hộ chiếu / Thẻ căn cước |
| `«HouseHoldCode»` | Mã số hộ gia đình (đã cấp) |
| `«HealthTreatmentPlace»` | Nơi đăng ký khám bệnh, chữa bệnh ban đầu |

---

## Mẫu TK02-TS — Tờ khai thay đổi thông tin tham gia BHXH, BHYT

Dùng khi nhân viên **thay đổi thông tin** tham gia BHXH, BHYT (địa chỉ, nơi KCB, ...).

---

## Mẫu D02-TS — Danh sách lao động tham gia BHXH, BHYT

**Mục đích:**
- Kê khai lao động, tiền lương tham gia BHXH, BHYT, BHTN
- Điều chỉnh mức đóng BHXH, BHYT, BHTN
- Trách nhiệm lập thuộc **đơn vị sử dụng lao động** khi có phát sinh tăng/giảm lao động hoặc tăng/giảm tiền lương

**Cột tiêu chí D02:**

| Cột | Nội dung | Ghi chú |
|-----|----------|---------|
| STT | Số thứ tự theo từng phần (tăng/giảm) | |
| Họ và tên | Họ tên người lao động | |
| Số định danh | Số sổ BHXH (nếu có) | |
| Cấp bậc, chức vụ, chức danh | Ghi rõ nếu không làm tại trụ sở chính | |
| Tiền lương | Mức tiền lương chính | |
| CV | Hệ số phụ cấp chức vụ (cơ quan HCNN) | |
| TN VK, TN Nghề | Tỷ lệ % thâm niên vượt khung, thâm niên nghề | VD: 5 = 5% |
| PC khác | Mức phụ cấp khác được đóng BHXH | |
| Từ tháng | Tháng bắt đầu báo tăng/giảm/điều chỉnh | |
| Ghi chú | Ghi rõ ĐẾN THÁNG nào (vì không có cột riêng) | Ví dụ: "Tăng lương đến tháng 10/2014" |

**Ký hiệu viết tắt nghiệp vụ D02:**

| Ký hiệu | Nội dung |
|---------|---------|
| AD | Truy thu nguyên lương (BHXH + BHYT + BHTN) |
| CD | Điều chỉnh chức danh |
| DC | Điều chỉnh lương (BHXH + BHYT + BHTN) |
| DN | Điều chỉnh tham gia thất nghiệp (mức lương thời điểm) |
| GH | Giảm hẳn (BHXH + BHYT + BHTN) |
| GN | Giảm tham gia BHTN |
| KL | Nghỉ không lương (BHXH + BHYT + BHTN) |
| OF | Nghỉ do ốm đau/Nghỉ không lương |
| ON | Đi làm lại sau (BHXH + BHYT + BHTN) |
| SB | Thoái thu nguyên lương (BHXH, BHTN) |
| TM | Tăng mới (BHXH + BHYT + BHTN) |
| TN | Tăng tham gia BHTN |
| TS | Thai sản (BHXH + BHYT + BHTN) |
| TT | Truy thu BHYT |
| TU | Thoái thu BHYT |

**Trạng thái D02 theo loại:**

| Loại | Diễn giải |
|------|-----------|
| **Tăng** | Tăng LĐ, Tăng Do Nghỉ 14 Ngày Đi Làm Lại, Tăng Sau Nghỉ Tạm Hoãn, Tăng Thai Sản, Tăng Bệnh, Tăng BHTN, Tăng BHYT |
| **Giảm** | Giảm LĐ, Giảm Thai Sản, Giảm Bệnh, Giảm Do Nghỉ >= 14 Ngày, Giảm Nghỉ Tạm Hoãn |
| **Điều chỉnh** | Thay Đổi Lương, Giảm/Tăng Mức Đóng, Tăng/Giảm Lương Và Thay Đổi Chức Danh, Thay Đổi Chức Danh, Điều chỉnh tăng/giảm/chức danh |
| **Khác** | Nghỉ luôn sau thai sản, Nghỉ 14 ngày sau thai sản, Nghỉ Việc Mà Tháng Trước Nghỉ >= 14 Ngày, Giảm/Tăng LĐ Do Đổi Nơi Đóng BH |

---

## Mẫu D03-TS — Danh sách người chỉ tham gia BHYT

Dùng cho nhân viên **chỉ tham gia BHYT** (không tham gia BHXH, BHTN).

---

## Mẫu C70A — Đề nghị giải quyết trợ cấp ốm đau, thai sản, dưỡng sức

### Mục đích
Căn cứ đề nghị giải quyết trợ cấp ốm đau, thai sản, dưỡng sức, phục hồi sức khỏe đối với người lao động trong doanh nghiệp.

### Trách nhiệm lập
- Đơn vị sử dụng lao động lập cho từng đợt
- Có thể đề nghị nhiều đợt trong tháng, theo tháng hoặc theo quý
- Nếu danh sách nhiều tờ: phải có **dấu giáp lai**

### Cơ sở lập
- Giấy chứng nhận nghỉ việc hưởng BHXH
- Giấy khám chữa bệnh của con
- Bản sao sổ y bạ của con, phiếu hội chẩn
- Giấy khám thai, bản sao giấy chứng sinh
- Bản sao giấy khai sinh, giấy ra viện
- Quyết định công nhận việc nuôi con nuôi

### Hướng dẫn ghi — Phần 1: Danh sách đề nghị hưởng chế độ mới phát sinh

| Cột | Nội dung ghi |
|-----|-------------|
| A, B | Số thứ tự, họ và tên người hưởng |
| 1 | Số sổ BHXH hoặc số định danh |
| 2 | Điều kiện tính hưởng (xem bảng mã bên dưới) |
| 3 | Điều kiện tính hưởng về thời điểm |
| 4 | Ngày bắt đầu nghỉ việc hưởng chế độ |
| 5 | Ngày cuối cùng nghỉ hưởng chế độ |
| 6 | Tổng số ngày nghỉ trong kỳ đề nghị |

**Mã điều kiện cột 2:**

| Chế độ | Trường hợp | Mã |
|--------|-----------|-----|
| Ốm đau | Bệnh thông thường | (để trống) |
| Ốm đau | Bệnh dài ngày | BDN |
| Thai sản | Khám thai | (để trống) |
| Thai sản | Sảy/nạo thai (ví dụ 3 tuần) | 03T |
| Thai sản | Sảy/nạo thai (ví dụ 3 tháng) | 03Th |
| Thai sản | Sinh 1 con | SC |
| Thai sản | Sinh đôi | SC02 |
| Thai sản | Nhận con nuôi | NCN |
| Thai sản | Mẹ chết, cha hưởng chế độ | MC01 |
| Thai sản | Người nuôi dưỡng hưởng | MC02 |
| Thai sản | Con < 60 ngày chết | 60- |
| Thai sản | Con > 60 ngày chết | 60+ |
| Thai sản | Đặt vòng | ĐV |
| Thai sản | Triệt sản | TS |
| DSPHSK | Sau ốm thông thường | (để trống, mặc định 5 ngày) |
| DSPHSK | Sau ốm phẫu thuật | PT |
| DSPHSK | Sau ốm bệnh dài ngày | BDN |
| DSPHSK | Tập trung | BDN/TT |
| DSPHSK | Sau sinh mổ | PT |
| DSPHSK | Sinh đôi tại nhà | SC02 |
| DSPHSK | Sinh đôi tập trung | SC02/TT |

### Phần 2: Danh sách đề nghị điều chỉnh số đã được giải quyết

Lập cho NV đã được BHXH giải quyết các đợt trước nhưng cần điều chỉnh do:
- Tính sai mức hưởng
- Phát sinh về hồ sơ hoặc chính sách
- Tiền lương thay đổi làm thay đổi mức hưởng

| Cột | Nội dung |
|-----|---------|
| Cột 2 | Ghi đợt/tháng/năm đã được giải quyết |
| Cột 3 | Nội dung điều chỉnh (tiền lương, số ngày nghỉ, mức hưởng...) |
| Cột C | Lý do điều chỉnh cụ thể |

> ⏱ Thông thường **~3 ngày làm việc** sau khi nộp C70A, doanh nghiệp nhận được **C70B-HD** (do cơ quan BHXH lập).

---

## BC Kế Toán 01 và 02 — Dữ Liệu Thanh Toán BH NV

- **BC Kế Toán 01**: Dữ liệu thanh toán BH chưa điều chỉnh
- **BC Kế Toán 02**: Dữ liệu thanh toán BH đã điều chỉnh

---

## Liên kết

- [[INS-Thiet-Ke-Chuc-Nang]] — Tổng quan tài liệu thiết kế
- [[INS-Nghiep-Vu]] — Nghiệp vụ tăng/giảm/điều chỉnh bảo hiểm
- [[INS-IBHXH]] — Chi tiết cột dữ liệu IBHXH tăng/giảm
- [[INS-Database-Tables]] — Bảng dữ liệu liên quan
- [[INS-C70-FAQ]] — FAQ báo cáo C70
