# D02 FAQ – Quy tắc hỏi ngược khi nhận báo lỗi

> Ngày: 2026-05-02  
> Áp dụng cho: mọi câu hỏi liên quan D02

---

## Bước 0 – Hỏi loại báo cáo

> **D02 loại nào?**
> - D02 TS
> - D02 V2
> - iBHXH Tăng
> - iBHXH Giảm
> - iBHXH Điều chỉnh
> - VietTel
> - VNPT

Mỗi loại dùng hàm Search riêng, bảng nguồn và điều kiện lọc khác nhau dù đều xuất phát từ `Ins_ReportD02ItemV2` (trừ D02 TS dùng `Ins_ReportD02Item`).

---

## Khi báo "không có dữ liệu" – hỏi đủ 5 câu

| # | Câu hỏi | Mục đích |
|---|---|---|
| 1 | **Loại báo cáo nào?** | D02 TS / V2 / iBHXH tăng-giảm-điều chỉnh / VietTel / VNPT |
| 2 | **Nhân viên nào?** (mã NV) | Kiểm tra item trong DB |
| 3 | **Tháng nào? Kỳ mấy?** | Xác định đúng `DateMonth` + `Perior` |
| 4 | **Mong muốn thấy gì?** (tăng/giảm/loại TM,DC...) | Xác định đúng filter đang tìm |
| 5 | **Gần đây có sửa thiết lập bảo hiểm không?** | `Ins_TypeD02`, chu kỳ tăng lao động, cấu hình kỳ |

> **Câu 5 quan trọng:** sửa `Ins_TypeD02.IsIIns/IsVIns`, đổi ngày chu kỳ (`PeriodInsuranceDayPreMonth`...) ảnh hưởng trực tiếp đến việc sinh và hiển thị D02. Hay bị bỏ qua nhất.

---

## Khi báo "field trên lưới trống" – hỏi thêm

| # | Câu hỏi | Mục đích |
|---|---|---|
| 1-5 | Như trên | |
| 6 | **Field nào trống cụ thể?** | Mỗi field có nguồn khác nhau |
| 7 | **Có vừa cập nhật hồ sơ NV không?** | Dữ liệu lưới là snapshot — cần phân tích lại |

---

## Khi báo "sai loại" (VD: TM thay vì DC) – hỏi thêm

| # | Câu hỏi | Mục đích |
|---|---|---|
| 1-5 | Như trên | |
| 6 | **Loại mong muốn là gì? Tại sao nghĩ nó sai?** | Xác nhận logic nghiệp vụ |
| 7 | **NV có hợp đồng BHXH mới trong tháng đó không?** | TM ưu tiên cao hơn DC nếu có HĐ mới |

---

## Index các file FAQ D02

| File | Nội dung |
|---|---|
| `01-loai-bao-cao.md` | Tổng quan 6 loại D02, hàm Search, bảng nguồn |
| `02-khong-co-du-lieu-chung.md` | Checklist chung: chưa phân tích, filter sai |
| `03-khong-co-du-lieu-theo-loai.md` | Checklist theo từng loại (D02 TS / V2 / iBHXH / VietTel / VNPT) |
| `04-sai-loai-ibhxh.md` | Tại sao báo sai loại TM/TD/ON/DC/CD/TN/TT |
| `05-field-trong-ibhxh-tang.md` | Field trên lưới iBHXH tăng không có dữ liệu |
