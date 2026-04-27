---
type: source
domain: ins
tags:
  - bao-hiem
  - BHXH
  - BHYT
  - BHTN
  - HRM
  - INS
  - VnResource
  - database
  - uml
created: 2015-02-21
updated: 2026-04-27
khach-hang: VnResource (nội bộ)
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/concepts/INS-NghiepVu-BaoHiem]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
  - "[[wiki/flows/Flow-KhaiBaoiBHXH]]"
  - "[[wiki/sources/INS-D02-ChungTu]]"
  - "[[wiki/sources/INS-C70-TinhLuong]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
---

# INS — Tài Liệu Bảo Hiểm 01 (HRM Pro v8.0.1.x)

> **Nguồn gốc**: Tài liệu nghiệp vụ nội bộ VnResource — HRM Pro phiên bản 8.0.1.x  
> **Tạo**: 21/02/2015 | **Cập nhật cuối**: 12/05/2022 (nội dung gốc), re-structured 2026-04-27  
> **Phạm vi**: Toàn bộ phân hệ INS — từ nghiệp vụ pháp lý đến database schema đến code diagram

---

## Tóm tắt

Tài liệu toàn diện nhất về phân hệ Bảo Hiểm (INS) trong HRM Pro VnResource, bao gồm 9 module con:
1. **Giới thiệu & từ viết tắt** — mục đích, căn cứ Luật BHXH 2014
2. **Mindmap** — tổng quan BHXH/BHYT/BHTN/D02, các chế độ ốm đau, thai sản, thất nghiệp
3. **Nghiệp vụ & biểu mẫu** — quy trình tăng/giảm lao động, mẫu TK01/TK02/D02/D03/C70A, mapping IBHXH/EBHXH
4. **Chuỗi giá trị (Lean)** — 5 bước phân tích BH, tương quan HR→Công→BH→Lương
5. **Database schema** — 20+ bảng chính: Ins_ProfileInsuranceMonthly, Ins_InsuranceRecord, Ins_ReportD02, Cat_RateInsurance...
6. **UML & Activity Diagram** — UseCase, Class Diagram, Activity Diagram tính trích nộp, D02, C70A
7. **Báo cáo động** — IBHXH, thai sản, 12 tháng, quá trình tham gia BH
8. **Vấn đề & cấu hình** — bảng cấu hình 20+ key, phần tử bảo hiểm (elements)
9. **Biểu đồ code (kỹ thuật)** — Builder pattern nghỉ 14 ngày, Sequence Diagram logic D02TS

---

## Key Takeaways

- **3 loại BH bắt buộc**: BHXH (8% NLĐ + 18% NSDLĐ), BHYT (1.5% + 3%), BHTN (1% + 1%) — tỉ lệ theo `Cat_RateInsurance`
- **Rule nghỉ 14 ngày**: nghỉ ≥ 14 ngày làm việc trong tháng → không đóng BH tháng đó — đây là rule **dễ sai nhất** toàn hệ thống
- **Chu kỳ BH**: mặc định 16 tháng [N-1] → 15 tháng [N] — khác với chu kỳ lương thông thường
- **Bảng trung tâm**: `Ins_ProfileInsuranceMonthly` — lưu kết quả phân tích BH từng tháng, được Lương đọc vào khi tính khấu trừ
- **Flow 5 bước**: Lấy data NV → Kiểm tra tháng tham gia → Kiểm tra đóng BH → Kiểm tra nghỉ 14 ngày → Tính lương BH
- **Tương quan module**: HR cung cấp master data → Công phản ánh ngày nghỉ thực tế → BH quyết định có đóng không → Lương tính tiền
- **80% bug INS** nằm ở: sai ngày công, sai trạng thái nghỉ, sai lịch sử BH — không phải do code tính toán
- **IBHXH vs EBHXH**: 2 kênh khai báo điện tử với mapping mã trạng thái D02 → mã kênh riêng (TM, GH, KL, TS, AD, DC, CD...)
- **Biểu mẫu C70A**: đề nghị giải quyết trợ cấp ốm đau/thai sản — nộp theo đợt, ~3 ngày làm việc có kết quả
- **Builder Pattern**: code tách phần nghỉ ≥ 14 ngày ra riêng để dễ sửa sau này
- **Mapping V6→V7→V8**: `Ins_InsuranceSalary` bị xóa, `Hre_InsuranceRecord` → `Ins_InsuranceRecord`, `Ins_InsuranceForPayrollMonthly` là bảng mới V8

---

## Trích dẫn quan trọng

> **Mục đích tài liệu**: "Giúp cán bộ bảo hiểm quản lý và lưu trữ các chứng từ BHXH của nhân viên hiệu quả. Hỗ trợ tính toán, kiểm tra các khoản chi phí bảo hiểm nhanh chóng và chính xác."

> **Insight cốt lõi (04-chuoi-gia-tri)**: "BH = hệ quả của dữ liệu + rule → không phải phép tính đơn thuần. Nhân sự cung cấp dữ liệu → Công phản ánh thực tế → Bảo hiểm quyết định có đóng không → Lương tính ra tiền."

> **Debug checklist (04-chuoi-gia-tri)**: "80% bug nằm ở: sai ngày công, sai trạng thái nghỉ, sai lịch sử BH. Khi có lỗi BH: Đừng fix ngay ở kết quả. Đi theo flow ngược: sai tiền → check Lương → sai điều kiện → check Rule BH → sai trạng thái → check Công → sai dữ liệu gốc → check Nhân sự."

