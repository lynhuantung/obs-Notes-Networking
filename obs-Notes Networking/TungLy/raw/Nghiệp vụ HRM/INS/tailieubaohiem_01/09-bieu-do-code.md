---
type: source
domain: ins
tags:
  - bao-hiem
  - HRM
  - INS
  - VnResource
created: 2015-02-21
updated: 2026-04-27
khach-hang: VnResource (nội bộ)
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
  - "[[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/00-INDEX]]"
source: "[[1. Projects/Nghiệp vụ HRM/INS/Ins_TaiLieuBaoHiem_01]]"
---
# INS — Biểu Đồ Code (Kỹ Thuật)

> **Domain**: Bảo hiểm (BHXH / BHYT / BHTN)
> **Khách hàng**: VnResource (nội bộ)
> **Ngày ghi**: 21/02/2015
> **Nội dung**: Biểu đồ code kỹ thuật, sequence diagram xử lý phân hệ BH

---

## Xử Lý Phân Hệ Bảo Hiểm Tổng Quát

![](Ins_TaiLieuBaoHiem_01_image64.png)

## Xử Lý Phân Hệ Bảo Hiểm

- Mối liên hệ xử lý giữa các lớp trong phân hệ bảo hiểm

- Tách phần nghỉ \>= 14 ngày để sau này dễ dàng thêm hoặc sửa (dùng
  builder Pattern)

![](Ins_TaiLieuBaoHiem_01_image65.png)

## Khởi Tạo Nghỉ 14 Ngày

![](Ins_TaiLieuBaoHiem_01_image66.png)

## Phân tích Bảo Hiểm

![](Ins_TaiLieuBaoHiem_01_image67.png)

## Phân tích D02

![](Ins_TaiLieuBaoHiem_01_image68.png)

## Báo Cáo C70A-HD

![](Ins_TaiLieuBaoHiem_01_image69.png)

###  Sequence Diagram

![](Ins_TaiLieuBaoHiem_01_image70.png)

**LOGIC D02TS**

**TĂNG**

1.  **Tăng Lao Động**

| a. | Tháng N-1 nghỉ \> 14 ngày |
| i. | HĐ đóng BHXH trong khoảng 1-\>31 tháng N =\> [Tăng |
            LĐ]{.underline}

        ii. HĐ đóng BHXH không nào trong khoảng 1-\>31 tháng N =\> [Tăng
            nghỉ 14 ngày đi làm lại]{.underline}

| b. | Tháng N-1 không nghỉ \>14 ngày |
| i. | HĐ có đóng BHXH (đầu tiên) trong khoảng 18 tháng N-1 đến 17 |
            tháng N =\> [Tăng LĐ]{.underline}

2.  **Tăng Thai Sản**

| a. | Dựa vào công hoặc chứng từ bảo hiểm |

3.  **Tăng Bệnh**

| a. | Ngắn ngày hay dài ngày và nghỉ hơn 30 ngày |

4.  **Tăng BHYT**

5.  **Tăng BHTN**

| a. | HĐ đóng BHTN (đầu tiên) của NV trong khoảng 16 tháng N-1 đến 15 |
        tháng N

**GIẢM**

1.  **Giảm LĐ** (Nghỉ Việc) \[Từ 16 tháng N-1 đến 15 tháng N\]

| a. | [Nghỉ Việc]{.underline} |
| b. | [Tạm Hoãn]{.underline} |

2.  **Giảm Thai Sản**

| a. | Giảm Thai Sản và nghỉ luôn |
| i. | Giảm TS và nghỉ việc từ 16 tháng N-1 đến 15 tháng N |
| b. | Giảm Thai Sản |
| i. | Kiểm tra NV đóng BHXH đủ 6 tháng trong 12 tháng liền kề |
| 1. | Có: =\> [Giảm Thai Sản]{.underline} |
| 2. | Không =\> kiểm nghỉ 14 ngày =\>[Giảm do nghỉ hơn 14 |
                ngày]{.underline}

3.  **Giảm Bệnh (thiếu dựa vào công)**

| a. | Chứng từ bảo hiểm nghỉ hơn 30 ngày (dài ngày hoặc ngắn ngày) |

> ?? có tính ca làm việc không!!

4.  **Giảm do nghỉ 14 ngày**

## Chứng từ BHXH

![](Ins_TaiLieuBaoHiem_01_image71.emf)
---

## Lỗi thường gặp / Bug đã gặp

| Triệu chứng | Root cause | Cách fix |
|-------------|-----------|---------|
| | | |

---

## Văn bản pháp lý / Căn cứ

- **Luật / Nghị định**: Luật BHXH 2014 (sửa đổi 2019)
- **Thông tư**:
- **Hiệu lực từ**: 

---

## Ghi chú thêm / Lessons Learned

- 

---

## Liên kết

- [[wiki/sources/INS-C70-TinhLuong]]
- [[wiki/sources/INS-InsuranceMonthJoin]]
- [[wiki/flows/Flow-KhaiBaoiBHXH]]

---
## 🔗 Xem thêm

[[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/00-INDEX|⬆ INDEX — Tài Liệu Bảo Hiểm 01]]

- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/01-gioi-thieu|Giới Thiệu & Từ Viết Tắt]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/02-mindmap|Sơ Đồ Mindmap]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/03-nghiep-vu-bieu-mau|Nghiệp Vụ & Biểu Mẫu BH]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/04-chuoi-gia-tri|Chuỗi Giá Trị (Lean Production)]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/05-database|Cấu Trúc Database]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/06-uml|Mô Hình UML & Activity Diagram]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/07-bao-cao-dong|Báo Cáo Động]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/08-van-de-bh|Vấn Đề Bảo Hiểm & Cấu Hình]]
