---
type: source
domain: attendance
tags:
  - cham-cong
  - 
created: {{date:YYYY-MM-DD}}
updated: {{date:YYYY-MM-DD}}
khach-hang: 
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
---

# ATT — {{title}}

> **Domain**: Chấm công & OT (Attendance)
> **Khách hàng**: 
> **Ngày ghi**: {{date:DD/MM/YYYY}}

---

## Nghiệp vụ / Quy tắc

> Mô tả rule ca làm việc, OT, nghỉ phép, bù giờ

- **Đối tượng áp dụng**: 
- **Loại ca**: (vd: hành chính / ca xoay / linh hoạt)
- **Thiết bị chấm công**: (vd: fingerprint / face ID / app)

### Cấu hình ca làm việc

| Tham số | Giá trị chuẩn | Cấu hình tại KH |
|---------|--------------|-----------------|
| Giờ làm tiêu chuẩn | 8h/ngày, 48h/tuần | |
| Làm tròn giờ vào/ra | 15 phút | |
| OT tối thiểu tính | 30 phút | |
| Quy tắc 1 đầu IN | Không (cần cả IN & OUT) | |

### Hệ số lương OT

| Loại OT | Hệ số | Căn cứ |
|---------|-------|--------|
| Ngày thường | 150% | BLLĐ 2019, Điều 98 |
| Chủ nhật | 200% | |
| Ngày lễ | 300% | |
| Ca đêm (22h–6h) | +30% | |

### Phân loại nghỉ

| Loại nghỉ | Hưởng lương | Tác động BH | Tác động công |
|-----------|-------------|-------------|---------------|
| Nghỉ phép năm | 100% | Không đổi | Trừ phép tồn |
| Nghỉ ốm (BHXH) | 75% lương BH | Không cắt BH | Tính là ngày nghỉ |
| Thai sản | 100% lương BH | Không cắt BH | Tính là ngày nghỉ |
| Nghỉ không lương | 0% | Cắt BH nếu > 14 ngày | Trừ công |
| Nghỉ lễ | 100% | Không đổi | Không trừ công |

---

## Cấu hình tại dự án

> Điền nếu ghi chú này liên quan đến một khách hàng cụ thể

- **Quy tắc đặc biệt**: 
- **Thiết bị / Phần mềm chấm công**: 
- **Tích hợp**: (vd: sync timezone, API máy chấm công)

---

## Lỗi thường gặp / Bug đã gặp

| Triệu chứng | Root cause | Cách fix |
|-------------|-----------|---------|
| Lệch timezone | Server HRM ≠ máy chấm công | Đồng bộ NTP, kiểm tra trước chốt |
| | | |

---

## Văn bản pháp lý / Căn cứ

- **Bộ Luật Lao Động 2019**: Điều 105–115 (giờ làm, OT), Điều 113 (nghỉ phép năm)
- **Nghị định 145/2020/NĐ-CP**: Hướng dẫn BLLĐ về thời giờ làm việc
- **Nghị định / Thông tư liên quan**: 

---

## Ghi chú thêm / Lessons Learned

- 

---

## Liên kết

- [[wiki/flows/Flow-TinhLuong-Monthly]]
- [[wiki/sources/ATT-BUG01-PhepNam-NgayLe]]
- [[wiki/concepts/HRM-Modules]]
