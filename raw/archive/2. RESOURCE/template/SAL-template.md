---
type: source
domain: payroll
tags:
  - luong
  - 
created: {{date:YYYY-MM-DD}}
updated: {{date:YYYY-MM-DD}}
khach-hang: 
description: 
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
---

# SAL — {{title}}

> **Domain**: Lương & Thuế TNCN (Payroll)
> **Khách hàng**: 
> **Ngày ghi**: {{date:DD/MM/YYYY}}

---

## Nghiệp vụ / Quy tắc

> Mô tả rule tính lương, cơ cấu lương, phụ cấp, khấu trừ

- **Đối tượng áp dụng**: 
- **Kỳ lương**: (vd: ngày 1–31 / ngày 26 tháng trước – 25 tháng này)
- **Phương pháp tính ngày công**: (vd: 26 ngày / thực tế / 365)

### Cơ cấu lương

| Khoản mục | Loại | Chịu BH | Chịu thuế TNCN | Ghi chú |
|-----------|------|---------|----------------|---------|
| Lương cơ bản | Thu nhập | ✅ | ✅ | |
| Phụ cấp ăn ca | Phụ cấp | ❌ | ❌ (≤ 730k/tháng) | |
| Phụ cấp xăng xe | Phụ cấp | ❌ | ❌ (mức TT) | |
| | | | | |

### Công thức tính

```
Lương Gross    = Lương cơ bản + Phụ cấp chịu thuế + Thưởng (nếu có)
Khấu trừ BH    = BHXH 8% + BHYT 1.5% + BHTN 1% = 10.5% × Lương đóng BH
Thu nhập chịu thuế = Gross - Khấu trừ BH - Giảm trừ bản thân (11tr) - Giảm trừ NPT
Thuế TNCN      = Áp bảng lũy tiến 7 bậc
Lương Net      = Gross - Khấu trừ BH - Thuế TNCN - Khấu trừ khác
```

---

## Cấu hình tại dự án

> Điền nếu ghi chú này liên quan đến một khách hàng cụ thể

| Tham số | Giá trị chuẩn | Cấu hình tại KH |
|---------|--------------|-----------------|
| Kỳ lương | Ngày 1–31 | |
| Ngày tính công | 26 ngày/tháng | |
| Làm tròn giờ OT | 30 phút | |
| Số NPT đã đăng ký | — | |

---

## Lỗi thường gặp / Bug đã gặp

| Triệu chứng | Root cause | Cách fix |
|-------------|-----------|---------|
| | | |

---

## Văn bản pháp lý / Căn cứ

- **Luật Thuế TNCN**: Luật số 04/2007/QH12, sửa đổi 2012, 2014
- **Mức giảm trừ**: Nghị quyết 954/2020/UBTVQH14 (bản thân 11tr, NPT 4.4tr)
- **Nghị định / Thông tư liên quan**: 

---

## Ghi chú thêm / Lessons Learned

- 

---

## Liên kết

- [[wiki/flows/Flow-TinhLuong-Monthly]]
- [[wiki/sources/INS-C70-TinhLuong]]
- [[wiki/concepts/HRM-Modules]]
