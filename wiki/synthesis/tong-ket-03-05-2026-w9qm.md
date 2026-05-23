---
description: "Tổng kết ngày 03/05/2026: nghiên cứu ETL nền tảng, Mockoon API Mock và cập nhật wiki health check."
type: tong-hop
code: w9qm
tags:
  - "tong-ket"
  - "etl"
  - "mockoon"
  - "api-mock"
  - "data-warehouse"
  - "testing"
sources-wiki:
  - "wiki/synthesis/etl-kien-thuc-nen-tang-Research-20260503-k7qm"
  - "wiki/synthesis/Mockoon-API-Mock-Research-20260503-p4kx"
  - "wiki/overview"
  - "wiki/log"
created: 2026-05-03
updated: 2026-05-03
related:
  - "[[wiki/synthesis/etl-kien-thuc-nen-tang-Research-20260503-k7qm]]"
  - "[[wiki/synthesis/Mockoon-API-Mock-Research-20260503-p4kx]]"
  - "[[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]]"
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/concepts/AI-DevTools]]"
---

# Tổng kết ngày 03/05/2026

## Document History

| Ngày | Phiên bản | Mô tả | Người tạo |
|------|-----------|-------|-----------|
| 03/05/2026 | 1.0.0 | Tạo tài liệu | Tung.Ly |

---

## Nội dung – Content

