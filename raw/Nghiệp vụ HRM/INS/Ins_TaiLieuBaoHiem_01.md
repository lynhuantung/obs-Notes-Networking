![](../../../../src/Ins_TaiLieuBaoHiem_01_image1.png)

[Document History]{.underline}

  -----------------------------------------------------------------------------------
    **Date**    **Revision**  **Description**            **PIC**
  ------------ -------------- -------------------------- ----------------------------
   21/02/2015     8.0.1.0     Tạo tài liệu               Tung.Ly@VnResource.vn

   19/05/2016     8.0.1.1     Thêm field vào D02Item     Tung.Ly@VnResource.vn

   14/07/2016     8.0.1.1     Thêm bảng                  Tung.Ly@VnResource.vn
                              Cat_HealthTreatmentPlace   

   12/05/2022                 Cập nhật trạng thái trong  khai.nguyen@vnresource.org
                              bảng Ins_InsuranceRecord   
                              và mốt số field trong bảng 
                              Cat_InsuranceRecordType    
  -----------------------------------------------------------------------------------

[Nội Dung - Content]{.underline}

[1. Giới thiệu tài liệu -- Document Introduction
[5](#giới-thiệu-tài-liệu-document-introduction)](#giới-thiệu-tài-liệu-document-introduction)

[1.1 Mục đích tài liệu [5](#mục-đích-tài-liệu)](#mục-đích-tài-liệu)

[1.2 Từ viết tắt [5](#từ-viết-tắt)](#từ-viết-tắt)

[1.3 Ý nghĩa các hình vẽ
[5](#ý-nghĩa-các-hình-vẽ)](#ý-nghĩa-các-hình-vẽ)

[2. Sơ đồ mindmap [7](#sơ-đồ-mindmap)](#sơ-đồ-mindmap)

[2.1 Sơ đồ tổng quát [7](#sơ-đồ-tổng-quát)](#sơ-đồ-tổng-quát)

[2.1.1 Bảo hiểm thất nghiệp
[8](#bảo-hiểm-thất-nghiệp)](#bảo-hiểm-thất-nghiệp)

[2.1.2 Bảo hiểm phần ốm đau
[8](#bảo-hiểm-phần-ốm-đau)](#bảo-hiểm-phần-ốm-đau)

[2.1.3 Bảo hiểm phần thai sản
[9](#bảo-hiểm-phần-thai-sản)](#bảo-hiểm-phần-thai-sản)

[2.1.4 Báo cáo D02 [9](#báo-cáo-d02)](#báo-cáo-d02)

[3. Nghiệp vụ bảo hiểm [10](#nghiệp-vụ-bảo-hiểm)](#nghiệp-vụ-bảo-hiểm)

[3.1 Chức năng tương ứng với nghiệp vụ
[10](#chức-năng-tương-ứng-với-nghiệp-vụ)](#chức-năng-tương-ứng-với-nghiệp-vụ)

[3.1.1 Các chức năng bảo hiểm
[10](#các-chức-năng-bảo-hiểm)](#các-chức-năng-bảo-hiểm)

[3.2 Các Biểu Mẫu Bảo Hiểm
[11](#các-biểu-mẫu-bảo-hiểm)](#các-biểu-mẫu-bảo-hiểm)

[3.2.1 Mẫu TK01-TS [11](#mẫu-tk01-ts)](#mẫu-tk01-ts)

[3.2.2 Mẫu TK02-TS [11](#mẫu-tk02-ts)](#mẫu-tk02-ts)

[3.2.3 Mẫu D02-TS [13](#mẫu-d02-ts)](#mẫu-d02-ts)

[3.2.4 Mẫu D03-TS [13](#mẫu-d03-ts)](#mẫu-d03-ts)

[3.2.5 Mẫu C70A [15](#mẫu-c70a)](#mẫu-c70a)

[3.2.6 BC Kế Toán 01 và 02 (Dữ Liệu Thanh Toán BH NV)
[19](#bc-kế-toán-01-và-02-dữ-liệu-thanh-toán-bh-nv)](#bc-kế-toán-01-và-02-dữ-liệu-thanh-toán-bh-nv)

[3.3 Nghiệp vụ Bảo Hiểm
[19](#nghiệp-vụ-bảo-hiểm-1)](#nghiệp-vụ-bảo-hiểm-1)

[3.3.1 Nghiệp vụ (Tăng Lao động)
[19](#nghiệp-vụ-tăng-lao-động)](#nghiệp-vụ-tăng-lao-động)

[3.3.2 Nghiệp vụ tăng (Mức đóng)
[20](#nghiệp-vụ-tăng-mức-đóng)](#nghiệp-vụ-tăng-mức-đóng)

[3.3.3 Nghiệp vụ Giảm [20](#nghiệp-vụ-giảm)](#nghiệp-vụ-giảm)

[3.3.4 Nghiệp vụ Mẫu D02 [20](#nghiệp-vụ-mâu-d02)](#nghiệp-vụ-mâu-d02)

[3.3.5 Logic Lấy số quyết định ( Các loại D02)
[23](#logic-lấy-số-quyết-định-các-loại-d02)](#logic-lấy-số-quyết-định-các-loại-d02)

[3.3.6 Nghiệp Vụ IBHXH (tăng và giảm)
[25](#nghiệp-vụ-ibhxh-tăng-và-giảm)](#nghiệp-vụ-ibhxh-tăng-và-giảm)

[3.3.7 Nghiệp Vụ EBHXH (tăng, giảm và điều chỉnh)
[36](#nghiệp-vụ-ebhxh-tăng-giảm-và-điều-chỉnh)](#nghiệp-vụ-ebhxh-tăng-giảm-và-điều-chỉnh)

[3.4 Các Bảng sử dụng phân hệ bảo hiểm
[38](#các-bảng-sử-dụng-phân-hệ-bảo-hiểm)](#các-bảng-sử-dụng-phân-hệ-bảo-hiểm)

[3.5 Mapping (V8 , V7 , V6) [39](#mapping-v8-v7-v6)](#mapping-v8-v7-v6)

[4. Chuổi Giá Trị (Lean Production)
[41](#chuôi-gia-tri-lean-production)](#chuôi-gia-tri-lean-production)

[4.1 Qui trình bảo hiểm [41](#qui-trinh-bảo-hiểm)](#qui-trinh-bảo-hiểm)

[4.1.1 Chi tiết các bước thực hiện
[41](#chi-tiết-các-bước-thực-hiện)](#chi-tiết-các-bước-thực-hiện)

[4.1.2 Danh sách chức năng
[42](#danh-sách-chức-năng)](#danh-sách-chức-năng)

[4.2 Qui trình chuổi giá trị toàn bộ phân hệ bảo hiểm
[42](#qui-trinh-chuôi-gia-tri-toan-bô-phân-hê-bao-hiêm)](#qui-trinh-chuôi-gia-tri-toan-bô-phân-hê-bao-hiêm)

[4.3 Qui trình chuổi giá trị phân tích bảo hiểm
[42](#qui-trinh-chuôi-gia-tri-phân-tich-bao-hiêm)](#qui-trinh-chuôi-gia-tri-phân-tich-bao-hiêm)

[4.4 Tương quan với các phân hệ khác
[44](#tương-quan-với-các-phân-hệ-khác)](#tương-quan-với-các-phân-hệ-khác)

[4.5 Các thành phần liên quan đến bảo hiểm
[45](#các-thành-phần-liên-quan-đến-bảo-hiểm)](#các-thành-phần-liên-quan-đến-bảo-hiểm)

[4.5.1 Các thành phần liên quan đến bảo hiểm tổng quát
[45](#các-thành-phần-liên-quan-đến-bảo-hiểm-tổng-quát)](#các-thành-phần-liên-quan-đến-bảo-hiểm-tổng-quát)

[4.5.2 Các phân hệ liên quan đến bảo hiểm
[46](#các-phân-hệ-liên-quan-đến-bảo-hiểm)](#các-phân-hệ-liên-quan-đến-bảo-hiểm)

[4.5.3 Nhân sự [47](#nhân-sự)](#nhân-sự)

[4.5.4 Chấm công [48](#chấm-công)](#chấm-công)

[4.5.5 Lương [49](#lương)](#lương)

[4.5.6 Bảo Hiểm [50](#bảo-hiểm)](#bảo-hiểm)

[4.5.7 Hệ thống [51](#hệ-thống)](#hệ-thống)

[5. Cấu Trúc DataBase [52](#câu-truc-database)](#câu-truc-database)

[Không sử dụng bảng :
\"~~Ins_InsuranceSalary~~\",\"~~Hre_InsuranceRecord~~\"
[52](#không-sư-dung-bang-ins_insurancesalaryhre_insurancerecord)](#không-sư-dung-bang-ins_insurancesalaryhre_insurancerecord)

[~~5.1 Ins_InsuranceSalary (Remove)~~
[52](#ins_insurancesalary-remove)](#ins_insurancesalary-remove)

[~~5.2 Hre_InsuranceRecord (Remove)~~
[52](#hre_insurancerecord-remove)](#hre_insurancerecord-remove)

[5.3 Ins_ProfileInsuranceMonthly
[52](#ins_profileinsurancemonthly)](#ins_profileinsurancemonthly)

[5.4 Sal_InsuranceSalary
[55](#sal_insurancesalary)](#sal_insurancesalary)

[5.5 Ins_InsuranceRecord
[56](#ins_insurancerecord)](#ins_insurancerecord)

[5.6 Ins_ReportD02 [58](#ins_reportd02)](#ins_reportd02)

[5.7 Ins_ReportD02Item [59](#ins_reportd02item)](#ins_reportd02item)

[5.8 Ins_ReportD02V2 (D02 nhiều đợt)
[60](#ins_reportd02v2-d02-nhiều-đợt)](#ins_reportd02v2-d02-nhiều-đợt)

[5.9 Ins_ReportD02ItemV2 (D02 nhiều đợt)
[61](#ins_reportd02itemv2-d02-nhiều-đợt)](#ins_reportd02itemv2-d02-nhiều-đợt)

[5.10 Ins_InsuranceSalaryPayback
[62](#ins_insurancesalarypayback)](#ins_insurancesalarypayback)

[5.11 Ins_TypeD02 [63](#ins_typed02)](#ins_typed02)

[5.12 Cat_ValueEntity [65](#cat_valueentity)](#cat_valueentity)

[5.13 Cat_RateInsurance [66](#cat_rateinsurance)](#cat_rateinsurance)

[5.14 Ins_InsuranceForPayrollMonthly
[67](#ins_insuranceforpayrollmonthly)](#ins_insuranceforpayrollmonthly)

[5.15 Hre_HealthInsuranceCard
[69](#hre_healthinsurancecard)](#hre_healthinsurancecard)

[5.16 Cat_HealthTreatmentPlace
[70](#cat_healthtreatmentplace)](#cat_healthtreatmentplace)

[5.17 Cat_InsuranceGrade [70](#cat_insurancegrade)](#cat_insurancegrade)

[5.18 Ins_InsuranceGrade [71](#ins_insurancegrade)](#ins_insurancegrade)

[6. Mô Hình UML
[72](#cat_insurancerecordtype)](#cat_insurancerecordtype)

[6.1 UseCase Diagram [72](#usecase-diagram)](#usecase-diagram)

[6.2 Insurance Class Diagram
[73](#insurance-class-diagram)](#insurance-class-diagram)

[6.3 Activity Diagram [74](#activity-diagram)](#activity-diagram)

[6.3.1 Xử lý Trích Nộp Bảo HiểmXử lý Trích Nộp Bảo Hiểm
[74](#xư-ly-trich-nộp-bao-hiêm-xư-ly-trich-nộp-bao-hiêm)](#xư-ly-trich-nộp-bao-hiêm-xư-ly-trich-nộp-bao-hiêm)

[6.3.2 Xử Lý Báo Cáo [79](#xư-ly-bao-cao)](#xư-ly-bao-cao)

[6.3.3 BC Đuôi D02 [82](#bc-đuôi-d02)](#bc-đuôi-d02)

[6.3.4 Xử lý chức năng tính truy lĩnh bảo hiểm
[85](#xư-lý-chức-năng-tính-truy-linh-bảo-hiểm)](#xư-lý-chức-năng-tính-truy-linh-bảo-hiểm)

[6.3.5 Kiểm tra nghỉ \>= 14 ngày trong phân tích bảo hiểm
[88](#kiêm-tra-nghi-14-ngay-trong-phân-tich-bao-hiêm)](#kiêm-tra-nghi-14-ngay-trong-phân-tich-bao-hiêm)

[6.3.6 Kiểm tra nghỉ Thai Sản trong phân tích bảo hiểm
[89](#kiêm-tra-nghi-thai-san-trong-phân-tich-bao-hiêm)](#kiêm-tra-nghi-thai-san-trong-phân-tich-bao-hiêm)

[6.3.7 BC Chưa Có BHXH,BHYT (\[TK01-TS\] , \[TK02-TS\])
[91](#bc-chưa-co-bhxhbhyt-tk01-ts-tk02-ts)](#bc-chưa-co-bhxhbhyt-tk01-ts-tk02-ts)

[6.3.8 BC D02 [93](#bc-d02)](#bc-d02)

[6.3.9 BC D02 VNPT [97](#bc-d02-vnpt)](#bc-d02-vnpt)

[6.3.10 Mẫu EBHXH [102](#mẫu-ebhxh)](#mẫu-ebhxh)

[6.3.11 Mẫu BC BHXH đã chi trả
[113](#mẫu-bc-bhxh-đã-chi-trả)](#mẫu-bc-bhxh-đã-chi-trả)

[6.3.12 BC C70A-HD [113](#bc-c70a-hd)](#bc-c70a-hd)

[6.3.13 Danh Sách Đóng BHXH
[117](#danh-sach-đong-bhxh)](#danh-sach-đong-bhxh)

[6.3.14 DS NV Đủ Đk Tham Gia BH
[118](#ds-nv-đu-đk-tham-gia-bh)](#ds-nv-đu-đk-tham-gia-bh)

[6.3.15 BC Kế Toán 01 ( chưa điều chỉnh BH)
[119](#bc-kê-toan-01-chưa-điều-chỉnh-bh)](#bc-kê-toan-01-chưa-điều-chỉnh-bh)

[6.3.16 BC Kế Toán 02 (điều chỉnh bảo hiểm)
[120](#bc-kê-toan-02-điều-chỉnh-bảo-hiểm)](#bc-kê-toan-02-điều-chỉnh-bảo-hiểm)

[6.3.17 DS Chức Danh Tổng Hợp
[121](#ds-chưc-danh-tông-hơp)](#ds-chưc-danh-tông-hơp)

[6.3.18 Bảo Hiểm Mở Rộng [122](#bao-hiêm-mơ-rông)](#bao-hiêm-mơ-rông)

[6.3.19 BC DS NV Hưởng Trợ Cấp Nặng Nhọc , Độc Hại, Nguy Hiểm
[123](#bc-ds-nv-hương-trơ-câp-năng-nhoc-đôc-hai-nguy-hiêm)](#bc-ds-nv-hương-trơ-câp-năng-nhoc-đôc-hai-nguy-hiêm)

[6.3.20 BC Dữ Liệu HDT Lần 2
[124](#bc-dư-liêu-hdt-lân-2)](#bc-dư-liêu-hdt-lân-2)

[6.3.21 BC Dữ Liệu TAS Lần 2
[125](#bc-dư-liêu-tas-lân-2)](#bc-dư-liêu-tas-lân-2)

[6.3.22 Dữ Liệu D02Type (Điều Chỉnh BH)
[126](#dữ-liệu-d02type-điều-chỉnh-bh)](#dữ-liệu-d02type-điều-chỉnh-bh)

[6.3.23 BC D02 VIETTEL [126](#bc-d02-viettel)](#bc-d02-viettel)

[7. Báo cáo động [131](#báo-cáo-động)](#báo-cáo-động)

[7.1.1 Cấu hình Bảo Hiểm [131](#_Toc11140721)](#_Toc11140721)

[8. Vấn Đề Bảo Hiểm
[132](#bc-danh-sách-nhân-viên-nghỉ-thai-sản-0108621)](#bc-danh-sách-nhân-viên-nghỉ-thai-sản-0108621)

[8.1.1 Cấu hình Bảo Hiểm [132](#câu-hinh-bao-hiêm)](#câu-hinh-bao-hiêm)

[8.1.2 Phần Tử Bảo Hiểm [135](#phần-tử-bao-hiêm)](#phần-tử-bao-hiêm)

[8.1.3 Các Vấn Đề BH Thường Gặp
[138](#các-vấn-đề-bh-thường-gặp)](#các-vấn-đề-bh-thường-gặp)

[9. Biểu đồ Code (Kỹ Thuật)
[139](#biểu-đồ-code-kỹ-thuật)](#biểu-đồ-code-kỹ-thuật)

[9.1 Xử Lý Phân Hệ Bảo Hiểm Tổng Quát
[139](#xử-lý-phân-hệ-bảo-hiểm-tổng-quát)](#xử-lý-phân-hệ-bảo-hiểm-tổng-quát)

[9.2 Xử Lý Phân Hệ Bảo Hiểm
[139](#xử-lý-phân-hệ-bảo-hiểm)](#xử-lý-phân-hệ-bảo-hiểm)

[9.3 Khởi Tạo Nghỉ 14 Ngày
[141](#khởi-tạo-nghỉ-14-ngày)](#khởi-tạo-nghỉ-14-ngày)

[9.4 Phân tích Bảo Hiểm [142](#phân-tích-bảo-hiểm)](#phân-tích-bảo-hiểm)

[9.5 Phân tích D02 [143](#phân-tích-d02)](#phân-tích-d02)

[9.6 Báo Cáo C70A-HD [143](#báo-cáo-c70a-hd)](#báo-cáo-c70a-hd)

[Sequence Diagram [144](#sequence-diagram)](#sequence-diagram)

# Giới thiệu tài liệu -- Document Introduction

## Mục đích tài liệu

- Giúp cán bộ bảo hiểm quản lý và lưu trữ các chứng từ BHXH của nhân
  viên hiệu quả.

- Hỗ trợ tính toán, kiểm tra các khoản chi phí bảo hiểm nhanh chóng và
  chính xác.

- Kết xuất các mẫu báo cáo BHXH theo quy định của luật hiện hành.

- Đáp ứng yêu cầu sau:

  - Tính BHXH theo luật lao động Việt Nam

  - Thiết lập các cấu hình để tính BHXH

  - Xử lý các chế độ bảo hiểm ốm đau, thai sản

## Từ viết tắt

+---------+---------+---------------------------------------------------+
| **STT** | **Thuật | > **Ý nghĩa**                                     |
|         | ngữ/    |                                                   |
|         | Viết    |                                                   |
|         | tắt**   |                                                   |
+=========+:========+:==================================================+
| 1.      | HRM Pro | Giải pháp phần mềm nhân sự VnResource             |
+---------+---------+---------------------------------------------------+
| 2.      | INS     | Insurance (BH)                                    |
+---------+---------+---------------------------------------------------+

## Ý nghĩa các hình vẽ

![](../../../../src/Ins_TaiLieuBaoHiem_01_image2.emf)

# Sơ đồ mindmap

## Sơ đồ tổng quát

![](../../../../src/Ins_TaiLieuBaoHiem_01_image3.png)

### Bảo hiểm thất nghiệp

![](../../../../src/Ins_TaiLieuBaoHiem_01_image4.png)

### Bảo hiểm phần ốm đau

![](../../../../src/Ins_TaiLieuBaoHiem_01_image5.png)

### Bảo hiểm phần thai sản

![](../../../../src/Ins_TaiLieuBaoHiem_01_image6.png)

### Báo cáo D02

![](../../../../src/Ins_TaiLieuBaoHiem_01_image7.png)

# Nghiệp vụ bảo hiểm

## Chức năng tương ứng với nghiệp vụ

### Các chức năng bảo hiểm

+--------+--------------+-----------------------------+--------------+-----------------------------+-------+
| **Thời | **Bước thực  | **Mô tả**                   | **Template** | **Table liên quan**         | Ghi   |
| điểm** | hiện**       |                             |              |                             | chú   |
+:=======+:=============+:============================+:=============+:============================+:======+
| Khi có | Khai báo     |                             |              | Sal_InsuranceSalary         |       |
| nhân   | lương đóng   |                             |              |                             |       |
| viên   | bảo hiểm &   |                             |              |                             |       |
| mới    | loại đóng    |                             |              |                             |       |
|        | (BHXH, BHYT, |                             |              |                             |       |
|        | BHTN)        |                             |              |                             |       |
+--------+--------------+-----------------------------+--------------+-----------------------------+-------+
| Khi có | Xuất danh    |                             | A01 & A01-TS | Hre_Profile                 | Bảo   |
| nhân   | sách đề nghị |                             |              |                             | điều  |
| viên   | tham gia bảo |                             |              |                             | chỉnh |
| mới    | hiểm xã hội  |                             |              |                             | đúng  |
|        | (A01)\       |                             |              |                             |       |
|        | Xuất tờ khai |                             |              |                             |       |
|        | bảo hiểm     |                             |              |                             |       |
|        | (A01-TS)     |                             |              |                             |       |
+--------+--------------+-----------------------------+--------------+-----------------------------+-------+
| Trước  | Tính trích   | Cho phép thêm / xóa /sửa    | D02          | Lưu dữ liệu vào:            |       |
| khi    | nộp bảo hiểm | sau khi đã tính             |              | Ins_ProfileInsuranceMonthly |       |
| tính   |              | (Ins_ReportD02Item)\        |              |                             |       |
| lương  | (NV đóng bao | Thêm trạng thái Tự chỉnh,   |              | Ins_ReportD02\              |       |
| (Nộp   | nhiêu, Cty   | tự tính                     |              | Ins_ReportD02Item           |       |
| Tờ     | bao nhiêu,   |                             |              |                             |       |
| khai   | tăng LĐ,     |                             |              |                             |       |
| trước  | giảm LĐ,     |                             |              |                             |       |
| ngày   | tăng giảm    |                             |              |                             |       |
| 20     | mức đóng     |                             |              |                             |       |
| hằng   | (điều chỉnh  |                             |              |                             |       |
| tháng, | lương)...    |                             |              |                             |       |
| nộp    |              |                             |              |                             |       |
| tiền   |              |                             |              |                             |       |
| trước  |              |                             |              |                             |       |
| 30     |              |                             |              |                             |       |
| hằng   |              |                             |              |                             |       |
| thái)  |              |                             |              |                             |       |
+--------+--------------+-----------------------------+--------------+-----------------------------+-------+
| Quy    | Tính lương   | Sử dụng kết quả ở           |              | Sal_PayrollTable\           |       |
| định   |              | Ins_ProfileInsuranceMonthly |              | Sal_PayrollTableItem        |       |
| Cty    | (lấy bảo     | để lấy qua trừ bảo hiểm tại |              |                             |       |
|        | hiểm đã      | lương                       |              |                             |       |
| (Sau   | trích nộp)   |                             |              |                             |       |
| tính   |              |                             |              |                             |       |
| bảo    |              |                             |              |                             |       |
| hiểm   |              |                             |              |                             |       |
| trích  |              |                             |              |                             |       |
| nộp)   |              |                             |              |                             |       |
+--------+--------------+-----------------------------+--------------+-----------------------------+-------+
| Dựa    | Nhập Chứng   | *Sau khi NV nộp chứng từ:\  |              | Ins_InsuranceRecord\        | Phải  |
| theo   | từ ốm đau,   | - Cty kiểm tra đúng thì trả |              | Ins_ChildSick (nếu loại     | có    |
| ngày   | thai sản,    | tiền cho NV trước\          |              | chứng từ con ốm)            | chức  |
| phát   | nghỉ ngắn    | - Sau x ngày, Cơ quan bảo   |              |                             | năng  |
| sinh   | ngày, con    | hiểm, trả HS duyệt và trả   |              |                             |       |
| chứng  | ốm...        | tiền cho Cty sau.*          |              |                             |       |
| từ     |              |                             |              |                             |       |
+--------+--------------+-----------------------------+--------------+-----------------------------+-------+
| Sau    | Xuất tờ      |  Dùng Enum Status cho table | Xuất C70A    | Load dữ liệu từ các table:  |       |
| khi    | khai: ốm     | Ins_InsuranceRecord để đánh |              | Ins_ChildSick\              |       |
| nhập   | đau, thai    | dấu chứng từ đã thanh toán  |              | Ins_InsuranceRecord\        |       |
| chứng  | sản, nghỉ    | hay chưa                    |              | Ins_ProfileInsuranceMonthly |       |
| từ ốm  | ngắn ngày,   |                             |              |                             |       |
| đau..  | con ốm...    |                             |              |                             |       |
+--------+--------------+-----------------------------+--------------+-----------------------------+-------+

##  Các Biểu Mẫu Bảo Hiểm

### Mẫu TK01-TS

Tờ khai tham gia BHXH, BHYT

> ![](../../../../src/Ins_TaiLieuBaoHiem_01_image8.png)

*[Enum xuất BC mẫu TK01-TS:]{.underline}*

  ---------------------------------------------------------------------------
  **Tên enum**                 **Ý nghĩa**
  ---------------------------- ----------------------------------------------
  «PROFILENAME»                Họ và tên

  «GenderView»                 Giới tính

  «EthnicGroupName»            Dân tộc

  «VillageBirthCertificate»    \[06.1\]. Xã (phường, thị trấn)

  «ProvinceBirthCertificate»   Tỉnh (Tp)

  «PAddress»                   Số nhà, đường phố, thôn xóm

  «PVillageName»               \[07.2\]. Xã (phường, thị trấn)

  «PDistrictName»              \[07.3\]. Huyện (quận, thị xã, Tp thuộc tỉnh)

  «PProvinceName»              \[07.4\]. Tỉnh (Tp):

  «SocialInsOldNo»             \[09\]. Mã số BHXH (đã cấp)

  «CellPhone»                  Số điện thoại liên hệ

  «IDNo»                       Số CMND/ Hộ chiếu/ Thẻ căn cước

  «HouseHoldCode»              Mã số hộ gia đình (đã cấp)

  «HealthTreatmentPlace»       Nơi đăng ký khám bệnh, chữa bệnh ban đầu
  ---------------------------------------------------------------------------

### Mẫu TK02-TS

Tờ khai thay đổi thông tin tham gia BHXH,BHYT

![](../../../../src/Ins_TaiLieuBaoHiem_01_image9.png)

### Mẫu D02-TS

Danh sách lao động tham gia BHXH, BHYT

Kê khai lao động, tiền lương tham gia BHXH, BHYT, BHTN;

Điều chỉnh mức đóng BHXH, BHYT, BHTN;

Trách nhiệm lập thuộc đơn vị sử dụng lao động khi có phát sinh tăng/giảm
lao động hoặc tăng/giảm tiền lương.

![](../../../../src/Ins_TaiLieuBaoHiem_01_image10.png)

### Mẫu D03-TS

Danh sách người chỉ tham gia BHYT

![](../../../../src/Ins_TaiLieuBaoHiem_01_image11.png)

### Mẫu C70A

![](../../../../src/Ins_TaiLieuBaoHiem_01_image12.png)

1\. Mục đích lập mẫu c70a-HD:

Căn cứ đề nghị giải quyết trợ cấp ốm đau, thai sản, dưỡng sức, phục hồi
sức khỏe đối với người lao động trong doanh nghiệp.

2\. Trách nhiệm và căn cứ lập mẫu c70a-HD:

Danh sách này do đơn vị sử dụng lao động lập cho từng đợt, tùy thuộc vào
số người hưởng trợ cấp phát sinh, đơn vị có thể đề nghị làm nhiều đợt
trong tháng, theo tháng hoặc theo quý.

Trường hợp danh sách có nhiều tờ thì giữa các tờ phải có dấu giáp lai.

Cơ sở để lập theo các giấy tờ sau:

\- Giấy chứng nhận nghỉ việc hưởng BHXH,

\- Giấy khám chữa bệnh của con,

\- Bản sao sổ y bạ của con, phiếu hội chẩn,

\- Giấy khám thai, bản sao giấy chứng sinh,

\- Bản sao giấy khai sinh, giấy ra viện,

\- Quyết định công nhận việc nuôi con nuôi\...

Đồng thời kèm Danh sách được cơ quan BHXH duyệt của đợt trước (nếu có).

3\. Hướng dẫn ghi mẫu c70a-HD:

Phần 1. DANH SÁCH ĐỀ NGHỊ HƯỞNG CHẾ ĐỘ MỚI PHÁT SINH

Cột A, B ghi số thứ tự, họ và tên của người hưởng chế độ.

Cột 1 ghi số sổ BHXH hoặc số định danh của người hưởng chế độ.

Cột 2 ghi điều kiện tính hưởng:

\* Đối với chế độ ốm đau:

\- Nếu là bệnh thông thường thì bỏ trống và mặc nhiên được hiểu là bệnh
thông thường

\- Nếu bản thân người lao động bị bệnh cần chữa trị dài ngày thì ghi:
BDN

\* Đối với chế độ thai sản:

\- Đối với khám thai: để trống;

\- Đối với sảy thai, nạo hút thai: ghi theo tuổi thai, VD: thai 3 tuần
tuổi ghi 03T, thai 3 tháng tuổi ghi : 03Th

\- Đối với sinh con ghi: SC và số con đã được sinh, VD sinh 1 con ghi:
SC, sinh đôi ghi: SC02

\- Nhận con nuôi ghi: NCN

\- Mẹ chết, cha hưởng chế độ chăm sóc con sau sinh ghi: MC01

\- Nếu người nuôi dưỡng hưởng chế độ chăm con, ghi: MC02

\- Nếu con dưới 60 ngày tuổi chết, ghi: 60-

\- Nếu con trên 60 ngày tuổi chết, ghi: 60+

\- Nếu thực hiện các biện pháp đặt vòng, triệt sản: Đặt vòng thì ghi:
ĐV, triệt sản thì ghi: TS.

\* Đối với dưỡng sức phục hồi sức khỏe:

\- Đối với dưỡng sưc phục hồi sức khỏe( DSPHSK) sau ốm đau các bệnh
thông thường thì bỏ trống và mặc nhiên được hiểu là bệnh thông thường
nghỉ 05 ngày.

\- Đối với DSPHSK ốm đau phải phẫu thuật: ghi PT.

\- Đối với DSPHSK do mắc các bệnh cần chữa trị dài ngày ghi: BDN.

Trường hợp dưỡng sức tại gia đình thì bỏ qua không phải ghi tiếp nhưng
nếu tại cơ sở tập trung thì ghi: BDN/TT

\- DSPHSK sau thai sản: sinh 01 con, sảy thai, nạo thai, hút thai, thai
chết lưu: bỏ trống.

\- DSPHSK sau sinh mổ: PT

DSPHSK sinh đôi trở lên: SC02 nếu nghỉ tại gia đình thì chỉ ghi SC02
nhưng nếu nghỉ tập trung thì ghi: SC02/TT, với nghỉ DSPHSK sinh một con
phải phẫu thuật : PT/TT.

\- Đối với DSPHSK sau tai nạn lao động BNN ghi tỷ lệ suy giảm khả năng
lao động, nếu nghỉ tại gia đình thì bỏ trống chỉ ghi 35, nếu nghỉ tại cơ
sở tập trung thì ghi TT, ví dụ người bị TN LĐBNN nghỉ dưỡng sức tại cơ
sở tập trung tổn hại 35% khả năng lao động: 35/TT.

Cột 3/ Điều kiện tính hưởng về thời điểm:

\- Con ốm: ghi ngày tháng năm sinh của con. VD: 10/09/2015

\- Sinh con: ghi ngày tháng năm sinh của con.

\- Nhận nuôi con nuôi: ghi ngày tháng năm sinh của con.

\- Dưỡng sức PHSK sau sinh, hoặc sau ốm đau: ghi ngày tháng năm trở lại
làm việc. VD sau khi nghỉ hết chế độ thai sản quay trở lại làm việc ngày
10 tháng 9 năm 2015 thì ghi: 10/09/2015

\- DSPHSK sau TNLĐBNN: ghi ngày tháng năm hội đồng giám định y khoa kết
luận mức suy giảm khả năng lao động. VD: 10/09/2015.

Cột 4/ Ghi ngày tháng năm người lao động thực tế nghỉ việc hưởng chế độ
theo quy định.

\- Con ốm: ghi ngày tháng năm sinh của con đến ngày nghỉ hết chế độ. VD:
con sinh ngày 09/09/2015. thì ghi tại cột từ ngày: 09/09/2015

\- Nhận nuôi con nuôi: ghi ngày tháng năm sinh của con. VD: con sinh
ngày 090/09/2015 thì ghi tại cột từ ngày: 09/09/2015

\- Dưỡng sức PHSK sau sinh, hoặc sau ốm đau: ghi ngày tháng năm thực tế
bắt đầu nghỉ hưởng chế độ. VD sau khi nghỉ hết chế độ thai sản quay trở
lại làm việc ngày 10 tháng 9 năm 2015 và được BCHCĐ và đơn vị cho nghỉ
từ ngày 15 thì ghi: 15/09/2015.

\- DSPHSK sau TNLĐBNN: ghi ngày tháng năm hội đồng giám định y khoa kết
luận mức suy giảm khả năng lao động. VD: 10/08/2015.

Cột 5/ghi ngày tháng năm cuối cùng người lao động thực tế nghỉ hưởng chế
độ theo quy định.

\- Con ốm: ghi ngày tháng năm nghỉ cuối cùng VD: con ốm được nghỉ 7 ngày
từ ngày 15/09/2015 đến ngày 19 tháng 9 thì ghi 19/09/2015

\- Sinh con: ghi ngày tháng năm nghỉ cuối cùng của chế độ thai sản sinh
con: VD con sinh ngày 10 tháng 9 năm 2015 thì ghi tại cột 5 :
10/03/2016.

\- Nhận nuôi con nuôi: ghi ngày tháng năm nghỉ cuối cùng của chế độ thai
sản nhận nuôi con nuôi: VD con sinh ngày 10 tháng 9 năm 2015 thì ghi tại
cột 5 : 10/03/2016.

\- Dưỡng sức PHSK sau sinh, hoặc sau ốm đau: ghi ngày tháng năm trở lại
làm việc. VD sau khi nghỉ hết chế độ thai sản quay trở lại làm việc ngày
10 tháng 9 năm 2015 thì ghi: 10/09/2015

\- DSPHSK sau TNLĐBNN: ghi ngày tháng năm hội đồng giám định y khoa kết
luận mức suy giảm khả năng lao động. VD: 10/09/2015.

Cột 6/ Ghi tổng số ngày thực tế người lao động nghỉ việc trong kỳ đề
nghị giải quyết.

PHẦN 2; DANH SÁCH ĐỀ NGHỊ ĐIỀU CHỈNH SỐ ĐÃ ĐƯỢC GIẢI QUYẾT

Phần này được lập đối với người lao động đã được cơ quan BHXH giải quyết
hưởng trợ cấp trong các đợt trước nhưng do tính sai mức hưởng hoặc phát
sinh về hồ sơ, về chính sách hoặc tiền lương làm thay đổi mức hưởng,
phải điều chỉnh lại theo quy định

Các cột A,B,1: ghi như nội dung hướng dẫn tại phần 1.

Cột 2: Ghi đợt/ tháng/ năm đã được giải quyết.

Cột 3: Ghi rõ nội dung phải điều chỉnh như: tiền lương làm căn cứ tính
hưởng, số ngày nghỉ, mức hưởng\...

Cột C: Lý do điều chỉnh: Ghi cụ thể lý do phải điều chỉnh mức hưởng. Ví
dụ: Tiền lương tính hưởng BHXH do điều chỉnh theo lương cơ sở, do được
nâng lương, do tính sai, do bổ xung hồ sơ\...

Phần cuối danh sách phải có đầy đủ xác nhận của người lập, Thủ trưởng
đơn vị sử dụng lao động. Nếu trong danh sách có người hưởng trợ cấp
dưỡng sức, PHSK thì có thêm phần xác nhận của người đại diện có thẩm
quyền của công đoàn cơ sở (trường hợp đơn vị chưa có tổ chức công đoàn
thì phải ghi rõ chưa có tổ chức công đoàn).

Danh sach này lập trên khổ A3 hoặc A4, nộp cho cơ quan BHXH nơi đơn vị
đóng BHXH 01 bản kèm theo bản điện tử cơ sở dữ liệu của danh sách và
toàn bộ hồ sơ theo quy định. Đơn vị sử dụng lao động chịu trách nhiệm về
các thông tin nêu trong danh sách.

Thông thường khoảng 03 ngày làm việc kể từ ngày nộp mẫu c70a-HD, doanh
nghiệp sẽ nhận được Danh sách giải quyết hưởng chế độ ốm đau, thai sản,
dưỡng sức, phục hồi sức khỏe- mẫu c70b-HD, (Mẫu c70b-HD do cơ quan bảo
hiểm lập).

### BC Kế Toán 01 và 02 (Dữ Liệu Thanh Toán BH NV)

![](../../../../src/Ins_TaiLieuBaoHiem_01_image13.png)

## Nghiệp vụ Bảo Hiểm

### Nghiệp vụ (Tăng Lao động)

#### Đối với nhân viên tăng mới hoàn toàn (kể cả nhân viên đã có sổ BHXH)

   Phải lập danh sách D02-TS đồng thời phải lập tờ khai cấp sổ bảo hiểm
xã hội (Mẫu A01 - TS) cho những nhân viên mới.

**Tăng lao động kịp thời trong tháng**

Đơn vị phát sinh tăng lao động tháng 02/2014, báo cáo tăng lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014.

**Tăng lao động có đóng bổ sung tháng trước:**

Đơn vị phát sinh tăng lao động tháng 01/2014, báo cáo tăng lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014. Vậy thời gian từ đến
sẽ là từ tháng 01-2014 đến tháng 02-2014

#### Tăng mới cho những nhân viên Thai sản, nghỉ ốm đi làm Ví dụ: Nhân viên A nghỉ

Thai sản từ tháng 10-2013 đến tháng 04-2014 đi làm lại. Thì người dùng
phải báo tăng lại cho nhân viên này và ghi rõ lý do tăng

#### Tăng tham gia BHTN

Người lao động dã tham gia BHXH, BHYT nhưng chưa đủ điều kiện tham gia
BHTN, đến tháng 02/2014 đủ điều kiện tham gia BHTN, đơn vị báo cáo tăng
đóng BHTN từ tháng 02/2014.

### Nghiệp vụ tăng (Mức đóng)

#### Tăng lương, phụ cấp báo cáo kịp thời

Là mức tăng khi nhân viên được điều chỉnh tăng mức đóng BHXH. Tại nghiệp
vụ này ghi rõ mức lương cũ và mức lương mới thay đổi như thế nào.

#### Tăng lương có truy nộp BHXH, BHYT, BHTN

Ghi các trường hợp người lao động có điều chỉnh tăng lương và phụ cấp
nhưng chưa đóng kịp thời phải truy đóng số tiền BHXH, BHYT, BHTN của các
tháng trước.

Ví dụ: Tăng lương là tháng 01-2014 nhưng trong tháng 01-2014 quên không
đóng phần tang cho tháng này. Đến tháng 02-2014 người dùng ghi nhận tăng
lương là từ tháng 01-2014 đến tháng 02-2014

#### Điều chuyển lao động

Trường hợp điều chuyển lao động có thay đổi chức danh thì cũng ghi nhận
trong nghiệp vụ này.

### Nghiệp vụ Giảm

#### Giảm lao động báo cáo kịp thời trong tháng, có thu hồi thẻ BHYT:

VD: Đơn vị phát sinh giảm lao động tháng 02/2014, báo cáo giảm lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014, thẻ BHYT có giá trị
sử dụng từ 01/01/2012 đến 31/03/2014.

#### Giảm lao động báo cáo kịp thời trong tháng, không thu hồi thẻ BHYT:

VD: Đơn vị phát sinh giảm lao động tháng 02/2014, báo cáo giảm lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014, thẻ BHYT có giá trị
sử dụng từ 01/01/2014 đến 31/03/2014. Nhưng nhân viên không trả thẻ cho
công ty

#### Giảm lao động, truy giảm các tháng trước có thu hồi thẻ BHYT:

VD: Đơn vị phát sinh giảm lao động tháng 01/2014, báo cáo giảm lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014, thẻ BHYT có giá trị
sử dụng từ 01/01/2014 đến 31/03/2014

#### Giảm lao động, truy giảm các tháng trước không thu hồi thẻ BHYT:

VD: Đơn vị phát sinh giảm lao động tháng 01/2014, báo cáo giảm lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014, thẻ BHYT có giá trị
sử dụng từ 01/01/2014 đến 31/03/2014

### Nghiệp vụ Mẫu D02 

- Phần lao động tăng:

> Đưa vào đối với các trường hợp Lao động tăng mới, tăng sau ốm, thai
> sản, nghỉ không lương, điều chỉnh tăng mức đóng, truy thu BHXH, BHYT,
> BHTN.

- Phần lao động giảm:

> Đưa vào đối với các trường hợp Lao động nghỉ việc do chấm dứt hợp
> đồng, nghỉ ốm, nghỉ thai sản, nghỉ không lương, điều chỉnh giảm mức
> đóng, thoái thu BHXH, BHTY, BHTN.

- Cột tiêu chí:

> \- STT: điền số thứ tự theo từng phần\
> - Họ và tên: họ và tên người lao động\
> - Số định danh: điền số sổ BHXH của người lao động (nếu có)\
> - Cấp bậc, chức vụ, chức danh nghề, nơi làm việc: ghi rõ cấp bậc, chức
> vụ, chức danh nghề, nơi làm việc (nếu không làm việc tại khu vực đặt
> trụ sở chính).\
> - Tiền lương: ghi mức tiền lương chính\
> - CV: ghi hệ số phụ cấp chức vụ đối với người có chức vụ lãnh đạo
> trong cơ quan Hành chính - Sự nghiệp\
> - TN VK, TN Nghề: ghi tỷ lệ % Thâm niên vượt khung, Thâm niên nghề (ví
> dụ: được hưởng thâm niên vượt khung 5% thì ghi vào cột TN VK là 5,
> được hưởng thâm niên nghề 10% thì ghi vào cột TN Nghề là 10)\
> - PC khác: ghi mức phụ cấp khác được đóng BHXH theo quy định.\
> - Từ tháng: ghi tháng bắt đầu báo tăng hoặc báo giảm hoặc điều
> chỉnh\....\
> - Ghi chú: vì không có cột ĐẾN THÁNG nên trong cột ghi chú cần ghi rõ
> nội dung nghiệp vụ và đến tháng nào để cán bộ BHXH hiểu rõ nghiệp vụ
> đơn vị muốn yêu cầu. Ví dụ: điều chỉnh tăng lương từ tháng 05/2014
> nhưng đến tháng 10/2014 mới báo điều chỉnh tăng lương thì ghi vào cột
> Tiền lương là Mức lương mới, Từ tháng ghi 05/2014, Ghi chú ghi Tăng
> lương đến tháng 10/2014.
>
> Có thể viết tắt các nội dung nghiệp vụ như sau:\
> Ký hiệu Nội dung\
> AD Truy thu nguyên lương (BHXH + BHYT + BHTN\
> CD Điều chỉnh chức danh\
> DC Điều chỉnh lương (BHXH + BHYT + BHTN)\
> DN Dieu chinh tham gia that nghiep (MLTT thoi diem)\
> GH Giảm hẳn ((BHXH + BHYT + BHTN)\
> GN Giảm tham gia BHTN\
> KL Nghi khong luong ((BHXH + BHYT + BHTN)\
> OF Nghỉ do ốm đau/Nghỉ không lương ((BHXH + BHYT + BHTN)\
> ON Đi làm lại sau (BHXH + BHYT + BHTN)\
> SB Thoái thu nguyên lương (BHXH, BHTN)\
> TM Tăng mới (BHXH + BHYT + BHTN)\
> TN Tăng tham gia BHTN\
> TS Thai sản (BHXH + BHYT + BHTN)\
> TT Truy thu BHYT\
> TU Thoái thu BHYT

+------------------------------------------------------+
| **Trạng Thái D02**                                   |
+:======================+:=============================+
| Loại                  | Diễn Giải                    |
+-----------------------+------------------------------+
| Tăng                  | Tăng Do Nghỉ 14 Ngày Đi Làm  |
|                       | Lại                          |
|                       +------------------------------+
|                       | Tăng LĐ                      |
|                       +------------------------------+
|                       | Tăng Sau Nghỉ Tạm Hoãn       |
|                       +------------------------------+
|                       | Tăng Thai Sản                |
|                       +------------------------------+
|                       | Tăng Bệnh                    |
|                       +------------------------------+
|                       | Tăng BHTN                    |
|                       +------------------------------+
|                       | Tăng BHYT                    |
+-----------------------+------------------------------+
| Giảm                  | Giảm Nghỉ Tạm Hoãn           |
|                       +------------------------------+
|                       | Giảm LĐ                      |
|                       +------------------------------+
|                       | Giảm Thai Sản                |
|                       +------------------------------+
|                       | Giảm Bệnh                    |
|                       +------------------------------+
|                       | Giảm Do Nghỉ \>= 14 Ngày     |
+-----------------------+------------------------------+
| Thay Đổi Lương        | Giảm Lương Và Thay Đổi Chức  |
|                       | Danh                         |
|                       +------------------------------+
|                       | Giảm Mức Đóng                |
|                       +------------------------------+
|                       | Tăng Lương Và Thay Đổi Chức  |
|                       | Danh                         |
|                       +------------------------------+
|                       | Tăng Mức Đóng                |
|                       +------------------------------+
|                       | Thay Đổi Chức Danh           |
+-----------------------+------------------------------+
| Điều chỉnh            | Điều chỉnh tăng              |
|                       +------------------------------+
|                       | Điều chỉnh giảm              |
|                       +------------------------------+
|                       | Điều chỉnh chức danh         |
+-----------------------+------------------------------+
| Khác                  | Nghỉ luôn sau thai sản       |
|                       +------------------------------+
|                       | Nghỉ 14 ngày sau thai sản    |
|                       +------------------------------+
|                       | Nghỉ Việc Mà Tháng Trước     |
|                       | Nghỉ \>= 14 Ngày             |
|                       +------------------------------+
|                       | Giảm Thai Sản                |
|                       +------------------------------+
|                       | Giảm LĐ Do Đổi Nơi Đóng BH   |
|                       +------------------------------+
|                       | Tăng LĐ Do Đổi Nơi Đóng BH   |
+-----------------------+------------------------------+
|                       |                              |
+-----------------------+------------------------------+

###  Logic Lấy số quyết định ( Các loại D02)

- Nếu loại tăng là "**TM**" (Tăng mới BHXH + BHYT + BHTN) thì:

  - DateStart = Hre_Contract.DateStart

  - DateEnd = Null

  - DecisionNo = Hre_Contract.ContractNo

  - DesicionType = Hre_Contract.ContractTypeID

  - DecisionDatesigned = Hre_Contract.DateSigned

- Nếu loại tăng là "**AD**" (Truy thu nguyên lương (BHXH + BHYT + BHTN))
  thì :

  - DateStart = Ins_InsuranceSalaryPayback.FromMonthEffect

  - DateEnd = Ins_InsuranceSalaryPayback. ToMonthEffect

  - DecisionNo = Null

  - DesicionType = Null

  - DecisionDatesigned = Null

- Nếu loại tăng là "**ON**" (Nghỉ thai san, ốm ngắn / dài ngày đi làm
  lại (BHXH + BHYT + BHTN)) hoặc "**TD**" (Tăng mới chuyển từ nơi khác
  đến) hoặc "**TT**" (Tăng tham gia BHYT) hoặc "**TN**" (Tăng tham gia
  BHTN) thì:

  - DateStart = Ins_ReportD02.DateMonth

  - DateEnd = Null

  - DecisionNo = Null

  - DesicionType = Null

  - DecisionDatesigned = Null

- Nếu loại tăng là "**DC**" (Điều chỉnh lương (BHXH + BHYT + BHTN)) hoặc
  "**CD**" (Tăng điều chỉnh chức danh) thì:

  - DateStart = Hre\_ ContractExtend. DateStart

  - DateEnd = Hre\_ ContractExtend. DateEnd

  - DecisionNo = Hre\_ ContractExtend. AnnexCode

  - DesicionType = Hre\_ ContractExtend. AppendixContractTypeID

  - DecisionDatesigned = Hre\_ ContractExtend.
    DateSignedAppendixContract

- Nếu loại tăng là "**GH**" (Giảm hẳn) thì :

  - DateStart = Hre_Profile. DateQuit

  - DateEnd = Null

  - DecisionNo = Hre_Profile. ResignNo

  - DesicionType = Null

  - DecisionDatesigned = Hre_Profile. DateQuitSign

- Nếu loại tăng là "**SB**" (Bổ sung giảm nguyên lương) thì :

  - DateStart = Ins_InsuranceSalaryPayback.FromMonthEffect

  - DateEnd = Ins_InsuranceSalaryPayback. ToMonthEffect

  - DecisionNo = Null

  - DesicionType = Null

  - DecisionDatesigned = Null

- Nếu loại tăng là "**OF_1**" (Nghỉ ốm ngắn ngày) hoặc "**OF_2**" (Nghỉ
  ốm dài ngày / Thai sản không đủ dk hưởng chế độ thai sai) hoặc
  "**GD**" (Giảm đến nơi khác) hoặc "**TU**" (Giảm BHYT) hoặc "**GN**"
  (Giảm BHTN) hoặc "**KL**" (Giảm nghỉ không lương) thì :

  - DateStart = Ins_ReportD02.DateMonth

  - DateEnd = Null

  - DecisionNo = Null

  - DesicionType = Null

  - DecisionDatesigned = Null

- Nếu loại tăng là "**DC**"(Giảm mức đóng) thì :

  - DateStart = Hre\_ ContractExtend. DateStart

  - DateEnd = Hre\_ ContractExtend. DateEnd

  - DecisionNo = Hre\_ ContractExtend. AnnexCode

  - DesicionType = Hre\_ ContractExtend. AppendixContractTypeID

  - DecisionDatesigned = Hre\_ ContractExtend.
    DateSignedAppendixContract

- Nếu loại tăng là "**TS**"( (Nghỉ thai sản và đủ dk hưởng chế độ thai
  sản) thì :

  - DateStart = Hre_Profile.DateStartPregnant

  - DateEnd = Hre_Profile.DateEndPregnant

  - DecisionNo = null

  - DesicionType = null

  - DecisionDatesigned = null

### Nghiệp Vụ IBHXH (tăng và giảm) 

+-------------------------------------------------------------------------------------+
| **IBHXH Giảm**                                                                      |
+:======================+:====================================+:======================+
| Mã IBHXH Giảm         | trạng thái D02                      | Diễn giải             |
+-----------------------+-------------------------------------+-----------------------+
| GH                    | E_GIAM_LD                           | Giảm lao động         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS | Nghỉ việc mà trước đó |
|                       |                                     | nghỉ \>= 14 ngày      |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_TS_QUIT                      | Nghỉ việc sau khi     |
|                       |                                     | nghỉ thai sản         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_QUIT_SUSPENSE                | Giảm do nghỉ tạm hoãn |
+-----------------------+-------------------------------------+-----------------------+
| GD                    | E_GIAM_LD_CHANGE_INSPLACE           | Giảm lao động do      |
|                       |                                     | chuyển nơi đóng BH    |
+-----------------------+-------------------------------------+-----------------------+
| KL                    | E_GIAM_LEAVE_14WORKINGDAYS          | Giảm do nghỉ hơn 14   |
|                       |                                     | ngày                  |
+-----------------------+-------------------------------------+-----------------------+
| TS                    | E_GIAM_TS                           | Giảm thai sản         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_PREGNANT_14WORKINGDAYS       | Giảm do nghỉ \>= 14   |
|                       |                                     | ngày sau thai sản     |
+-----------------------+-------------------------------------+-----------------------+
| SB                    | E_DieuChinhGiam                     | Điều chỉnh giảm       |
+-----------------------+-------------------------------------+-----------------------+
| DC                    | E_GIAM_LUONG                        | Giảm mức đóng         |
|                       |                                     |                       |
|                       | E_GIAM_LUONG_CHANGEJOBNAME          | Giảm lương thay đổi   |
|                       |                                     | chức danh             |
+-----------------------+-------------------------------------+-----------------------+
| CD                    | E_CHANGEJOBNAME                     | Đổi chức danh         |
+-----------------------+-------------------------------------+-----------------------+
| TU                    | E_GIAM_LD_BHYT                      | Giảm lao động trả thẻ |
|                       |                                     | BHYT kịp thời         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LD_NOT_BHYT                  | Giảm lao động không   |
|                       |                                     | trả thẻ               |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_BHYT                         | Giảm BHYT             |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LD_BHYT_KOKIPTHOI            | Giảm lao động không   |
|                       |                                     | trả BHYT kịp thời     |
+-----------------------+-------------------------------------+-----------------------+
| GN                    | E_GIAM_BHTN                         | Giảm BHTN             |
+-----------------------+-------------------------------------+-----------------------+
| OF_1                  | E_GIAM_BENH                         | Giảm bệnh             |
+-----------------------+-------------------------------------+-----------------------+
| GL                    | E_GIAM_LD_CHANGE_LEGALENTITY        | Giảm LĐ thay đổi pháp |
|                       |                                     | nhân                  |
+-----------------------+-------------------------------------+-----------------------+

+-------------------------------------------------------------------------------+
| **IBHXH Tăng**                                                                |
+:======================+:==============================+:======================+
| Mã IBHXH Tăng         | trạng thái D02                | Diễn giải             |
+-----------------------+-------------------------------+-----------------------+
| TM                    | E_TANG_LD                     | Tăng lao động         |
+-----------------------+-------------------------------+-----------------------+
| TD                    | E_TANG_LD_CHANGE_INSPLACE     | Tăng lao động do      |
|                       |                               | chuyển nơi đóng BH    |
+-----------------------+-------------------------------+-----------------------+
| ON                    | E_TANG_TS                     | Tăng thai sản         |
|                       +-------------------------------+-----------------------+
|                       | E_TANG_BENH                   | Tăng bệnh             |
|                       +-------------------------------+-----------------------+
|                       | E_TANG_LEAVE_14WORKINGDAYS    | Tăng do nghỉ \>= 14   |
|                       |                               | ngày                  |
+-----------------------+-------------------------------+-----------------------+
| DC                    | E_TANG_LUONG                  | - Tăng mức đóng       |
|                       |                               |                       |
|                       | E_TANG_LUONG_CHANGEJOBNAME    | - Tăng lương thay đổi |
|                       |                               |   chức danh nghề      |
+-----------------------+-------------------------------+-----------------------+
| CD                    | E_CHANGEJOBNAME               | Đổi chức danh         |
+-----------------------+-------------------------------+-----------------------+
| AD                    | E_DieuChinhTang               | Điều chỉnh tăng       |
+-----------------------+-------------------------------+-----------------------+
| TT                    | E_TANG_BHYT                   | Tăng BHYT             |
+-----------------------+-------------------------------+-----------------------+
| TN                    | E_TANG_BHTN                   | Tăng BHTN             |
+-----------------------+-------------------------------+-----------------------+
| TL                    | E_TANG_LD_CHANGE_LEGALENTITY  | Tăng LĐ thay đổi pháp |
|                       |                               | nhân                  |
+-----------------------+-------------------------------+-----------------------+

+-----------------------------------------------------------------------------------------------------------------------+
| Mẫu IBHXH Tăng                                                                                                        |
+:=============================+:========================+:=============================================================+
| Mã                           | Tên                     | > Cách lấy dữ liệu                                           |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol0]{.mark}  |                         | > Stt                                                        |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol1]{.mark}  | Tên NV                  | > ProfileName                                                |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol2]{.mark}  | Số sổ BH                | > Profile.[SocialInsNo]{.mark}                               |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol3]{.mark}  | Ngày sinh               | > Profile.[DateOfBirth]{.mark}                               |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol4]{.mark}  | Giới Tính               | > Profile.Gender                                             |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol5]{.mark}  | Chức danh , chức vụ     | > InsuranceMonthly.JobName                                   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol6]{.mark}  | Lương BHXH              | > D02.NewBasicSalary                                         |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol7]{.mark}  | Hệ số                   |                                                              |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol8]{.mark}  | PC1                     | > D02.Allowance1                                             |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol9]{.mark}  | PC2                     | > D02.Allowance2                                             |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol10]{.mark} | PC3                     | > D02.Allowance3                                             |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol11]{.mark} | PC khác                 | > D02.[AllowanceAdditional]{.mark}                           |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol12]{.mark} | Hiệu Lực HĐ/QĐ Từ Ngày  | > Ins_ReportD02item. DateStart                               |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol13]{.mark} | Hiệu Lực HĐ/QĐ Đến Ngày | > Ins_ReportD02item.DateEnd                                  |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol14]{.mark} | Trạng thái D02          | > [insReportD02ItemStatus]{.mark}                            |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol15]{.mark} | Số HĐ/QĐ Tăng           | > Ins_ReportD02item.DecisionNo                               |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol16]{.mark} | Loại HĐ                 | > insReportD02Item.DecisionType                              |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol17]{.mark} | Ngày Kí HĐ              | > Ins_ReportD02item.DecisionDatesigned                       |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol18]{.mark} | Tỉ lệ đóng              | > 32.5                                                       |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol19]{.mark} | Đối tượng               | > 1                                                          |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol20]{.mark} | Tình trạng sổ BH        | > Nếu Hre_Profile.SocialInsNo = Null thì 1, ngược lại là 2   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol21]{.mark} | Đóng BHXH cả tháng      | > X                                                          |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol22]{.mark} | Mã Tỉnh bệnh viện       | > [Profile.ProvinceHospital]{.mark}                          |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol2]{.mark}3 | Mã bệnh viện            | > Profile.[HealthTreatmentPlaceCode]{.mark}                  |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol24]{.mark} | Mã quốc tịch            | > Hre_Profile.NationalityID=\> Cat_Country.Code              |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol25]{.mark} | Dân tộc                 | > Hre_Profile.EthnicID =\>Cat_EthnicGroup.EthnicGroupName    |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol26]{.mark} | CMND                    | > Profile.IDNo (nếu là người VN) hoặc Profile. PassportNo    |
|                              |                         | > (nếu là người nước ngoài.                                  |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol27]{.mark} | Ngày cấp CMND           | > Profile.[IDDateOfIssue]{.mark} (nếu là người VN) hoặc      |
|                              |                         | > Profile. PassportDateOfIssue (nếu là người nước ngoài)     |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol28]{.mark} | Mã Tĩnh Cấp             | > Profile.[IDPlaceOfIssue]{.mark}                            |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol29]{.mark} | tên phuong xa thường    | > pVillageName =\> Cat_Village.VillageName                   |
|                              | tru                     |                                                              |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol30]{.mark} | tên quan/huyen thường   | > [pDistrictName]{.mark} =\> Cat_District. DistrictName      |
|                              | tru                     |                                                              |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol31]{.mark} | tên tinh/TP thường trú  | > [pProvinceName]{.mark} =\> Cat_Province.ProvinceName       |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol32]{.mark} | Số nhà thường trú       | > Profile.[PAddress]{.mark}                                  |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol33]{.mark} | Mã xã thường trú        | > [pVillage]{.mark}Code                                      |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol34]{.mark} | Mã quận thường trú      | > [pDistrict]{.mark}Code                                     |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol35]{.mark} | Mã tỉnh thường trú      | > [pProvince]{.mark}Code                                     |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol36]{.mark} | Số nhà tạm trú          | > Profile.[TAddress]{.mark}                                  |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol37]{.mark} | Mã phường tạm trú       | > [tVillage]{.mark}Code                                      |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol38]{.mark} | Mã Quận tạm trú         | > [tDistrict]{.mark}Code                                     |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol39]{.mark} | Mã tỉnh tạm trú         | > [tProvince]{.mark}Code                                     |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol40]{.mark} |                         | > Profile.[HomePhone]{.mark}                                 |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol41]{.mark} |                         | > Profile.Email                                              |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol42]{.mark} | Cha/mẹ                  |                                                              |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol43]{.mark} | Thân nhân khác          |                                                              |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol44]{.mark} |                         | > Profile.CodeEmp                                            |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol4]{.mark}5 | Số tài khoản            | > Sal_SalaryInformation.AccountNo                            |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol4]{.mark}6 | Ngân hàng               | > Cat_Bank.BankName                                          |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol4]{.mark}7 | Chi nhánh ngân hàng     | > Sal_SalaryInformation.BankBrandName                        |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol4]{.mark}8 | Lương BHXH              | > Ins_ReportD02Item.InsuranceSalary                          |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol4]{.mark}9 | Phòng ban E_BRANCH      | > Cat_OrgUnit.E_BRANCH (nếu không có dữ liệu sẽ lấy          |
|                              |                         | > Cat_Orgstructure.OrgStructureName)                         |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol50]{.mark} | Nơi cấp BHXH            | > Hre_Profile.SocialInsIssuePlace                            |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol51]{.mark} | Nơi đăng ký khám bệnh   | > Hre_Profile.HealthTreatmentPlace                           |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol52]{.mark} | Mã ngân hàng            | > Sal_SalaryInformation.BankID =\> Cat_Bank.BankCode         |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol53]{.mark} | Mã chi nhánh ngân hàng  | > Sal_SalaryInformation.BranchID =\> Cat_Branch.BranchCode   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol54]{.mark} | Tên Quốc Tịch           | > Hre_Profile.Cat_Country =\> Cat_Country.nationallityName   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol55]{.mark} | Tên Phường/Xã tạm trú   | > tVillageName =\> Cat_Village.VillageName                   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol56]{.mark} | Tên Quận/Huyện tạm trú  | > tDistrictName =\> Cat_District.DistrictName                |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol57]{.mark} | Tên Tỉnh/TP tạm trú     | > pProvinceName =\> Cat_Province.ProvinceName                |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol58]{.mark} | Mã Tỉnh/TP của CMND     | > Hre_Profile.IDNoProvinceID =\> Cat_Province.Code           |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol59]{.mark} | Tên Tỉnh/TP của CMND    | > Hre_Profile.IDNoProvinceID =\> Cat_Province.ProvinceName   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol60]{.mark} | Mã Quận/Huyện của CMND  | > Hre_Profile.IDNoDistrictID =\> Cat_District.Code           |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol61]{.mark} | Tên Quận/Huyện của CMND | > Hre_Profile.IDNoDistrictID =\> Cat_District.DistrictName   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol62]{.mark} | Mã Xã/Phường của CMND   | > Hre_Profile.IDNoAVillageID =\> Cat_Village.Code            |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol63]{.mark} | Tên Xã/Phường của CMND  | > Hre_Profile.IDNoAVillageID =\> Cat_Village.VillageName     |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol64]{.mark} | Họ tên chủ hộ           | > Ins_ReportD02Item                                          |
|                              |                         | >                                                            |
|                              |                         | > .ProfileID.ProfileMoreInfoID.HouseholderFullName           |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol65]{.mark} | Số điện thoại của chủ   | > Ins_ReportD02Item.ProfileID                                |
|                              | hộ                      | >                                                            |
|                              |                         | > .ProfileMoreInfoID.Telephone                               |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol66]{.mark} | Số sổ hộ khẩu/ Số sổ    | > Ins_ReportD02Item.ProfileID                                |
|                              | tạm trú                 | >                                                            |
|                              |                         | > .ProfileMoreInfoID.HouseholdBookNo                         |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol67]{.mark} | Loại giấy tờ            | > Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.PapersType   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol68]{.mark} | Tỉnh thành              | > Ins_ReportD02Item.ProfileID                                |
|                              |                         | >                                                            |
|                              |                         | > .ProfileMoreInfoID.ProvinceBirthCertificateID.ProvinceName |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol69]{.mark} | Mã tỉnh thành           | > Ins_ReportD02Item.ProfileID                                |
|                              |                         | >                                                            |
|                              |                         | > .ProfileMoreInfoID.ProvinceBirthCertificateID.Code         |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol70]{.mark} | Quận huyện              | > Ins_ReportD02Item.ProfileID                                |
|                              |                         | >                                                            |
|                              |                         | > .ProfileMoreInfoID.DistrictBirthCertificateID.DistrictName |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol71]{.mark} | Mã quận huyện           | > Ins_ReportD02Item.ProfileID                                |
|                              |                         | >                                                            |
|                              |                         | > .ProfileMoreInfoID.DistrictBirthCertificateID.Code         |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol72]{.mark} | Phường xã               | > Ins_ReportD02Item.ProfileID                                |
|                              |                         | >                                                            |
|                              |                         | > .ProfileMoreInfoID.VillageBirthCertificateID.VillageName   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol73]{.mark} | Mã phường xã            | > Ins_ReportD02Item.ProfileID.ProfileMoreInfoID              |
|                              |                         | >                                                            |
|                              |                         | > .VillageBirthCertificateID.Code                            |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol74]{.mark} | Mã hộ gia đình          | > Ins_ReportD02Item.ProfileID                                |
|                              |                         | >                                                            |
|                              |                         | > .ProfileMoreInfoID.HouseHoldCode                           |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol75]{.mark} | Mã vùng miền            | > Ins_ReportD02Item.RegionID.Code                            |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol76]{.mark} | Tên vùng miền           | > Ins_ReportD02Item.RegionID.RegionName                      |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol77]{.mark} | Mã dân tộc              | > Ins_ReportD02Item.ProfileID. EthnicID. Code                |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol78]{.mark} | Tiền Đồng Lương cu      | > Ins_ReportD02Item.OldBasicSalary                           |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol79]{.mark} | Trang thai D02          | > Ins_ReportD02Item.Status                                   |
+------------------------------+-------------------------+--------------------------------------------------------------+
| [iBHXHD02TSTangCol80]{.mark} | Số sổ BHXH              | > Ins_ReportD02Item.Hre_Profile.SocialInsNo                  |
+------------------------------+-------------------------+--------------------------------------------------------------+

+-----------------------------------------------------------------------------------------------------------------------+
| Mẫu IBHXH Giảm                                                                                                        |
+:=============================+:=========================+:============================================================+
| Mã                           | Tên                      | Cách lấy dữ liệu                                            |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol0]{.mark}  | > Số thứ tự              | Stt­­                                                         |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol1]{.mark}  | > Tên NV                 | [Profile.ProfileName]{.mark}                                |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol2]{.mark}  | > Số sổ BH               | Profile.[SocialInsNo]{.mark}                                |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol3]{.mark}  | > Ngày sinh              | Profile.[DateOfBirth]{.mark}                                |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol4]{.mark}  | > Giới tính (nữ là X)    | Profile.[Gender]{.mark}                                     |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol5]{.mark}  | > Chức danh chức vụ      | InsuranceMonthly.JobName                                    |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol6]{.mark}  | > Lương BHXH             | [D02Item.NewBasicSalary]{.mark}                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol7]{.mark}  |                          |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol8]{.mark}  | > Phụ cấp 1              | D02Item.[Allowance1]{.mark}                                 |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol9]{.mark}  | > PC 2                   | D02Item.[Allowance2]{.mark}                                 |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol10]{.mark} | > PC 3                   | D02Item.[Allowance]{.mark}3                                 |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol11]{.mark} | > PC thêm                | D02Item.[AllowanceAdditional]{.mark}                        |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol12]{.mark} | > Ngày hiệu lực HĐ (từ   | Ins_ReportD02item.DateStart                                 |
|                              | > ngày)                  |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol13]{.mark} | > Ngày hiệu lực HĐ (Đến  | Ins_ReportD02item.DateEnd                                   |
|                              | > ngày)                  |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol14]{.mark} | > Trạng thái D02         | D02Item.Status                                              |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol15]{.mark} | > Số HĐ                  | Ins_ReportD02item.DecisionNo                                |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol16]{.mark} | > Ngày ký HĐ             | Ins_ReportD02item.DecisionDatesigned                        |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol17]{.mark} | > Tỉ lệ đóng (cố định là | 32.5                                                        |
|                              | > 32.5)                  |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol18]{.mark} | > Đã Báo Giảm            |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol19]{.mark} | > Giảm                   | Nếu loại "GH (Giảm hẳn)" thì 1, ngược lại null              |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol20]{.mark} | > Không Trả Thẻ BHYT     | Nếu Hre_Profile.ReceiveHealthIns = 1 thì "X", ngược lại     |
|                              |                          | Null                                                        |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol21]{.mark} | > Mã Thẻ BHYT            |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol22]{.mark} | > Ngày Trả Thẻ           | Hre_Profile. ReceiveHealthIn­­­sDate                           |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol2]{.mark}3 | > Từ                     |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol24]{.mark} | > Đến                    |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol25]{.mark} | > Thời Gian Thai Sản     |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| [iBHXHD02TSGiamCol26]{.mark} | > Mã NV                  | Profile.CodeEmp                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol27          | > Số tài khoản           | Sal_SalaryInformation.AccountNo                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol28          | > Ngân hàng              | Cat_Bank.BankName                                           |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol29          | > Chi nhánh ngân hàng    | Sal_SalaryInformation.BankBrandName                         |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol30          | > Lương BHXH             | Hre_Profile.**Sal_InsuranceSalary**                         |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol31          | > Phòng ban E_BRANCH     | Cat_OrgUnit.E_BRANCH (nếu không có dữ liệu sẽ lấy           |
|                              |                          | Cat_Orgstructure.OrgstructureName)                          |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol32          | > Nơi cấp bảo hiểm xã    | Hre_Profile.SocialInsIssuePlace                             |
|                              | > hội                    |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol33          | > Nơi ĐK khám bệnh       | Hre_Profile.HealthTreatmentPlace                            |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol34          | > Quốc tịch nhân viên    | Hre_Profile.NationalityID =\> Cat_Country.CountryName       |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol35          | > Tỉnh thành             | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID               |
|                              |                          |                                                             |
|                              |                          | .ProvinceBirthCertificateID.ProvinceName                    |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol36          | > Mã tỉnh thành          | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID               |
|                              |                          |                                                             |
|                              |                          | .ProvinceBirthCertificateID.Code                            |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol37          | > Quận huyện             | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID               |
|                              |                          |                                                             |
|                              |                          | .DistrictBirthCertificateID.DistrictName                    |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol38          | > Mã quận huyện          | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID               |
|                              |                          |                                                             |
|                              |                          | .DistrictBirthCertificateID.Code                            |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol39          | > Phường xã              | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID               |
|                              |                          |                                                             |
|                              |                          | .VillageBirthCertificateID.VillageName                      |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol40          | > Mã phường xã           | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID               |
|                              |                          |                                                             |
|                              |                          | .VillageBirthCertificateID.Code                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol41          | > Mã hộ gia đình         | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID               |
|                              |                          |                                                             |
|                              |                          | .HouseHoldCode                                              |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol42          | > Mã vùng miền           | Ins_ReportD02Item.RegionID.Code                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol43          | > Tên vùng miền          | Ins_ReportD02Item.RegionID.RegionName                       |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol44          | > Mã dân tộc             | Ins_ReportD02Item.ProfileID. EthnicID. Code                 |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol45          | > Tên Tỉnh/TP thường trú | Ins_ReportD02Item.ProfileID.PprovinceID.ProvinceName        |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol46          | > Tên Quận/Huyện thường  | Ins_ReportD02Item.ProfileID.PdistrictID.DistrictName        |
|                              | > trú                    |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol47          | > Tên Xã/Phường thường   | Ins_ReportD02Item.ProfileID.VillageID.VillageName           |
|                              | > trú                    |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol48          | > Số Nhà (địa chỉ thường | Ins_ReportD02Item.ProfileID.PAddress                        |
|                              | > trú)                   |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol49          | > Tên Tỉnh/TP tạm trú    | Ins_ReportD02Item.ProfileID.TprovinceID.ProvinceName        |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol50          | > Tên Quận/Huyện tạm trú | Ins_ReportD02Item.ProfileID.TdistrictID.DistrictName        |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol51          | > Tên Xã/Phường tạm trú  | Ins_ReportD02Item.ProfileID.TAVillageID.VillageName         |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol52          | > Số Nhà (địa chỉ tạm    | Ins_ReportD02Item.ProfileID.TAddress                        |
|                              | > trú)                   |                                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol53          | > Tên dân tộc            | Cat_EthnicGroup.EthnicGroupName                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol54          | > Tiền Đồng lương củ     | Ins_ReportD02Item.OldBasicSalary                            |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol55          | > Số CMND                | Hre_Profile.IDNo hoặc Hre_Profile.PassportNo                |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol56          | > Trạng thái D02         | Ins_ReportD02Item.Status                                    |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol57          | > Họ tên chủ hộ          | Ins_ReportD02Item.Hre_Profile.Hre_ProfileMoreInfo.          |
|                              |                          |                                                             |
|                              |                          | HouseholderFullName                                         |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol58          | > Số sổ hộ khẩu/ số sổ   | Ins_ReportD02Item.Hre_Profile.Hre_ProfileMoreInfo.          |
|                              | > tạm trú                |                                                             |
|                              |                          | HouseholdBookNo                                             |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol59          | > Mã nơi đăng ký khám    | Ins_ReportD02Item.Hre_Profile.IDNoProvinceID =\>            |
|                              | > chữa bệnh              | Cat_Province.ProvinceName                                   |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol60          | > Ngày vào làm           | Ins_ReportD02Item.Hre_Profile.DateHire                      |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol61          | > Mã quốc tịch           | Ins_ReportD02Item.Hre_Profile.NationalityID.Code            |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol62          | > số sổ BHXH             | Ins_ReportD02Item.Hre_Profile.SocialInsNo                   |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol63          | > Ngày cấp CMND          | Ins_ReportD02Item.Hre_Profile.IDDateOfIssue                 |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol64          | > Nơi cấp CMND           | Ins_ReportD02Item.Hre_Profile.IDPlaceOfIssue                |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol65          | > Mã tỉnh đăng ký KCB    | Ins_ReportD02Item.Hre_Profile =\>                           |
|                              |                          | Hre_HealthInsuranceCard.ProvinceHospital                    |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol66          | > Điện thoại chủ hộ      | Ins_ReportD02Item.Hre_Profile.Hre_ProfileMoreInfo.Telephone |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol67          | > Tên Tỉnh TP của chứng  | Ins_ReportD02Item.Hre_Profile.IDNoProvinceID =\>            |
|                              | > minh thư               | Cat_Province.ProvinceName                                   |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol68          | > Mã Tỉnh TP của chứng   | Ins_ReportD02Item.Hre_Profile.IDNoProvinceID =\>            |
|                              | > minh thư               | Cat_Province.Code                                           |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol69          | > Tên Quan Huyen của     | Ins_ReportD02Item.Hre_Profile.IDNoDistrictID =\>            |
|                              | > chứng minh thư         | Cat_District.DistrictName                                   |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol70          | > Mã Quận Huyen của      | Ins_ReportD02Item.Hre_Profile.IDNoDistrictID =\>            |
|                              | > chứng minh thư         | Cat_District.Code                                           |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol71          | > Tên phuong xa của      | Ins_ReportD02Item.Hre_Profile.IDNoAVillageID =\>            |
|                              | > chứng minh thư         | Cat_Village.VillageName                                     |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol72          | > Mã phuong xa của chứng | Ins_ReportD02Item.Hre_Profile.IDNoAVillageID =\>            |
|                              | > minh thư               | Cat_Village.Code                                            |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol73          | > Mã phường xã của địa   | Ins_ReportD02Item.Hre_Profile.VillageID =\>                 |
|                              | > chỉ tạm trú            | Cat_Village.Code                                            |
+------------------------------+--------------------------+-------------------------------------------------------------+
| iBHXHD02TSGiamCol74          | > Mã phường xã của địa   | Ins_ReportD02Item.Hre_Profile.TAVillageID =\>               |
|                              | > chỉ thường trú         | Cat_Village.Code                                            |
+------------------------------+--------------------------+-------------------------------------------------------------+

### Nghiệp Vụ EBHXH (tăng, giảm và điều chỉnh)

+-------------------------------------------------------------------------------+
| **EBHXH Tăng**                                                                |
+:======================+:==============================+:======================+
| Mã EBHXH Tăng         | trạng thái D02                | Diễn giải             |
+-----------------------+-------------------------------+-----------------------+
| TM                    | E_TANG_LD                     | Tăng lao động         |
+-----------------------+-------------------------------+-----------------------+
| TD                    | E_TANG_LD_CHANGE_INSPLACE     | Tăng lao động do      |
|                       |                               | chuyển nơi đóng BH    |
+-----------------------+-------------------------------+-----------------------+
| ON                    | E_TANG_TS                     | Tăng thai sản         |
|                       +-------------------------------+-----------------------+
|                       | E_TANG_BENH                   | Tăng bệnh             |
|                       +-------------------------------+-----------------------+
|                       | E_TANG_LEAVE_14WORKINGDAYS    | Tăng do nghỉ \>= 14   |
|                       |                               | ngày                  |
+-----------------------+-------------------------------+-----------------------+
| DC                    | E_TANG_LUONG                  | - Tăng mức đóng       |
|                       |                               |                       |
|                       | E_TANG_LUONG_CHANGEJOBNAME    | - Tăng lương thay đổi |
|                       |                               |   chức danh nghề      |
+-----------------------+-------------------------------+-----------------------+
| CD                    | E_CHANGEJOBNAME               | Đổi chức danh         |
+-----------------------+-------------------------------+-----------------------+
| AD                    | E_DieuChinhTang               | Điều chỉnh tăng       |
+-----------------------+-------------------------------+-----------------------+
| TT                    | E_TANG_BHYT                   | Tăng BHYT             |
+-----------------------+-------------------------------+-----------------------+
| TN                    | E_TANG_BHTN                   | Tăng BHTN             |
+-----------------------+-------------------------------+-----------------------+

+-------------------------------------------------------------------------------------+
| **EBHXH Giảm**                                                                      |
+:======================+:====================================+:======================+
| Mã EBHXH Giảm         | trạng thái D02                      | Diễn giải             |
+-----------------------+-------------------------------------+-----------------------+
| GH                    | E_GIAM_LD                           | Giảm lao động         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS | Nghỉ việc mà trước đó |
|                       |                                     | nghỉ \>= 14 ngày      |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_TS_QUIT                      | Nghỉ việc sau khi     |
|                       |                                     | nghỉ thai sản         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_QUIT_SUSPENSE                | Giảm do nghỉ tạm hoãn |
+-----------------------+-------------------------------------+-----------------------+
| GD                    | E_GIAM_LD_CHANGE_INSPLACE           | Giảm lao động do      |
|                       |                                     | chuyển nơi đóng BH    |
+-----------------------+-------------------------------------+-----------------------+
| KL                    | E_GIAM_LEAVE_14WORKINGDAYS          | Giảm do nghỉ hơn 14   |
|                       |                                     | ngày                  |
+-----------------------+-------------------------------------+-----------------------+
| TS                    | E_GIAM_TS                           | Giảm thai sản         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_PREGNANT_14WORKINGDAYS       | Giảm do nghỉ \>= 14   |
|                       |                                     | ngày sau thai sản     |
+-----------------------+-------------------------------------+-----------------------+
| SB                    | E_DieuChinhGiam                     | Điều chỉnh giảm       |
+-----------------------+-------------------------------------+-----------------------+
| TU                    | E_GIAM_LD_BHYT                      | Giảm lao động trả thẻ |
|                       |                                     | BHYT kịp thời         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LD_NOT_BHYT                  | Giảm lao động không   |
|                       |                                     | trả thẻ               |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_BHYT                         | Giảm BHYT             |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LD_BHYT_KOKIPTHOI            | Giảm lao động không   |
|                       |                                     | trả BHYT kịp thời     |
+-----------------------+-------------------------------------+-----------------------+
| GN                    | E_GIAM_BHTN                         | Giảm BHTN             |
+-----------------------+-------------------------------------+-----------------------+
| OF_1                  | E_GIAM_BENH                         | Giảm bệnh             |
+-----------------------+-------------------------------------+-----------------------+
| GL                    | E_GIAM_LD_CHANGE_LEGALENTITY        | Giảm mức đóng         |
|                       |                                     |                       |
|                       |                                     | Giảm LĐ thay đổi pháp |
|                       |                                     | nhân                  |
+-----------------------+-------------------------------------+-----------------------+

+-------------------------------------------------------------------------------------+
| **EBHXH Điều chỉnh**                                                                |
+:======================+:====================================+:======================+
| Mã EBHXH Điều chỉnh   | trạng thái D02                      | Diễn giải             |
+-----------------------+-------------------------------------+-----------------------+
| GH                    | E_GIAM_LD                           | Giảm lao động         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS | Nghỉ việc mà trước đó |
|                       |                                     | nghỉ \>= 14 ngày      |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_TS_QUIT                      | Nghỉ việc sau khi     |
|                       |                                     | nghỉ thai sản         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_QUIT_SUSPENSE                | Giảm do nghỉ tạm hoãn |
+-----------------------+-------------------------------------+-----------------------+
| GD                    | E_GIAM_LD_CHANGE_INSPLACE           | Giảm lao động do      |
|                       |                                     | chuyển nơi đóng BH    |
+-----------------------+-------------------------------------+-----------------------+
| KL                    | E_GIAM_LEAVE_14WORKINGDAYS          | Giảm do nghỉ hơn 14   |
|                       |                                     | ngày                  |
+-----------------------+-------------------------------------+-----------------------+
| TS                    | E_GIAM_TS                           | Giảm thai sản         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_PREGNANT_14WORKINGDAYS       | Giảm do nghỉ \>= 14   |
|                       |                                     | ngày sau thai sản     |
+-----------------------+-------------------------------------+-----------------------+
| SB                    | E_DieuChinhGiam                     | Điều chỉnh giảm       |
+-----------------------+-------------------------------------+-----------------------+
| TU                    | E_GIAM_LD_BHYT                      | Giảm lao động trả thẻ |
|                       |                                     | BHYT kịp thời         |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LD_NOT_BHYT                  | Giảm lao động không   |
|                       |                                     | trả thẻ               |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_BHYT                         | Giảm BHYT             |
|                       +-------------------------------------+-----------------------+
|                       | E_GIAM_LD_BHYT_KOKIPTHOI            | Giảm lao động không   |
|                       |                                     | trả BHYT kịp thời     |
+-----------------------+-------------------------------------+-----------------------+
| GN                    | E_GIAM_BHTN                         | Giảm BHTN             |
+-----------------------+-------------------------------------+-----------------------+
| OF_1                  | E_GIAM_BENH                         | Giảm bệnh             |
+-----------------------+-------------------------------------+-----------------------+
| GL                    | E_GIAM_LD_CHANGE_LEGALENTITY        | Giảm mức đóng         |
|                       |                                     |                       |
|                       |                                     | Giảm LĐ thay đổi pháp |
|                       |                                     | nhân                  |
+-----------------------+-------------------------------------+-----------------------+
| CD                    | E_CHANGEJOBNAME                     | Đổi chức danh         |
+-----------------------+-------------------------------------+-----------------------+

## Các Bảng sử dụng phân hệ bảo hiểm

  --------------------------------------------------------------------------------------------
    **STT** **Tên bảng**                     **Mô tả**
  --------- -------------------------------- -------------------------------------------------
          1 Ins_ProfileInsuranceMonthly       

          2 Hre_Profile                       

          3 Cat_OrgStructure                  

          4 Sys_AsynTask                     xử lý phần trăm

          5 Cat_DayOff                        Ngày nghỉ lễ

          6 Sal_InsuranceSalary              lương BHXH

          7 Hre_StopWorking                  Xử lý nghỉ tạm hoãn

          8 Cat_GradePayroll                 chế độ lương để lấy công thức bao hiểm

          9 Ins_InsuranceRecord              chứng từ bảo hiểm

         10 Cat_LeaveDayType                 Loại ngày nghỉ có InsuranceType là
                                             E_PREGNANCY_SUCKLE

         11 Att_LeaveDay                     ngày nghỉ

         12 Cat_HDTJobType                   Loại HDTJOB (honda moi sử dụng)

         13 Cat_ExchangeRate                  Dùng để chuyển đổi tiền tệ

         14 Cat_ValueEntity                  Mức trần đóng BH

         15 Cat_Element                      phần tử bảo hiểm

         16 Cat_Region                       Vùng miền

         17 Cat_RegionDetail                 Chi tiết vùng miền

         18 Cat_RateInsurance                Tỉ lệ bảo hiểm

         19 Sal_BasicSalary                  lấy phần tử lương cơ bản để lấy các phụ cấp (lấy
                                             LCB đã approved)

         20 Cat_SalaryRank                   lấy phần tử

         21 Cat_UnusualAllowanceCfg          lấy phần tử

         22 Cat_OrgStructureType             lấy phần tử

         23 Cat_JobTitle                     lấy phần tử

         24 Cat_Position                     lấy phần tử

         25 Cat_UsualAllowance                Phụ cấp

         26 Hre_WorkHistory                  lấy dữ liệu lịch sử phong ban, chuc danh , chuc
                                             vu,....

         27 Cat_GradeAttendance              lay du lieu nghi 14 ngay (Ds Chế Độ công không Sử
                                             Dụng In/Out)

         28 Att_Grade                        lay du lieu nghi 14 ngay (ds NV sử dụng chế độ
                                             công)

         29 Att_Workday                      lay du lieu nghi 14 ngay (ds workday khong bao
                                             gom nhung nguoi co che do luong ko su dung may
                                             quet the)

         30 Att_Roster                       lay du lieu nghi 14 ngay (???)

         31 Att_RosterGroup                  lay du lieu nghi 14 ngay (???)

         32 Hre_HDTJob                       lay du lieu nghi 14 ngay

         33 Cat_SalaryClass                  Phần tử bảo hiểm

         34 Cat_AbilityTile                  Phần tử bảo hiểm

         35 Cat_HDTJobGroup                  Phần tử bảo hiểm

         36 Sal_Grade                        Phần tử bảo hiểm

         37 Sal_UnusualAllowance             Phần tử bảo hiểm

         38 Ins_ReportD02                    BC D02

         39 Ins_ReportD02Item                BC D02

         40 Ins_ReportD02V2                  BC D02 V2

         41 Ins_ReportD02ItemV2              BC D02 V2

         42 Ins_InsuranceSalaryPayback       Điều chỉnh bảo hiểm

         43 Ins_TypeD02                      Loại D02

         44 Ins_InsuranceForPayrollMonthly   Phân tích bảo hiểm chốt tính lương

         45 Hre_HealthInsuranceCard          Thẻ BHYT

         46 Cat_HealthTreatmentPlace         Nơi đăng ký khám bệnh

         47 Cat_ExchangeRate                 Tỉ giá

         48 Cat_InsuranceGrade               Chế độ bảo hiểm (công thức nghỉ 14 ngày)

         49 Ins_InsuranceGrade               Chế độ bảo hiểm NV (công thức nghỉ 14 ngày)

         50 Hre_Relatives                    Người thân

         51 Cat_Village                      Phường xã

         52 Cat_UnAllowCfgAmount             Mức thưởng phụ cấp

         53 Hre_ContractExtend               Số phụ lục

         54 Cat_Branch                       Chi nhánh

         55 Cat_EmployeeType                 Loại nhân viên

         56 Cat_WorkPlace                    Nơi làm việc

         57 Att_CutOffDuration               Kỳ công

         58 Sys_UserInfo                     Người dùng

         59 Sal_SalaryInformation            Thông tin lương

         60 Hre_ProfileMoreInfo              Thông tin thêm

         61 Cat_NameEntity                   

         62 Cat_Religion                     Tôn giáo

         63 Ins_ChildSick                    Con ốm

         64 Cat_EthnicGroup                  Dân tộc

         65 Cat_District                     Quận huyện

         66 Cat_Country                      Thành phố

         67 Cat_CostCentre                   Chi phí

         68 Sys_FieldInfoCustomValue         

         69 Cat_UnitStructure                Khối PB

         70 Cat_EnumTranslate                Dịch enum

         71 Hre_Contract                     Hợp đồng

         72 Ins_InsuranceRecord              Chứng từ bảo hiểm
  --------------------------------------------------------------------------------------------

## Mapping (V8 , V7 , V6)

+-----------------------------------------------------------------------------------------------------------------+
| > **So sánh mapping giữa các phiên bản (Bảo Hiểm bản Ver6, Ver7, Ver8)**                                        |
+:===================================+:================================+:====================+:===================+
| **Insurance (Ver 8)**              | **Insurance (Ver 7)**           | **Insurance (Ver    | **Mô Tả (V8)**     |
|                                    |                                 | 6)**                |                    |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Hre_Profile                        | Hre_Profile                     | Hre_Profile         |                    |
+------------------------------------+---------------------------------+---------------------+--------------------+
| **Ins_ProfileInsuranceMonthly**    | **Ins_ProfileInsuranceMonthly** |                     | Trích nộp bảo hiểm |
+------------------------------------+---------------------------------+---------------------+--------------------+
| **Ins_InsuranceForPayrollMonthly** |                                 |                     | Trích nộp BH tính  |
|                                    |                                 |                     | chốt lương         |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Ins_InsuranceRecord                | Hre_InsuranceRecord             | Hre_InsuranceRecord | Chứng Từ BH        |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Sal_InsuranceSalary                | Sal_BasicSalary                 | Sal_BasicSalary     | Lương BHXH         |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Att_LeaveDay                       | Att_LeaveDay                    | Att_LeaveDay        | Dùng nghỉ \>=14    |
|                                    |                                 |                     | ngày, Thai sản     |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Cat_DayOff                         | Cat_DayOff                      | Cat_DayOff          | Nghỉ lễ            |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Cat_ExchangeRate                   | Cat_ExchangeRate                | Cat_ExchangeRate    | Tỉ giá             |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Hre_Contract                       | Hre_Contract                    | Hre_Contract        | Hợp đồng mới nhất  |
+------------------------------------+---------------------------------+---------------------+--------------------+
|                                    | **Cat_GradeConfig**             | **Cat_GradeConfig** | Tăng mới LĐ(cấu    |
|                                    |                                 |                     | hình loại hợp đồng |
|                                    |                                 |                     | đóng BH)           |
+------------------------------------+---------------------------------+---------------------+--------------------+
|                                    |                                 | **Sal_Grade**       |                    |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Att_Roster                         | Att_Roster                      | Att_Roster          | Dùng cho nghỉ      |
|                                    |                                 |                     | \>=14              |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Ins_ReportD02                      | Ins_ReportD02                   | Ins_ReportD02       |                    |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Ins_ReportD02Item                  | Ins_ReportD02Item               | Ins_ReportD02Item   |                    |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Cat_ValueEntity                    | Cat_ValueEntity                 | Cat_ValueEntity     | Mức trần /luong    |
|                                    |                                 |                     | tối thiểu          |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Cat_RateInsurance                  | Cat_RateInsurance               | Cat_RateInsurance   | Tỉ Lệ BH           |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Att_Workday                        | Unknown                         | Unknown             | Dùng nghỉ \>=14    |
|                                    |                                 |                     | ngày               |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Hre_HDTJob                         | Unknown                         | Unknown             | HDTJob dành cho    |
|                                    |                                 |                     | Honda              |
+------------------------------------+---------------------------------+---------------------+--------------------+
| Note:                                                                                                           |
+-----------------------------------------------------------------------------------------------------------------+

# Chuổi Giá Trị (Lean Production)

## Qui trình bảo hiểm

![](../../../../src/Ins_TaiLieuBaoHiem_01_image14.emf)

### Chi tiết các bước thực hiện

+--------------+---------+----------------------------------------------------------+---------+
| > **Bước     | **Người | > **Mô tả chi tiết**                                     | **Tham  |
| > thực       | thực    |                                                          | chiếu** |
| > hiện**     | hiện**  |                                                          |         |
+==============+:========+==========================================================+=========+
| **INS01.01** | Bộ phận | Cán bộ Bảo hiểm cập nhật chứng từ BHXH vào hệ thống:     |         |
|              | nhân sự |                                                          |         |
|              |         | Đường dẫn: *[Trang                                       |         |
|              |         | Chủ](http://113.161.103.125/HRM/Home/Views/Default.aspx) |         |
|              |         | \> [Bảo                                                  |         |
|              |         | Hiểm](http://113.161.103.125/HRM/Insurance/Default.aspx) |         |
|              |         | \> DS Chứng Từ BHXH*                                     |         |
+--------------+---------+----------------------------------------------------------+---------+
| **INS01.02** | Bộ phận | Cán bộ Bảo hiểm vào màn hình:                            |         |
|              | nhân sự |                                                          |         |
|              |         | Đường dẫn: *[Trang                                       |         |
|              |         | Chủ](http://113.161.103.125/HRM/Home/Views/Default.aspx) |         |
|              |         | \> [Bảo                                                  |         |
|              |         | Hiểm](http://113.161.103.125/HRM/Insurance/Default.aspx) |         |
|              |         | \> Phân Tích Bảo Hiểm*                                   |         |
|              |         |                                                          |         |
|              |         | =\> Tiến hành phân tích BHXH                             |         |
+--------------+---------+----------------------------------------------------------+---------+
| **INS01.03** | Bộ phận | Cán bộ Bảo hiểm xuất các báo cáo bảo hiểm trên phần mềm  |         |
|              | nhân sự | ra từ các màn hình: *Trang Chủ \> Bảo Hiểm \> Báo cáo*   |         |
+--------------+---------+----------------------------------------------------------+---------+
| **INS01.04** | Bộ phận | Cán bộ Bảo hiểm nộp các báo cáo lên cơ quan bảo hiểm,    |         |
|              | nhân sự | thực hiện bên ngoài hệ thống                             |         |
+--------------+---------+----------------------------------------------------------+---------+

### Danh sách chức năng

  ------------------------------------------------------------------------
  **Mã**       **Tên chức năng**
  ------------ -----------------------------------------------------------
  **INS001**   DS chứng từ BHXH

               

  **INS002**   Phân tích BHXH

  **INS003**   DS D02

  **INS004**   DS D02TS

  **INS005**   DS C70A
  ------------------------------------------------------------------------

## Qui trình chuổi giá trị toàn bộ phân hệ bảo hiểm

![](../../../../src/Ins_TaiLieuBaoHiem_01_image15.png)

## Qui trình chuổi giá trị phân tích bảo hiểm

![](../../../../src/Ins_TaiLieuBaoHiem_01_image16.png)

1.  Dữ liệu NV: không tạo giá trị khách hàng

2.  Tháng tham gia BH(BHXH,BHYT,BHTN): không tạo giá trị cho khách hàng

3.  Kiểm tra đóng BH: tạo giá trị cho khách hàng

4.  Kiểm tra nghỉ 14 ngày: tạo giá trị cho khách hàng

5.  Tính lương đóng BH: tạo giá trị cho khách hàng + thao tác trung gian
    để tính phần tử (tăng chi phí nên tìm cách loại bỏ chúng)

![](../../../../src/Ins_TaiLieuBaoHiem_01_image17.png)

![](../../../../src/Ins_TaiLieuBaoHiem_01_image18.png)

## Tương quan với các phân hệ khác

![](../../../../src/Ins_TaiLieuBaoHiem_01_image19.png)

##  Các thành phần liên quan đến bảo hiểm

### Các thành phần liên quan đến bảo hiểm tổng quát

- Giúp xác định liệu có vấn đề phức tạp nào nằm ở gốc của vấn đề đang
  quan tâm không?

![](../../../../src/Ins_TaiLieuBaoHiem_01_image20.png)

### Các phân hệ liên quan đến bảo hiểm

![](../../../../src/Ins_TaiLieuBaoHiem_01_image21.png)

### Nhân sự

![](../../../../src/Ins_TaiLieuBaoHiem_01_image22.png)

### Chấm công

![](../../../../src/Ins_TaiLieuBaoHiem_01_image23.png)

### Lương

![](../../../../src/Ins_TaiLieuBaoHiem_01_image24.png)

### Bảo Hiểm

![](../../../../src/Ins_TaiLieuBaoHiem_01_image25.png)

### Hệ thống

![](../../../../src/Ins_TaiLieuBaoHiem_01_image26.png)

# Cấu Trúc DataBase

## Không sử dụng bảng : \"~~Ins_InsuranceSalary~~\",\"~~Hre_InsuranceRecord~~\"

## ~~Ins_InsuranceSalary (Remove)~~

## ~~Hre_InsuranceRecord (Remove)~~

## Ins_ProfileInsuranceMonthly

+-----------------------------------------------------------------------------------------------------------------------------------------+
| **Ins_ProfileInsuranceMonthly**                                                                                                         |
|                                                                                                                                         |
| **(Phân Tích Bảo Hiểm)**                                                                                                                |
+:==================+==========================+======================+=========================+=========================================+
| **Tên hiển thị**  | **Tên field**            | **Kiểu dữ liệu**     | **Khoá Ngoại**          | **Diễn giải**                           |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | **ID**                   | **uniqueidentifier** | ** **                   | ** **                                   |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | ProfileID                | uniqueidentifier     | Hre_Profile             |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | *MonthYear*              | DateTime             |                         | Tháng Năm                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SocialInsPlaceID         | uniqueidentifier     | Cat_Province            | Nơi Đóng BH                             |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | IsSocialInsurance        | bit                  |                         | Đóng BHXH                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | IsHealthInsurance        | bit                  |                         | Đóng BHYT                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | IsUnEmpInsurance         | bit                  |                         | Đóng BHTN                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | MoneySocialInsurance     | double               |                         | Tiền BHXH                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | MoneyHealthInsurance     | double               |                         | Tiền BHYT                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | MoneyUnEmpInsurance      | double               |                         | Tiền BHTN                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SalaryInsurance          | float                |                         | Lương BHXH                              |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | Allowance1               | double               |                         | PC1                                     |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | Allowance2               | double               |                         | PC2                                     |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | Allowance3               | double               |                         | PC3                                     |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | Allowance4               | double               |                         | PC4                                     |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | AllowanceAdditional      | double               |                         | Phụ cấp thêm                            |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | AmountChargeIns          | double               |                         | Tổng số tiền                            |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SocialInsEmpRate         | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | HealthInsEmpRate         | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UnemployEmpRate          | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SocialInsComRate         | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | HealthInsComRate         | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UnemployComRate          | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SocialInsEmpAmount       | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | HealthInsEmpAmount       | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UnemployEmpAmount        | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SocialInsComAmount       | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | HealthInsComAmount       | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UnemployComAmount        | double               |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | JobName                  | Nvarchar(200)        |                         | Chức Danh , hoặc tên công việc          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SalaryUnEmpInsurance     | double               |                         | Lương BHTN                              |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SalaryHealthInsurance    | double               |                         | Lương BHTN                              |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | ~~TypeGetData~~          | Nvarchar(100)        |                         | GETTEMP,GETFINAL                        |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | ~~WorkPlaceID~~          | ~~uniqueidentifier~~ | Cat_WorkPlace           | Không dùng field này                    |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | IsDecreaseWorkingDays    | bit                  |                         | Có Nghỉ \>= 14 ngày                     |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | AmountHDTIns             | double               |                         | Tiền HDTJob(Honda)                      |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | HDTGroupCode             | Nvarchar(100)        |                         | Mã HDTJob(Honda)                        |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | IsPregnant               | bit                  |                         | Có Thai Sản                             |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | MonthYearEffect          | DateTime             |                         | Tháng truy lĩnh                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | IsPayback                | Bit                  |                         | Có Điều Chỉnh                           |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | PaybackID                | uniqueidentifier     |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | CostCentreID             | Uniqueidentifier     | Cat_CostCentre          | Hre_WorkHistory.CostCentreID            |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | JobTitleID               | Uniqueidentifier     | Cat_JobTitle            | Hre_WorkHistory.JobTitleID              |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | PositionID               | Uniqueidentifier     | Cat_Position            | Hre_WorkHistory.PositionID              |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SalaryClassID            | Uniqueidentifier     | Cat_SalaryClass         | Hre_WorkHistory.SalaryClassID           |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | PayrollGroupID           | Uniqueidentifier     | Cat_PayrollGroup        | Hre_WorkHistory.PayrollGroupID          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SalGradeID               | Uniqueidentifier     | Cat_GradeCfg            | Dựa vào lịch sử NV                      |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | AttGradeID               | Uniqueidentifier     | Cat_GradeAttendance     | Dựa vào lịch sử NV                      |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | CostActivityID           | Uniqueidentifier     | Cat_CostActivity        | Hre_WorkHistory.CostActivityID          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | EmployeeGroupID          | Uniqueidentifier     | Cat_NameEntity          | Hre_WorkHistory.EmployeeGroupID         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | LaborType                | Nvarchar(200)        |                         | Hre_WorkHistory.LaborType               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | EmployeeTypeID           | uniqueidentifier     | Cat_EmployeeType        | Hre_WorkHistory.EmployeeTypeID          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | IsQuit                   | Bit                  |                         | Có Nghỉ Việc                            |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | TypeHDTIns               | varchar(50)          |                         | Loại HDT                                |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SortID                   | int                  |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | OrgStructureID           | Uniqueidentifier     | Cat_OrgStructure        | Hre_WorkHistory.OrganizationStructureID |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_MoneySocialInsurance   | Varchar(2000)        |                         | Tiền BHXH                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_MoneyUnEmpInsurance    | Varchar(2000)        |                         | Tiền BHTN                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_MoneyHealthInsurance   | Varchar(2000)        |                         | Tiền BHYT                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_SalaryInsurance        | Varchar(2000)        |                         | Lương BHXH                              |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_SocialInsEmpAmount     | Varchar(2000)        |                         | Tiền BHXH NV đóng                       |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_HealthInsEmpAmount     | Varchar(2000)        |                         | Tiền BHYT NV đóng                       |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_UnemployEmpAmount      | Varchar(2000)        |                         | Tiền BHTN NV đóng                       |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_SocialInsComAmount     | Varchar(2000)        |                         | Tiền BHXH cty đóng                      |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_HealthInsComAmount     | Varchar(2000)        |                         | Tiền BHYT cty đóng                      |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_UnemployComAmount      | Varchar(2000)        |                         | Tiền BHTN cty đóng                      |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_SalaryUnEmpInsurance   | Varchar(2000)        |                         | Lương BHTN                              |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_SalaryHealthInsurance  | Varchar(2000)        |                         | Lương BHYT                              |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SalaryRate               | Float                |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UsualAllowanceType1      | uniqueidentifier     |                         | Loại phụ cấp 1                          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UsualAllowanceType2      | uniqueidentifier     |                         | Loại phụ cấp 2                          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UsualAllowanceType3      | uniqueidentifier     |                         | Loại phụ cấp 3                          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UsualAllowanceType4      | uniqueidentifier     |                         | Loại phụ cấp 4                          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | AbilityTileID            | uniqueidentifier     | Cat_AbilityTile         | Cat_AbilityTile.ID                      |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | CompanyID                | uniqueidentifier     | Cat_Company             | Cat_Company.ID                          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | PayrollCategoryID        | uniqueidentifier     | Cat_PayrollCategory     | Cat_PayrollCategory.ID                  |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UnitStructureID          | uniqueidentifier     | Cat_UnitStructure       | Hre_WorkHistory.UnitStructureID         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | Period                   | Int                  |                         | Đợt phân tích                           |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | LeaveDayType             | Varchar(50)          |                         | Các Loại ngày nghỉ trong                |
|                   |                          |                      |                         | cat_LeaveDayType cách nhau bởi dấu phẩy |
|                   |                          |                      |                         | (vd: ABS,LT09091)                       |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | LeaveType14Days          | Varchar(50)          |                         | Loại nghỉ 14 ngày (enum                 |
|                   |                          |                      |                         | LeaveType14Days) , nghỉ ốm, nghỉ không  |
|                   |                          |                      |                         | lương, nghỉ 14 ngày                     |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | RegionID                 | uniqueidentifier     | Cat_Region              | Vùng miền                               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | ContractID               | uniqueidentifier     | Hre_Contract            | Hợp đồng (lấy từ lương BHXH             |
|                   |                          |                      |                         | \[Sal_InsuranceSalary\]                 |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | ContractExtendID         | uniqueidentifier     | Hre_ContractExtend      | Phụ lục hợp đồng (lấy từ lương BHXH     |
|                   |                          |                      |                         | \[Sal_InsuranceSalary\]                 |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | AreaPostJobWorkID        | uniqueidentifier     | Cat_NameEntity          | Vùng làm việc                           |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | Status                   | varchar(50)          |                         | Trạng thái xác nhận: E_CONFIRMED        |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | EmploymentType           | varchar(100)         |                         | Hình thức lao động                      |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | DistributionChannelID    | uniqueidentifier     | Cat_NameEntity          | Kênh phân phối                          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | MarketDomainID           | uniqueidentifier     | Cat_NameEntity          |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | RegionMarketID           | uniqueidentifier     | Cat_NameEntity          | Vùng thị trường                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | MarketAreaID             | uniqueidentifier     | Cat_NameEntity          |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | OriginalDistributorID    | uniqueidentifier     | Cat_NameEntity          |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | OtherDistributors        | varchar(500)         |                         |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | ShopID                   | uniqueidentifier     | Cat_Shop                |                                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | UsualAllowanceGroupID    | uniqueidentifier     | Cat_UsualAllowanceGroup | Nhóm phụ cấp                            |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SalaryPaidByTheFormOf    | Varchar(50)          |                         | Tính lương theo hình thức               |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | CoefficientOfWorkmanship | float                |                         | Hệ số tay nghề                          |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | ReductionType            | Varchar(50)          |                         | Loại giảm 14 ngày                       |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SMCompRate               | float                |                         | ốm đau,TS NSDLĐ đóng (%)                |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | SMCompAmount             | float                |                         | Tiền ốm đau,TS NSDLĐ                    |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | OADCompRate              | float                |                         | TNLĐ,BNN NSDLĐ đóng (%)                 |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | OADCompAmount            | float                |                         | Tiền TNLĐ,BNN NSDLĐ đóng                |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | PSCompRate               | float                |                         | Hưu trí ,Tử tuất NSDLĐ đóng (%)         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | PSCompAmount             | float                |                         | Tiến hưu trí,Tử tuất NSDLĐ đóng         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_SMCompAmount           | Varchar(2000)        |                         | Tiền ốm đau,TS NSDLĐ(mã hóa)            |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_OADCompAmount          | Varchar(2000)        |                         | Tiền TNLĐ,BNN NSDLĐ đóng (mã hóa)       |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_PSCompAmount           | Varchar(2000)        |                         | Tiến hưu trí,Tử tuất NSDLĐ đóng (mã     |
|                   |                          |                      |                         | hóa)                                    |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | TotalSickleaveDays       | int                  |                         | Tổng số ngày nghỉ ốm (trong nghỉ 14     |
|                   |                          |                      |                         | ngày)                                   |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | TotalUnpaidLeaveDays     | int                  |                         | Tổng số ngày nghỉ không lương (trong    |
|                   |                          |                      |                         | nghỉ 14 ngày)                           |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | WorkingDays              | float                |                         | ** **                                   |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | BaseInsuranceSalary      | float                |                         | ** **Lương BHXH gốc                     |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
|                   | E_BaseInsuranceSalary    | Varchar(1000)        |                         |  Lương BHXH gốc                         |
+-------------------+--------------------------+----------------------+-------------------------+-----------------------------------------+
| Qui Tắc:                                                                                                                                |
|                                                                                                                                         |
| - AmountChargeIns =Allowance1+Allowance2+Allowance3+Allowance4+ (*SalaryInsurance+AmountHDTIns*)                                        |
|                                                                                                                                         |
| - TypeHDTIns : enum (E_TYPE4,E_TYPE5)                                                                                                   |
|                                                                                                                                         |
| - LeaveType14Days: enum (LeaveType14Days.E_14_LEAVE, LeaveType14Days.E_14_UNPAID, LeaveType14Days.E_14_SICK)                            |
|                                                                                                                                         |
| - ReductionType : enum (E_QUIT, E_PREGNANT, E_14_SICK, E_14_UNPAID, E_14_LEAVE)                                                         |
+-----------------------------------------------------------------------------------------------------------------------------------------+

##  Sal_InsuranceSalary

+-------------------------------------------------------------------------------------------------------------+
| **Sal_InsuranceSalary**                                                                                     |
|                                                                                                             |
| **(Lương BHXH)**                                                                                            |
+:=================+==========================+==================+=========================+==================+
| **Tên hiển thị** | **Tên field**            | **Kiểu dữ liệu** | **Khoá Ngoại**          | **Diễn giải**    |
+------------------+--------------------------+------------------+-------------------------+------------------+
| #                | ID                       | uniqueidentifier |                         |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
| #                | ProfileID                | uniqueidentifier | Hre_Profile             |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
| #                | DateEffect               | DateTime         |                         | Ngày Hiệu Lực    |
|                  |                          |                  |                         | (bắt buộc)       |
+------------------+--------------------------+------------------+-------------------------+------------------+
| #                | InsuranceAmount          | double           |                         | Số Lương         |
+------------------+--------------------------+------------------+-------------------------+------------------+
| #                | CurrencyID               | uniqueidentifier | Cat_Currency            | Tiền tệ          |
+------------------+--------------------------+------------------+-------------------------+------------------+
| #                | IsSocialIns              | Bit              |                         | Đóng BHXH        |
+------------------+--------------------------+------------------+-------------------------+------------------+
| #                | IsMedicalIns             | Bit              |                         | Đóng BHYT        |
+------------------+--------------------------+------------------+-------------------------+------------------+
| #                | IsUnimploymentIns        | Bit              |                         | Đóng BHTN        |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | DecisionNo               | nvarchar(100)    |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | Note                     | nvarchar(200)    |                         |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | InsuranceRate            | float            |                         |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | Allowance1               | Float            |                         |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | Allowance2               | Float            |                         |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | Allowance3               | Float            |                         |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | Allowance4               | float            |                         |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | RankID                   | uniqueidentifier | Cat_SalaryClass         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | RankDetailID             | uniqueidentifier | Cat_SalaryRank          | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | E_InsuranceAmount        | varchar(2000)    |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | OrgStructureID           | uniqueidentifier | Cat_OrgStructure        |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | PositionID               | uniqueidentifier | Cat_Position            |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | JobTitleID               | uniqueidentifier | Cat_JobTitle            |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | EmployeeTypeID           | uniqueidentifier | Cat_EmployeeType        |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | PayrollGroupID           | uniqueidentifier | Cat_PayrollGroup        |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | CostCentreID             | uniqueidentifier | Cat_CostCentre          |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | WorkPlaceID              | uniqueidentifier | Cat_WorkPlace           |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | SalaryClassID            | uniqueidentifier | Cat_SalaryClass         |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | EmployeeGroupID          | uniqueidentifier | Cat_NameEntity          |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | CostActivityID           | uniqueidentifier | Cat_CostActivity        |                  |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | LaborType                | nvarchar(100)    |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | AbilityTileID            | uniqueidentifier | Cat_AbilityTile         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | CompanyID                | uniqueidentifier | Cat_Company             | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | PayrollCategoryID        | uniqueidentifier | Cat_PayrollCategory     | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | UnitStructureID          | uniqueidentifier | Cat_UnitStructure       | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | ContractID               | uniqueidentifier | Hre_Contract            | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | ContractExtendID         | uniqueidentifier | Hre_ContractExtend      | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | AreaPostJobWorkID        | uniqueidentifier | Cat_NameEntity          | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | AllowanceID1             | uniqueidentifier | Cat_UsualAllowance      | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | AllowanceID2             | uniqueidentifier | Cat_UsualAllowance      | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | AllowanceID3             | uniqueidentifier | Cat_UsualAllowance      | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | AllowanceID4             | uniqueidentifier | Cat_UsualAllowance      | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | CurrencyID1              | uniqueidentifier | Cat_Currency            | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | CurrencyID2              | uniqueidentifier | Cat_Currency            | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | CurrencyID3              | uniqueidentifier | Cat_Currency            | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | CurrencyID4              | uniqueidentifier | Cat_Currency            | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | E_Allowance1             | varchar(2000)    |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | E_Allowance2             | varchar(2000)    |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | E_Allowance3             | varchar(2000)    |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | E_Allowance4             | varchar(2000)    |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | EmploymentType           | varchar(100)     |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | DistributionChannelID    | uniqueidentifier | Cat_NameEntity          | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | MarketDomainID           | uniqueidentifier | Cat_NameEntity          | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | RegionMarketID           | uniqueidentifier | Cat_NameEntity          | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | MarketAreaID             | uniqueidentifier | Cat_NameEntity          | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | OriginalDistributorID    | uniqueidentifier | Cat_NameEntity          | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | OtherDistributors        | nvarchar(1000)   |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | ShopID                   | uniqueidentifier | Cat_Shop                | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | UsualAllowanceGroupID    | uniqueidentifier | Cat_UsualAllowanceGroup | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | SalaryPaidByTheFormOf    | varchar(50)      |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | CoefficientOfWorkmanship | float            |                         | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+
|                  | IsPayback                | bit              | ** **                   | ** **            |
+------------------+--------------------------+------------------+-------------------------+------------------+

##  Ins_InsuranceRecord

+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| **Ins_InsuranceRecord**                                                                                                                             |
+:===========================+=================================+============================+============================+============================+
| **Tên hiển thị**           | **Tên field**                   | **Kiểu dữ liệu**           | **Khoá Ngoại**             | **Diễn giải**              |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ID                              | uniqueidentifier           | ** **                      | ** **                      |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ProfileID                       | uniqueidentifier           | Hre_Profile                |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | InsuranceType                   | Nvarchar(50)               |                            | Enum (Loại Chứng Từ)       |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | RecordDate                      | DateTime                   |                            | Ngày nhận Chứng Từ         |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DateStart                       | DateTime                   |                            | Bắt Đầu chứng từ           |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DateEnd                         | DateTime                   |                            | Kết Thúc chứng từ          |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DateSuckle                      | DateTime                   |                            | Ngày Sinh Con              |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | TypeSuckle                      | Nvarchar(50)               |                            | Enum (Loại Sinh Con)       |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | TypeSick                        | Nvarchar(50)               |                            | Loại Bệnh                  |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DateStartWorking                | DateTime                   |                            | Ngày đi làm lại            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DayCount                        | double                     |                            | Số ngày nghỉ               |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DayCountOld                     | double                     |                            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | LeaveInYear                     | double                     |                            | Lũy kế từ đầu năm          |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | Status                          | Nvarchar(50)               |                            | Trạng thái                 |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | Comment                         | Nvarchar(1000)             |                            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | RelativesID                     | uniqueidentifier           | Hre_Relatives              | Người thân                 |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ChildSickID                     | uniqueidentifier           | Ins_ChildSick              |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | TypeData                        | Nvarchar(100)              |                            | Nơi dưỡng sức              |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | FileAttachment                  | nvarchar(2000)             |                            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | IsPaymented                     | bit                        |                            | Thanh toán                 |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
| ** **                      | **SortID**                      | **int**                    | ** **                      | ** **                      |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | Amount                          | Float                      |                            | Số tiền (C70A Chuyển qua)  |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | TreatmentLine                   | Nvarchar(200)              |                            | Tuyến điều trị             |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | InsRecordCode                   | Nvarchar(100)              |                            | Mã chứng từ                |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | OrgStructureID                  | uniqueidentifier           | Cat_OrgStructure           |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | PositionID                      | uniqueidentifier           | Cat_Position               |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | JobTitleID                      | uniqueidentifier           | Cat_JobTitle               |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | EmployeeTypeID                  | uniqueidentifier           | Cat_EmployeeType           |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | PayrollGroupID                  | uniqueidentifier           | Cat_PayrollGroup           |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | CostCentreID                    | uniqueidentifier           | Cat_CostCentre             |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | WorkPlaceID                     | uniqueidentifier           | Cat_WorkPlace              |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | SalaryClassID                   | uniqueidentifier           | Cat_SalaryClass            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | EmployeeGroupID                 | uniqueidentifier           | Cat_NameEntity             |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | CostActivityID                  | uniqueidentifier           | Cat_CostActivity           |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | LaborType                       | Nvarchar(100)              |                            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | AbilityTileID                   | uniqueidentifier           | Cat_AbilityTile            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | CompanyID                       | uniqueidentifier           | Cat_Company                |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | PayrollCategoryID               | uniqueidentifier           | Cat_PayrollCategory        |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | UnitStructureID                 | uniqueidentifier           | Cat_UnitStructure          |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DateSettlement                  | Datetime                   |                            | Ngày đề nghị               |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DateDelivery                    | Datetime                   |                            | Ngày BH trả kết quả        |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DatePayment                     | Datetime                   |                            | Ngày thanh toán            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | Settlement                      | int                        |                            | Lần đề nghị                |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | MonthYearSettlement             | Datetime                   |                            | Tháng đề nghị              |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | InsuranceStatus                 | Nvarchar (100)             |                            | Tình trạng C70A            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | InsuranceTime                   | DateTime                   |                            | Thời điểm                  |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | EmploymentType                  | varchar(100)               |                            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DistributionChannelID           | uniqueidentifier           | Cat_NameEntity             |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | MarketDomainID                  | uniqueidentifier           | Cat_NameEntity             |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | RegionMarketID                  | uniqueidentifier           | Cat_NameEntity             |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | MarketAreaID                    | uniqueidentifier           | Cat_NameEntity             |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | OriginalDistributorID           | uniqueidentifier           | Cat_NameEntity             |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | OtherDistributors               | nvarchar(1000)             |                            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ShopID                          | uniqueidentifier           | Cat_Shop                   |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
| ** **                      | SickID                          | uniqueidentifier           | Cat_Sick                   | ** **                      |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | TreatmentLineID                 | uniqueidentifier           | Cat_NameEntity             |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | UsualAllowanceGroupID           | uniqueidentifier           | Cat_UsualAllowanceGroup    |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | SalaryPaidByTheFormOf           | Varchar(50)                |                            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | CoefficientOfWorkmanship        | float                      |                            |                            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | IDNoOfWife                      | Nvarchar(50)               |                            | CMND/TCC của vợ            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | SeriNo                          | Nvarchar(50)               |                            | Số seri                    |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | FoetusAge                       | int                        |                            | Tuổi thai                  |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DocumentLink                    | Nvarchar(500)              |                            | Đường dẫn tài liệu         |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | BaseInsurancePayment            | float                      |                            | Lương thánh toán bảo hiểm  |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | WorkingCondition                | Nvarchar(100)              | ** **                      |  ĐIều kiện làm việc        |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | WeeklyDayOff                    | Nvarchar(200)              | ** **                      |  Ngày nghỉ hàng tuần       |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | IsMaternityLeave                | bit                        | ** **                      |  Nghỉ dưỡng thai           |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | AdditionalSettlement            | int                        | ** **                      |  Lần bổ sung               |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | AdditionalMonthYearSettlement   | date                       | ** **                      |  Tháng bổ sung             |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | PaymentMethod                   | Nvarchar(100)              | ** **                      |  Hình thức nhận            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | NumberOfChildSick               | int                        | ** **                      |  Số con ốm                 |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | AntenatalCareCondition          | nvarchar(100)              | ** **                      |  Điều kiện khám thai       |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ChildbirthCondition             | nvarchar(100)              | ** **                      |  Điều kiện sinh con        |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ChildrenNumber                  | int                        | ** **                      |  Số con                    |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ChildLostDate                   | datetime                   | ** **                      |  Ngày con chết             |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | NumberOfLostChild               | int                        | ** **                      |  Số con chết               |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | AdoptionDate                    | date                       | ** **                      |  Ngày nhận nuôi con        |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | SurrogacyAdoptionDate           | date                       | ** **                      |  Ngày nhận con (Mang thai  |
|                            |                                 |                            |                            | hộ)                        |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | MotherSocialInsuranceNumer      | Nvarchar(200)              | ** **                      |  Mã số BHXH của mẹ         |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | MotherHealthInsuranceCardNumber | Nvarchar(200)              | ** **                      |  Số thẻ BHYT của mẹ        |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | MotherIDNumber                  | Nvarchar(200)              | ** **                      |  Số CMND của mẹ            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | SurrogacyType                   | Nvarchar(200)              | ** **                      |  Mang thai hộ              |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | IsSurgeryOrUnder32Weeks         | bit                        | ** **                      |  Phẫu thuật hoặc thai dưới |
|                            |                                 |                            |                            | 32 tuần                    |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | MotherLostDate                  | date                       | ** **                      |  Ngày mẹ chết              |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ConclusionDate                  | date                       | ** **                      |  Ngày kết luận mẹ không đủ |
|                            |                                 |                            |                            | điều kiện chăm con         |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | MedicalExaminationFees          | float                      | ** **                      |  Phí giám định y khoa      |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | NurturerSocialInsuranceNumer    | Nvarchar(200)              | ** **                      |  Mã số BHXH của người nuôi |
|                            |                                 |                            |                            | dưỡng                      |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | IsFatherTakeCareOfChild         | bit                        | ** **                      |  Cha nghỉ chăm con         |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | AdjustmentReason                | Nvarchar(1000)             | ** **                      |  Lý do đề nghị điều chỉnh  |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | HealthDeclineRate               | float                      | ** **                      |  Tỉ lệ suy giảm            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DiagnosticDate                  | date                       | ** **                      |  Ngày giám định            |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | AccountNumber                   | Nvarchar(200)              | ** **                      |  Số tài khoản              |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | BankID                          | uniqueidentifier           | ** **                      |  Ngân hàng                 |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | BranchID                        | uniqueidentifier           | ** **                      |  Chi nhánh                 |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | IDNo                            | Nvarchar(100)              | ** **                      |  Số CMND/CCCD              |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | InsuranceCode                   | Nvarchar(100)              | ** **                      |  Mã số BHXH                |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ChildHealthInsNo                | Nvarchar(100)              | ** **                      |  Số thẻ BHYT của con       |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | SickName                        | Nvarchar(200)              | ** **                      |  Bệnh                      |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ChildInsuranceCode              | Nvarchar(100)              | ** **                      |  Mã số BHXH của con        |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
| [~~ ~~]{.mark}             | [~~ChildDateOfBirth~~]{.mark}   | [~~date~~]{.mark}          | **[~~ ~~]{.mark}**         | **[~~ ~~]{.mark}**         |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
| [~~ ~~]{.mark}             | [~~ChillDateOfBirth~~]{.mark}   | [~~date~~]{.mark}          | **[~~ ~~]{.mark}**         | **[~~ ~~]{.mark}**         |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | RejectReason                    | Nvarchar(1000)             | ** **                      | ** **Lý do từ chối         |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DocumentStatus                  | varchar(32)                | ** **                      | ** **Trạng thái chứng từ   |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | UserSubmit                      | uniqueidentifier           | Hre_Profile                |  Người đăng ký             |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | DatePregnancy                   | date                       | ** **                      | ** **Ngày mang thai        |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
|                            | ActualAmount                    | float                      | ** **                      | ** **Số tiền BHXH thanh    |
|                            |                                 |                            |                            | toán                       |
+----------------------------+---------------------------------+----------------------------+----------------------------+----------------------------+
| **InsuranceType**: [E_SICK_SHORT]{.mark}, [E_SICK_LONG]{.mark},                                                                                     |
| [E_SICK_CHILD]{.mark},[E_PREGNANCY_EXAMINE]{.mark},[E_PREGNANCY_LOSTE_PREGNANCY_SUCKLE]{.mark},[E_PREGNANCY_PREVENTION]{.mark}                      |
| ,[E_RESTORATION_PREGNANCY]{.mark} ,.... Tham khảo thêm trong file excel dưới đây:                                                                   |
|                                                                                                                                                     |
| ![](../../../../src/Ins_TaiLieuBaoHiem_01_image27.emf)                                                                                                                            |
|                                                                                                                                                     |
| **TypeSuckle (loại sinh con**): [E_SUCKLE_USUALLY]{.mark} (sinh thường), [E_SUCKLE_SURGERY]{.mark}(sinh mổ),[E_SUCKLE_TWINS]{.mark}(sinh đôi)       |
|                                                                                                                                                     |
| **DocumentStatus (Trạng thái chứng từ, dùng trong dự án AVN**):                                                                                     |
|                                                                                                                                                     |
| E_ATTACHFILEVALID (\"HS Đính kèm hợp lệ\")                                                                                                          |
|                                                                                                                                                     |
| E_ATTACHFILEINVALID (\"HS Đính kèm không hợp lệ\")                                                                                                  |
|                                                                                                                                                     |
| E_ORIGINFILEVALID (\"HS gốc hợp lệ\")                                                                                                               |
|                                                                                                                                                     |
| E_ORIGINFILEINVALID (\"HS gốc không hợp lệ\")                                                                                                       |
|                                                                                                                                                     |
| E_TEMPSAVE (\"Lưu tạm\")                                                                                                                            |
|                                                                                                                                                     |
| E_WAITINGCONFIRM (\"Chờ xác nhận\")                                                                                                                 |
|                                                                                                                                                     |
| **Status (Trạng thái**):                                                                                                                            |
|                                                                                                                                                     |
| E_CONFIRM (\"Xác nhận\")                                                                                                                            |
|                                                                                                                                                     |
| E_REJECT (\"Từ chối\")                                                                                                                              |
|                                                                                                                                                     |
| **PaymentStatus (Trang thái thanh toán, sử dụng enum PaymentStatusV2):**                                                                            |
|                                                                                                                                                     |
| E_Paid (\"Đã thanh toán\")                                                                                                                          |
|                                                                                                                                                     |
| E_Unpaid (\"Chưa thanh toán\")                                                                                                                      |
|                                                                                                                                                     |
| E_NoPaid (\"Không thanh toán\")                                                                                                                     |
+-----------------------------------------------------------------------------------------------------------------------------------------------------+

##  Ins_ReportD02

+------------------------------------------------------------------------------------------------------------------+
| **Ins_ReportD02**                                                                                                |
+:==================+======================+======================+============================+===================+
| **Tên hiển thị**  | **Tên field**        | **Kiểu dữ liệu**     | **Khoá Ngoại**             | **Diễn giải**     |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | ID                   | uniqueidentifier     | ** **                      | ** **             |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | ReportD02Name        | Nvarchar(100)        |                            | "Kỳ Tạm Thời -    |
|                   |                      |                      |                            | 05/2016"          |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | DateReport           | DateTime             |                            | Ngày lập báo cáo  |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | DateMonth            | DateTime             |                            | Tháng kiểm tra    |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | DateStart            | DateTime             |                            | 16 tháng \[N-1\]  |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | DateEnd              | DateTime             |                            | 15 tháng \[N\]    |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | SociaInsCountPro     | Int                  |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | SociaInsTotalSalary  | double               |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | HealthInsCountPro    | Int                  |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | HealthInsTotalSalary | double               |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | UnEmpInsCountPro     | Int                  |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | UnEmpInsTotalSalary  | double               |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | MaxSalary            | double               |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | MinSalary            | double               |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | DateOfEffectMax      | DateTime             |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | DateOfEffectMin      | DateTime             |                            |                   |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
|                   | Type                 | Nvarchar(50)         |                            | GETTEMP           |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
| ** **             | ~~PayBackID~~        | ~~uniqueidentifier~~ | ~~InsuranceSalaryPayback~~ | Không sử dụng     |
|                   |                      |                      |                            | field này         |
+-------------------+----------------------+----------------------+----------------------------+-------------------+
| Note: ReportD02Name là "Kỳ Tạm Thời" + DateMonth                                                                 |
+------------------------------------------------------------------------------------------------------------------+

##  Ins_ReportD02Item

+-------------------------------------------------------------------------------------------------------------------+
| **Ins_ReportD02Item**                                                                                             |
+===================+==========================+===================+============================+:==================+
| **Tên hiển thị**  | **Tên field**            | **Kiểu dữ liệu**  | **Khoá Ngoại**             | **Diễn giải**     |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | ID                       | uniqueidentifier  | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | ReportD02ID              | uniqueidentifier  | Ins_ReportD02              |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | ProfileID                | uniqueidentifier  | Hre_Profile                |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OldBasicSalary           | Double            |                            | Lương Tháng Trước |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | NewBasicSalary           | Double            |                            | Lương BHXH Và Phụ |
|                   |                          |                   |                            | Cấp               |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | RateSocialIns            | Double            |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | RateHealthIns            | Double            |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | RateUnEmpIns             | Double            |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | NotCardHealth            | Bit               |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | Status                   | Nvarchar(100)     |                            | E_TANG_LD,...     |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | Type                     | Nvarchar(100)     |                            | E_TANG,E_GIAM...  |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | MonthFrom                | DateTime          |                            | 16 Tháng \[N-1\]  |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | MonthTo                  | DateTime          |                            | 15 Tháng \[N\]    |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | MonthConvertRecord       | DateTime          |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | ItemOrder                | Int               |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | Comment                  | Nvarchar(1000)    |                            | Mô tả trạng thái  |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | IsUserCreate             | Bit               | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | JobName                  | Nvarchar(200)     |                            | Tên Công Việc     |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | Allowance1               | Double            |                            | PC1 trong lương   |
|                   |                          |                   |                            | CB                |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | Allowance2               | Double            |                            | PC2 trong lương   |
|                   |                          |                   |                            | CB                |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | Allowance3               | Double            |                            | PC3 trong lương   |
|                   |                          |                   |                            | CB                |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | AllowanceAdditional      | Double            |                            | PC4 trong lương   |
|                   |                          |                   |                            | CB                |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | WorkPlaceID              | uniqueidentifier  | Cat_WorkPlace              | Nơi làm việc      |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | SocialInsPlaceID         | uniqueidentifier  | Cat_Province               | Nơi Đóng BH       |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | IsPayBack                | Bit               |                            | Có Điều Chỉnh     |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | PayBackID                | uniqueidentifier  | Ins_InsuranceSalaryPayback | Điều Chỉnh BH     |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
| ** **             | **SortID**               | **int**           | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | E_OldBasicSalary         | Varchar(2000)     | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | E_NewBasicSalary         | Varchar(2000)     | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | DateStart                | DateTime          |                            | Từ ngày (IBHXH)   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | DateEnd                  | DateTime          |                            | Đến ngày (HĐ)     |
|                   |                          |                   |                            | (IBHXH)           |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | DecisionNo               | Nvarchar (100)    |                            | Số HĐ, mã PLHĐ    |
|                   |                          |                   |                            | (IBHXH)           |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | DecisionType             | Nvarchar (1000)   |                            | Loại HĐ hoặc loại |
|                   |                          |                   |                            | phụ lục HĐ(IBHXH) |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | DecisionDatesigned       | DateTime          |                            | Ngày ký HĐ hoặc   |
|                   |                          |                   |                            | ngày ký phụ lục   |
|                   |                          |                   |                            | HĐ(IBHXH)         |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | InsuranceSalary          | Double            |                            | Lương BHXH gốc    |
|                   |                          |                   |                            | (chưa cắt mức     |
|                   |                          |                   |                            | trần)             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | Allowance4               | Double            | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | LeaveDayType             | Varchar(50)       | ** **                      | DS Loại ngày nghỉ |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OldAllowance1            | Double            | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OldAllowance2            | Double            |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OldAllowance3            | Double            |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OldAllowance4            | Double            |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OldAllowanceAdditional   | Double            |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | RegionID                 | uniqueidentifier  | Cat_Region                 | Vùng miền         |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | EmploymentType           | Varchar (100)     |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | DistributionChannelID    | Uniqueidentifier  | Cat_NameEntity             |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | MarketDomainID           | Uniqueidentifier  | Cat_NameEntity             |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | RegionMarketID           | Uniqueidentifier  | Cat_NameEntity             |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | MarketAreaID             | Uniqueidentifier  | Cat_NameEntity             |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OriginalDistributorID    | Uniqueidentifier  | Cat_NameEntity             |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OtherDistributors        | Nvarchar (1000)   |                            |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | OrgStructureID           | Uniqueidentifier  | Cat_OrgStructure           | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | PositionID               | Uniqueidentifier  | Cat_Position               | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | JobTitleID               | Uniqueidentifier  | Cat_JobTitle               | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | EmployeeTypeID           | Uniqueidentifier  | Cat_EmployeeType           | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | PayrollGroupID           | Uniqueidentifier  | Cat_PayrollGroup           | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | CostCentreID             | Uniqueidentifier  | Cat_CostCentre             | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | SalaryClassID            | Uniqueidentifier  | Cat_SalaryClass            | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | EmployeeGroupID          | Uniqueidentifier  | Cat_NameEntity             | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | CostActivityID           | Uniqueidentifier  | Cat_CostActivity           | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | AbilityTileID            | Uniqueidentifier  |                            | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | CompanyID                | Uniqueidentifier  | Cat_Company                | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | PayrollCategoryID        | Uniqueidentifier  | Cat_PayrollCategory        | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | UnitStructureID          | Uniqueidentifier  | Cat_UnitStructure          | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | LaborType                | Uniqueidentifier  |                            | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | ShopID                   | uniqueidentifier  | Cat_Shop                   |                   |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | UsualAllowanceGroupID    | Uniqueidentifier  | Cat_UsualAllowanceGroup    | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | SalaryPaidByTheFormOf    | Varchar (50)      |                            | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | CoefficientOfWorkmanship | float             |                            | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | SubmitDate               | DateTime          |                            | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | IsSubmitted              | Bit               | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | InsuranceAmount          | float             | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | DateStartHarmful         | DateTime          | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | DateEndHarmful           | DateTime          | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                   | InsAmountNotAllowance    | float             | ** **                      | ** **             |
+-------------------+--------------------------+-------------------+----------------------------+-------------------+
|                                                                                                                   |
+-------------------------------------------------------------------------------------------------------------------+

## Ins_ReportD02V2 (D02 nhiều đợt)

+------------------------------------------------------------------------------------------------------+
| **Ins_ReportD02V2**                                                                                  |
|                                                                                                      |
| **(D02 Nhiều Đợt)**                                                                                  |
+:==================+======================+===================+===================+===================+
| **Tên hiển thị**  | **Tên field**        | **Kiểu dữ liệu**  | **Khoá Ngoại**    | **Diễn giải**     |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | ID                   | uniqueidentifier  |                   |                   |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | ReportD02Name        | Nvarchar(100)     | ** **             | "Kỳ 1 - 05/2016"  |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | DateReport           | DateTime          |                   | Ngày lập báo cáo  |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | DateMonth            | DateTime          |                   | Tháng kiểm tra    |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | DateStart            | DateTime          | ** **             | 16 tháng \[N-1\]  |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | DateEnd              | DateTime          |                   | 15 tháng \[N\]    |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | SociaInsCountPro     | Int               |                   | Tổng NV đóng BHXH |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | SociaInsTotalSalary  | double            | ** **             | Tổng Lương NV     |
|                   |                      |                   |                   | (BHXH)            |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | HealthInsCountPro    | Int               |                   | Tổng NV đóng BHYT |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | HealthInsTotalSalary | double            |                   | Tổng Lương NV     |
|                   |                      |                   |                   | (BHYT)            |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | UnEmpInsCountPro     | Int               | ** **             | Tổng NV đóng BHTN |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | UnEmpInsTotalSalary  | double            |                   | Tổng Lương NV     |
|                   |                      |                   |                   | (BHTN)            |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | MaxSalary            | double            |                   | Lương lớn nhất    |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | MinSalary            | double            | ** **             | Lương thấp nhất   |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | DateOfEffectMax      | DateTime          |                   |                   |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | DateOfEffectMin      | DateTime          |                   |                   |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | Type                 | Nvarchar(50)      | ** **             | GETTEMP           |
+-------------------+----------------------+-------------------+-------------------+-------------------+
|                   | Perior               | int               |                   | 1 đến 10 (kỳ)     |
+-------------------+----------------------+-------------------+-------------------+-------------------+
| Note: ReportD02Name là "Kỳ Tạm Thời" + DateMonth                                                     |
+------------------------------------------------------------------------------------------------------+

## Ins_ReportD02ItemV2 (D02 nhiều đợt)

+----------------------------------------------------------------------------------------------------------------+
| **Ins_ReportD02ItemV2**                                                                                        |
|                                                                                                                |
| **(D02 Nhiều Đợt)**                                                                                            |
+:=================+==========================+==================+============================+:=================+
| **Tên hiển thị** | **Tên field**            | **Kiểu dữ liệu** | **Khoá Ngoại**             | **Diễn giải**    |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | ID                       | uniqueidentifier |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | ReportD02ID              | uniqueidentifier | Ins_ReportD02V2            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | ProfileID                | uniqueidentifier | Hre_Profile                |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OldBasicSalary           | Double           |                            | Lương Tháng      |
|                  |                          |                  |                            | Trước            |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | NewBasicSalary           | Double           |                            | Lương BHXH Và    |
|                  |                          |                  |                            | Phụ Cấp          |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | RateSocialIns            | Double           |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | RateHealthIns            | Double           |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | RateUnEmpIns             | Double           |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | NotCardHealth            | Bit              |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | Status                   | Nvarchar(100)    |                            | E_TANG_LD,...    |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | Type                     | Nvarchar(100)    |                            | E_TANG,E_GIAM... |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | MonthFrom                | DateTime         |                            | 16 Tháng \[N-1\] |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | MonthTo                  | DateTime         |                            | 110 Tháng \[N\]  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | MonthConvertRecord       | DateTime         |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | ItemOrder                | Int              |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | Comment                  | Nvarchar(1000)   |                            | Mô tả trạng thái |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | IsUserCreate             | Bit              |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | JobName                  | Nvarchar(400)    |                            | Tên Công Việc    |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | Allowance1               | Double           |                            | PC1 trong lương  |
|                  |                          |                  |                            | CB               |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | Allowance2               | Double           |                            | PC2 trong lương  |
|                  |                          |                  |                            | CB               |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | Allowance3               | Double           |                            | PC3 trong lương  |
|                  |                          |                  |                            | CB               |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | AllowanceAdditional      | Double           |                            | PC4 trong lương  |
|                  |                          |                  |                            | CB               |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | SocialInsPlaceID         | uniqueidentifier | Cat_Province               | Nơi Đóng BH      |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | IsPayBack                | Bit              |                            | Có Điều Chỉnh    |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | PayBackID                | uniqueidentifier | Ins_InsuranceSalaryPayback | Điều Chỉnh BH    |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | DateStart                | DateTime         |                            | Từ ngày (IBHXH)  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | DateEnd                  | DateTime         |                            | Đến ngày (HĐ)    |
|                  |                          |                  |                            | (IBHXH)          |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | DecisionNo               | Nvarchar (100)   |                            | Số HĐ, mã PLHĐ   |
|                  |                          |                  |                            | (IBHXH)          |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | DecisionType             | Nvarchar (1000)  |                            | Loại HĐ hoặc     |
|                  |                          |                  |                            | loại phụ lục     |
|                  |                          |                  |                            | HĐ(IBHXH)        |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | DecisionDatesigned       | DateTime         |                            | Ngày ký HĐ hoặc  |
|                  |                          |                  |                            | ngày ký phụ lục  |
|                  |                          |                  |                            | HĐ(IBHXH)        |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | InsuranceSalary          | Double           |                            | Lương BHXH gốc   |
|                  |                          |                  |                            | (chưa cắt mức    |
|                  |                          |                  |                            | trần)            |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | E_OldBasicSalary         | Varchar(2000)    |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | E_NewBasicSalary         | Varchar(2000)    |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | Allowance4               | Double           | ** **                      | ** **            |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | LeaveDayType             | Varchar(50)      |                            | Loại ngày nghỉ   |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OldAllowance1            | Double           | ** **                      | ** **            |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OldAllowance2            | Double           |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OldAllowance3            | Double           |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OldAllowance4            | Double           |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OldAllowanceAdditional   | Double           |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | RegionID                 | uniqueidentifier | Cat_Region                 | Vùng miền        |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | EmploymentType           | Varchar (100)    |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | DistributionChannelID    | Uniqueidentifier | Cat_NameEntity             |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | MarketDomainID           | Uniqueidentifier | Cat_NameEntity             |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | RegionMarketID           | Uniqueidentifier | Cat_NameEntity             |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | MarketAreaID             | Uniqueidentifier | Cat_NameEntity             |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OriginalDistributorID    | Uniqueidentifier | Cat_NameEntity             |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OtherDistributors        | Nvarchar (1000)  |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | OrgStructureID           | Uniqueidentifier | Cat_OrgStructure           |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | PositionID               | Uniqueidentifier | Cat_Position               |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | JobTitleID               | Uniqueidentifier | Cat_JobTitle               |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | EmployeeTypeID           | Uniqueidentifier | Cat_EmployeeType           |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | PayrollGroupID           | Uniqueidentifier | Cat_PayrollGroup           |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | CostCentreID             | Uniqueidentifier | Cat_CostCentre             |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | SalaryClassID            | Uniqueidentifier | Cat_SalaryClass            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | EmployeeGroupID          | Uniqueidentifier | Cat_NameEntity             |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | CostActivityID           | Uniqueidentifier | Cat_CostActivity           |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | AbilityTileID            | Uniqueidentifier |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | CompanyID                | Uniqueidentifier | Cat_Company                |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | PayrollCategoryID        | Uniqueidentifier | Cat_PayrollCategory        |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | UnitStructureID          | Uniqueidentifier | Cat_UnitStructure          |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | LaborType                | Uniqueidentifier |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | ShopID                   | uniqueidentifier | Cat_Shop                   |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | UsualAllowanceGroupID    | Uniqueidentifier | Cat_UsualAllowanceGroup    |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | SalaryPaidByTheFormOf    | Varchar (50)     |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | CoefficientOfWorkmanship | float            |                            |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | SubmitDate               | DateTime         | ** **                      |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | IsSubmitted              | Bit              | ** **                      |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | InsuranceAmount          | float            | ** **                      |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | DateStartHarmful         | DateTime         | ** **                      |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
|                  | DateEndHarmful           | DateTime         | ** **                      |                  |
+------------------+--------------------------+------------------+----------------------------+------------------+
| - LeaveDayType: loại ngày nghỉ cách nhau dấu ","                                                               |
+----------------------------------------------------------------------------------------------------------------+

## Ins_InsuranceSalaryPayback

+----------------------------------------------------------------------------------------------------------+
| **Ins_InsuranceSalaryPayback**                                                                           |
|                                                                                                          |
| **(Điều Chỉnh Bảo Hiểm)**                                                                                |
+:=================+====================+==================+============================+==================+
| **Tên hiển thị** | **Tên field**      | **Kiểu dữ liệu** | **Khoá Ngoại**             | **Diễn giải**    |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | ID                 | uniqueidentifier |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | ProfileID          | uniqueidentifier | Hre_Profile                |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | MonthYear          | DateTime         |                            | Tháng chọn       |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | FromMonthEffect    | DateTime         |                            | Tháng Điều Chỉnh |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | ToMonthEffect      | DateTime         |                            | Tháng Điều Chỉnh |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | InsSalary          | Double           |                            | Lương BH đã đóng |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | InsSalaryPayBack   | Double           |                            | Lương BH Điều    |
|                  |                    |                  |                            | Chỉnh            |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | InsSalaryAdjust    | Double           |                            | Lương chênh lệch |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | AmoutHDTIns        | Double           |                            | Tiền HDTJob      |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | AmoutHDTInsPayBack | Double           |                            | Tiền HDTJob Điều |
|                  |                    |                  |                            | Chỉnh            |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | JobtitleName       | Nvarchar(1500)   |                            | Tên công việc    |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | IsSocialIns        | Bit              |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | IsMedicalIns       | Bit              |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | IsUnemploymentIns  | Bit              |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | SocialInsEmpRate   | double           |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | HealthInsEmpRate   | double           |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | UnemployEmpRate    | double           |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | SocialInsComRate   | double           |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | HealthInsComRate   | double           |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | UnemployComRate    | double           |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | Note               | Nvarchar(40000)  |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | TypeID             | uniqueidentifier | Ins_TypeD02                | Trạng thái       |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | Comment            | Nvarchar(3000)   |                            |                  |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | IsCallPayBack      | Bit              |                            | Có điều chỉnh    |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | SocialInsPlaceID   | uniqueidentifier | Cat_Province               | Nơi đóng BH      |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | CommentReduce      | VARCHAR(50)      |                            | ** **            |
+------------------+--------------------+------------------+----------------------------+------------------+
|                  | PaybackID          | uniqueidentifier | Ins_InsuranceSalaryPayback | ** **            |
+------------------+--------------------+------------------+----------------------------+------------------+
|                                                                                                          |
+----------------------------------------------------------------------------------------------------------+

## Ins_TypeD02

+----------------------------------------------------------------------------------------------+
| **Ins_TypeD02**                                                                              |
|                                                                                              |
| **Trạng Thái D02**                                                                           |
+:=================+==================+==================+==================+==================+
| **Tên hiển thị** | **Tên field**    | **Kiểu dữ liệu** | **Khoá Ngoại**   | **Diễn giải**    |
+------------------+------------------+------------------+------------------+------------------+
|                  | ID               | uniqueidentifier |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | TypeCode         | Nvarchar(3000)   |                  | E_TANG           |
+------------------+------------------+------------------+------------------+------------------+
|                  | TypeName         | Nvarchar(8000)   |                  | Tăng             |
+------------------+------------------+------------------+------------------+------------------+
|                  | StatusCode       | Nvarchar(3000)   |                  | E_TANG_LD        |
+------------------+------------------+------------------+------------------+------------------+
|                  | StatusName       | Nvarchar(8000)   |                  | Tăng Lao Động    |
+------------------+------------------+------------------+------------------+------------------+
|                  | Comment          | Nvarchar(8000)   |                  | Tăng Lao Động    |
+------------------+------------------+------------------+------------------+------------------+
|                  | Note             | Nvarchar(8000)   |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | CommentCode      | Nvarchar(150)    |                  | E_TANG_LD        |
+------------------+------------------+------------------+------------------+------------------+
|                  | DisplayCode      | Nvarchar(50)     |                  | Mã Phương án     |
+------------------+------------------+------------------+------------------+------------------+
|                  | DisplayName      | Nvarchar(100)    |                  | Tên phương án    |
+------------------+------------------+------------------+------------------+------------------+
|                  | IsNotPayback     | Bit              |                  | Không tính       |
|                  |                  |                  |                  | payback          |
+------------------+------------------+------------------+------------------+------------------+
|                  | IsD02Ins         | Bit              |                  | D02              |
+------------------+------------------+------------------+------------------+------------------+
|                  | IsIIns           | Bit              |                  | I - BHXH         |
+------------------+------------------+------------------+------------------+------------------+
|                  | IsVIns           | Bit              |                  | Viettel - BHXH   |
+------------------+------------------+------------------+------------------+------------------+
|                  | IsVNPTIns        | Bit              |                  | VNPT - BHXH      |
+------------------+------------------+------------------+------------------+------------------+
|                  | IsEIns           | bit              | ** **            | ** **            |
+------------------+------------------+------------------+------------------+------------------+
|                                                                                              |
+----------------------------------------------------------------------------------------------+

##  Cat_ValueEntity

+----------------------------------------------------------------------------------------------+
| **Cat_ValueEntity**                                                                          |
|                                                                                              |
| **Mức Trần BHXH / Lương Tối Thiểu**                                                          |
+:=================+==================+==================+==================+==================+
| **Tên hiển thị** | **Tên field**    | **Kiểu dữ liệu** | **Khoá Ngoại**   | **Diễn giải**    |
+------------------+------------------+------------------+------------------+------------------+
|                  | ID               | uniqueidentifier |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | Type             | nvarchar(60)     |                  | Loại (Enum) :    |
|                  |                  |                  |                  | Mức Trần , Lương |
|                  |                  |                  |                  | Tối Thiểu        |
+------------------+------------------+------------------+------------------+------------------+
|                  | ValueEntityName  | nvarchar(200)    |                  | Tên              |
+------------------+------------------+------------------+------------------+------------------+
|                  | Value            | float            |                  | Số tiền          |
+------------------+------------------+------------------+------------------+------------------+
|                  | DateOfEffect     | datetime         |                  | Ngày hiệu lực    |
+------------------+------------------+------------------+------------------+------------------+
|                  | Value2           | float            |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | Value3           | float            |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | ValueString      | nvarchar(1000)   |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | ValueString2     | nvarchar(1000)   |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | ValueString3     | nvarchar(1000)   |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | Comment          | nvarchar(1000)   |                  |                  |
+------------------+------------------+------------------+------------------+------------------+
|                  | CurrencyID       | uniqueidentifier | Cat_Currency     |                  |
+------------------+------------------+------------------+------------------+------------------+
| Type : E_INSURANCE_CAPE_AMOUNT (Mức Trần BHXH) , [E_MINIMUM_SALARY]{.mark} (Lương Tối Thiểu) |
+----------------------------------------------------------------------------------------------+
|                                                                                              |
+----------------------------------------------------------------------------------------------+

##  Cat_RateInsurance

+-----------------------------------------------------------------------------------------------------+
| **Cat_RateInsurance**                                                                               |
|                                                                                                     |
| **Tỉ Lệ Bảo Hiểm**                                                                                  |
+:==================+=====================+===================+===================+===================+
| **Tên hiển thị**  | **Tên field**       | **Kiểu dữ liệu**  | **Khoá Ngoại**    | **Diễn giải**     |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | ID                  | uniqueidentifier  |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | HealthInsCompRate   | float             |                   | 3%(BHYT NSDLĐ     |
|                   |                     |                   |                   | Đóng)             |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | HealthInsEmpRate    | float             |                   | 0.15%(BHYT NLĐ    |
|                   |                     |                   |                   | Đóng)             |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | SocialInsCompRate   | float             |                   | 18%(BHXH NSDLĐ    |
|                   |                     |                   |                   | Đóng)             |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | SocialInsEmpRate    | float             |                   | 8%(BHXH NLĐ Đóng) |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | UnemployInsCompRate | float             |                   | 1%(BHTN NSDLĐ     |
|                   |                     |                   |                   | Đóng)             |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | UnemployInsEmpRate  | float             |                   | 1%                |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | ApplyFrom           | datetime          |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | SMCompRate          | float             |                   | Ốm đau,TS NSDLĐ   |
|                   |                     |                   |                   | đóng (%)          |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | OADCompRate         | float             |                   | TNLĐ,BNN NSDLĐ    |
|                   |                     |                   |                   | đóng (%)          |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | PSCompRate          | float             |                   | Hưu trí,Tử tuất   |
|                   |                     |                   |                   | NSDLĐ đóng (%)    |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                                                                                                     |
+-----------------------------------------------------------------------------------------------------+

##  Ins_InsuranceForPayrollMonthly

+-----------------------------------------------------------------------------------------------------------+
| **Ins_InsuranceForPayrollMonthly**                                                                        |
|                                                                                                           |
| **Bảo hiểm -- Tính Chốt Lương**                                                                           |
+:==================+=========================+===================+=====================+===================+
| **Tên hiển thị**  | **Tên field**           | **Kiểu dữ liệu**  | **Khoá Ngoại**      | **Diễn giải**     |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | ID                      | uniqueidentifier  |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | ProfileID               | uniqueidentifier  | Hre_Profile         |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
| Nơi Đóng BH       | SocialInsPlaceID        | uniqueidentifier  | Cat_Province        |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | MonthYear               | DateTime          |                     | Tháng Năm         |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | IsSocialInsurance       | bit               |                     | Đóng BHXH         |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | IsHealthInsurance       | bit               |                     | Đóng BHYT         |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | IsUnEmpInsurance        | bit               |                     | Đóng BHTN         |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | IsDecreaseWorkingDays   | bit               |                     | Có Nghỉ \>= 14    |
|                   |                         |                   |                     | ngày              |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | IsPregnant              | bit               |                     | Có Thai Sản       |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | MoneySocialInsurance    | double            |                     | Tiền BHXH         |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | MoneyHealthInsurance    | double            |                     | Tiền BHYT         |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | MoneyUnEmpInsurance     | double            |                     | Tiền BHTN         |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SalaryInsurance         | double            |                     | Lương BHXH        |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SalaryUnEmpInsurance    | double            |                     | Lương BHTN        |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SalaryHealthInsurance   | double            |                     | Lương BHTN        |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | Allowance1              | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | Allowance2              | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | Allowance3              | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | Allowance4              | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | AllowanceAdditional     | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | AmountChargeIns         | double            |                     | Tổng số tiền      |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SocialInsEmpRate        | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | HealthInsEmpRate        | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | UnemployEmpRate         | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SocialInsComRate        | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | HealthInsComRate        | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | UnemployComRate         | double            |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SocialInsEmpAmount      | double            |                     | Tiền BHXH NV Đóng |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | HealthInsEmpAmount      | double            |                     | Tiền BHYT NV Đóng |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | UnemployEmpAmount       | double            |                     | Tiền BHTN NV Đóng |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SocialInsComAmount      | double            |                     | Tiền BHXH Cty     |
|                   |                         |                   |                     | Đóng              |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | HealthInsComAmount      | double            |                     | Tiền BHYT Cty     |
|                   |                         |                   |                     | Đóng              |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | UnemployComAmount       | double            |                     | Tiền BHTN Cty     |
|                   |                         |                   |                     | Đóng              |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | JobName                 | Nvarchar(400)     |                     | Chức Danh , hoặc  |
|                   |                         |                   |                     | tên công việc     |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | TypeGetData             | Nvarchar(200)     |                     | GETTEMP,GETFINAL  |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | AmountHDTIns            | double            |                     | Tiền HDTJob       |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | HDTGroupCode            | Nvarchar(200)     |                     | Mã HDTJob         |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | MonthYearEffect         | DateTime          |                     | Tháng truy lĩnh   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | IsPayback               | Bit               |                     | Có Điều Chỉnh     |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | PaybackID               | uniqueidentifier  |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | WorkPlaceID             | uniqueidentifier  | Cat_WorkPlace       |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | CostCentreID            | Uniqueidentifier  | Cat_CostCentre      |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | OrgStructureID          | Uniqueidentifier  | Cat_OrgStructure    |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | JobTitleID              | Uniqueidentifier  | Cat_JobTitle        |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | PositionID              | Uniqueidentifier  | Cat_Position        |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SalaryClassID           | Uniqueidentifier  | Cat_SalaryClass     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | PayrollGroupID          | Uniqueidentifier  | Cat_PayrollGroup    |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | SalGradeID              | Uniqueidentifier  | Cat_GradeCfg        |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | AttGradeID              | Uniqueidentifier  | Cat_GradeAttendance |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | CostActivityID          | Uniqueidentifier  | Cat_CostActivity    |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | EmployeeGroupID         | Uniqueidentifier  | Cat_NameEntity      |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | LaborType               | Nvarchar(100)     |                     |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | EmployeeTypeID          | uniqueidentifier  | Cat_EmployeeType    |                   |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | IsQuit                  | Bit               |                     | Có Nghỉ Việc      |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | TypeHDTIns              | varchar(50)       |                     | Loại HDT          |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_MoneySocialInsurance  | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_MoneyUnEmpInsurance   | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_MoneyHealthInsurance  | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_SalaryInsurance       | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_SocialInsEmpAmount    | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_HealthInsEmpAmount    | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_UnemployEmpAmount     | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_SocialInsComAmount    | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_HealthInsComAmount    | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_UnemployComAmount     | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_SalaryUnEmpInsurance  | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
|                   | E_SalaryHealthInsurance | varchar(200)      | ** **               | ** **             |
+-------------------+-------------------------+-------------------+---------------------+-------------------+
| Dùng để tính lương                                                                                        |
|                                                                                                           |
| • TypeHDTIns : enum (E_TYPE4,E_TYPE5)                                                                     |
+-----------------------------------------------------------------------------------------------------------+

## Hre_HealthInsuranceCard 

+-----------------------------------------------------------------------------------------------------------------+
| **Hre_HealthInsuranceCard**                                                                                     |
|                                                                                                                 |
| **(Thẻ BHYT)**                                                                                                  |
+:==================+==========================+===================+==========================+===================+
| **Tên hiển thị**  | **Tên field**            | **Kiểu dữ liệu**  | **Khoá Ngoại**           | **Diễn giải**     |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | ID                       | uniqueidentifier  |                          |                   |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | HealthInsNo              | NVarchar(100)     |                          | Số Sổ BHYT        |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | HealthInsIssueDate       | DateTime          |                          | Ngày Cấp BHYT     |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | HealthInsExpiredDate     | DateTime          |                          | Ngày Hết Hạn BHYT |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | HealthTreatmentPlace     | Nvarchar(200)     |                          | Nơi Đăng Ký Khám  |
|                   |                          |                   |                          | Bệnh              |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | HealthTreatmentPlaceCode | NVarchar(100)     |                          | Mã Bệnh Viện Đăng |
|                   |                          |                   |                          | Ký Khám           |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | IsPeriodicExamination    | bit               |                          | Khám Sức Khỏe     |
|                   |                          |                   |                          | Định Kỳ           |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | ReceiveHealthIns         | bit               |                          | Đã Trả Thẻ BHYT   |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | ReceiveHealthInsDate     | DateTime          |                          | Ngày Trả Thẻ BHYT |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | IsRegisterHealthIns      | bit               |                          | Tham Gia BHYT     |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | ProfileID                | uniqueidentifier  | Hre_Profile              |                   |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | ProvinceHospital         | Nvarchar(300)     |                          | ** **             |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | HealthTreatmentPlaceID   | uniqueidentifier  | Cat_HealthTreatmentPlace | ** **             |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                   | FiveConsecutiveYearsFrom | DateTime          | ** **                    | ** **             |
+-------------------+--------------------------+-------------------+--------------------------+-------------------+
|                                                                                                                 |
+-----------------------------------------------------------------------------------------------------------------+

##  Cat_HealthTreatmentPlace 

+------------------------------------------------------------------------------------------------------+
| **Cat_HealthTreatmentPlace**                                                                         |
|                                                                                                      |
| **(Nơi Khám Chữa Bệnh)**                                                                             |
+:================+=============================+==================+=================+=================+
| **Tên hiển      | **Tên field**               | **Kiểu dữ liệu** | **Khoá Ngoại**  | **Diễn giải**   |
| thị**           |                             |                  |                 |                 |
+-----------------+-----------------------------+------------------+-----------------+-----------------+
|                 | ID                          | uniqueidentifier |                 |                 |
+-----------------+-----------------------------+------------------+-----------------+-----------------+
|                 | HealthTreatmentCode         | Varchar(20)      |                 | Mã KCB          |
+-----------------+-----------------------------+------------------+-----------------+-----------------+
|                 | HealthTreatmentProvinceCode | Nvarchar(40)     |                 | Mã tỉnh bệnh    |
|                 |                             |                  |                 | viện KCB        |
+-----------------+-----------------------------+------------------+-----------------+-----------------+
|                 | HealthTreatmentName         | Nvarchar(400)    |                 | Tên cơ sở KCB   |
+-----------------+-----------------------------+------------------+-----------------+-----------------+
|                 | HealthTreatmentAddress      | Varchar(1000)    |                 | Địa chỉ KCB     |
+-----------------+-----------------------------+------------------+-----------------+-----------------+
|                 | Notes                       | Nvarchar(1000)   |                 | Ghi chú         |
+-----------------+-----------------------------+------------------+-----------------+-----------------+
|                                                                                                      |
+------------------------------------------------------------------------------------------------------+

## Cat_InsuranceGrade 

- Mục đích : dùng tính nghỉ 14 ngày bằng công thức và tính lương dựa vào
  các tỉ lệ

+------------------------------------------------------------------------------------------------------------+
| **Cat_InsuranceGrade**                                                                                     |
|                                                                                                            |
| **(Chế độ bảo hiểm)**                                                                                      |
+:==================+============================+===================+===================+===================+
| **Tên hiển thị**  | **Tên field**              | **Kiểu dữ liệu**  | **Khoá Ngoại**    | **Diễn giải**     |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | ID                         | uniqueidentifier  |                   |                   |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | Code                       | nvarchar(100)     |                   |                   |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | InsuranceGradeName         | Nvarchar(200)     |                   | Tên chế độ bảo    |
|                   |                            |                   |                   | hiểm              |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | Description                | Nvarchar(400)     |                   | Mô tả             |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | FileAttach                 | Nvarchar(8000)    |                   | File đính kèm     |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | MinSalary                  | Float             |                   | Lương tối thiểu   |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | MaxSalary                  | Float             |                   | Lương tối đa      |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | HealthInsCompRate          | Float             |                   | BHYT NSDLD đóng   |
|                   |                            |                   |                   | (%)               |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | HealthInsEmpRate           | Float             |                   | BHYT NLD đóng (%) |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | SocialInsCompRate          | Float             |                   | BHXH NSDLD đóng   |
|                   |                            |                   |                   | (%)               |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | SocialInsEmpRate           | Float             |                   | BHXH NLD đóng (%) |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | UnemployInsCompRate        | Float             |                   | BHTN NSDLD đóng   |
|                   |                            |                   |                   | (%)               |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | UnemployInsEmpRate         | Float             |                   | BHTN NLD đóng (%) |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | FormulaDecreasedWorkingDay | Varchar(200)      |                   | Công thức tính số |
|                   |                            |                   |                   | ngày nghỉ không   |
|                   |                            |                   |                   | đóng bảo hiểm     |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | CountLeaveIns              | Int               |                   | Số ngày nghỉ      |
|                   |                            |                   |                   | không đóng BH     |
|                   |                            |                   |                   | (nghỉ 14 ngày)    |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | SMCompRate                 | Float             |                   | ** **             |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | OADCompRate                | Float             |                   | ** **             |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | PSCompRate                 | Float             |                   | ** **             |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                   | FormulaWorkingDay          | Varchar(4000)     |                   | ** **             |
+-------------------+----------------------------+-------------------+-------------------+-------------------+
|                                                                                                            |
+------------------------------------------------------------------------------------------------------------+

## Ins_InsuranceGrade 

Mục đích: thiết lập chế độ bảo hiểm cho nhân

- Khi trích nộp bảo hiểm sẽ chia 2 loại, loại có chế độ bảo hiểm sẽ dùng
  công thức để tính nghỉ 14 ngày(dựa vào bảng công để thiết lập công
  thức), ngược lại tính nghỉ 14 ngày dựa vào xử lý ngày công

+----------------------------------------------------------------------------------------------------+
| **Ins_InsuranceGrade**                                                                             |
|                                                                                                    |
| **(Chế độ bảo hiểm cho nhân viên)**                                                                |
+:==================+===================+===================+====================+===================+
| **Tên hiển thị**  | **Tên field**     | **Kiểu dữ liệu**  | **Khoá Ngoại**     | **Diễn giải**     |
+-------------------+-------------------+-------------------+--------------------+-------------------+
|                   | ID                | uniqueidentifier  |                    |                   |
+-------------------+-------------------+-------------------+--------------------+-------------------+
|                   | ProfileID         | uniqueidentifier  | Hre_Profile        |                   |
+-------------------+-------------------+-------------------+--------------------+-------------------+
|                   | InsuranceGradeID  | uniqueidentifier  | Cat_InsuranceGrade |                   |
+-------------------+-------------------+-------------------+--------------------+-------------------+
|                   | MonthOfEffect     | datetime          |                    |                   |
+-------------------+-------------------+-------------------+--------------------+-------------------+
|                                                                                                    |
+----------------------------------------------------------------------------------------------------+

## Cat_InsuranceRecordType

+-----------------------------------------------------------------------------------------------------------+
| **Cat_InsuranceRecordType**                                                                               |
|                                                                                                           |
| **(Loại chứng từ)**                                                                                       |
+:==================+===========================+===================+===================+===================+
| **Tên hiển thị**  | **Tên field**             | **Kiểu dữ liệu**  | **Khoá Ngoại**    | **Diễn giải**     |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | ID                        | uniqueidentifier  |                   |                   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | Code                      | varchar(50)       |                   |                   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | InsuranceType             | nvarchar(200)     |                   | Loại chứng từ     |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | NumberOfWarnDays          | int               |                   |                   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | Note                      | nvarchar(400)     |                   | Ghi chú           |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | IsBlock                   | bit               |                   |                   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | InsuranceRecordTypeGroup1 | varchar(50)       |                   | Nhóm chứng từ 1   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | InsuranceRecordTypeGroup2 | varchar(50)       |                   | Nhóm chứng từ 2   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | InsuranceRecordTypeGroup3 | varchar(50)       |                   | Nhóm chứng từ 3   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | IsUse                     | bit               |                   | Có sử dụng        |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | OrderNumber               | int               |                   | Số thứ tự         |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | IsIncludeHolidaysdayoff   | bit               | ** **             |  Có tính ngày     |
|                   |                           |                   |                   | nghỉ lễ, tết, off |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | MethodGroupCode           | nvarchar(100)     | ** **             |                   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | MethodCode                | nvarchar(100)     | ** **             |                   |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | IsMethod                  | bit               | ** **             |  Định nghĩa đây   |
|                   |                           |                   |                   | là Loại chứng từ  |
|                   |                           |                   |                   | con (Cây chứng    |
|                   |                           |                   |                   | từ)               |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | InsuranceRecordTypeGroup4 | nvarchar(100)     | ** **             |  Nhóm chứng từ 4  |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                   | ParentID                  | uniqueidentifier  | ** **             |  ID Chứng từ cha  |
+-------------------+---------------------------+-------------------+-------------------+-------------------+
|                                                                                                           |
+-----------------------------------------------------------------------------------------------------------+

## Ins_ChangeInsInfoRegister

+----------------------------------------------------------------------------------------------------------------+
| **Ins_ChangeInsInfoRegister**                                                                                  |
+:==================+=========================+===================+==========================+===================+
| **Tên hiển thị**  | **Tên field**           | **Kiểu dữ liệu**  | **Khoá Ngoại**           | **Diễn giải**     |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | ID                      | uniqueidentifier  |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | ProfileID               | uniqueidentifier  | Hre_Profile              |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | RegisterType            | varchar(32)       |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | InsuranceCode           | nvarchar(200)     |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | ProfileName             | nvarchar(400)     |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | DayOfBirth              | datetime          |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | Gender                  | varchar(32)       |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | NationalityID           | uniqueidentifier  | Cat_Country              |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | EthnicID                | uniqueidentifier  | Cat_EthnicGroup          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | PProvinceID             | uniqueidentifier  | Cat_Province             |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | PDistrictID             | uniqueidentifier  | Cat_District             |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | PVillageID              | uniqueidentifier  | Cat_Village              |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | RProvinceID             | uniqueidentifier  | Cat_Province             |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | RDistrictID             | uniqueidentifier  | Cat_District             |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | RVillageID              | uniqueidentifier  | Cat_Village              |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | RAdress                 | nvarchar(400)     |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | DocumentType            | varchar(50)       |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | IDNo                    | nvarchar(200)     |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | PhoneNumber             | nvarchar(200)     |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | HealthTreatmentPlaceID  | uniqueidentifier  | Cat_HealthTreatmentPlace |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | ChangeContent           | nvarchar(400)     |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | AttachedDocuments       | nvarchar(4000)    |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | Is1TimeSocialInsPayment | bit               |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | IsUnEmploymentPayment   | bit               |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | Status                  | varchar(32)       |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | Note                    | nvarchar(2000)    |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | FileAttach              | varchar(1000)     |                          |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                   | UserSubmitID            | uniqueidentifier  | Hre_Profile              |                   |
+-------------------+-------------------------+-------------------+--------------------------+-------------------+
|                                                                                                                |
+----------------------------------------------------------------------------------------------------------------+

## Ins_ChildSick

+-----------------------------------------------------------------------------------------------------------+
| **Ins_ChildSick**                                                                                         |
+:==================+====================+===================+==========================+===================+
| **Tên hiển thị**  | **Tên field**      | **Kiểu dữ liệu**  | **Khoá Ngoại**           | **Diễn giải**     |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                   | ID                 | uniqueidentifier  |                          |                   |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                   | ProfileID          | uniqueidentifier  | Hre_Profile              |                   |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                   | ChildSickName      | varchar(32)       |                          |                   |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                   | Gender             | nvarchar(200)     |                          |                   |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                   | DateOfBirth        | nvarchar(400)     |                          |                   |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                   | RelativeID         | varchar(50)       |                          |                   |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                   | HealthInsNo        | nvarchar(200)     |                          |                   |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                   | HealthInsIssueDate | uniqueidentifier  | Cat_HealthTreatmentPlace |                   |
+-------------------+--------------------+-------------------+--------------------------+-------------------+
|                                                                                                           |
+-----------------------------------------------------------------------------------------------------------+

## Ins_Claim

+-------------------------------------------------------------------------------------------------------------+
| **Ins_Claim**                                                                                               |
+:==================+=======================+===================+=========================+===================+
| **Tên hiển thị**  | **Tên field**         | **Kiểu dữ liệu**  | **Khoá Ngoại**          | **Diễn giải**     |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | ID                    | uniqueidentifier  |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | ProfileID             | uniqueidentifier  | Hre_Profile             |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | DateFrom              | datetime          |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | DateTo                | datetime          |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | VoluntaryInsTypeID    | uniqueidentifier  | Cat_VoluntaryInsType    |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | InsuranceRecordTypeID | uniqueidentifier  | Cat_InsuranceRecordType |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | EmpPaid               | float             |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | Claim                 | float             |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | InsPaid               | float             |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | FileAttachment        | varchar(4000)     |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | InsuranceRecordType   | varchar(50)       |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                                                                                                             |
+-------------------------------------------------------------------------------------------------------------+

## Ins_HealthCard

+---------------------------------------------------------------------------------------------------+
| **Ins_HealthCard**                                                                                |
+:==================+===================+===================+===================+===================+
| **Tên hiển thị**  | **Tên field**     | **Kiểu dữ liệu**  | **Khoá Ngoại**    | **Diễn giải**     |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | ID                | uniqueidentifier  |                   |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | ProfileId         | uniqueidentifier  | Hre_Profile       |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | DateStart         | datetime          |                   |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | DateEnd           | datetime          |                   |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | HealthNo          | nvarchar(100)     |                   |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | HospitalCode      | nvarchar(100)     |                   |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | HospitalName      | nvarchar(300)     |                   |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | IsReturn          | bit               |                   |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                   | DateReturn        | datetime          |                   |                   |
+-------------------+-------------------+-------------------+-------------------+-------------------+
|                                                                                                   |
+---------------------------------------------------------------------------------------------------+

## Ins_InsuranceConfig

+-----------------------------------------------------------------------------------------------------+
| **Ins_InsuranceConfig**                                                                             |
+:==================+=====================+===================+===================+===================+
| **Tên hiển thị**  | **Tên field**       | **Kiểu dữ liệu**  | **Khoá Ngoại**    | **Diễn giải**     |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | ID                  | uniqueidentifier  |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | InsuranceConfigName | nvarchar(200)     |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | IsSocialIns         | bit               |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | IsMedicalIns        | bit               |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | IsUnimploymentIns   | bit               |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | Days                | int               |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                   | Description         | nvarchar(200)     |                   |                   |
+-------------------+---------------------+-------------------+-------------------+-------------------+
|                                                                                                     |
+-----------------------------------------------------------------------------------------------------+

## Ins_InsuranceInfo

+-------------------------------------------------------------------------------------------------------------------+
| **Ins_InsuranceInfo**                                                                                             |
+:==================+===========================+===================+===========================+===================+
| **Tên hiển thị**  | **Tên field**             | **Kiểu dữ liệu**  | **Khoá Ngoại**            | **Diễn giải**     |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | ID                        | uniqueidentifier  |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | ProfileID                 | uniqueidentifier  | Hre_Profile               |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | ProfileName               | nvarchar(400)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | DateOfBirth               | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | Gender                    | varchar(32)       |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | NationalityID             | uniqueidentifier  | Cat_Country               |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | EthnicID                  | uniqueidentifier  | Cat_EthnicGroup           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | PProvinceID               | uniqueidentifier  | Cat_Province              |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | PDistrictID               | uniqueidentifier  | Cat_District              |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | PVillageID                | uniqueidentifier  | Cat_Village               |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | RProvinceID               | uniqueidentifier  | Cat_Province              |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | RDistrictID               | uniqueidentifier  | Cat_District              |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | RVillageID                | uniqueidentifier  | Cat_Village               |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | RAdress                   | nvarchar(1000)    |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | DocumentType              | varchar(32)       |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | IDNo                      | nvarchar(200)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | PhoneNumber               | nvarchar(200)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsNo               | nvarchar(200)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | InsuranceCode             | nvarchar(200)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | InsuranceCodeOld          | nvarchar(200)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsIssueDate        | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsIssuePlace       | nvarchar(400)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsPlaceID          | uniqueidentifier  | Cat_Province              |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsBookStatus       | varchar           |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsDateReg          | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsSubmitBookStatus | nvarchar(64)      |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsSubmitBookDate   | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsReserveDate      | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsAppointmentDate  | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsNote             | nvarchar(400)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | ReceiveSocialInsDate      | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | IsReceiveSocialIns        | bit               |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | SocialInsDeliveryDate     | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | HealthInsNo               | nvarchar(400)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | HealthInsIssueDate        | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | HealthInsExpiredDate      | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | HealthTreatmentPlaceID    | uniqueidentifier  | Cat_HealthTreatmentPlace  |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | HealthTreatmentPlace      | nvarchar(400)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | ProvinceHospital          | nvarchar(400)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | HealthTreatmentPlaceCode  | nvarchar(400)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | FiveConsecutiveYearsFrom  | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | IsPeriodicExamination     | bit               |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | UnEmpInsDateReg           | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | UnEmpInsCountMonthOld     | int               |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | FileStore                 | nvarchar(4000)    |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | Note                      | nvarchar(400)     |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | FileAttach                | nvarchar(4000)    |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | IsTradeUnionist           | bit               |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | TradeUnionistPositionID   | uniqueidentifier  | Cat_TradeUnionistPosition |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | TradeUnionistEnrolledDate | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                   | TradeUnionistEndDate      | datetime          |                           |                   |
+-------------------+---------------------------+-------------------+---------------------------+-------------------+
|                                                                                                                   |
+-------------------------------------------------------------------------------------------------------------------+

## Ins_LeaveDayIns

+-----------------------------------------------------------------------------------------------------+
| **Ins_LeaveDayIns**                                                                                 |
+===================+===================+===================+=====================+===================+
| **Tên hiển thị**  | **Tên field**     | **Kiểu dữ liệu**  | **Khoá Ngoại**      | **Diễn giải**     |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | ID                | uniqueidentifier  |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | LeaveDayID        | uniqueidentifier  |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | ProfileID         | uniqueidentifier  | Hre_Profile         |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | LeaveDayTypeID    | uniqueidentifier  | Cat_LeaveDayType    |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | UserApproveID     | uniqueidentifier  | Sys_UserInfo        |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | UserApproveID2    | uniqueidentifier  | Sys_UserInfo        |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | InsuranceRecordID | uniqueidentifier  | Ins_InsuranceRecord |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | DateStart         | datetime          |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | DateEnd           | datetime          |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | Status            | varchar(50)       |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | CommentApprove    | nvarchar(1000)    |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | Comment           | nvarchar(1000)    |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | DeclineReason     | nvarchar(100)     |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | UserRegister      | nvarchar(100)     |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | DateRegister      | datetime          |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | UserApprove       | nvarchar(100)     |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | DateApprove       | datetime          |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | Duration          | float             |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | TotalDuration     | float             |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | DurationType      | nvarchar(100)     |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                   | PayMethod         | nvarchar(100)     |                     |                   |
+-------------------+-------------------+-------------------+---------------------+-------------------+
|                                                                                                     |
+-----------------------------------------------------------------------------------------------------+

## Ins_NormsVoluntaryIns

+------------------------------------------------------------------------------------------------------------+
| **Ins_NormsVoluntaryIns**                                                                                  |
+===================+=========================+===================+======================+===================+
| **Tên hiển thị**  | **Tên field**           | **Kiểu dữ liệu**  | **Khoá Ngoại**       | **Diễn giải**     |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | ID                      | uniqueidentifier  |                      |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | VoluntaryInsTypeID      | uniqueidentifier  | Cat_VoluntaryInsType |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | OrgStructureID          | uniqueidentifier  | Cat_OrgStructure     |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | JobTitleID              | uniqueidentifier  | Cat_JobTitle         |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | PositionID              | uniqueidentifier  | Cat_Position         |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | AbilityTileInPositionID | uniqueidentifier  | Cat_AbilityTile      |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | ContractTypeID          | uniqueidentifier  | Cat_ContractType     |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | PaidByEmployee          | float             |                      |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                   | PaidByCompany           | float             |                      |                   |
+-------------------+-------------------------+-------------------+----------------------+-------------------+
|                                                                                                            |
+------------------------------------------------------------------------------------------------------------+

## Ins_PaidInsurance

+-------------------------------------------------------------------------------------------------------+
| **Ins_PaidInsurance**                                                                                 |
+===================+=======================+===================+===================+===================+
| **Tên hiển thị**  | **Tên field**         | **Kiểu dữ liệu**  | **Khoá Ngoại**    | **Diễn giải**     |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | ID                    | uniqueidentifier  |                   |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | MonthYear             | datetime          |                   |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | SalaryInsurance       | float             |                   |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | SalaryHealthInsurance | float             |                   |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | SalaryUnEmpInsurance  | float             |                   |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | Note                  | nvarchar(1000)    |                   |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | Period                | int               |                   |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | OrgStructureID        | uniqueidentifier  | Cat_OrgStructure  |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                   | SocialInsPlaceID      | uniqueidentifier  | Cat_Province      |                   |
+-------------------+-----------------------+-------------------+-------------------+-------------------+
|                                                                                                       |
+-------------------------------------------------------------------------------------------------------+

## Ins_VoluntaryInsInfo

+-------------------------------------------------------------------------------------------------------------+
| **Ins_VoluntaryInsInfo**                                                                                    |
+===================+=======================+===================+=========================+===================+
| **Tên hiển thị**  | **Tên field**         | **Kiểu dữ liệu**  | **Khoá Ngoại**          | **Diễn giải**     |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | ID                    | uniqueidentifier  |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | ProfieldID            | uniqueidentifier  |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | VoluntaryInsCompanyID | uniqueidentifier  | Cat_VoluntaryInsCompany |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | VoluntaryInsTypeID    | uniqueidentifier  | Cat_VoluntaryInsType    |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | ComPaid               | float             |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | EmpPaid               | float             |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | StartDate             | datetime          |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | EndDate               | datetime          |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | IssuedDate            | datetime          |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | CardNo                | varchar(250)      |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | Note                  | nvarchar(1000)    |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | Month                 | int               |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | MonthlyPaid           | float             |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | RelativeID            | uniqueidentifier  | Hre_Relatives           |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | TotalPaid             | float             |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | UnitTime              | varchar(50)       |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | ValueTime             | float             |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | PaidStatus            | varchar           |                         |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | ComPaidCurrencyID     | uniqueidentifier  | Cat_Currency            |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | EmpPaidCurrencyID     | uniqueidentifier  | Cat_Currency            |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | TotalPaidCurrencyID   | uniqueidentifier  | Cat_Currency            |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                   | MonthlyPaidCurrencyID | uniqueidentifier  | Cat_Currency            |                   |
+-------------------+-----------------------+-------------------+-------------------------+-------------------+
|                                                                                                             |
+-------------------------------------------------------------------------------------------------------------+

# Mô Hình UML

## UseCase Diagram

![](../../../../src/Ins_TaiLieuBaoHiem_01_image28.png)

Đặc tả:

- Mô tả tóm tắt (tên,mục đích,tóm lượt , đối tác,ngày ,phiên bản,ngày
  lập)

- Mô tả kịch bản (đầu vào ,đầu ra, dãy hành động)

- Ràng buộc về giao diện

## Insurance Class Diagram

![](../../../../src/Ins_TaiLieuBaoHiem_01_image29.png)

##  Activity Diagram

### Xử lý Trích Nộp Bảo Hiểm Xử lý Trích Nộp Bảo Hiểm

![](../../../../src/Ins_TaiLieuBaoHiem_01_image30.png)

####  Xử lý Tính tháng bắt đầu nộp BHXH,BHYT,BHTN

#### ![](../../../../src/Ins_TaiLieuBaoHiem_01_image31.png) Xử lý Kiểm Tra Nôp BHXH,BHYT,BHTN

![](../../../../src/Ins_TaiLieuBaoHiem_01_image32.png)

####  Xử lý tính lương và mức đóng của BHXH , BHYT,BHTN

![](../../../../src/Ins_TaiLieuBaoHiem_01_image33.png)

###  Xử Lý Báo Cáo

####  Xử Lý Tăng Giảm Cho Báo Cáo D02

![](../../../../src/Ins_TaiLieuBaoHiem_01_image34.png)

#### 

#### Xử Lý Tăng Báo Cáo D02

![](../../../../src/Ins_TaiLieuBaoHiem_01_image35.png)

####  Xử Lý Giảm Báo Cáo D02

![](../../../../src/Ins_TaiLieuBaoHiem_01_image36.png)

###  BC Đuôi D02

#### ![](../../../../src/Ins_TaiLieuBaoHiem_01_image37.png)Mô Hình

> ![](../../../../src/Ins_TaiLieuBaoHiem_01_image38.png)

- Dữ liệu đầu kỳ trong BC đuôi D02 sẽ "**không**" lấy những dữ liệu đã
  điều chỉnh.

####  Các Bảng xử lý D02

- Bảo Hiểm

  - Ins_ProfileInsuranceMonthly

  - Ins_InsuranceRecord (chứng từ bảo hiểm)

- Nhân Sự

  - Hre_Profile

  - Hre_Contract (Cat_ContractType)

  - Hre_StopWorking

+----------------------------------------------------------------------------------------+
| Các trạng thái Bảo Hiểm                                                                |
+====================================+===================================================+
| Loại                               | Trạng Thái                                        |
+------------------------------------+---------------------------------------------------+
| Tăng                               | Tăng lao động (tăng LĐ , tăng LĐ do tạm hoãn)     |
|                                    | ([E_TANG_LD]{.mark})                              |
|                                    +---------------------------------------------------+
|                                    | Tăng do nghỉ 14 ngày                              |
|                                    +---------------------------------------------------+
|                                    | Tăng sau thai sản                                 |
|                                    +---------------------------------------------------+
|                                    | Tăng sau bệnh (E_TANG_TS)                         |
|                                    +---------------------------------------------------+
|                                    | Tăng BHTN                                         |
|                                    +---------------------------------------------------+
|                                    | Tăng BHYT                                         |
+------------------------------------+---------------------------------------------------+
| Giảm                               | Giảm do tạm hoãn ([E_GIAM_QUIT_SUSPENSE]{.mark})  |
|                                    +---------------------------------------------------+
|                                    | Nghỉ việc sau khi nghỉ sinh con                   |
|                                    +---------------------------------------------------+
|                                    | Giảm LĐ trả thẻ BHYT kịp thời                     |
|                                    +---------------------------------------------------+
|                                    | Giảm LĐ không trả thẻ BHYT                        |
|                                    +---------------------------------------------------+
|                                    | Giảm LĐ                                           |
|                                    +---------------------------------------------------+
|                                    | Giảm Bệnh                                         |
|                                    +---------------------------------------------------+
|                                    | Giảm do nghỉ hơn 14 ngày                          |
+------------------------------------+---------------------------------------------------+
| Thay Đổi Lương                     | Giảm lương thay đổi chức danh nghề                |
|                                    +---------------------------------------------------+
|                                    | Giảm mức đóng                                     |
|                                    +---------------------------------------------------+
|                                    | Tăng Lương và thay đổi chức danh nghề             |
|                                    +---------------------------------------------------+
|                                    | Tăng mức đóng                                     |
+------------------------------------+---------------------------------------------------+
| Thay Đổi Chức Danh Nghề            | Thay Đổi Chức Danh Nghề                           |
+------------------------------------+---------------------------------------------------+
| Trường hợp đặc biệt                | Nghỉ việc sau khi nghỉ sinh con                   |
|                                    +---------------------------------------------------+
|                                    | Giảm do nghỉ \>=14 sau thai sản (nằm trong loại   |
|                                    | giảm)                                             |
|                                    +---------------------------------------------------+
|                                    | Nghỉ việc mà tháng trước nghỉ \>=14 ngày (nằm     |
|                                    | trong loại giảm)                                  |
|                                    +---------------------------------------------------+
|                                    | Giảm Lao Động Do Chuyển Nơi Đóng BH (nằm trong    |
|                                    | loại giảm)                                        |
|                                    +---------------------------------------------------+
|                                    | Tăng Lao Động Do Chuyển Nơi Đóng BH (nằm trong    |
|                                    | loại tăng)                                        |
+------------------------------------+---------------------------------------------------+
|                                    |                                                   |
+------------------------------------+---------------------------------------------------+

###  Xử lý chức năng tính truy lĩnh bảo hiểm

- **Mục đích :**

<!-- -->

- Điều chỉnh cho nv(kể cả NV nghỉ việc) \* Điều chỉnh tiền đóng BH và
  tiền HDTJob \*

- Điều chỉnh sai lệch tiền BHXH của các tháng trước(vd: tháng 5 điều
  chỉnh cho tháng 3,4 với sai lệch 100,000)

- Đóng BH cho các tháng trước quên đóng (đóng toàn bộ tiền cho tháng
  trước) (vd: tháng 05 điều chỉnh cho tháng 3,4 với số tiền là
  3,000,000)

<!-- -->

- **Cách tính truy lĩnh**

<!-- -->

- Trước khi tính thì xoá Ins_profileInsuranceMonthly chưa truy lĩnh (dựa
  vào profile,monthYear,Ispayback=0) (Dựa vào cấu hình cho phép xoa hay
  không)

- Trước khi tính thì xoá D02Item chưa truy lĩnh (dựa vào
  profile,Ispayback=0) (dựa vào cấu hình cho phép xoá hay không)

- Điều chỉnh số tiền đóng BHXH cho các tháng trước ( dựa vào
  FromMonthYearEffect , ToMonthYearEffect) cho tháng được chọn
  (MonthYearEffect)

- Dựa vào số tiền tháng được truy lĩnh (vd: 2 tháng) sẽ them vào 2 dòng
  vào Ins_ProfileInsuranceMonthly và Ins_ReportD02Item (với IsPayBack là
  true)

Vd: Dữ liệu thật trong phân tích bảo hiểm và phân tích D02

+--------------------------------------------------------------------------+--------------+
| Dữ liệu phân tích bảo hiểm tháng **05/2015** và truy lĩnh cho tháng      |              |
| **03/2015 , 04/2015**                                                    |              |
+:==========:+:==========:+:===============:+:===============:+:==========:+:=============+
| **Ins_ProfileInsuranceMonthly**                                          |              |
+------------+------------+-----------------+-----------------+------------+--------------+
| NV         | MonthYear  | MonthYearEffect | InsuranceSalary | IsPayBack  |              |
+------------+------------+-----------------+-----------------+------------+--------------+
| 001        | 05/2015    | 04/2015         | 500,000.00      | TRUE       | Điều Chỉnh   |
+------------+------------+-----------------+-----------------+------------+--------------+
| 001        | 05/2015    | 03/2015         | 500,000.00      | TRUE       | Điều Chỉnh   |
+------------+------------+-----------------+-----------------+------------+--------------+
| 001        | 05/2015    | 05/2015         | 3,000,000.00    | FALSE      | PT BH        |
+------------+------------+-----------------+-----------------+------------+--------------+
| Tháng **05/2015** : nhận tổng số lương là 4,000,000 (bao gồm 500,000     |              |
| điều chỉnh cho tháng **03/2015** và 500,000 điều chỉnh cho tháng         |              |
| **04/2015**)                                                             |              |
+--------------------------------------------------------------------------+--------------+

+------------------------------------------------------------------------------------+---------------------+
| Dữ liệu D02 tháng **05/2015** và điều chỉnh D02 cho tháng **03/2015 , 04/2015**    |                     |
+:===========:+:===========:+:===========:+:============:+:===========:+:===========:+:====================+
| **Ins_ReportD02Item**                                                              |                     |
+-------------+-------------+-------------+--------------+-------------+-------------+---------------------+
| NV          | FromMonth   | ToMonth     | Salary       | Status      | IsPayBack   |                     |
+-------------+-------------+-------------+--------------+-------------+-------------+---------------------+
| 001         | 04/2015     | 04/2015     | 500,000.00   | Truy tăng   | TRUE        | Điều Chỉnh          |
+-------------+-------------+-------------+--------------+-------------+-------------+---------------------+
| 001         | 03/2015     | 03/2015     | 500,000.00   | Truy tăng   | TRUE        | Điều Chỉnh          |
+-------------+-------------+-------------+--------------+-------------+-------------+---------------------+
| 001         | 05/2015     | 05/2015     | 3,000,000.00 | tăng lao    | FALSE       | PT D02              |
|             |             |             |              | động        |             |                     |
+-------------+-------------+-------------+--------------+-------------+-------------+---------------------+

- **\
  Biểu đồ lớp cho điều chỉnh bảo hiểm :**

![](../../../../src/Ins_TaiLieuBaoHiem_01_image39.png)

- **\
  Biểu đồ hoạt động cho điều chỉnh bảo hiểm :**

![](../../../../src/Ins_TaiLieuBaoHiem_01_image40.png)

###  Kiểm tra nghỉ \>= 14 ngày trong phân tích bảo hiểm

- Duyệt từ ngày của tháng kiểm tra (đầu tháng đến cuối tháng)

- Nếu nghỉ việc trong tháng kiểm tra , tính các ngày (sau ngày nghỉ
  việc) đến cuối tháng (ngoại trừ ngày nghỉ lễ)

- Nguoc lại nếu có ca thì kiểm tra 1 số trường hợp

  - Leaveday (thuộc loại ngày nghỉ BHXH trả)

  - Workday (không đăng ký nghỉ leaveday ,ko phải ngày nghỉ lễ,intime1
    và outtime1 là null)

  - Record

> ![](../../../../src/Ins_TaiLieuBaoHiem_01_image41.png)

###  Kiểm tra nghỉ Thai Sản trong phân tích bảo hiểm

- Đk nghỉ thai sản : những ngày nghỉ(att_leaveday) thuộc loại ngày nghỉ
  (có **InsuranceType** là **E_PREGNANCY_SUCKLE**) và đã approved trong
  khoảng thời gian chu kỳ bảo hiểm(16-\>15 tháng \[N\])

- Kiểm tra nv có nghỉ thai sản trong tháng kiểm tra (nằm trong chu kỳ
  bảo hiểm)

  - Ngày kết thúc thai sản nằm trong chu kỳ bảo hiểm tháng kiểm tra =\>
    không tính nghỉ thai sản

  - Kiểm tra Leaveday hoặc Ins_Record . Nếu nằm trong chu kỳ bảo hiểm
    =\> nghỉ thai sản

- Nếu NV có đóng BHXH 6 tháng trong 12 tháng liền kề (so với tháng kiểm
  tra)

  - Có : Nghỉ Thai Sản

  - Không: nghỉ \>=14 ngày

![](../../../../src/Ins_TaiLieuBaoHiem_01_image42.png)

![](../../../../src/Ins_TaiLieuBaoHiem_01_image43.png)

###  BC Chưa Có BHXH,BHYT (\[TK01-TS\] , \[TK02-TS\])

- Lấy danh sách nhân viên

- Mẫu TK01-TS : Tờ khai lần đầu tham gia BHXH,BHYT

> ![](../../../../src/Ins_TaiLieuBaoHiem_01_image8.png)

- Mẫu KT2-TS : Tờ khai thay đổi thông tin tham gia BHXH,BHYT

> ![](../../../../src/Ins_TaiLieuBaoHiem_01_image9.png)

###  BC D02

![](../../../../src/Ins_TaiLieuBaoHiem_01_image44.png)

- Bổ sung -- tách riêng các trạng thái nghỉ 14 ngày ( Không lương, nghỉ
  ốm, nghỉ 14 ngày ) của báo cáo D02V2:

+-------------------------------------------------------------+
| Các trạng thái nghi 14 ngày theo 3 trang thái (nghỉ ốm,     |
| nghỉ không lương, nghỉ 14 ngày)                             |
+:===============================+:===========================+
| trạng thái D02 V2              | Diễn giải                  |
+--------------------------------+----------------------------+
| E_GIAM_LEAVE_SICK_AFTER_UNPAID | Nghỉ ốm sau khi nghỉ không |
|                                | lương                      |
+--------------------------------+----------------------------+
| E_GIAM_14DAY_AFTER_UNPAID      | Nghỉ \>= 14 ngày sau khi   |
|                                | nghỉ không lương           |
+--------------------------------+----------------------------+
| E_GIAM_QUIT_AFTER_UNPAID       | Nghỉ việc sau khi nghỉ     |
|                                | không lương                |
+--------------------------------+----------------------------+
| E_GIAM_QUIT_AFTER_SICK         | Nghỉ việc sau khi nghỉ ốm  |
+--------------------------------+----------------------------+
| E_GIAM_UNPAID_AFTER_SICK       | Nghỉ không lương sau khi   |
|                                | nghỉ ốm                    |
+--------------------------------+----------------------------+
| E_GIAM_14DAY_AFTER_SICK        | Nghỉ \>= 14 ngày sau khi   |
|                                | nghỉ ốm                    |
+--------------------------------+----------------------------+
| E_GIAM_SICK_AFTER_PREGNANT     | Nghỉ ốm sau khi sinh con   |
+--------------------------------+----------------------------+
| E_GIAM_UNPAID_AFTER_PREGNANT   | Nghỉ không lương sau khi   |
|                                | sinh con                   |
+--------------------------------+----------------------------+
| E_GIAM_UNPAID_AFTER_14DAY      | Nghỉ không lương sau khi   |
|                                | nghỉ \>= 14 ngày           |
+--------------------------------+----------------------------+
| E_GIAM_SICK_AFTER_14DAY        | Nghỉ ốm sau khi nghỉ \>=   |
|                                | 14 ngày                    |
+--------------------------------+----------------------------+

- **Bổ sung trạng thái tiền lương cũ và tiền lương mới.**

  --------------------------------------------------------------------------------------
     **Trạng thái D02 tăng**     **Diễn giải**     **Lương cũ         **Lương mới
                                                   OldBasicSalary**   NewBasicSalary**
  ------------------------------ ----------------- ------------------ ------------------
           E_TANG_LUONG          Loại truy tăng    N-1                N

    E_TANG_LUONG_CHANGEJOBNAME   Tăng lương và     N-1                N
                                 thay đổi theo                        
                                 chức danh nghề.                      

            E_TANG_LD            Tăng lao động.    0                  N

           E_TANG_BENH           Tăng sao bệnh     0                  N

    E_TANG_LEAVE_14WORKINGDAYS   Tăng do nghỉ \>=  0                  N
                                 14 ngày.                             

        E_TANG_BHTN_SPLIT        Tham gia BHTN     0                  N
                                 (tách khi tăng                       
                                 lao động)                            

            E_TANG_TS            Tăng sao thai sản 0                  N

   E_TANG_BHTN_TANGLUONG_SPLIT   Tăng lương thì    0                  N
                                 tăng lương BHXH                      

    E_TANG_LD_CHANGE_INSPLACE    Tăng lao động     N                  N
                                 chuyển nơi đóng                      
                                 bảo hiểm.                            

   E_TANG_LD_CHANGE_LEGALENTITY  Tăng LĐ do thay   N                  N
                                 đổi pháp nhân                        

   E_TANG_BHTN_GIAMLUONG_SPLIT   Tăng BHTN nhưng   0                  N-1
                                 giảm lương                           

     E_TANG_BHTN_GIAMLD_SPLIT    Tăng BHTN giảm    N-1                N-1
                                 lao động.                            

           E_TANG_BHYT           Tăng BHYT         N-1                N

         E_CHANGEJOBNAME         Thay đổi chức     N-1                N
                                 danh nghề                            

           E_TANG_BHTN           Tăng BHTN         N-1                N
  --------------------------------------------------------------------------------------

  ---------------------------------------------------------------------------------------
     **Trạng thái D02 giảm**     **Diễn giải**      **Lương cũ         **Lương mới
                                                    OldBasicSalary**   NewBasicSalary**
  ------------------------------ ------------------ ------------------ ------------------
           E_GIAM_LUONG          Giảm mức đóng.     N-1                N

    E_GIAM_LUONG_CHANGEJOBNAME   Giảm lương thay    N-1                N
                                 đổi chức danh                         
                                 nghề.                                 

    E_GIAM_LEAVE_14WORKINGDAYS   Giảm do nghỉ \>=   N-1                N-1
                                 14 ngày.                              

           E_GIAM_BHYT           Giảm BHYT.         N-1                N

           E_GIAM_BHTN           Giảm BHTN          N-1                N

            E_GIAM_LD            Giảm lao động.     N-1                N-1

            E_GIAM_TS            Giảm thai sản      N-1                N-1

          E_GIAM_TS_QUIT         Nghỉ việc sao khi  N-1                N-1
                                 nghỉ sinh con                         

        E_GIAM_LD_NOT_BHYT       Giảm lao động      N-1                N-1
                                 không trả thẻ BHYT                    

       E_GIAM_QUIT_SUSPENSE      Giảm do tạm hoãn.  N-1                N-1

          E_GIAM_LD_BHYT         Giảm bảo hiểm trả  N-1                N-1
                                 thẻ kịp thời                          

     E_GIAM_LD_BHYT_KOKIPTHOI    Giảm lao động trả  N-1                N-1
                                 thẻ không kịp thời                    

    E_GIAM_LD_CHANGE_INSPLACE    Giảm lao động do   N-1                N-1
                                 đổi nơi đóng BH                       

   E_GIAM_LD_CHANGE_LEGALENTITY  Giảm LĐ do thay    N-1                N-1
                                 đổi pháp nhân                         

         E_CHANGEJOBNAME         Thay đổi chức danh N-1                N
                                 nghề                                  
  ---------------------------------------------------------------------------------------

### BC D02 VNPT

#### Cách lấy dữ liệu của báo cáo D02 VNPT

+------------------------------------------------------------------------------------------------------------------+
| **D02 VNPT**                                                                                                     |
+============================+=========================+===========================================================+
| Mã                         | Tên                     | Cách lấy dữ liệu                                          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume0]{.mark}  |                         | Stt                                                       |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume1]{.mark}  | Tên NV                  | ProfileName                                               |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume2]{.mark}  | Số sổ BH                | Profile.[SocialInsNo]{.mark}                              |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}  | Ngày sinh               | Profile.[DateOfBirth]{.mark}                              |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume4]{.mark}  | Giới Tính               | Profile.Gender                                            |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume5]{.mark}  | Chức danh , chức vụ     | Ins_ReportD02ItemV2.JobName                               |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume6]{.mark}  | Số thẻ BHYT             | Hre_HealthInsuranceCard.HealthInsNo                       |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume7]{.mark}  | Mức lương đầu kỳ        | Nếu Ins_ReportD02ItemV2.Type = E_TANG AND                 |
|                            |                         | Ins_ReportD02ItemV2.Status = E_TANG_LD 🡺 Null             |
|                            |                         |                                                           |
|                            |                         | Ngược lại là Ins_ReportD02ItemV2.OldBasicSalary           |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume8]{.mark}  | Mức lương cuối kỳ       | Nếu (Ins_ReportD02ItemV2.Type = E_TANG AND                |
|                            |                         | Ins_ReportD02ItemV2.Status = E_TANG_LD) **hoặc**          |
|                            |                         | Ins_ReportD02ItemV2.Type = (E_TANG_LUONG OR E_GIAM_LUONG) |
|                            |                         | 🡺 Ins_ReportD02ItemV2.NewBasicSalary                      |
|                            |                         |                                                           |
|                            |                         | Ngược lại 🡺 Null                                          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume9]{.mark}  |                         | INS_REPORTD02ITEMV2.Allowance1 +                          |
|                            |                         | INS_REPORTD02ITEMV2.Allowance2 +                          |
|                            |                         | INS_REPORTD02ITEMV2.Allowance3 +                          |
|                            |                         | INS_REPORTD02ITEMV2.Allowance4 +                          |
|                            |                         | INS_REPORTD02ITEMV2.[AllowanceAdditional]{.mark}          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume10]{.mark} |                         | INS_REPORTD02ITEMV2.Allowance1                            |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume11]{.mark} |                         | INS_REPORTD02ITEMV2.Allowance2                            |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume12]{.mark} |                         | INS_REPORTD02ITEMV2.Allowance3                            |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume13]{.mark} | Các khoản bổ sung       | INS_REPORTD02ITEMV2.[AllowanceAdditional]{.mark}          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume14]{.mark} | Từ tháng/năm            | **Nếu** (Ins_ReportD02ItemV2.Status = E_DieuChinhGiam     |
|                            |                         | **OR**                                                    |
|                            |                         |                                                           |
|                            |                         | Ins_ReportD02ItemV2. Status = E_DieuChinhTang)            |
|                            |                         |                                                           |
|                            |                         | **AND** IsPayBacks=1 🡺 Ins_ReportD02ItemV2.DateStart      |
|                            |                         |                                                           |
|                            |                         | **Ngược lại: 🡺** Ins_ReportD02ItemV2.MonthFrom            |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume15]{.mark} | Ghi chú                 | **Nếu** Ins_ReportD02ItemV2.Status = E_TANG_LD **OR**     |
|                            |                         | Ins_ReportD02ItemV2.Status = E_GIAM_TS **🡺**              |
|                            |                         |                                                           |
|                            |                         | Ins_ReportD02ItemV2.MonthFrom                             |
|                            |                         |                                                           |
|                            |                         | **Ngược lại 🡺** null                                      |
+----------------------------+-------------------------+-----------------------------------------------------------+
| VNPTD02V2Colume16          | Trả thẻ                 | B1: Lấy ra dòng dữ liệu trong bảng                        |
|                            |                         | Hre_HealthInsuranceCard thỏa:                             |
|                            |                         | Hre_HealthInsuranceCard.HealthInsIssueDate \<=            |
|                            |                         | Ins_ReportD02ItemV2.MonthTo &&                            |
|                            |                         | Hre_HealthInsuranceCard.HealthInsIssueDate lớn nhất       |
|                            |                         |                                                           |
|                            |                         | B2: Nếu Hre_HealthInsuranceCard.ReceiveHealthIns=1 🡺 "X"  |
|                            |                         |                                                           |
|                            |                         | Ngược lại 🡺 Null                                          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume17]{.mark} | Ngày trả thẻ            | B1: Lấy ra dòng dữ liệu trong bảng                        |
|                            |                         | Hre_HealthInsuranceCard thỏa:                             |
|                            |                         | Hre_HealthInsuranceCard.HealthInsIssueDate \<=            |
|                            |                         | Ins_ReportD02ItemV2.MonthTo &&                            |
|                            |                         | Hre_HealthInsuranceCard.HealthInsIssueDate lớn nhất       |
|                            |                         |                                                           |
|                            |                         | B2: Nếu Hre_HealthInsuranceCard.ReceiveHealthIns=1 🡺      |
|                            |                         | Hre_HealthInsuranceCard.ReceiveHealthInsDate              |
|                            |                         |                                                           |
|                            |                         | Ngược lại 🡺 Null                                          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume18]{.mark} | Tỉ lệ đóng              | Ins_ReportD02ItemV2.RateSocialIns +                       |
|                            |                         | Ins_ReportD02ItemV2.RateHealthIns +                       |
|                            |                         | Ins_ReportD02ItemV2.RateUnEmpIns                          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume]{.mark}19 | Ngày Sinh               | Nếu Hre_Profile.DayOfBirth = null or                      |
|                            |                         | Hre_Profile.MonthOfBirth = null 🡺 Hre_Profile.YearOfBirth |
|                            |                         |                                                           |
|                            |                         | Ngược lại 🡺                                               |
|                            |                         |                                                           |
|                            |                         | Hre_Profile.DateOfBirth                                   |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume20]{.mark} | Chỉ có năm sinh         | Nếu Hre_Profile.DayOfBirth = null or                      |
|                            |                         | Hre_Profile.MonthOfBirth = null 🡺 "X"                     |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume2]{.mark}1 | Giới tính               | Nếu Hre_Profile.Gender = E_MALE 🡺 1                       |
|                            |                         |                                                           |
|                            |                         | Nếu Hre_Profile.Gender = E_FEMALE 🡺 0                     |
|                            |                         |                                                           |
|                            |                         | Ngược lại 🡺 Null                                          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume2]{.mark}2 | Mã quốc tịch            | Hre_Profile.[NationalityID]{.mark} =\>Cat_Country.Code    |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume2]{.mark}3 | Mã Dân Tộc              | Hre_Profile.EthnicID=\> Cat_EthnicGroup.Code              |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume2]{.mark}4 | Mã Tỉnh bệnh viện       | B1: Lấy ra dòng dữ liệu trong bảng                        |
|                            |                         | Hre_HealthInsuranceCard thỏa:                             |
|                            |                         | Hre_HealthInsuranceCard.HealthInsIssueDate \<=            |
|                            |                         | Ins_ReportD02ItemV2.MonthTo &&                            |
|                            |                         | Hre_HealthInsuranceCard.HealthInsIssueDate lớn nhất       |
|                            |                         |                                                           |
|                            |                         | B2: Lấy Hre_HealthInsuranceCard[.ProvinceHospital]{.mark} |
|                            |                         | của dòng dữ liệu tìm được ở B1                            |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume2]{.mark}5 | Mã bệnh viện            | B1: Lấy ra dòng dữ liệu trong bảng                        |
|                            |                         | Hre_HealthInsuranceCard thỏa:                             |
|                            |                         | Hre_HealthInsuranceCard.HealthInsIssueDate \<=            |
|                            |                         | Ins_ReportD02ItemV2.MonthTo &&                            |
|                            |                         | Hre_HealthInsuranceCard.HealthInsIssueDate lớn nhất       |
|                            |                         |                                                           |
|                            |                         | B2: Lấy                                                   |
|                            |                         | Hre_HealthInsuranceCard.[HealthTreatmentPlaceCode]{.mark} |
|                            |                         | của dòng dữ liệu tìm được ở B1                            |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume2]{.mark}6 | Mã Tỉnh Nơi Sinh        | [Hre_Profile.PProvinceID =\> Cat_Province]{.mark}.Code    |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume2]{.mark}7 | Mã Huyện Nơi Sinh       | [Hre_Profile.PDistrictID =\> Cat_District]{.mark}.Code    |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume]{.mark}28 | Mã Xã Nơi Sinh          | [Hre_Profile. VillageID =\> Cat_Village]{.mark}.Code      |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume]{.mark}29 | CMND                    | Hre_Profile.IDNo                                          |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}0 | Ngày cấp CMND           | Hre_Profile.[IDDateOfIssue]{.mark}                        |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}1 | Mã Tĩnh Cấp             | Hre_Profile.[IDPlaceOfIssue]{.mark}                       |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}2 | Số nhà thường trú       | Hre_Profile.[PAddress]{.mark}                             |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}3 | Mã xã thường trú        | [Hre_Profile.VillageID =\> Cat_Village]{.mark}.Code       |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}4 | Mã quận thường trú      | [Hre_Profile.PDistrictID =\> Cat_District]{.mark}.Code    |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}5 | Mã tỉnh thường trú      | [Hre_Profile.PProvinceID =\> Cat_Province]{.mark}.Code    |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}6 | Số nhà tạm trú          | Hre_Profile.[TAddress]{.mark}                             |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume3]{.mark}7 | Mã phường tạm trú       | [Hre_Profile.TVillageID =\> Cat_Village]{.mark}.Code      |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume]{.mark}38 | Mã Quận tạm trú         | [Hre_Profile.TDistrictID =\> Cat_District]{.mark}.Code    |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume]{.mark}39 | Mã tỉnh tạm trú         | [Hre_Profile.TProvinceID =\> Cat_Province]{.mark}.Code    |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume]{.mark}40 | Mã Phương Án            | Ins_ReportD02ItemV2.Status =\> Ins_TypeD02.DisplayCode    |
|                            |                         | **Where Ins_ReportD02ItemV2.Status =                      |
|                            |                         | Ins_TypeD02.CommentCode**                                 |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume4]{.mark}1 | Tên Phương Án           | Ins_ReportD02ItemV2.Status =\> Ins_TypeD02.DisplayName    |
|                            |                         | **Where Ins_ReportD02ItemV2.Status =                      |
|                            |                         | Ins_TypeD02.CommentCode**                                 |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume42]{.mark} | Loại Bảo hiểm           | Ins_ReportD02ItemV2.Type                                  |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume43]{.mark} | Họ tên chủ hộ           | Hre_ProfileMoreInfo.HouseholderFullName                   |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume44]{.mark} | Số điện thoại           | Hre_ProfileMoreInfo.Telephone                             |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume45]{.mark} | Ngày sinh chủ hộ        | Hre_ProfileMoreInfo.HouseHoldDateOfBirth                  |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume46]{.mark} | Mã hộ gia đình          | Hre_ProfileMoreInfo.HouseHoldCode                         |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume47]{.mark} | Sổ hộ khẩu              | Hre_ProfileMoreInfo.HouseholdBookNo                       |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume48]{.mark} | Loại giấy tờ            | Hre_ProfileMoreInfo.PapersType                            |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Colume49]{.mark} | Quan hệ với chủ hộ      | Hre_ProfileMoreInfo.HouseHolderRelativeTypeID             |
|                            |                         | Cat_RelativeType.RelativeTypeName                         |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column50]{.mark} | Dân tộc                 | Hre_Profile.EthnicID =\> Cat_EthnicGroup.EthnicGroupName  |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column51]{.mark} | Mã Nhân Viên            | Hre_Profile.CodeEmp                                       |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column52]{.mark} | Ngày hiệu lực hợp       | Hre_Contract.DateStart                                    |
|                            | đồng(nếu không có phụ   |                                                           |
|                            | lục hợp đồng thì sẽ lấy |                                                           |
|                            | số hợp đồng)            |                                                           |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column53]{.mark} | Mã hợp đồng             | Hre_Contract.Code                                         |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column54]{.mark} | Nơi làm việc theo danh  | Cat_UnitStructure.UnitName                                |
|                            | sách khối               |                                                           |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column55]{.mark} | CellGroup               | Hre_Profile.BloodType                                     |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column56]{.mark} | Tên quận/huyện khai     | Cat_District.DistrictName                                 |
|                            | sinh                    |                                                           |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column57]{.mark} | Tên phường/xã khai sinh | Cat_Village.VillageName                                   |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column58]{.mark} | Tên tỉnh/thành địa chỉ  | Cat_Province.ProvinceName                                 |
|                            | liên hệ                 |                                                           |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column59]{.mark} | Tên quận/huyện liên hệ  | Cat_District.DistrictName                                 |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column60]{.mark} | Tên phường/xã liên hệ   | Cat_Village.VillageName                                   |
+----------------------------+-------------------------+-----------------------------------------------------------+
| [VNPTD02V2Column61]{.mark} | Số điện thoại của NV    | Hre_Profile.CellPhone                                     |
+----------------------------+-------------------------+-----------------------------------------------------------+

#### Nghiệp vụ phân tích đợt báo cáo D02 V2

- So sánh 2 đợt kề cận, nếu đợt trước không có dữ liệu sẽ so với đợt
  trước nửa.

![](../../../../src/Ins_TaiLieuBaoHiem_01_image45.png)

### Mẫu EBHXH

#### Mẫu EBHXH Tăng

+---------------------------------------------------------------------------------------------------------------------------------------------+
| Mẫu EBHXH Tăng                                                                                                                              |
+:========================:+:========================:+:=====================================================================================:+
| Mã                       | Tên                      | > Cách lấy dữ liệu                                                                    |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol0       | Stt                      | Stt                                                                                   |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol1       | Họ và tên                | Profile.ProfileName                                                                   |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol2       | Số định danh             | Profile.SocialInsNo                                                                   |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol3       | Ngày sinh                | Profile.DateOfBirth                                                                   |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol4       | Nữ(X)                    | Profile.Gender                                                                        |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol5       | Cấp bật, chức vụ, chức   | InsuranceMonthly.JobName                                                              |
|                          | danh nghề                |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol6       | Tiền đồng                | D02Item.NewBasicSalary                                                                |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol7       | Hệ số                    | DBNull.Value                                                                          |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol8       | CV                       | D02Item.Allowance1                                                                    |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol9       | TNVK                     | D02Item.Allowance2                                                                    |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol10      | TN Nghề                  | D02Item.Allowance3                                                                    |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol11      | Khác                     | D02Item.AllowanceAdditional                                                           |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol12      | Hiệu lực HD/QD Từ ngày   | Ins_ReportD02item.DateStart                                                           |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol13      | Hiệu lực HD/QD Đến ngày  | Ins_ReportD02item.DateEnd                                                             |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol14      | Loại tăng                | D02Item.Status                                                                        |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol15      | Số HD/QD tăng            | Ins_ReportD02item.DecisionNo                                                          |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol16      | Loại HD                  | insReportD02Item.DecisionType                                                         |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol17      | Ngày ký HD               | Ins_ReportD02item.DecisionDatesigned                                                  |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol18      | Tỉ lệ đóng               | 32.5                                                                                  |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol19      | Đối tượng                | "1"                                                                                   |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol20      | Tình trạng sổ BHXH       | Ins_ReportD02Item.Hre_Profile.SocialInsNo                                             |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol21      | Đóng BHXH cả tháng       | "X"                                                                                   |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol22      | Mã Tỉnh                  | Ins_ReportD02Item.Hre_Profile =\> Hre_HealthInsuranceCard.ProvinceHospital            |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol23      | Mã Bệnh viện             | Profile.[HealthTreatmentPlaceCode]{.mark}                                             |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol24      | Mã Quốc Tịch             | Hre_Profile.NationalityID =\> Cat_Country.Code                                        |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol25      | Tên dân tộc              | Hre_Profile.EthnicID =\> Cat_EthnicGroup.EthnicGroupName                              |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol26      | Số CMND                  | Hre_Profile.IDNo hoặc Hre_Profile.PassportNo                                          |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol27      | Ngày cấp                 | Ins_ReportD02Item.Hre_Profile.IDDateOfIssue                                           |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol28      | Mã tỉnh cấp              | Cat_Province.PProvinceID =\> PlaceOfIssueIDCode                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol29      | Tên Xã/Phường thường trú | pVillageName =\> Cat_Village.VillageName                                              |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol30      | Tên Quận/Huyện thường    | pDistrictName =\> Cat_District. DistrictName                                          |
|                          | trú                      |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol31      | Tên Tỉnh/TP thường trú   | pProvinceName =\> Cat_Province.ProvinceName                                           |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol32      | Số Nhà (địa chỉ thường   | Profile.PAddress                                                                      |
|                          | trú)                     |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol33      | Mã Phường/Xã thường trú  | pVillageCode                                                                          |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol34      | Mã Quận/Huyện thường trú | pDistrictCode                                                                         |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol35      | Mã Tĩnh/TP thường trú    | pProvinceCode                                                                         |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol36      | Số Nhà (địa chỉ tạm trú) | TAddress                                                                              |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol37      | Mã Phường/Xã tạm trú     | tVillageCode                                                                          |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol38      | Mã Quận/Huyện tạm trú    | tDistrictCode                                                                         |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol39      | Mã Tỉnh/TP tạm trú       | tProvinceCode                                                                         |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol40      | Số ĐT                    | Profile.HomePhone                                                                     |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol41      | Email                    | Profile.Email                                                                         |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol42      | Cha/Me                   | DBNull.Value                                                                          |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol43      | Thân Nhân Khác           | DBNull.Value                                                                          |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol44      | Mã nhân viên             | Profile.CodeEmp                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol45      | Số tài khoản             | Sal_SalaryInformation.AccountNo                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol46      | Ngân hàng                | Cat_Bank.BankName.BankName                                                            |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol47      | Chi nhánh ngân hàng      | Sal_SalaryInformation.BankBrandName                                                   |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol48      | Lương BHXH               | Ins_ReportD02Item.InsuranceSalary                                                     |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol49      | Phòng ban E_BRANCH       | Cat_OrgUnit.E_BRANCH (nếu không có dữ liệu sẽ lấy Cat_Orgstructure.OrgStructureName)  |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol50      | Nơi cấp bảo hiểm xã hội  | Hre_Profile.SocialInsIssuePlace                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol51      | Nơi ĐK khám bệnh         | Hre_Profile.HealthTreatmentPlace                                                      |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol52      | Mã ngân hàng             | Sal_SalaryInformation.BankID =\> Cat_Bank.BankCode                                    |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol53      | Mã chi nhánh ngân hàng   | Sal_SalaryInformation.BranchID =\> Cat_Branch.BranchCode                              |
|                          | của nhân viên            |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol54      | Tên Quốc Tịch            | Hre_Profile.Cat_Country =\> Cat_Country.nationallityName                              |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol55      | Tên Phường/Xã tạm trú    | tVillageName =\> Cat_Village.VillageName                                              |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol56      | Tên Quận/Huyện tạm trú   | tDistrictName =\> Cat_District.DistrictName                                           |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol57      | Tên Tỉnh/TP tạm trú      | pProvinceName =\> Cat_Province.ProvinceName                                           |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol58      | Mã Tỉnh/TP của chứng     | Hre_Profile.IDNoProvinceID =\> Cat_Province.Code                                      |
|                          | minh thư                 |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol59      | Tên Tỉnh/TP của chứng    | Hre_Profile.IDNoProvinceID =\> Cat_Province.ProvinceName                              |
|                          | minh thư                 |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol60      | Mã Quận/Huyện của chứng  | Hre_Profile.IDNoDistrictID =\> Cat_District.Code                                      |
|                          | minh thư                 |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol61      | Tên Quận/Huyện của chứng | Hre_Profile.IDNoDistrictID =\> Cat_District.DistrictName                              |
|                          | minh thư                 |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol62      | Mã Xã/Phường của chứng   | Hre_Profile.IDNoAVillageID =\> Cat_Village.Code                                       |
|                          | minh thư                 |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol63      | Tên Xã/Phường của chứng  | Hre_Profile.IDNoAVillageID =\> Cat_Village.VillageName                                |
|                          | minh thư                 |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol64      | Họ tên chủ hộ            | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseholderFullName                     |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol65      | Số điện thoại của chủ hộ | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.Telephone                               |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol66      | Số sổ hộ khẩu/ Số sổ tạm | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseholdBookNo                         |
|                          | trú                      |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol67      | Loại giấy tờ             | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.PapersType                              |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol68      | Tên tỉnh thành của       | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.ProvinceName |
|                          | ProfileMoreInfoID        |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol69      | Mã Tỉnh thành của        | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.Code         |
|                          | ProfileMoreInfoID        |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol70      | Tên quận huyện của       | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.DistrictName |
|                          | ProfileMoreInfoID        |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol71      | Mã quận huyện của        | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.Code         |
|                          | ProfileMoreInfoID        |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol72      | Tên phường xã của        | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.VillageName   |
|                          | ProfileMoreInfoID        |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol73      | Mã phường xã của         | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.Code          |
|                          | ProfileMoreInfoID        |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol74      | Tỉnh thành               | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseHoldCode                           |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol75      | Quận huyện               | Ins_ReportD02Item.RegionID.Code                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol76      |  Phường xã               | Ins_ReportD02Item.RegionID.RegionName                                                 |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol77      | Mã dân tộc               | Ins_ReportD02Item.ProfileID.EthnicID.Code                                             |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol78      | Hình thức báo tăng lao   | Ins_ReportD02Item.StatusName                                                          |
|                          | động                     |                                                                                       |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol79      | Ghi chú                  | Ins_TypeD02.DisplayName                                                               |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol80      | Số sổ BHXH               | Hre_Profile.SocialInsNo                                                               |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol81      | Mức lương cũ             | Ins_ReportD02Item.OldBasicSalary                                                      |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSTangCol82      | Mức lương mới            | Ins_ReportD02Item.NewBasicSalary                                                      |
+--------------------------+--------------------------+---------------------------------------------------------------------------------------+

#### Mẫu EBHXH Giảm

+-------------------------------------------------------------------------------------------------------------------------------------------+
| Mẫu EBHXH Giảm                                                                                                                            |
+:=======================:+:=======================:+:=====================================================================================:+
| Mã                      | Tên                     | Cách lấy dữ liệu                                                                      |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol0      | Stt                     | Stt                                                                                   |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol1      | Họ Và Tên               | Profile.ProfileName                                                                   |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol2      | Số Định Danh            | Profile.SocialInsNo                                                                   |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol3      | Ngày Sinh               | Profile.DateOfBirth                                                                   |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol4      | Nữ(X)                   | Profile.Gender                                                                        |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol5      | Cấp Bật ,Chức Vụ , Chức | InsuranceMonthly.JobName                                                              |
|                         | Danh Nghề               |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol6      | Tiền Đồng               | D02Item.NewBasicSalary                                                                |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol7      | Hệ Sô                   | DBNull.Value                                                                          |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol8      | CV                      | D02Item.Allowance1                                                                    |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol9      | TNVK                    | D02Item.Allowance2                                                                    |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol10     | TN Nghề                 | D02Item.Allowance3                                                                    |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol11     | Khác                    | D02Item.AllowanceAdditional                                                           |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol12     | Hiệu Lực HĐ/QĐ Từ Ngày  | Ins_ReportD02item.DateStart                                                           |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol13     | Hiệu Lực HĐ/QĐ Đến Ngày | Ins_ReportD02item.DateEnd                                                             |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol14     | Loại Giảm               | D02Item.Status                                                                        |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol15     | Số HĐ/QĐ Giảm           | insReportD02ItemV2.DecisionNo                                                         |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol16     | Ngày Quyết              | dateDecision                                                                          |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol17     | Tỉ Lệ Đóng              | 32.5                                                                                  |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol18     | Đã Báo Giảm             | DBNull.Value                                                                          |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol19     | Giảm                    |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol20     | Không Trả Thẻ BHYT      | "1"                                                                                   |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol21     | Mã Thẻ BHYT             | DBNull.Value                                                                          |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol22     | Ngày Trả Thẻ            | Hre_Profile.ReceiveHealthInsDate                                                      |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol23     | Từ                      | DBNull.Value                                                                          |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol24     | Đến                     | DBNull.Value                                                                          |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol25     | Thời Gian Thai Sản      | DBNull.Value                                                                          |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol26     | Mã nhân viên            | Profile.CodeEmp                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol27     | Số tài khoản            | Sal_SalaryInformation.AccountNo                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol28     | Ngân hàng               | Cat_Bank.BankName                                                                     |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol29     | Chi nhánh ngân hàng     | Sal_SalaryInformation.BankBrandName                                                   |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol30     | Lương BHXH              | insReportD02Item.InsuranceSalary                                                      |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol31     | Phòng ban E_BRANCH      | orgUnit_E_Brach                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol32     | Nơi cấp bảo hiểm xã hội | Hre_Profile.SocialInsIssuePlace                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol33     | Nơi ĐK khám bệnh        | Hre_Profile.HealthTreatmentPlace                                                      |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol34     | Quốc tịch nhân viên     | Hre_Profile.NationalityID =\> Cat_Country.CountryName                                 |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol35     | Tên tỉnh thành của      | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.ProvinceName |
|                         | ProfileMoreInfoID       |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol36     | Mã tỉnh thành của       | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.Code         |
|                         | ProfileMoreInfoID       |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol37     | Tên quận huyện của      | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.DistrictName |
|                         | ProfileMoreInfoID       |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol38     | Mã quận huyện của       | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.Code         |
|                         | ProfileMoreInfoID       |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol39     | Tên phường xã của       | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.VillageName   |
|                         | ProfileMoreInfoID       |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol40     | Mã phường xã của        | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.Code          |
|                         | ProfileMoreInfoID       |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol41     | Mã hộ gia đình          | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseHoldCode                           |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol42     | Mã vùng miền            | Ins_ReportD02Item.RegionID.Code                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol43     | Tên vùng miền           | Ins_ReportD02Item.RegionID.RegionName                                                 |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol44     | Mã dân tộc              | Ins_ReportD02Item.ProfileID.EthnicID.Code                                             |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol45     | Tháng năm               | dtMonthYear truyền từ view(kendoDateTimePicker) vào controller(function               |
|                         |                         | SearchiBHXHTangD02TS).                                                                |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol46     | Hình thức báo giảm lao  | Ins_ReportD02Item.StatusName                                                          |
|                         | động                    |                                                                                       |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol47     | Ghi chú                 | Ins_ReportD02Item.DisplayName                                                         |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol48     | Số sổ BHXH              | Hre_Profile.SocialInsNo                                                               |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol49     | Mã phương án            | Ins_TypeD02.StatusCode                                                                |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol50     | Điều chỉnh mức đóng BH  | Ins_ReportD02Item.OldBasicSalary                                                      |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol51     | Từ ngày                 | dateFrom                                                                              |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSGiamCol52     | Đến ngày                | dateTo                                                                                |
+-------------------------+-------------------------+---------------------------------------------------------------------------------------+

#### Mẫu EBHXH Điều chỉnh

+---------------------------------------------------------------------------------------------------------------------------------------------------+
| Mẫu EBHXH Điều chỉnh                                                                                                                              |
+:=========================+:===============================+:======================================================================================+
| Mã                       | Tên                            | Cách lấy dữ liệu                                                                      |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol0  | Stt                            | Stt                                                                                   |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol1  | Họ Và Tên                      | Profile.ProfileName                                                                   |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol2  | Số Định Danh                   | Profile.SocialInsNo                                                                   |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol3  | Ngày Sinh                      | Profile.DateOfBirth                                                                   |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol4  | Nữ(X)                          | Profile.Gender                                                                        |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol5  | Cấp Bật ,Chức Vụ , Chức Danh   | InsuranceMonthly.JobName                                                              |
|                          | Nghề                           |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol6  | Tiền Đồng                      | D02Item.NewBasicSalary                                                                |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol7  | Hệ Sô                          | DBNull.Value                                                                          |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol8  | CV                             | D02Item.Allowance1                                                                    |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol9  | TNVK                           | D02Item.Allowance2                                                                    |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol10 | TN Nghề                        | D02Item.Allowance3                                                                    |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol11 | Khác                           | D02Item.AllowanceAdditional                                                           |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol12 | Hiệu Lực HĐ/QĐ Từ Ngày         | Ins_ReportD02item.DateStart                                                           |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol13 | Hiệu Lực HĐ/QĐ Đến Ngày        | Ins_ReportD02item.DateEnd                                                             |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol14 | Loại Tăng                      | D02Item.Status                                                                        |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol15 | Số HĐ/QĐ Tăng                  | Ins_ReportD02item.DecisionNo                                                          |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol16 | Loại HĐ                        | insReportD02Item.DecisionType                                                         |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol17 | Ngày Kí HĐ                     | Ins_ReportD02item.DecisionDatesigned                                                  |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol18 | Tỉ Lệ Đóng                     | 32.5                                                                                  |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol19 | Đối Tượng                      | "1"                                                                                   |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol20 | Tình Trạng Sổ BHXH             | Ins_ReportD02Item.Hre_Profile.SocialInsNo                                             |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol21 | Đóng BHXH Cả Tháng             | "X"                                                                                   |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol22 | Mã Tĩnh                        | Ins_ReportD02Item.Hre_Profile =\> Hre_HealthInsuranceCard.ProvinceHospital            |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol23 | Mã Bệnh Viện                   | Profile.[HealthTreatmentPlaceCode]{.mark}                                             |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol24 | Mã Quốc Tịch                   | Hre_Profile.NationalityID =\> Cat_Country.Code                                        |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol25 | Tên Dân Tộc                    | Hre_Profile.EthnicID =\> Cat_EthnicGroup.EthnicGroupName                              |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol26 | Số CMND                        | Hre_Profile.IDNo hoặc Hre_Profile.PassportNo                                          |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol27 | Ngày Cấp                       | Ins_ReportD02Item.Hre_Profile.IDDateOfIssue                                           |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol28 | Mã Tĩnh Cấp                    | Cat_Province.PProvinceID =\> PlaceOfIssueIDCode                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol29 | Tên Xã/Phường thường trú       | pVillageName =\> Cat_Village.VillageName                                              |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol30 | Tên Quận/Huyện thường trú      | pDistrictName =\> Cat_District. DistrictName                                          |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol31 | Tên Tỉnh/TP thường trú         | pProvinceName =\> Cat_Province.ProvinceName                                           |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol32 | Số Nhà (địa chỉ thường trú)    | Profile.PAddress                                                                      |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol33 | Mã Phường/Xã thường trú        | pVillageCode                                                                          |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol34 | Mã Quận/Huyện thường trú       | pDistrictCode                                                                         |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol35 | Mã Tĩnh/TP thường trú          | pProvinceCode                                                                         |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol36 | Số Nhà (địa chỉ tạm trú)       | TAddress                                                                              |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol37 | Mã Phường/Xã tạm trú           | tVillageCode                                                                          |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol38 | Mã Quận/Huyện tạm trú          | tDistrictCode                                                                         |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol39 | Mã Tỉnh/TP tạm trú             | tProvinceCode                                                                         |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol40 | Số ĐT                          | Profile.HomePhone                                                                     |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol41 | Email                          | Profile.Email                                                                         |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol42 | Cha/Me                         | DBNull.Value                                                                          |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol43 | Thân Nhân Khác                 | DBNull.Value                                                                          |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol44 | Mã nhân viên                   | Profile.CodeEmp                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol45 | Số tài khoản                   | Sal_SalaryInformation.AccountNo                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol46 | Ngân hàng                      | Cat_Bank.BankName.BankName                                                            |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol47 | Chi nhánh ngân hàng            | Sal_SalaryInformation.BankBrandName                                                   |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol48 | Lương BHXH                     | Ins_ReportD02Item.InsuranceSalary                                                     |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol49 | Phòng ban E_BRANCH             | Cat_OrgUnit.E_BRANCH (nếu không có dữ liệu sẽ lấy Cat_Orgstructure.OrgStructureName)  |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol50 | Nơi cấp bảo hiểm xã hội        | Hre_Profile.SocialInsIssuePlace                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol51 | Nơi ĐK khám bệnh               | Hre_Profile.HealthTreatmentPlace                                                      |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol52 | Mã ngân hàng                   | Sal_SalaryInformation.BankID =\> Cat_Bank.BankCode                                    |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol53 | Mã chi nhánh ngân hàng của     | Sal_SalaryInformation.BranchID =\> Cat_Branch.BranchCode                              |
|                          | nhân viên                      |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol54 | Tên Quốc Tịch                  | Hre_Profile.Cat_Country =\> Cat_Country.nationallityName                              |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol55 | Tên Phường/Xã tạm trú          | tVillageName =\> Cat_Village.VillageName                                              |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol56 | Tên Quận/Huyện tạm trú         | tDistrictName =\> Cat_District.DistrictName                                           |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol57 | Tên Tỉnh/TP tạm trú            | pProvinceName =\> Cat_Province.ProvinceName                                           |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol58 | Mã Tỉnh/TP của chứng minh thư  | Hre_Profile.IDNoProvinceID =\> Cat_Province.Code                                      |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol59 | Tên Tỉnh/TP của chứng minh thư | Hre_Profile.IDNoProvinceID =\> Cat_Province.ProvinceName                              |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol60 | Mã Quận/Huyện của chứng minh   | Hre_Profile.IDNoDistrictID =\> Cat_District.Code                                      |
|                          | thư                            |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol61 | Tên Quận/Huyện của chứng minh  | Hre_Profile.IDNoDistrictID =\> Cat_District.DistrictName                              |
|                          | thư                            |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol62 | Mã Xã/Phường của chứng minh    | Hre_Profile.IDNoAVillageID =\> Cat_Village.Code                                       |
|                          | thư                            |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol63 | Tên Xã/Phường của chứng minh   | Hre_Profile.IDNoAVillageID =\> Cat_Village.VillageName                                |
|                          | thư                            |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol64 | Họ tên chủ hộ                  | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseholderFullName                     |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol65 | Số điện thoại của chủ hộ       | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.Telephone                               |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol66 | Số sổ hộ khẩu/ Số sổ tạm trú   | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseholdBookNo                         |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol67 | Loại giấy tờ                   | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.PapersType                              |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol68 | Tên tỉnh thành của             | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.ProvinceName |
|                          | ProfileMoreInfoID              |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol69 | Mã Tỉnh thành của              | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.Code         |
|                          | ProfileMoreInfoID              |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol70 | Tên quận huyện của             | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.DistrictName |
|                          | ProfileMoreInfoID              |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol71 | Mã quận huyện của              | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.Code         |
|                          | ProfileMoreInfoID              |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol72 | Tên phường xã của              | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.VillageName   |
|                          | ProfileMoreInfoID              |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol73 | Mã phường xã của               | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.Code          |
|                          | ProfileMoreInfoID              |                                                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol74 | Mã hộ gia đình                 | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseHoldCode                           |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol75 | Mức lương cũ                   | Ins_ReportD02Item.OldBasicSalary                                                      |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol76 | Quận huyện                     | Ins_ReportD02Item.RegionID.Code                                                       |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol77 | Phường xã                      | Ins_ReportD02Item.RegionID.RegionName                                                 |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+
| eBHXHD02TSDieuChinhCol78 | Mã dân tộc                     | Ins_ReportD02Item.ProfileID.EthnicID.Code                                             |
+--------------------------+--------------------------------+---------------------------------------------------------------------------------------+

### Mẫu BC BHXH đã chi trả

**Mục đích BC:** Xuất Danh sách chi trả tiền TC OD -- TS -- NDS của BHXH
đối với những chứng từ đã có Ngày thanh toán BH.

**Enum xuất BC của chứng từ theo từng nhân viên:**

- Họ tên: Ins_InsuranceRecord.ProfileID =\>
  Sal_SalaryInformation.AccountName

- MSNV: Ins_InsuranceRecord.ProfileID =\> Hre_Profile.CodeEmp

- Số TK: Ins_InsuranceRecord.ProfileID =\>
  Sal_SalaryInformation.AccountNo

- NHTH (Ngân hàng thụ hưởng): Mã Ngân hàng -- Tên Chi nhánh Ngân hàng

- Số tiền: Ins_InsuranceRecord.Amount

  - **SUM(Ins_InsuranceRecord.Amount)**

- Nội dung: Ins_InsuranceRecord.InsuranceType

**GHÉP CHUỔI (Ins_InsuranceRecord.InsuranceType) bằng dấu ';'**

**Xuất Phiếu:**

- Xuất nhiều sheet: Mỗi nhân viên với một chứng từ sẽ được xuất ra một
  sheet

- Xuất nhiều file excel(nén trong file .zip): Mỗi nhân viên ứng với một
  chứng từ sẽ được xuất ra một file excel và tất cả file này được nén
  trong file .zip

### BC C70A-HD

**Mục Đích C70A-HD :**

- Giải quyết trợ cấp ốm đau, thai sản, dưỡng sức, phục hồi sức khỏe đối
  với người lao động trong doanh nghiệp.

**Mô Tả Các Cột :**

> **Cột Lương BHXH** \[SalaryIns\] (Cột 5):

- **Thai sản các loại:** Lấy lương BH trung bình đóng BH 6 tháng gần
  nhất(Nếu số tháng đóng không đủ 6 tháng =\> lấy lương trung bình ứng
  với các tháng đóng)

- **Ngắn ngày, dài ngày, con ốm:** Lấy lương BHXH gần nhất

- **Dưỡng sức và LĐ nam hưởng trợ cấp vợ sanh:** SalaryIns =0

> **Note:** Cách lấy lương BHXH dựa vào ngày hiệu lực(ngày bắt đầu chứng
> từ)

- **Chứng từ thai Sản:**

  - InsRecord.DateStart \>15 =\> 15\[thang N+1\]

  - InsRecord.DateStart \<=15 =\> 15\[thang N\]

- **Chứng từ ngắn ngày,dài ngày, con ốm:**

  - tháng trước chưa tham gia BH =\> lấy tháng tham gia BH

  - Tháng trước đã tham gia BH =\> lấy tháng trước của ngày chứng
    từ(ngày 15)

> **Cột tiền (Số tiền trợ cấp trong kỳ)** (Cột 11):

- [Khám Thai , tránh thai]{.mark}

  - [(]{.mark}\[SalaryIns\] [/ 24) \*]{.mark} \[SoNgayNghiChungTu\]

- [Sảy Thai ,]{.mark} nạo hút thai, thai lưu

  - [(]{.mark}\[SalaryIns\] [/ 30) \*]{.mark} \[SoNgayNghiChungTu\]

- [Sinh con]{.mark},nữ mang thai hộ sinh con, nữ nhờ mang thai hộ nhận
  con

  - Số ngày nghỉ TS \<= 190 ngày :

    - \[SalaryIns\] \* 6 + \[LuongToiThieu\] \* \[HesoSinhCon\]

  - Số ngày nghỉ TS \> 190 :

    - \[SalaryIns\]\*\[SoThangNhan\]+\[LuongToiThieu\]\*\[HeSoCon\]

- Lao động nam hưởng trợ cấp 1 lần vợ sinh con

  - \[SalaryIns\] = 0 (không tính lương BHXH cho trường hợp này)

  - \[LuongToiThieu\]\* \[HesoSinhCon\]

- Lao động nam hưởng trợ cấp nghỉ khi vợ sinh(5 đến 14 ngày)

  - (\[SalaryIns\]/24)\*\[SoNgayNghi\]

- Ốm ngắn ngày , con ốm

  - (\[SalaryIns\]/\[24\])\*\[SoNgayNghi\]\*75%

- Dài ngày

> (\[SalaryIns\]/\[24\])\*TiLeC70A
>
> Trong đó : TiLeC70A = 180\*75%+(\[SoNgayNghi\] -180)\*HeSo
>
> Nếu là ốm dài ngày: \[SoNgayNghi\] bao gồm cả cuối tuần và ngày lễ

- Dưỡng Sức TS, TNLĐ, dưỡng sức ốm đau

  - \[LuongToiThieu\]\*\[SoNgayNghi\]\*RateRestore

> **Cột Luỹ kế từ đầu năm**:

- Ghi tổng số ngày được nghỉ hưởng chế độ cộng dồn từ đầu năm đến hết kỳ
  thanh toán.

**[Note:]{.underline}**

1.  HesoSinhCon : sinh đôi (4) , sinh thường (2)

2.  SoThangNhan : \[Số ngày TS\]/30

3.  HeSo :

    a.  Đóng \< 15 năm (45%)

    b.  Đóng \>15 năm đến 30 năm (55%)

    c.  Đóng \> 30 năm (65%)

4.  RateRestore

    a.  Nghỉ tại gia (30%)

    b.  Nghỉ tập trung (40%)

5.  LuongToiThieu : Lương tối thiểu trong cấu hình (gần với tháng kiểm
    tra nhất) \[Cat_ValueEntity\]

**Hạng Mục C70A:**

A.  Chế Độ Đau Ốm

B.  Chế Độ Thai Sản

C.  Dưỡng Sức Phục Hồi Sau Ốm

D.  Dưỡng Sức Phục Hồi Sau Sinh

E.  Dưỡng Sức Phục Hồi Sức Khoẻ Sau TNLĐ , Bệnh Nghề Nghiệp

**Logic C70A:**

- Lấy danh sách chứng từ trong 1 năm trở về trước (trong kỳ đang tính
  ),dùng để lấy luỹ kế

> ![](../../../../src/Ins_TaiLieuBaoHiem_01_image46.png)

###  Danh Sách Đóng BHXH

- Thể hiện danh sách nv đóng BH từ tháng đến tháng

- Dữ liệu lấy trong Ins_ProfileInsuranceMonthly

- Những thông tin thể hiện trong cột tháng:

  - Số tiền

  - Nghỉ Việc

    - Nghỉ Việc (nằm trong chu kỳ giảm lao động)

    - Chuyển nơi đóng BH

  - Nghỉ Thai Sản (dựa vào dữ liệu bảo hiểm)

  - Nghỉ \>= 14 ngày (dựa vào dữ liệu BH)

> Note: Nghiệp vụ đổi nơi đóng bảo hiểm trong báo cáo này : NV 001
> chuyển nơi đóng BH từ Vĩnh Phúc sang Hà Nam .

- Dòng 1 (Vĩnh Phúc) : cột số tiền thể hiện "Nghỉ Việc"

- Dòng 2 ( Hà Nam) : cột số tiền thể hiện "Số Tiền"

![](../../../../src/Ins_TaiLieuBaoHiem_01_image47.png)

###  DS NV Đủ Đk Tham Gia BH

- Lấy dữ liệu bảo hiểm (ins_ProfileInsuranceMonthly) theo tháng kiểm tra
  (có đóng BHXH)

- Duyệt danh sách nv trong dữ liệu bảo hiểm

  - Hiển thị dữ liệu NV

  - Nếu không đóng BHXH =\> set lương BHXH là null

  - Nếu không đóng BHYT =\> set lương BHYT là null

  - Nếu không đóng BHTN =\> set lương BHTN là null

![](../../../../src/Ins_TaiLieuBaoHiem_01_image48.png)

###  BC Kế Toán 01 ( chưa điều chỉnh BH)

- Lấy dữ liệu bảo hiểm có đóng BHXH (có mã chi phí Costcentre)

- Lọc dữ liệu theo mã chi phí

- Lọc dữ liệu **không điều chỉnh bảo hiểm**

> ![](../../../../src/Ins_TaiLieuBaoHiem_01_image49.png)

###  BC Kế Toán 02 (điều chỉnh bảo hiểm)

- Lấy dữ liệu bảo hiểm có đóng BHXH (và cả dữ liệu bảo hiểm không đóng
  BHXH có điều chỉnh BH)

- Lấy dữ liệu bảo hiểm (có mã chi phí Costcentre)

- Lọc dữ liệu theo mã chi phí

- Lọc dữ liệu bảo hiểm **có điều chỉnh**

> ![](../../../../src/Ins_TaiLieuBaoHiem_01_image50.png)

###  DS Chức Danh Tổng Hợp

- Lấy dữ liệu bảo hiểm tháng chọn (~~chỉ lấy những nv có lương
  BHXH(bỏ)~~)(theo monthYearEffect bằng tháng kiểm tra)

- Lấy danh sách BH tháng trước (tháng kiểm tra))(theo monthYearEffect
  bằng tháng kiểm tra)

- Duyệt danh sách BH đã điều chỉnh

  - Hiển thị thông tin NV

  - Không hiển thị những NV có :

    - Tháng check và tháng trước không đóng BHXH

    - ~~Tháng Check và tháng trước nghỉ thai sản (chưa nghỉ việc)(bỏ)~~

    - ~~Tháng Check và tháng trước nghỉ \>=14 ngày (chưa nghỉ
      việc)(bỏ)~~

    - ~~Bắt đầu nghỉ việc từ tháng trước so với tháng kiểm tra(bỏ)~~

![](../../../../src/Ins_TaiLieuBaoHiem_01_image51.png)

###  Bảo Hiểm Mở Rộng

- Lấy danh sách bảo hiểm theo từ tháng đến tháng

- Duyệt từ tháng đến tháng

  - Lấy DS BH theo tháng

  - Dòng đầu : dòng tháng (cột name)

    - Lấy tổng số NV (không đếm NV đã điều chỉnh bảo hiểm)

    - Tổng lương : Tổng lương BHXH (không điều chỉnh)

    - Tổng BHXH : tổng tiền BHXH NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh )

    - Tổng BHYT : tổng tiền BHYT NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh )

    - Tổng BHTN : tổng tiền BHTN NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh )

  - Dòng sau : dòng thể hiện các nơi đóng BH (lọc theo nơi đóng BH)

    - Lấy tổng số NV theo nơi đóng BH (Không cộng NV đã điều chỉnh BH)

    - Tổng lương : Tổng lương BHXH (không điều chỉnh) theo nơi đóng BH

    - Tổng BHXH : tổng tiền BHXH NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh ) theo nơi đóng BH

    - Tổng BHYT : tổng tiền BHYT NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh ) theo nơi đóng BH

    - Tổng BHTN : tổng tiền BHTN NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh ) theo nơi đóng BH

![](../../../../src/Ins_TaiLieuBaoHiem_01_image52.png)

###  BC DS NV Hưởng Trợ Cấp Nặng Nhọc , Độc Hại, Nguy Hiểm

###  BC Dữ Liệu HDT Lần 2

- Lấy dữ liệu bảo hiểm của tháng check ( nv có đóng BHXH)

- Lấy ds ngày nghỉ (leaveday) trong tháng check và thuộc loại ngày nghỉ
  không đóng BH

- Lấy ds HDTJob

[**\[Số ngày không làm HDTJob\]** = Số Ngày Trong Tháng - Số Ngày
Nghỉ(cat_dayoff theo th]{.mark}áng năm[) - Số Ngày Nghỉ leaveday
(kh]{.mark}ông đóng BHXH [theo profile) - (numday_HDTJob_4
+numday_HDTJob_5)]{.mark}

![](../../../../src/Ins_TaiLieuBaoHiem_01_image53.png)

###  BC Dữ Liệu TAS Lần 2

- Nghỉ 14 ngày (giống logic của phân tích bảo hiểm)

###  Dữ Liệu D02Type (Điều Chỉnh BH)

+-----------------------------------------------------------------------------------------------------------------------------+
| **Ins_TypeD02**                                                                                                             |
|                                                                                                                             |
| **Dữ Liệu Trạng Thái D02 (Điều Chỉnh BH)**                                                                                  |
+=================+=================+=================+=================+=================+=================+=================+
| STT             | TypeCode        | TypeName        | StatusCode      | StatusName      | Comment         | CommentCode     |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| 1               | E_Dieu_Chinh    | Điều Chỉnh      | E_DieuChinhTang | Điều Chỉnh Tăng | Truy Tăng       | E_DieuChinhTang |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| 2               | E_Dieu_Chinh    | Điều Chỉnh      | E_DieuChinhTang | Điều Chỉnh Tăng | Điều Chỉnh Tăng | E_DieuChinhTang |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| 3               | E_Dieu_Chinh    | Điều Chỉnh      | E_DieuChinhTang | Điều Chỉnh Tăng | Điều Chỉnh Tăng | E_DieuChinhTang |
|                 |                 |                 |                 |                 | Lương           |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| 4               | E_Dieu_Chinh    | Điều Chỉnh      | E_DieuChinhGiam | Điều Chỉnh Giảm | Truy Giảm       | E_DieuChinhGiam |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| 5               | E_Dieu_Chinh    | Điều Chỉnh      | E_DieuChinhGiam | Điều Chỉnh Giảm | Điều Chỉnh Giảm | E_DieuChinhGiam |
|                 |                 |                 |                 |                 | Lương           |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| 6               | E_Dieu_Chinh    | Điều Chỉnh      | E_DieuChinhGiam | Điều Chỉnh Giảm | Điều Chỉnh Giảm | E_DieuChinhGiam |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+

### BC D02 VIETTEL

I.  Ý NGHĨA BC D02 Viettel: tương tự như BC D02,

> Nhưng có điểm khác biệt để tránh nhằm lẫn BC Viettel và các báo cáo
> D02 khác, là BC D02 viettel không gôm Nhóm, và chỉ xử lý các trạng
> thái được cấu hình.

Mẫu BC cũng tương tự như các mẫu BC D02.

> Vẫn có các cột tiêu chí: đều giống như báo cáo D02.

Dữ liệu được lấy từ 2 bảng

a.  Bảng thông tin thẻ BHXH **(Hre_HealthInsuranceCard)**

+----------------------------------------------------------------------------------------------------------+
| **Hre_HealthInsuranceCard**                                                                              |
|                                                                                                          |
| **(Thẻ BHYT)**                                                                                           |
+:==================+==========================+===================+===================+===================+
| **Tên hiển thị**  | **Tên field**            | **Kiểu dữ liệu**  | **Khoá Ngoại**    | **Diễn giải**     |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | HealthInsNo              | NVarchar(50)      |                   | Số Sổ BHYT        |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | HealthInsIssueDate       | DateTime          |                   | Ngày Cấp BHYT     |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | HealthInsExpiredDate     | DateTime          |                   | Ngày Hết Hạn BHYT |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | HealthTreatmentPlace     | Nvarchar(100)     |                   | Nơi Đăng Ký Khám  |
|                   |                          |                   |                   | Bệnh              |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | HealthTreatmentPlaceCode | NVarchar(50)      |                   | Mã Bệnh Viện Đăng |
|                   |                          |                   |                   | Ký Khám           |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | IsPeriodicExamination    | bit               |                   | Khám Sức Khỏe     |
|                   |                          |                   |                   | Định Kỳ           |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | ReceiveHealthIns         | bit               |                   | Đã Trả Thẻ BHYT   |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | ReceiveHealthInsDate     | DateTime          |                   | Ngày Trả Thẻ BHYT |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | IsRegisterHealthIns      | bit               |                   | Tham Gia BHYT     |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                   | ProfileID                | uniqueidentifier  | Hre_Profile       |                   |
+-------------------+--------------------------+-------------------+-------------------+-------------------+
|                                                                                                          |
+----------------------------------------------------------------------------------------------------------+

b.  Bảng thông tin nhân viên **(Hre_Profile)**

II\. Dữ liệu sẽ được lây từ bảng Hre_HealthInsuranceCard đúng với điều
kiện.

Hre_HealthInsuranceCard.Hre_profileID = Ins_ReportD02Item.ProflerID lấy
nhân viên nhận xét

Hre_HealthInsuranceCard.HealthInsIssueDate \<= Ins_ReportD02Item.MonthTo

AND Hre_HealthInsuranceCard.HealthInsIssueDate Lấy ngày lớp nhất

Từ dữ liệu tìm kiếm bên trên xuất

Lấy các thông tin cần thiết của bảng nhân viên

- Dựa vào Hre_Profile.ID = Ins_ReportD02Item.ProfileID.

- Từ dữ liệu trả về Thông tin nhân viên thỏa điều kiện.

- Mã nhân viên = insReportD02Item.CodeEmp

- Tên nhân viên = insReportD02Item.ProfileName

- Giới tính = insReportD02Item.Gender

- Ngày sinh = insReportD02Item.DateOfBirth

- ..............

#### Cách lấy dữ liệu cho báo cáo D02 viettel.

+-------------------------------------------------------------------------------------------------------+
| **D02 VIETTEL**                                                                                       |
+:========================:+:=======================:+:================================================:+
| Mã                       | Tên                     | Cách lấy dữ liệu                                 |
+--------------------------+-------------------------+--------------------------------------------------+
| CodeEmp                  | Mã nhân viên            | insReportD02Item.CodeEmp                         |
+--------------------------+-------------------------+--------------------------------------------------+
| ProfileName              | Tên nhân viên           | insReportD02Item.ProfileName                     |
+--------------------------+-------------------------+--------------------------------------------------+
| Gender                   | Giới tính               | insReportD02Item.Gender                          |
+--------------------------+-------------------------+--------------------------------------------------+
| DateOfBirth              | Ngày sinh               | insReportD02Item.DateOfBirth                     |
+--------------------------+-------------------------+--------------------------------------------------+
| SocialInsNo              | Số sổ BH                | insReportD02Item.SocialInsNo                     |
+--------------------------+-------------------------+--------------------------------------------------+
| JobName                  | Tên công việc           | insReportD02Item.JobName                         |
+--------------------------+-------------------------+--------------------------------------------------+
| OrgStructureName         | Phòng ban               | insReportD02Item.OrgStructureName                |
+--------------------------+-------------------------+--------------------------------------------------+
| ProvinceName             | Tên tỉnh.               | insReportD02Item.ProvinceName                    |
+--------------------------+-------------------------+--------------------------------------------------+
| WorkPlaceName            | Tên nơi làm việc        | insReportD02Item.WorkPlaceName                   |
+--------------------------+-------------------------+--------------------------------------------------+
| MonthYear                |                         | insReportD02Item.MonthYear                       |
+--------------------------+-------------------------+--------------------------------------------------+
| NewBasicSalary           |                         | insReportD02Item.NewBasicSalary                  |
+--------------------------+-------------------------+--------------------------------------------------+
| OldAllowance1            | Phụ cấp 1 lương CB      | insReportD02Item.OldAllowance1                   |
+--------------------------+-------------------------+--------------------------------------------------+
| OldAllowance2            | Phụ cấp 2 lương CB      | insReportD02Item.OldAllowance2                   |
+--------------------------+-------------------------+--------------------------------------------------+
| OldAllowance3            | Phụ cấp 3 lương CB      | insReportD02Item.OldAllowance3                   |
+--------------------------+-------------------------+--------------------------------------------------+
| OldAllowance4            | Phụ cấp 4               | insReportD02Item.OldAllowance4                   |
+--------------------------+-------------------------+--------------------------------------------------+
| NewBasicSalary           | Tiền lương hiện mới     | insReportD02Item.NewBasicSalary                  |
+--------------------------+-------------------------+--------------------------------------------------+
| OldBasicSalary           | Tiền lương cũ           | insReportD02Item.OldBasicSalary                  |
+--------------------------+-------------------------+--------------------------------------------------+
| RateBHXH                 | Lương BHXH              | insReportD02Item.RateSocialIns                   |
+--------------------------+-------------------------+--------------------------------------------------+
| RateBHYT                 | Lương BHYT              | insReportD02Item.RateHealthIns                   |
+--------------------------+-------------------------+--------------------------------------------------+
| RateBHTN                 | Lương BHTN              | insReportD02Item.RateUnEmpIns                    |
+--------------------------+-------------------------+--------------------------------------------------+
| DisplayCode              | Mã PA                   | [Ins_TypeD02]{.mark}.DisplayCode                 |
+--------------------------+-------------------------+--------------------------------------------------+
| DisplayName              | Tên PA                  | [Ins_TypeD02]{.mark}.DisplayName                 |
+--------------------------+-------------------------+--------------------------------------------------+
| ProvinceHospital         | Mã tỉnh BV KCB          | Hre_HealthInsuranceCard.ProvinceHospital         |
+--------------------------+-------------------------+--------------------------------------------------+
| HealthTreatmentPlaceCode | Mã BV KCB               | Hre_HealthInsuranceCard.HealthTreatmentPlaceCode |
+--------------------------+-------------------------+--------------------------------------------------+
| HealthTreatmentPlace     | Tên BV KCB              | Hre_HealthInsuranceCard.HealthTreatmentPlace     |
+--------------------------+-------------------------+--------------------------------------------------+
| ReceiveHealthIns         | Trả thẻ                 | Hre_HealthInsuranceCard.ReceiveHealthIns         |
+--------------------------+-------------------------+--------------------------------------------------+
| HealthInsNo              | Thẻ BHYT                | Hre_HealthInsuranceCard.HealthInsNo              |
+--------------------------+-------------------------+--------------------------------------------------+
| NationalityID            | Mã quốc tịch            | Hre_Profile.NationalityID =\> Cat_Country.Code   |
+--------------------------+-------------------------+--------------------------------------------------+
| IDNo                     | CMND                    | Hre_Profile.IDNo                                 |
+--------------------------+-------------------------+--------------------------------------------------+
| [IDDateOfIssue]{.mark}   | Ngày cấp CMND           | Hre_Profile.[IDDateOfIssue]{.mark}               |
+--------------------------+-------------------------+--------------------------------------------------+
| [IDPlaceOfIssue]{.mark}  | Nơi cấp CMND            | Hre_Profile.[IDPlaceOfIssue]{.mark}              |
+--------------------------+-------------------------+--------------------------------------------------+
| [PAddress]{.mark}        | Số nhà thường trú       | Hre_Profile.[PAddress]{.mark}                    |
+--------------------------+-------------------------+--------------------------------------------------+
| [VillageID]{.mark}       | Mã xã/phường thường trú | [Hre_Profile.VillageID =\>                       |
|                          |                         | Cat_Village]{.mark}.Code                         |
+--------------------------+-------------------------+--------------------------------------------------+
| [PDistrictID]{.mark}     | Mã quận thường trú      | [Hre_Profile.PDistrictID =\>                     |
|                          |                         | Cat_District]{.mark}.Code                        |
+--------------------------+-------------------------+--------------------------------------------------+
| [PProvinceID]{.mark}     | Mã tỉnh thường trú      | [Hre_Profile.PProvinceID =\>                     |
|                          |                         | Cat_Province]{.mark}.Code                        |
+--------------------------+-------------------------+--------------------------------------------------+
| Comment                  | Ghi chú                 | insReportD02Item.Comment                         |
+--------------------------+-------------------------+--------------------------------------------------+

### 1.46.24 Chứng từ BH

![](../../../../src/Ins_TaiLieuBaoHiem_01_image54.emf)

# Báo cáo động

### Báo cáo theo dõi bảo hiểm cả năm\<0104728\>:

Goal: Xuất Báo cáo danh sách theo dõi bảo hiểm cả năm của nhân viên theo
mẫu

Nơi chứa store script:
3.3.Docs\\BaoCaoDong\\INS\\0104728_BCD_Year_Insurance_Report

![](../../../../src/Ins_TaiLieuBaoHiem_01_image55.png)

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

![](../../../../src/Ins_TaiLieuBaoHiem_01_image56.png)

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

![](../../../../src/Ins_TaiLieuBaoHiem_01_image57.png)

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

![](../../../../src/Ins_TaiLieuBaoHiem_01_image58.png)

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

![](../../../../src/Ins_TaiLieuBaoHiem_01_image59.png)

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

![](../../../../src/Ins_TaiLieuBaoHiem_01_image60.png)

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

![](../../../../src/Ins_TaiLieuBaoHiem_01_image61.png)

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

# Vấn Đề Bảo Hiểm

### Cấu hình Bảo Hiểm

![](../../../../src/Ins_TaiLieuBaoHiem_01_image62.png)

![](../../../../src/Ins_TaiLieuBaoHiem_01_image63.png)

+--------------------------------------------------------------------------------------+
| **Cấu hình Bảo Hiểm**                                                                |
+===========================+=========================+================================+
| Tên Cấu Hình              | DataType                | Mô Tả                          |
+---------------------------+-------------------------+--------------------------------+
| Chu Kỳ Báo Tăng LĐ Mới    | int                     | 16 \[Thang N-1\] -\> 15\[Thang |
|                           |                         | N\]                            |
+---------------------------+-------------------------+--------------------------------+
| Chu Kỳ Bảo Hiểm           | int                     | 16 \[Thang N-1\] -\> 15\[Thang |
|                           |                         | N\]                            |
+---------------------------+-------------------------+--------------------------------+
| Chu Kỳ Báo Giảm LĐ Nghỉ   | int                     |                                |
| Việc                      |                         |                                |
+---------------------------+-------------------------+--------------------------------+
| Chu Kỳ Thay Đổi Lương     | int                     | 16 \[Thang N-1\] -\> 15\[Thang |
|                           |                         | N\]                            |
+---------------------------+-------------------------+--------------------------------+
| Ngày Nghỉ Thai Sản        | string                  | Ngày Nghỉ hoặc chứng từ        |
+---------------------------+-------------------------+--------------------------------+
| Không KT Dữ Liệu BH       | bit                     | Không kt dữ liệu BH bằng lịch  |
|                           |                         | sử BH (đóng BH đủ 6 tháng      |
|                           |                         | trong 12 tháng)                |
+---------------------------+-------------------------+--------------------------------+
| Đếm Từ Ngày Nghỉ Việc Đến | bool                    | Đếm từ ngày nghỉ việc đến cuối |
| Cuối Tháng                |                         | tháng (14 ngày)                |
+---------------------------+-------------------------+--------------------------------+
| ~~Sử dụng công thức lương | ~~bool~~                | ~~Sử dụng cthuc Lương BHXH     |
| BHXH~~                    |                         | hoặc lấy lươngBHXH~~           |
+---------------------------+-------------------------+--------------------------------+
| **Có Đếm Ngày Nghỉ Để     | bool                    | Có đếm nghỉ \>=14 ngày         |
| Đóng BH**                 |                         |                                |
+---------------------------+-------------------------+--------------------------------+
| Chu Kỳ Đếm Số Ngày Nghỉ   | int                     | Chu kỳ 14 ngày (vd: ngày 1 đến |
| Không Lương \>=14 Ngày    |                         | ngày 31)                       |
+---------------------------+-------------------------+--------------------------------+
| Áp Dụng Theo Chế Độ Lương | bool                    | Có sử dụng chu kỳ nghỉ 14 ngày |
|                           |                         | trong chế độ lương             |
|                           |                         | (dateFrom,DateEnd)             |
+---------------------------+-------------------------+--------------------------------+
| **Số ngày nghỉ để không   | int                     | mặc định 14 ngày               |
| đóng BH**                 |                         |                                |
+---------------------------+-------------------------+--------------------------------+
| Dữ Liệu Tính Công         | bool                    | Đếm nghỉ \>=14 ngày dựa vào    |
|                           |                         | Att_Attendance                 |
+---------------------------+-------------------------+--------------------------------+
| **Xoá Dữ liệu Khi Phân    | bool                    | Xử Lý Nghiệp Vụ Điều Chỉnh     |
| tích Bảo Hiểm**           |                         | BH - Xoá Dữ liệu Khi Phân tích |
|                           |                         | Bảo Hiểm                       |
+---------------------------+-------------------------+--------------------------------+
| Phân tích cho nhân viên   | Bool                    | Phân tích cho Nv đã nhân bản,  |
| nhân bản                  |                         |                                |
+---------------------------+-------------------------+--------------------------------+
| **Dữ liệu ngày nghỉ dựa   | string                  | Nghỉ 14 ngày, E_LeaveDay,      |
| vào**                     |                         | E_WorkDay, E_InsuranceRecord   |
+---------------------------+-------------------------+--------------------------------+
| **Điều chỉnh bảo hiểm**                                                              |
+---------------------------+-------------------------+--------------------------------+
| **Xóa lịch sử bảo hiểm    | bool                    | Xử Lý Nghiệp Vụ Điều Chỉnh     |
| khi điều chỉnh**          |                         | BH - Xoá Dữ liệu lịch sử phân  |
|                           |                         | tích bảo hiểm khi điều chỉnh   |
|                           |                         | bảo hiểm                       |
+---------------------------+-------------------------+--------------------------------+
| **D02**                                                                              |
+---------------------------+-------------------------+--------------------------------+
| Xoá Dữ liệu Khi Phân tích | Bool                    | Xử Lý Nghiệp Vụ Điều Chỉnh     |
| D02TS                     |                         | BH - Xoá Dữ liệu Khi Phân tích |
|                           |                         | D02TS                          |
+---------------------------+-------------------------+--------------------------------+
| Tách BHTN khi khác mức    | bool                    | Tách BHTN khi khác mức đóng    |
| đóng                      |                         | (BHXH) {Dùng cho BC D02}       |
+---------------------------+-------------------------+--------------------------------+
| **Phân tích BH theo đợt** | bool                    | \- Khi tính toán điều chỉnh    |
|                           |                         | bảo hiểm -\> Lưu thêm vào báo  |
|                           |                         | cáo D02V2.                     |
|                           |                         |                                |
|                           |                         | \- Sử dụng cho chức năng phân  |
|                           |                         | tích bảo hiểm.                 |
+---------------------------+-------------------------+--------------------------------+
| Thay đổi pháp nhân theo   | string                  | \- Khi phân tích D02, 2 tháng  |
|                           |                         | liền kề không phải là đổi nơi  |
|                           |                         | đóng bảo hiểm sẽ xử lý thay    |
|                           |                         | đổi pháp nhân theo(công ty,    |
|                           |                         | cấp phòng ban công ty, cấp     |
|                           |                         | phòng ban chi nhánh).          |
|                           |                         |                                |
|                           |                         | \- Sử dụng cho chức năng phân  |
|                           |                         | tích tất báo cáo D02.          |
+---------------------------+-------------------------+--------------------------------+
| **Khác**                                                                             |
+---------------------------+-------------------------+--------------------------------+
| Chu kỳ C70A (từ)          | Int                     | 16 \[Thang N-1\] -\> 15\[Thang |
|                           |                         | N\]                            |
+---------------------------+-------------------------+--------------------------------+
| Chu kỳ C70A (đến)         | int                     | 16 \[Thang N-1\] -\> 15\[Thang |
|                           |                         | N\]                            |
+---------------------------+-------------------------+--------------------------------+
| Không làm mới thông tin   | bool                    | khi bấm nút lưu và tạo mới sẽ  |
| khi "Lưu và tạo mới"      |                         | không làm mới tất cả các field |
| chứng từ                  |                         | (ngoại trừ tên nhân viên)      |
+---------------------------+-------------------------+--------------------------------+

###  Phần Tử Bảo Hiểm

+-------------------------------------------------------------------------------------------------------------------------------+
| **Phần Tử Bảo Hiểm**                                                                                                          |
+:=====================================================+:===============================+:======================================+
| Mã Phần Tử                                           | Tên Phần Tử                    | Mô Tả                                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| **Tên công việc**                                                                                                             |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_SAL_BASICSALARY_JOBLEVEL                         |   -------------------          | Sal_BasicSalary.JobLevel (với         |
|                                                      |      Hệ số cấp bậc             | \[Sal_BasicSalary.Status =            |
|                                                      |      chức danh                 | "E_APPROVED"\])                       |
|                                                      |   -- ----------------          |                                       |
|                                                      |                                |                                       |
|                                                      |   -------------------          |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| **INS_JOBNAME_JOBTITLE**                             | Chức Danh                      | Tên Công Việc                         |
|                                                      |                                | (Cat_JobTitle.**JobTitleNameInLaw**)  |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| **INS_JOBNAME_POSITION**                             |   ---------                    | Tên Công Việc                         |
|                                                      |   Chức                         | (Cat_Position.**PositionNameInLaw**)  |
|                                                      |   Vụ                           |                                       |
|                                                      |   ------ --                    |                                       |
|                                                      |                                |                                       |
|                                                      |   ---------                    |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
|                                                      |                                |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_JOBNAME_NAMEOFRANK                               | Name Of Rank                   |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_JOBNAME_HDTGROUPNAME                             |   --------------------         | Honda                                 |
|                                                      |      Tên Nhóm Công             |                                       |
|                                                      |      Việc Nặng Nhọc            |                                       |
|                                                      |   -- -----------------         |                                       |
|                                                      |                                |                                       |
|                                                      |   --------------------         |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_JOBNAME_ORGSTRUCTURENAME                         | Tên Phòng Ban Cha              |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| **Tính lương BHXH**                                                                                                           |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| ATT_WORKDAY_HDTJOB_4                                 | Số ngày công làm HDT Job Loại  | Honda                                 |
|                                                      | 4 (tháng N)                    |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| ATT_WORKDAY_HDTJOB_5                                 | Số ngày công làm HDT Job Loại  | Honda                                 |
|                                                      | 5 (tháng N)                    |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| HR_START_DATE_HDTJOB                                 | Ngày vào làm HDT Job trong kỳ  | Honda                                 |
|                                                      | tính lương                     |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| HR_END_DATE_HDTJOB                                   | Ngày kết thúc HDT Job trong kỳ | Honda                                 |
|                                                      | tính lương                     |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| ATT_CUTOFFDURATION_MONTH                             | Tháng tính lương               |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| **INS_SALARY_INSURANCE_ROOT**                        | Lương đóng bảo hiểm gốc        | Lương BHXH mới nhất so với kỳ BH      |
|                                                      |                                | (Sal_InsuranceSalary.InsuranceAmount) |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_SALARY_INSURANCE_SENIORYEAR                      | Năm thâm niên                  | Tháng tính BH -- tháng bắt đầu đóng   |
|                                                      |                                | BH (profile.SocialInsDateReg) =\> số  |
|                                                      |                                | năm thâm niên (lấy phần nguyên)       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_CAT_SALARYRANK_RATE                              |   ------------------           | Cat_SalaryRank.**Rate**               |
|                                                      |      Hệ số bậc lương           |                                       |
|                                                      |      chi tiết                  | (chứa rankRateID trong                |
|                                                      |   -- ---------------           | Sal_BasicSalary với                   |
|                                                      |                                | \[Sal_BasicSalary.Status =            |
|                                                      |   ------------------           | "E_APPROVED"\] )                      |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_JOBNAME_HDTJOBMONEY                              | Tiền công việc nặng nhọc       | Honda                                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_JOBNAME_NUMDAYNONHDTJOB                          | Số ngày không làm việc HDTJob  | Honda                                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_HDT4_TIMELINE                                    | Số tiền HDT4 theo timeline     | Honda                                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_HDT5_TIMELINE                                    | Số tiền HDT5 theo timeline     | Honda                                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| INS_ALLOWANCE_AMOUNT1                                | Số tiền Phụ Cấp 1              | Lấy 15 phụ cấp trong lương cơ bản     |
|                                                      |                                | (các cột Sal_BasicSalary.             |
|                                                      |                                | [E_AllowanceAmount]{.mark} ...)       |
|                                                      |                                |                                       |
|                                                      |                                | **Note**: lương cơ bản có ngày hiệu   |
|                                                      |                                | lực trước ngày cuối tháng kiểm tra và |
|                                                      |                                | trạng thái là E_APPROVED              |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT2                                | Số tiền Phụ Cấp 2              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT3                                | Số tiền Phụ Cấp 3              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT4                                | Số tiền Phụ Cấp 4              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT5                                | Số tiền Phụ Cấp 5              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT6                                | Số tiền Phụ Cấp 6              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT7                                | Số tiền Phụ Cấp 7              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT8                                | Số tiền Phụ Cấp 8              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT9                                | Số tiền Phụ Cấp 9              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT10                               | Số tiền Phụ Cấp 10             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT11                               | Số tiền Phụ Cấp 11             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT12                               | Số tiền Phụ Cấp 12             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT13                               | Số tiền Phụ Cấp 13             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT14                               | Số tiền Phụ Cấp 14             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT15                               | Số tiền Phụ Cấp 15             |                                       |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| PC1                                                  | Mã phụ cấp [động]{.mark} trong | Sal_BasicSalary.Status =              |
|                                                      | lương cơ bản                   | "**E_APPROVED**" .                    |
|                                                      |                                |                                       |
|                                                      |                                | Sal_BasicSalary.AllowanceType1ID      |
|                                                      |                                |                                       |
|                                                      |                                | \- AllowanceType1ID dựa vào           |
|                                                      |                                | Cat_UsualAllowance.Code (vd: PC1)     |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| PC2                                                  | Mã phụ cấp [động]{.mark} trong | Sal_BasicSalary.Status = "E_APPROVED" |
|                                                      | lương cơ bản                   | .                                     |
|                                                      |                                |                                       |
|                                                      |                                | Sal_BasicSalary.AllowanceType2ID      |
|                                                      |                                |                                       |
|                                                      |                                | \- AllowanceType1ID dựa vào           |
|                                                      |                                | Cat_UsualAllowance.Code (vd: PC2)     |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| [INS_SALARY_INSURANCE_ALLOWANCE1]{.mark}             | PC1 của Lương BHXH             | Sal_InsuranceSalary.Allowance1 (sau   |
|                                                      |                                | khi phân tích lương BHXH sẽ có dữ     |
|                                                      |                                | liệu này \[Sakurai\])                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| [INS_SALARY_INSURANCE_ALLOWANCE]{.mark}2             | PC2 của Lương BHXH             | Sal_InsuranceSalary.Allowance2(sau    |
|                                                      |                                | khi phân tích lương BHXH sẽ có dữ     |
|                                                      |                                | liệu này \[Sakurai\])                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| [INS_SALARY_INSURANCE_ALLOWANCE]{.mark}3             | PC3 của Lương BHXH             | Sal_InsuranceSalary.Allowance3(sau    |
|                                                      |                                | khi phân tích lương BHXH sẽ có dữ     |
|                                                      |                                | liệu này \[Sakurai\])                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| [INS_SALARY_INSURANCE_ALLOWANCE]{.mark}4             | PC4 của Lương BHXH             | Sal_InsuranceSalary.Allowance4(sau    |
|                                                      |                                | khi phân tích lương BHXH sẽ có dữ     |
|                                                      |                                | liệu này \[Sakurai\])                 |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| \[PC_DieuChinh\] (mã tuỳ chỉnh)                      | Mã phụ cấp phát sinh           | Lấy phụ cấp theo nhân viên            |
|                                                      | (Cat_UnusualAllowanceCfg.Code) | (Sal_UnusualAllowance.Amount)         |
|                                                      |                                |                                       |
|                                                      |                                | Với mã phụ cấp                        |
|                                                      |                                | (Cat_UnusualAllowanceCfg.Code) :      |
|                                                      |                                | Sal_UnusualAllowance.UnusualEDTypeID  |
|                                                      |                                | = Cat_UnusualAllowanceCfg.ID (điều    |
|                                                      |                                | kiện lấy                              |
|                                                      |                                |                                       |
|                                                      |                                | phụ cấp : ngày bắt đầu pc trước(hoặc  |
|                                                      |                                | bằng) ngày kết thúc chu kỳ lương của  |
|                                                      |                                | bh && ngày kết thúc pc phải sau(hoặc  |
|                                                      |                                | bằng) ngày bắt đầu chu kỳ lương (lấy  |
|                                                      |                                | giao kỳ PC và kỳ lương BH)            |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| **Nghỉ 14 ngày**                                                                                                              |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| \[INS_14DAYS_INSURANCE_STDWORKDAYCOUNT\]             | Công chuẩn (ngày)              | Att_AttendanceTable.StdWorkDayCount   |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| \[INS_14DAYS_INSURANCE_REALWORKDAYCOUNT\]            | Công thực tế (ngày)            | Att_AttendanceTable.RealWorkDayCount  |
|                                                      |                                | (sau tính công hoặc import công sẽ có |
|                                                      |                                | dữ liệu này)                          |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| \[INS_14DAYS_INSURANCE_PAIDWORKDAYCOUNT\]            | Công tính lương (ngày)         | Att_AttendanceTable.PaidWorkDayCount  |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| \[INS_14DAYS_INSURANCE_TOTALUNPAIDLEAVEDAYNOTSHIFT\] | Tổng số ngày nghỉ (không ca)   | Đếm số ngày nghỉ trong Att_Leaveday   |
|                                                      |                                | theo chu kỳ nghỉ 14 ngày              |
|                                                      |                                | (Att_Leaveday.DateEnd -               |
|                                                      |                                | Att_Leaveday.DateStart):              |
|                                                      |                                | Att_Leaveday.LeavedayType =\>         |
|                                                      |                                | Cat_LeaveDayType.PaidRate = 0         |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| \[INS_PROFILE_COMPARE_DATEEND_PROBATION\]            | Có thử việc trong kỳ tăng LĐ   | Kiểm tra NV có DateEndProbation và    |
|                                                      | mới                            | DateHire nằm trong chu kỳ tăng LĐ     |
+------------------------------------------------------+--------------------------------+---------------------------------------+
| Lưu ý: các mã phần tử không được có khoảng trắng                                                                              |
+-------------------------------------------------------------------------------------------------------------------------------+

###  Các Vấn Đề BH Thường Gặp

1.  Phân tích BH

+-------------------------------------------------------------------------------------------------------------------+
| **Lỗi Thường Gặp BHXH**                                                                                           |
+:========================+:===========================================================+:===========================+
| Mã Phần Tử              | Tên Phần Tử                                                | Mô Tả                      |
+-------------------------+------------------------------------------------------------+----------------------------+
| Err_001                 | **Chức danh theo luật không thể để trống**                 | Xem lại danh mục \>\> chức |
|                         |                                                            | danh, không được để trống  |
|                         |                                                            | chức danh theo luật        |
+-------------------------+------------------------------------------------------------+----------------------------+
| Err002                  | **Chức vụ theo luật không thể để trống**                   | Xem lại danh mục \>\> chức |
|                         |                                                            | vụ, không được để trống    |
|                         |                                                            | chức vụ theo luật          |
+-------------------------+------------------------------------------------------------+----------------------------+
| Err003                  | **Chưa tổng hợp công**                                     | Tổng hợp công tháng chọn   |
|                         |                                                            | trước khi phân tích bảo    |
|                         |                                                            | hiểm                       |
+-------------------------+------------------------------------------------------------+----------------------------+
| Err004                  | **công thức lương BH không thể parse**                     | Xem lại công thức bảo hiểm |
|                         |                                                            | trong chế độ lương         |
+-------------------------+------------------------------------------------------------+----------------------------+
| Err005                  | **Công thức tên công việc không thể parse do tên theo luật | tên theo luật không thể để |
|                         | bị null**                                                  | trống                      |
+-------------------------+------------------------------------------------------------+----------------------------+
| Err006                  | **Currency VND / USD not found**                           | Tiền tệ (Cat_Currency) đã  |
|                         |                                                            | chỉnh sửa tiền tệ, trong   |
|                         |                                                            | khi lương BHXH vẫn tham    |
|                         |                                                            | chiếu tiền tệ cũ           |
+-------------------------+------------------------------------------------------------+----------------------------+
| Err007                  | **Employee Code \[00121\]. ElementList :                   | Cấu hình công thức sai     |
|                         | INS_SALARY_INSURANCE_ROOT : 8000000 , Formular :           | \[Ele1\]+\[Ele2\]+\[Ele3\] |
|                         | \[Ele1\]+\[Ele2\]+\[Ele3\]+\[INS_SALARY_INSURANCE_ROOT\]** | không tồn tại              |
+-------------------------+------------------------------------------------------------+----------------------------+
| Err008                  | **Nơi đóng bảo hiểm không thể để trống**                   | Nơi đóng bảo hiểm không    |
|                         |                                                            | thể để trống trong màn     |
|                         |                                                            | hình chỉnh sửa nhân viên   |
+-------------------------+------------------------------------------------------------+----------------------------+
|                         |                                                            |                            |
+-------------------------+------------------------------------------------------------+----------------------------+

# Biểu đồ Code (Kỹ Thuật)

## Xử Lý Phân Hệ Bảo Hiểm Tổng Quát

![](../../../../src/Ins_TaiLieuBaoHiem_01_image64.png)

## Xử Lý Phân Hệ Bảo Hiểm

- Mối liên hệ xử lý giữa các lớp trong phân hệ bảo hiểm

- Tách phần nghỉ \>= 14 ngày để sau này dễ dàng thêm hoặc sửa (dùng
  builder Pattern)

![](../../../../src/Ins_TaiLieuBaoHiem_01_image65.png)

## Khởi Tạo Nghỉ 14 Ngày

![](../../../../src/Ins_TaiLieuBaoHiem_01_image66.png)

## Phân tích Bảo Hiểm

![](../../../../src/Ins_TaiLieuBaoHiem_01_image67.png)

## Phân tích D02

![](../../../../src/Ins_TaiLieuBaoHiem_01_image68.png)

## Báo Cáo C70A-HD

![](../../../../src/Ins_TaiLieuBaoHiem_01_image69.png)

###  Sequence Diagram

![](../../../../src/Ins_TaiLieuBaoHiem_01_image70.png)

**LOGIC D02TS**

**TĂNG**

1.  **Tăng Lao Động**

    a.  Tháng N-1 nghỉ \> 14 ngày

        i.  HĐ đóng BHXH trong khoảng 1-\>31 tháng N =\> [Tăng
            LĐ]{.underline}

        ii. HĐ đóng BHXH không nào trong khoảng 1-\>31 tháng N =\> [Tăng
            nghỉ 14 ngày đi làm lại]{.underline}

    b.  Tháng N-1 không nghỉ \>14 ngày

        i.  HĐ có đóng BHXH (đầu tiên) trong khoảng 18 tháng N-1 đến 17
            tháng N =\> [Tăng LĐ]{.underline}

2.  **Tăng Thai Sản**

    a.  Dựa vào công hoặc chứng từ bảo hiểm

3.  **Tăng Bệnh**

    a.  Ngắn ngày hay dài ngày và nghỉ hơn 30 ngày

4.  **Tăng BHYT**

5.  **Tăng BHTN**

    a.  HĐ đóng BHTN (đầu tiên) của NV trong khoảng 16 tháng N-1 đến 15
        tháng N

**GIẢM**

1.  **Giảm LĐ** (Nghỉ Việc) \[Từ 16 tháng N-1 đến 15 tháng N\]

    a.  [Nghỉ Việc]{.underline}

    b.  [Tạm Hoãn]{.underline}

2.  **Giảm Thai Sản**

    a.  Giảm Thai Sản và nghỉ luôn

        i.  Giảm TS và nghỉ việc từ 16 tháng N-1 đến 15 tháng N

    b.  Giảm Thai Sản

        i.  Kiểm tra NV đóng BHXH đủ 6 tháng trong 12 tháng liền kề

            1.  Có: =\> [Giảm Thai Sản]{.underline}

            2.  Không =\> kiểm nghỉ 14 ngày =\>[Giảm do nghỉ hơn 14
                ngày]{.underline}

3.  **Giảm Bệnh (thiếu dựa vào công)**

    a.  Chứng từ bảo hiểm nghỉ hơn 30 ngày (dài ngày hoặc ngắn ngày)

> ?? có tính ca làm việc không!!

4.  **Giảm do nghỉ 14 ngày**

## Chứng từ BHXH

![](../../../../src/Ins_TaiLieuBaoHiem_01_image71.emf)
