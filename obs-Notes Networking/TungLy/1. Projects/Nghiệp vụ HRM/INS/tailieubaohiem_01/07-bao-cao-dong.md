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
# INS — Báo Cáo Động

> **Domain**: Bảo hiểm (BHXH / BHYT / BHTN)
> **Khách hàng**: VnResource (nội bộ)
> **Ngày ghi**: 21/02/2015
> **Nội dung**: Các báo cáo động INS: IBHXH, thai sản, 12 tháng, quá trình tham gia BH

---

### Báo cáo theo dõi bảo hiểm cả năm\<0104728\>:

Goal: Xuất Báo cáo danh sách theo dõi bảo hiểm cả năm của nhân viên theo
mẫu

Nơi chứa store script:
3.3.Docs\\BaoCaoDong\\INS\\0104728_BCD_Year_Insurance_Report

![](Ins_TaiLieuBaoHiem_01_image55.png)

Logic:

- Nguồn lấy dữ liệu: Sal_BasicSalary, Hre_Profile

- Các bước thực hiện:

> Step1: Lấy dữ liệu lương và 15 loại phụ cấp của nhân viên của năm
> trước và năm hiện tại
>
> Step2: Lấy dữ liệu nhân viên và dữ liệu kèm theo
>
> Step3: Kết hợp 3 bảng ở step1 và step2 để tạo thành 1 bảng và pivot
> bảng đó.

### Báo cáo ibhxh \<0105483\>:

Goal: Xuất được báo cáo ibhxh theo yêu cầu.

Nơi chứa store script:
3.3.Docs\\BaoCaoDong\\INS\\0105483_rpt_ins_IBHXHReport

![](Ins_TaiLieuBaoHiem_01_image56.png)

Logic:

- Nguồn lấy dữ liệu: Ins_ReportD02ItemV2, Hre_Profile, ...

- Các bước thực hiện:

> Step1: Join các bảng lại với nhau
>
> Step2: Lấy các enum từ các bảng đã join với nhau và bỏ vào trong bảng
> tạm.
>
> Step3: Từ bảng tạm phân trang cho nó

### BC Danh sách nhân viên nghỉ thai sản \<0108621\>

Goal: Xuất được danh sách nhân viên nghỉ thai sản.

Nơi chứa store script:
3.3.Docs\\BaoCaoDong\\INS\\0108621_rpt_ins_Pregnancy

![](Ins_TaiLieuBaoHiem_01_image57.png)

Logic:

- Nguồn dữ liệu: Ins_InsuranceRecord, Hre_Profile,\...

Các bước thực hiện:

> Step 1: Lấy dữ liệu từ bảng.
>
> Step 2: Pivot dữ liệu đó sang các dữ liệu của các số lần sinh con.

### BC bảo hiểm 12 tháng \<0108577\>

Goal: Xuất được danh sách Bảo hiểm 12 tháng theo từng nhân viên.

Nơi chứa store script:
3.3.Docs\\BaoCaoDong\\INS\\0108577_rpt_ins_Report_12Months

![](Ins_TaiLieuBaoHiem_01_image58.png)

Logic:

- Nguồn dữ liệu: Hre_Profile, Sal_InsuranceSalary,
  Ins_ProfileInsuranceMonthly,...

- Các bước thực hiện:

> Step 1: Lấy dữ liệu từ bảng.
>
> Step 2: Pivot dữ liệu theo từng tháng của từng nhân viên.

### BC tổng hợp lương và khoản trích đóng bảo hiểm trong tháng \<0109195\>

Goal: Xuất tổng hợp lương và khoản trích đóng bảo hiểm trong tháng

Nơi chứa store script:
3.3.Docs\\BaoCaoDong\\INS\\0109195_rpt_hrm_ins_sumins_cat_shop

![](Ins_TaiLieuBaoHiem_01_image59.png)

Logic:

- Nguồn dữ liệu: Ins_ProfileInsuranceMonthly, Hre_WorkHistory,
  Cat_Shop,...

- Các bước thực hiện:

> Step 1: Lấy dữ liệu từ bảng.
>
> Step 2: Sum và count theo từng shop

### BÁO CÁO DS TĂNG/GIẢM BẢO HIỂM SỨC KHỎE

Goal: Xuất DS tăng/giảm bảo hiểm sức khỏe dựa vào Loại điều
chuyển(TypeOfTransferID) với bảng Cat_NameEntity

Nơi chứa store script:

**3.3.Docs\\BaoCaoDong\\INS\\0111244_rpt_hrm_ins_ReportIncreaseDecreaseHealthInsurance**

![](Ins_TaiLieuBaoHiem_01_image60.png)

Steps:

\* Vùng 1:

Step 1: Lấy dữ liệu từ Hre_WorkHistory khi có TypeOfTransferID = ID của
Cat_NamEntity khi có EnumType = E_COMEBACK và E_NEW

Step 2: Join với bảng Sal_InsuranceSalary lấy ra dữ liệu cần
thiết(AbilityTileID, CompanyID)

\* Vùng 2:

Step 1: Lấy dữ liệu từ Hre_WorkHistory khi có TypeOfTransferID = ID của
Cat_NamEntity khi có EnumType = E_STOP

Step 2: Join với bảng Sal_InsuranceSalary lấy ra dữ liệu cần
thiết(AbilityTileID, CompanyID)

\* Vùng 3:

Step 1: Lấy dữ liệu từ Hre_RequestInfo

Step 2: Join với bảng Sal_InsuranceSalary lấy ra dữ liệu cần
thiết(AbilityTileID, CompanyID)

- Kết hợp 3 vùng lại =\> 1 bảng. Join với các bảng khác để lấy ra dữ
  liệu của bảng.

### Báo cáo động xuất báo cáo ốm đau thai sản mẫu mới

Goal: Xuất dữ liệu bảo hiểm dựa vào bảng chứng từ BHXH

Nơi chứa store script:
**3.3.Docs\\BaoCaoDong\\INS\\0111694_rpt_hrm_ins_M01B_HSB**

[Template:]{.underline}**3.3.Docs\\BaoCaoDong\\INS\\0111694_rpt_hrm_ins_M01B_HSB\\**
**BHXH630+mau+12h00+28.11.19.xls**

### Báo cáo động quá trình tham gia: BHXH, BHYT, BHTH \<0119924\>

**Docs\\BaoCaoDong\\INS\\119924_rpt_Ins_ProfileInsuranceMonthly_v02**

![](Ins_TaiLieuBaoHiem_01_image61.png)

Bước 1: Lấy dữ liệu bảng phân tích bảo hiểm Ins_ProfileInsuranceMonthly
theo logic sau:

- Mỗi nhân viên 1 dòng

- Nếu 1 tháng có 2 dòng phân tích (điều chỉnh, phân tích) 🡺 Lấy dòng
  điều chỉnh

Bước 2: Nối dữ liệu bảng bảng nhân viên (Hre_Profile) và các bảng phụ để
lấy dữ liệu;

- Nối với bảng tạm lọc từ enum loại ngày nghĩ 14 ngày
  #tblEnumLeaveType14Days

Bước 3: nối với bản tạm #tempComment để lấy ghi chú

Bước 4: select ra những file cần hiện trên lưới theo yêu cầu trong tài
liệu
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
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/08-van-de-bh|Vấn Đề Bảo Hiểm & Cấu Hình]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/09-bieu-do-code|Biểu Đồ Code (Kỹ Thuật)]]