> **Rule nghỉ 14 ngày (04-chuoi-gia-tri)**: "Nghỉ ≥ 14 ngày trong tháng → KHÔNG đóng BH. 🔥 Đây là chỗ dễ sai nhất trong hệ thống."

> **Rule trích nộp thai sản (02-mindmap)**: "Thai sản: 100% lương BHXH. Trợ cấp 1 lần (tã lót): 2x lương cơ sở / mỗi con. Nếu đi làm sớm: Vẫn nhận lương công ty + trợ cấp BH."

---

## Nghiệp vụ biểu mẫu — Tóm tắt nhanh

| Mẫu | Tên | Mục đích |
|-----|-----|---------|
| TK01-TS | Tờ khai tham gia BHXH/BHYT | Nhân viên mới |
| TK02-TS | Tờ khai thay đổi thông tin | Khi có thay đổi |
| D02-TS | Danh sách LĐ tham gia BH | Tăng/giảm/điều chỉnh hàng tháng |
| D03-TS | Danh sách chỉ tham gia BHYT | Đối tượng chỉ đóng BHYT |
| C70A | Đề nghị hưởng chế độ ốm đau/thai sản | Nộp cho cơ quan BH, ~3 ngày có kết quả |

### Mã trạng thái D02 quan trọng

| Mã | Loại | Diễn giải |
|----|------|-----------|
| TM | Tăng | Tăng lao động mới |
| GH | Giảm | Giảm hẳn (nghỉ việc) |
| KL | Giảm | Nghỉ không lương ≥ 14 ngày |
| TS | Giảm | Nghỉ thai sản |
| DC | Thay đổi lương | Tăng/giảm mức đóng |
| ON | Tăng | Đi làm lại sau thai sản/ốm/nghỉ 14 ngày |
| AD | Điều chỉnh | Truy thu nguyên lương |
| SB | Điều chỉnh | Bổ sung giảm nguyên lương |

---

## Database — Bảng chính

| Bảng | Vai trò |
|------|---------|
| `Ins_ProfileInsuranceMonthly` | **Bảng trung tâm** — kết quả phân tích BH từng tháng/NV |
| `Ins_InsuranceForPayrollMonthly` | Bản sao chốt để tính lương (V8 mới) |
| `Ins_InsuranceRecord` | Chứng từ BH (ốm đau, thai sản, con ốm...) |
| `Sal_InsuranceSalary` | Lương BHXH của NV (ngày hiệu lực) |
| `Ins_ReportD02` / `Ins_ReportD02Item` | Báo cáo D02 header + detail |
| `Ins_ReportD02V2` / `Ins_ReportD02ItemV2` | D02 nhiều đợt |
| `Ins_InsuranceSalaryPayback` | Điều chỉnh BH (truy thu/hoàn trả) |
| `Ins_TypeD02` | Danh mục loại D02 (TM, GH, KL...) |
| `Cat_RateInsurance` | Tỉ lệ đóng BHXH/BHYT/BHTN |
| `Cat_ValueEntity` | Mức trần BH / lương tối thiểu |
| `Cat_InsuranceGrade` | Chế độ BH (công thức nghỉ 14 ngày) |
| `Hre_HealthInsuranceCard` | Thẻ BHYT |
| `Ins_ChildSick` | Con ốm |
| `Ins_InsuranceGrade` | Chế độ BH gắn với NV cụ thể |

---

## Cấu hình BH quan trọng

| Cấu hình | Ý nghĩa |
|---------|---------|
| **Chu kỳ BH** | 16 [N-1] → 15 [N], có thể tùy biến |
| **Số ngày nghỉ để không đóng BH** | Mặc định = 14 ngày |
| **Có đếm ngày nghỉ để đóng BH** | bool — bật/tắt rule 14 ngày |
| **Dữ liệu ngày nghỉ dựa vào** | E_LeaveDay / E_WorkDay / E_InsuranceRecord |
| **Phân tích BH theo đợt** | Lưu vào D02V2 khi tính điều chỉnh |
| **Xóa lịch sử BH khi điều chỉnh** | bool — cẩn thận khi bật |

---

## Liên kết

- [[wiki/concepts/HRM-Modules]] — tổng quan phân hệ INS trong hệ thống HRM
- [[wiki/concepts/INS-NghiepVu-BaoHiem]] — nghiệp vụ BH tổng hợp
- [[wiki/flows/Flow-TinhLuong-Monthly]] — luồng tính lương có sử dụng kết quả BH
- [[wiki/flows/Flow-KhaiBaoiBHXH]] — luồng khai báo D02 điện tử
- [[wiki/sources/INS-D02-ChungTu]] — phân tích biểu mẫu D02
- [[wiki/sources/INS-C70-TinhLuong]] — bảng tổng hợp lương C70
- [[wiki/sources/INS-InsuranceMonthJoin]] — logic tháng tham gia BH
- [[wiki/sources/INS-Nghi14Ngay]] — quy tắc nghỉ 14 ngày
- [[wiki/sources/INS-NghiThaiSan]] — chế độ thai sản
- [[wiki/architecture/INS-Database-Schema]] — sơ đồ database INS