- [1. Giới thiệu tài liệu](#1-giới-thiệu-tài-liệu)
  - [1.1 Mục tiêu tài liệu](#11-mục-tiêu-tài-liệu)
  - [1.2 Từ viết tắt](#12-từ-viết-tắt)
- [2. Bức tranh toàn cảnh](#2-bức-tranh-toàn-cảnh)
- [3. Các điểm cốt lõi](#3-các-điểm-cốt-lõi)
- [4. Biểu đồ](#4-biểu-đồ)
  - [4.1 Biểu đồ số liệu](#41-biểu-đồ-số-liệu)
- [5. Quy luật & Mâu thuẫn](#5-quy-luật--mâu-thuẫn)
- [6. Khuyến nghị](#6-khuyến-nghị)

---

# 1. Giới thiệu tài liệu

## 1.1 Mục tiêu tài liệu

Tổng kết hoạt động nghiên cứu ngày 03/05/2026 — dành cho developer HRM muốn nắm nhanh 2 chủ đề được đào sâu hôm nay: ETL pipeline thực chiến tại VnR và giải pháp Mockoon mock API. Tài liệu nêu bật khoảng cách nguy hiểm giữa cam kết kỹ thuật PTSC và năng lực thực tế hiện có.

## 1.2 Từ viết tắt

| STT | Thuật ngữ | Ý nghĩa |
|-----|-----------|---------|
| 1 | ETL | Extract – Transform – Load (quy trình tích hợp dữ liệu) |
| 2 | ELT | Extract – Load – Transform (biến thể hiện đại, load trước, transform sau) |
| 3 | CDC | Change Data Capture — đọc dữ liệu gia tăng qua thay đổi |
| 4 | DWH | Data Warehouse — kho dữ liệu phân tích |
| 5 | PTSC | Khách hàng đấu thầu 2026 — yêu cầu CDC/Incremental pipeline |
| 6 | HRM | Phần mềm Quản lý Nhân sự của VnResource |
| 7 | Mockoon | Công cụ mock API server chạy local, không chạm DB |
| 8 | VnR | VnResource — công ty phát triển HRM |

---

# 2. Bức tranh toàn cảnh

Hôm nay tập trung vào 2 mảng kỹ thuật nền tảng thường bị bỏ qua trong context HRM: **ETL pipeline** và **API mock testing**. Cả hai đều có mẫu số chung đáng ngại: VnR đã làm được bước đầu tiên (demo Talend 2024, tài liệu Mockoon do Tú.Huỳnh viết) nhưng **dừng lại đúng chỗ quan trọng nhất** — không có Transform layer cho ETL, không có test strategy rõ ràng cho mock.

Điều không hiển nhiên: Hệ thống HRM đang tồn tại một **"shadow ETL pipeline"** — API động đã làm Extract layer, raw tables DWH đã được tạo — nhưng toàn bộ team không nhận ra mình đã làm 2/3 ETL vì không gọi nó là ETL. Trong khi đó, cam kết CDC với PTSC đã được ký vào tài liệu giải pháp, tạo ra một khoảng trống nghiêm trọng giữa trạng thái thực tế và trạng thái đã cam kết.

---

# 3. Các điểm cốt lõi

### 1. Shadow ETL Pipeline — VnR đang làm ETL mà không biết

**Mô tả chi tiết**: Ngày 30/10/2024, team VnR tạo API động cho phép Extract qua URL: `GET /api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_AttendanceMonth`. Kết quả tạo ra 2 raw tables trong DWH: `dbo_raw__stream_API_CustomByStore_AttendanceMonth` và `dbo_raw__stream_Profile_Birthday`. Đây là Extract layer hoàn chỉnh — nhưng không được gọi là ETL, không được document như ETL, và không có Transform layer tiếp theo.

**Tại sao quan trọng**: Đây không phải thiếu năng lực — đây là thiếu **nhận thức về việc mình đang làm gì**. Team đã xây Extract + Load nhưng gọi nó là "API lấy dữ liệu" thay vì "ETL pipeline". Hậu quả: không có governance, không có error handling, không có roadmap hoàn thiện Transform.

**Rủi ro / Tác động**: DWH hiện có là dump site dữ liệu thô. Nếu team báo cáo dựa trên raw tables này → số liệu sai vì chưa có Transform chuẩn hóa. Nếu có SE mới join, họ sẽ không biết pipeline này tồn tại.

**Nguồn**: [[wiki/synthesis/etl-kien-thuc-nen-tang-Research-20260503-k7qm]] | **Độ tin cậy**: Dữ kiện

---

### 2. Cam kết CDC với PTSC — Ký rồi nhưng chưa có implementation

**Mô tả chi tiết**: Tài liệu giải pháp PTSC §3 Core yêu cầu VnR hỗ trợ **Incremental Data Extraction** qua Watermark/Timestamp (`Last_Updated_Date`), Version-based và Change Log từ DB trigger. API phải hỗ trợ tham số `updated_since=`, backfill/replay theo Time Window, và cover đầy đủ Insert/Update/Delete kể cả soft-delete. Trong khi đó, 3 job Talend thực hành năm 2024 đều là **full-load** — không có incremental job nào.

**Tại sao quan trọng**: Đây là mâu thuẫn giữa tài liệu đã ký và năng lực thực tế. HRM đã từng có timezone bug (Mantis #87680) làm lệch phân tích BH sang tháng khác — risk trực tiếp cho CDC nếu timezone không nhất quán.

**Rủi ro / Tác động**: Khi PTSC yêu cầu demo CDC hoặc bắt đầu implementation phase — VnR không có gì để show. Còn nghiêm trọng hơn: nếu bảng HRM thiếu `LastUpdated` field hoặc soft-delete không được track, cam kết PTSC §3 cần renegotiate.

**Nguồn**: [[wiki/synthesis/etl-kien-thuc-nen-tang-Research-20260503-k7qm]] + [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] | **Độ tin cậy**: Dữ kiện

---

### 3. Mockoon — Giải pháp POST an toàn, 60% test case không cần DB

**Mô tả chi tiết**: Mockoon là mock HTTP server chạy local — request đến `localhost:3001` bị "nuốt" và trả response cấu hình sẵn, DB thật không bao giờ bị chạm. Với HRM, mỗi POST API test không dùng mock = 1 record rác trong bảng như `Ins_ProfileInsuranceMonthly` hay `Hre_Profile`. Qua nghiên cứu: ~60% test case (interface test, error handling, LLM parsing) có thể dùng mock hoàn toàn. Chỉ 25% cần DB test tách biệt với seed data kiểm soát, 15% cần DB thật cho UAT final.

**Tại sao quan trọng**: Vấn đề không phải là kỹ thuật Mockoon — mà là team chưa có **test strategy phân loại rõ ràng**. Khi không có phân loại, default luôn là "gọi API thật" và rủi ro tích lũy theo sprint.

**Rủi ro / Tác động**: 100 lần test POST không dùng mock = 100 record rác. Nếu record này trigger downstream logic (tính BH, lương) → tháng sau báo cáo sai, khó trace nguyên nhân.

**Nguồn**: [[wiki/synthesis/Mockoon-API-Mock-Research-20260503-p4kx]] | **Độ tin cậy**: Dữ kiện

---

### 4. Talend vs API HRM Tự xây — Quyết định thiếu framework

**Mô tả chi tiết**: Tài liệu nội bộ liệt kê 10 công cụ ETL (NiFi, Talend, Airflow, Spark...) nhưng không có trọng số hay framework chọn lựa. Talend Open Studio được chọn thực hành có vẻ vì "quen tay" (học trước), không phải vì so sánh có hệ thống. Trong khi đó, API HRM tự xây đang đạt điểm phù hợp tương đương NiFi/Airflow (4/5) vì nó gắn với codebase thực tế — nhưng thiếu governance hoàn toàn.

**Tại sao quan trọng**: Talend Open Studio (free version) bị giới hạn về real-time và enterprise features — không phù hợp cho CDC/Incremental mà PTSC yêu cầu. Apache Airflow phù hợp hơn cho orchestration phức tạp nhưng chưa có thực nghiệm tại VnR.

**Rủi ro / Tác động**: Nếu dùng Talend cho PTSC vì quen tay → khi scale lên CDC/real-time sẽ phải migration toàn bộ pipeline. Chi phí rework cao hơn nhiều so với chọn đúng công cụ từ đầu.

**Nguồn**: [[wiki/synthesis/etl-kien-thuc-nen-tang-Research-20260503-k7qm]] | **Độ tin cậy**: Dữ kiện

---

### 5. Wiki tăng trưởng ổn định — 2 synthesis mới hôm nay, tổng 25+

**Mô tả chi tiết**: Hôm nay tạo thêm 2 synthesis chuyên sâu: `etl-kien-thuc-nen-tang-k7qm` (nghiên cứu ETL 9 file raw + 1 wiki source) và `Mockoon-API-Mock-p4kx` (7 file đọc chi tiết). Wiki đã có 143 sources, 9 projects, 11 flows, 8 architecture, 25+ synthesis tính đến hôm nay. Phần `wiki/concepts/` chưa có trang ETL — toàn bộ kiến thức ETL vẫn nằm rải rác trong raw/ và 2 synthesis.

**Tại sao quan trọng**: 2 synthesis hôm nay có chất lượng cao — nhiều mâu thuẫn được phát hiện, nhiều gaps được đặt tên rõ ràng. Tuy nhiên, nếu không distill thành `wiki/concepts/ETL-ELT-Overview`, kiến thức này sẽ khó tìm lại khi cần tham khảo nhanh.

**Rủi ro / Tác động**: SE mới join team không biết VnR đã nghiên cứu ETL từ 2024 — họ sẽ làm lại từ đầu. Knowledge silo hình thành dù wiki đã có.

**Nguồn**: [[wiki/overview]] + [[wiki/log]] | **Độ tin cậy**: Dữ kiện

---

# 4. Biểu đồ

## 4.1 Biểu đồ số liệu

#### 📈 Mức độ hoàn thiện ETL Pipeline tại VnR (tính đến 03/05/2026)

> 💡 **Phân tích — đúng 6 dòng:**
>
> Extract dẫn đầu với 60% — không phải vì team làm tốt mà vì Extract đang tồn tại dưới dạng "shadow pipeline" trong API HRM, team không nhận ra.
> Khoảng cách giữa Extract (60%) và Transform (5%) là vực thẳm — Extract không có Transform = DWH chứa raw data vô dụng cho báo cáo.
> CDC/Incremental đang ở 5% nhưng đã được cam kết 100% với PTSC — đây là gap nguy hiểm nhất, không phải vì năng lực mà vì có chữ ký.
> Pattern lặp lại: VnR luôn hoàn thiện Extract tốt (API HRM mạnh), nhưng thiếu Transform layer ở mọi dự án (không chỉ ETL — INS cũng có vấn đề transform BH tương tự).
> Chưa rõ: DWH raw tables hiện có schema ổn định không, hay có thể thay đổi bất cứ lúc nào khi store procedure thay đổi?
> Nếu PTSC đi vào implementation phase trong 3–6 tháng tới mà CDC gap chưa được lấp → rủi ro contract mismatch, trì hoãn go-live, mất uy tín đấu thầu.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "Extract"
    value: 60
  - label: "Load"
    value: 30
  - label: "Transform"
    value: 5
  - label: "CDC/Incremental"
    value: 5

#-----------------#
#- chart options -#
#-----------------#
options:
  xField: "label"
  yField: "value"
  label:
    position: "middle"
  meta:
    value:
      alias: "% Hoàn thiện"
```

> 🎯 **Nên làm**: Tung.Ly audit codebase HRM — kiểm tra `LastUpdated`/`CreatedDate` có đủ trên các bảng PTSC yêu cầu không. Làm trước khi PTSC họp implementation phase.

---

#### 📈 Phân bổ Test Case theo chiến lược — Mock vs DB thật

> 💡 **Phân tích — đúng 6 dòng:**
>
> 60% test case có thể dùng mock hoàn toàn — đây là số liệu team thường không tin vì quen với "test thật mới đúng", nhưng 60% đó là interface test, không cần logic nghiệp vụ DB.
> Khoảng cách giữa "có thể mock" (60%) và "đang thực tế dùng mock" (~0%) là toàn bộ rủi ro tích lũy mỗi sprint.
> DB test riêng (25%) là vùng thường bị bỏ qua nhất — team hoặc dùng mock (nhanh nhưng không test logic) hoặc dùng DB prod (test được logic nhưng nguy hiểm), không có trung gian.
> Pattern nguy hiểm: khi không có test strategy rõ ràng, mọi test case đều drift về nhóm "cần DB thật" — đây là triệu chứng thiếu chuẩn hóa, không phải thiếu tool.
> Chưa xác nhận: HRM có DB test tách biệt không, hay tất cả đang test trên DB UAT dùng chung?
> Nếu LLM agent đang test POST API thường xuyên mà không có mock → mỗi ngày thêm N record rác; cộng dồn theo tháng sẽ ảnh hưởng báo cáo BH/lương.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Pie

#-----------------#
#- chart data    -#
#-----------------#
data:
  - type: "Mock đủ (Mockoon)"
    value: 60
  - type: "DB test riêng"
    value: 25
  - type: "DB thật (UAT/prod)"
    value: 15

#-----------------#
#- chart options -#
#-----------------#
options:
  angleField: "value"
  colorField: "type"
  radius: 0.8
  label:
    type: "spider"
    content: "{percentage}\n{name}"
  legend:
    layout: "horizontal"
    position: "bottom"
```

> 🎯 **Nên làm**: Xác định 3 POST API LLM đang gọi nhiều nhất → import vào Mockoon → đổi base URL. Mất 30 phút, loại bỏ rủi ro ngay.

---

# 5. Quy luật & Mâu thuẫn

**Quy luật rút ra:**

**Quy luật 1 — "Shadow work" luôn thiếu governance**: Bất kỳ khi nào team làm một việc quan trọng mà không gọi đúng tên nó (API động = ETL Extract; test thủ công = integration test), việc đó sẽ không có documentation, không có error handling, không có ownership. Biết quy luật này → khi thấy code "không tên" là cần đặt tên và document ngay.

**Quy luật 2 — Công cụ quen ≠ công cụ đúng**: VnR chọn Talend vì đã học, không phải vì so sánh. Pattern này lặp lại trong nhiều quyết định kỹ thuật HRM (ví dụ: Redis Sentinel được chọn vì constraint hạ tầng, có decision log rõ ràng — ngược lại Talend không có). Nếu không biết điều này → sẽ bảo vệ công cụ quen thay vì đánh giá lại.

**Quy luật 3 — Mock test ≠ test giả**: Team thường nghĩ "mock = không test thật". Thực ra mock test *interface contract*, còn test thật kiểm tra *business logic*. Đây là 2 loại test độc lập. Không biết điều này → hoặc không dùng mock (rủi ro DB), hoặc dùng mock nhầm chỗ (bỏ sót logic).

**Mâu thuẫn phát hiện:**

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | VnR cam kết CDC với PTSC (tài liệu đã ký) nhưng 3 job Talend thực hành đều là full-load | Khi PTSC yêu cầu demo CDC → không có gì để show; hoặc phát hiện bảng HRM thiếu `LastUpdated` field |
| 2 | Tài liệu nội bộ gọi Airbyte là "mô hình kiến trúc ETL" nhưng Airbyte là ELT tool | SE mới đọc tài liệu thiết kế sai pipeline, chọn sai công cụ |
| 3 | API HRM tự xây đang làm Extract thực tế nhưng không được nhận ra là ETL layer | Không có governance, không có error handling, dễ bị xóa/thay đổi mà không biết hậu quả |

---

# 6. Khuyến nghị

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | **Audit codebase HRM**: kiểm tra các bảng PTSC yêu cầu có `LastUpdated`/`CreatedDate` không, soft-delete có được track không | Cam kết CDC với PTSC đã ký — cần biết gap thực tế ngay trước khi họp implementation phase |
| 🔴 Cao | **Setup Mockoon cho 3 POST API LLM đang dùng nhiều nhất** — trỏ base URL về `localhost:3001` | Mỗi ngày không làm = thêm N record rác trong DB UAT; mất 30 phút để loại bỏ rủi ro hoàn toàn |
| 🟡 Trung bình | **Xây Transform layer** cho 2 raw DWH tables đang có (AttendanceMonth, Birthday) bằng stored procedure | Hoàn thiện pipeline E→T→L đang dang dở; tạo precedent cho các bảng PTSC sau này |
| 🟡 Trung bình | **Tạo `wiki/concepts/ETL-ELT-Overview`** — distill kiến thức từ 2 synthesis hôm nay thành trang concept chuẩn | Tránh SE mới làm lại từ đầu; tránh tái diễn lẫn lộn ETL/ELT trong tài liệu nội bộ |
| 🟡 Trung bình | **Xác nhận DB test strategy**: HRM có DB test riêng không? Nếu không → đề xuất tạo DB test với seed data | Không có DB test riêng = toàn bộ test đổ lên DB UAT dùng chung, rủi ro data contamination |
| 🟢 Thấp | **Đọc nội dung thực tế Data_WareHouse_ETL_Plan Google Sheets** và ingest vào wiki | File này là kế hoạch DWH — không biết trạng thái thì không lập lịch tiếp theo được |

---

## 💬 3 Câu hỏi suy ngẫm

1. 🧠 **[Giả định]** Chúng ta cam kết CDC với PTSC dựa trên giả định HRM có đầy đủ `LastUpdated` field và track soft-delete đúng — nếu audit codebase và phát hiện 30% bảng thiếu field này, ai trong team có quyền quyết định renegotiate phạm vi với PTSC, và quy trình đó mất bao lâu?

2. 🧪 **[Thí nghiệm]** Shadow ETL pipeline (API động + raw DWH tables) đang tồn tại không có tên — nếu đặt tên chính thức cho nó và thêm vào `wiki/flows/Flow-ETL-HRM.md`, điều gì sẽ thay đổi trong cách team tiếp cận khi có yêu cầu data integration tiếp theo từ khách hàng (như PTSC, hay KH khác sau PTSC)?

3. 🌐 **[Kết nối]** Timezone bug trong INS (Mantis #87680, đã có trong [[wiki/sources/INS-Phan-Tich-BH-Lech-Thang]]) từng làm lệch phân tích BH sang tháng khác — nếu CDC dùng Watermark/Timestamp mà timezone không nhất quán, có phải lỗi tương tự sẽ tái diễn ở tầng ETL? Và liệu fix timezone của INS đã cover cả tầng API extract không?
