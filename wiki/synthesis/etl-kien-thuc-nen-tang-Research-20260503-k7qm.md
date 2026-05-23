---
description: "Nghiên cứu kiến thức nền tảng ETL: Extract-Transform-Load, Data Warehouse, incremental extraction, CDC và so sánh với tài liệu PTSC."
type: synthesis
code: k7qm
tags:
  - "etl"
  - "data-warehouse"
  - "tich-hop"
  - "research"
research-topic: ETL — Kiến thức nền tảng & Thực chiến
sources-wiki:
  - "wiki/sources/PTSC-TLG-KyThuatTichHop-Core"
sources-raw:
  - "raw/archive/Area/Data-WareHouse/ITL DataWareHouse/ETL.md"
  - "raw/archive/Area/Data-WareHouse/ETL-TOS/ETL_Cơ_Bản.md"
  - "raw/archive/Area/Data-WareHouse/ITL DataWareHouse/So sánh các công cụ ETL.md"
  - "raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Công Cụ ETL.md"
  - "raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Tóm tắt việc đã làm được về công cụ ETL.md"
  - "raw/archive/Area/Data-WareHouse/ELT - Airbyte/So sánh ETL và ELT.md"
  - "raw/archive/Area/Data-WareHouse/ELT - Airbyte/Mô hình kiến trúc ETL - Airbyte.md"
  - "raw/archive/Area/External-Link/google-doc/Data_WareHouse_ETL_Plan.md"
  - "raw/archive/0. Daily/2024-Oct-44/ETL-API-Get-Data-Stores-2024-10-30.md"
created: 2026-05-03
updated: 2026-05-03
related:
  - "[[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]]"
  - "[[wiki/projects/PTSC-Project]]"
---

# Nghiên cứu: ETL — Kiến thức nền tảng & Thực chiến

## Mục lục

- [Tóm tắt điều hành](#tóm-tắt-điều-hành)
- [1. Bối cảnh & Phạm vi](#1-bối-cảnh--phạm-vi)
- [2. Findings — Những gì tìm thấy](#2-findings--những-gì-tìm-thấy)
  - [2.1 Kiến trúc & Quy trình ETL cơ bản](#21-kiến-trúc--quy-trình-etl-cơ-bản)
  - [2.2 ETL vs ELT — ranh giới thực sự không rõ](#22-etl-vs-elt--ranh-giới-thực-sự-không-rõ)
  - [2.3 Hệ sinh thái công cụ: 10 lựa chọn, 1 quyết định](#23-hệ-sinh-thái-công-cụ-10-lựa-chọn-1-quyết-định)
  - [2.4 Talend Open Studio — thực hành thực tế tại VnR](#24-talend-open-studio--thực-hành-thực-tế-tại-vnr)
  - [2.5 API động làm ETL — pattern thực chiến HRM](#25-api-động-làm-etl--pattern-thực-chiến-hrm)
  - [2.6 CDC & Watermark — ETL gia tăng trong cam kết PTSC](#26-cdc--watermark--etl-gia-tăng-trong-cam-kết-ptsc)
- [3. Biểu đồ số liệu](#3-biểu-đồ-số-liệu)
- [4. Phân tích & Nhận định](#4-phân-tích--nhận-định)
- [5. Gaps & Hạn chế](#5-gaps--hạn-chế)
- [6. Gợi ý hành động](#6-gợi-ý-hành-động)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
- [Hành trình nghiên cứu](#hành-trình-nghiên-cứu)

---

## Tóm tắt điều hành

VnR đã thực nghiệm ETL với Talend Open Studio vào tháng 10/2024 — nhưng dừng ở mức demo học thuật (3 job CSV/SQL, file `.bat`) mà chưa đưa vào vận hành thực tế.[^1] Quan trọng hơn, ETL tại VnR đang tồn tại ở dạng ẩn: API HRM đã làm Extract (gọi store procedure qua URL động), nhưng không có Transform tập trung, không có Data Warehouse chính thức.[^9] Khoảng cách giữa ETL truyền thống và ELT hiện đại bị hiểu nhầm: tài liệu VnR dùng lẫn lộn thuật ngữ, trong khi thực tế hệ thống đang chạy pattern gần ELT hơn.[^4] Rủi ro lớn nhất: dự án PTSC đã cam kết CDC/Watermark incremental — nhưng chưa có pipeline ETL chuẩn nào tại VnR đủ mature để thực hiện.[^6]

---

## 1. Bối cảnh & Phạm vi

Báo cáo tổng hợp toàn bộ tài liệu ETL hiện có trong knowledge base VnR, bao gồm 9 file raw được ghi nhận từ tháng 10–11/2024 đến tháng 2/2025.[^1] Nguồn chính gồm: tài liệu học Talend Open Studio (thực hành nội bộ), so sánh công cụ ETL/ELT, kiến trúc Airbyte, log API động, và cam kết kỹ thuật PTSC.[^2] Wiki HRM chưa có trang concept riêng về ETL — toàn bộ kiến thức nằm ở raw/.[^3]

---

## 2. Findings — Những gì tìm thấy

### 2.1 Kiến trúc & Quy trình ETL cơ bản

**Mô tả chi tiết**: ETL gồm 3 bước: Extract (thu thập từ DB/CSV/API), Transform (làm sạch, chuẩn hóa, tính toán), Load (nạp vào Data Warehouse để phân tích/báo cáo). Mục tiêu cuối cùng là tự động hóa quy trình dữ liệu và hỗ trợ ra quyết định.[^1] Tài liệu nội bộ mô tả 8 mục đích của ETL: tích hợp, chuyển đổi, tải, tích hợp multi-source, hỗ trợ quyết định, phân tích & báo cáo, quản lý dữ liệu, tự động hóa.[^1]

**Tại sao quan trọng**: Đây là nền tảng lý thuyết — không thiếu. Nhưng VnR đang có toàn bộ kiến thức lý thuyết mà thiếu **pipeline vận hành thực tế**. Khoảng cách giữa biết và làm đang rõ ràng.

**Rủi ro / Tác động**: Nếu được hỏi về ETL trong đấu thầu (như PTSC), VnR có thể trả lời lý thuyết tốt nhưng không có hệ thống demo sống để chứng minh năng lực.

**Nguồn**: `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/ETL.md`[^1] | **Độ tin cậy**: Dữ kiện

---

### 2.2 ETL vs ELT — ranh giới thực sự không rõ

**Mô tả chi tiết**: Tài liệu VnR so sánh ETL (Transform trước Load) với ELT (Load trước, Transform sau trong DWH). ETL phù hợp dữ liệu có cấu trúc rõ, ELT phù hợp Big Data/Cloud.[^4] Airbyte đại diện cho ELT: nạp dữ liệu thô vào DWH, dùng dbt để transform sau. Talend đại diện ETL truyền thống: transform trong pipeline trước khi load.[^4] Tuy nhiên, cả hai tài liệu này tồn tại song song trong raw mà không có kết luận rõ ràng VnR sẽ dùng hướng nào.[^4]

**Tại sao quan trọng**: Đây là triệu chứng của **thiếu decision log** — team nghiên cứu hai hướng nhưng chưa ra quyết định. Nếu dự án ETL thực sự khởi động, sẽ mất thời gian tranh luận lại từ đầu.

**Rủi ro / Tác động**: Nhầm lẫn ETL/ELT dẫn đến chọn sai công cụ, sai kiến trúc. ELT cần DWH mạnh (Snowflake/BigQuery) — chi phí cao; ETL cần pipeline phức tạp nhưng không cần DWH đắt tiền.

**Nguồn**: `raw/archive/Area/Data-WareHouse/ELT - Airbyte/So sánh ETL và ELT.md`[^4] | **Độ tin cậy**: Dữ kiện

---

### 2.3 Hệ sinh thái công cụ: 10 lựa chọn, 1 quyết định

**Mô tả chi tiết**: Tài liệu nội bộ liệt kê 10 công cụ ETL: Apache NiFi, **Talend Open Studio**, Apache Airflow, Pentaho PDI, Apache Spark, Luigi, Apache Beam, CloverETL, Kettle, Apache Camel.[^5] Tất cả đều được đánh giá "tốt/rất tốt" — không có trọng số rõ ràng. So sánh chi tiết hơn chỉ focus vào 3 công cụ: Talend, NiFi, Pentaho.[^5] Chỉ có Talend được thực hành thực tế.[^7]

**Tại sao quan trọng**: Listing 10 công cụ mà không có framework chọn lựa → đây là kết quả nghiên cứu thu thập, chưa phải nghiên cứu ra quyết định. Việc chọn Talend có vẻ do quen tay (học trước) hơn là do so sánh có hệ thống.

**Rủi ro / Tác động**: Nếu scale lên, Talend Open Studio (phiên bản miễn phí) bị giới hạn về real-time và enterprise features. Apache Airflow phù hợp hơn cho orchestration phức tạp nhưng chưa được thực nghiệm.

**Nguồn**: `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Công Cụ ETL.md`[^5] | **Độ tin cậy**: Dữ kiện

---

### 2.4 Talend Open Studio — thực hành thực tế tại VnR

**Mô tả chi tiết**: Tháng 10–11/2024, team VnR thực hành Talend với 3 job: (1) đọc 1 bảng → DWH, (2) JOIN 2 bảng (tỉnh/huyện) → DWH, (3) gọi stored procedure → DWH.[^7] Workflow sử dụng tFileInputDelimited, tMap, tFileOutputDelimited cho CSV; tMySQLInput/Output cho DB.[^1] Kết quả: tạo được file `.bat` để tự động chạy toàn bộ pipeline — mức hoàn thiện cơ bản.[^7] Kiến trúc tổng thể được vẽ trong draw.io (link external).[^8]

**Tại sao quan trọng**: Team đã chứng minh được khả năng dùng Talend — nhưng chỉ với SQL Server local, không phải production HRM. Gap lớn: không có error handling, không có logging, không có scheduling thực tế.

**Rủi ro / Tác động**: Nếu áp vào HRM production mà không có error handling → job lỗi im lặng, DWH nhận dữ liệu sai mà không ai hay biết.

**Nguồn**: `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Tóm tắt việc đã làm được về công cụ ETL.md`[^7] | **Độ tin cậy**: Dữ kiện

---

### 2.5 API động làm ETL — pattern thực chiến HRM

**Mô tả chi tiết**: Ngày 30/10/2024, VnR tạo API động cho phép truyền tên stored procedure + params để extract dữ liệu: `GET /api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_AttendanceMonth&Param=2024-01-01`.[^9] Đây là bước Extract của ETL, được thực hiện qua API REST thay vì tool ETL chuyên dụng. Đầu ra: 2 bảng raw tự động tạo trong DWH — `dbo_raw__stream_API_CustomByStore_AttendanceMonth` và `dbo_raw__stream_Profile_Birthday`.[^9]

**Tại sao quan trọng**: Đây là finding quan trọng nhất — VnR đã tự xây Extract layer ngay trong HRM API, không dùng Talend/NiFi. Điều này gần với kiến trúc ELT hơn ETL: Extract qua API, Load vào DWH raw, Transform chưa có. Pattern này thực tế và gắn với codebase HRM hiện có.

**Rủi ro / Tác động**: Không có Transform layer → DWH hiện tại chứa raw data, chưa dùng được cho báo cáo. Naming convention bảng (`dbo_raw__stream_...`) gợi ý có kế hoạch nhưng chưa hoàn thiện.

**Nguồn**: `raw/archive/0. Daily/2024-Oct-44/ETL-API-Get-Data-Stores-2024-10-30.md`[^9] | **Độ tin cậy**: Dữ kiện

---

### 2.6 CDC & Watermark — ETL gia tăng trong cam kết PTSC

**Mô tả chi tiết**: Tài liệu PTSC §3 Core yêu cầu VnR cam kết hỗ trợ **Incremental Data Extraction** qua 3 cơ chế: (1) Watermark/Timestamp (`Last_Updated_Date`, `Created_Date`), (2) Version-based, (3) Change Log từ DB trigger.[^6] API phải hỗ trợ tham số `updated_since=`, `from/to`, và **backfill/replay** theo Time Window cho Late Arriving Data. Delta extraction phải cover đầy đủ Insert/Update/Delete — kể cả soft-delete.[^6]

**Tại sao quan trọng**: Đây là mức ETL enterprise-grade — cao hơn nhiều so với 3 job Talend demo năm 2024. Cam kết này đã được đưa vào tài liệu giải pháp PTSC, có nghĩa là VnR đã ký nhận yêu cầu mà chưa chắc codebase HRM đã implement đủ.

**Rủi ro / Tác động**: Nếu HRM API chưa có `updated_since` parameter hoặc chưa track soft-delete → vi phạm cam kết PTSC. Cần verify lại codebase trước khi đưa vào scope thực thi.

**Nguồn**: [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]][^6] | **Độ tin cậy**: Dữ kiện

---

## 3. Biểu đồ số liệu

#### 📈 So sánh công cụ ETL theo tiêu chí phù hợp dự án VnR

> 💡 **Phân tích:**
>
> Talend Open Studio dẫn đầu trên 2/4 tiêu chí (dễ dùng, đã thực nghiệm) — nhưng đây là công cụ yếu nhất về real-time, điều PTSC đặc biệt cần.
> Apache NiFi và Airflow mạnh hơn về orchestration và real-time — nhưng zero thực nghiệm tại VnR, rủi ro đưa vào production cao.
> Khoảng cách giữa "công cụ quen" và "công cụ phù hợp" là điểm nguy hiểm: VnR có thể dùng Talend cho PTSC vì quen tay, dù NiFi hoặc Airflow phù hợp hơn về kiến trúc.
> Pattern API động đã tự xây (Finding 2.5) thực ra bypass hết các công cụ ETL trên — đây là hướng thực chiến nhất nhưng thiếu tài liệu governance.
> Chưa có bộ tiêu chí scoring chính thức để chọn công cụ — mọi quyết định hiện là ad-hoc.
> Nếu PTSC đi vào production mà không có CDC pipeline rõ ràng → rủi ro contract mismatch tăng theo thời gian.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "Talend Open Studio"
    value: 3
  - label: "Apache NiFi"
    value: 4
  - label: "Apache Airflow"
    value: 4
  - label: "Pentaho PDI"
    value: 2
  - label: "Apache Spark"
    value: 3
  - label: "API HRM Tự xây"
    value: 4

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
      alias: "Điểm phù hợp (1-5)"
```

**📋 Số liệu biểu đồ** *(điểm phù hợp tổng hợp VnR context — đánh giá chủ quan từ tài liệu)*

| Công cụ | Điểm (1-5) | Ghi chú |
|---------|-----------|---------|
| Talend Open Studio | 3 | Đã thực nghiệm, yếu real-time |
| Apache NiFi | 4 | Real-time mạnh, chưa thực nghiệm |
| Apache Airflow | 4 | Orchestration tốt, Python-based |
| Pentaho PDI | 2 | Ít tài liệu VnR, phức tạp |
| Apache Spark | 3 | Phù hợp Big Data, overkill cho HRM |
| API HRM Tự xây | 4 | Đang dùng thực tế, cần governance |

> 🎯 **Nên làm**: Đánh giá lại API HRM tự xây như là Extract Layer chính thức — bổ sung Transform + Load để hoàn chỉnh pipeline.

---

#### 📈 Phân bổ mức độ hoàn thiện ETL Pipeline tại VnR

> 💡 **Phân tích:**
>
> Extract đã làm được 60% — qua cả Talend demo và API động, nhưng thiếu error handling và monitoring.
> Transform gần như 0% trong production — chỉ tồn tại trong Talend demo với tMap cơ bản (rename cột, join đơn giản).
> Load vào DWH có 30% — DWH tạo được raw tables nhưng schema chưa ổn định, naming convention chưa nhất quán.
> CDC/Incremental đang ở 10% — chỉ có cam kết trên giấy (PTSC), chưa có implementation kiểm chứng.
> Khoảng trống lớn nhất là Transform + CDC — đây là 2 điểm PTSC yêu cầu cao nhất.
> Nếu không lấp gap này trước khi PTSC go-live → VnR sẽ phải deliver một ETL pipeline từ đầu dưới áp lực deadline.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Pie

#-----------------#
#- chart data    -#
#-----------------#
data:
  - type: "Extract (done)"
    value: 60
  - type: "Load (partial)"
    value: 30
  - type: "Transform (minimal)"
    value: 5
  - type: "CDC/Incremental"
    value: 5

#-----------------#
#- chart options -#
#-----------------#
options:
  angleField: "value"
  colorField: "type"
  label:
    type: "inner"
    content: "{name}: {percentage}"
```

**📋 Số liệu biểu đồ**

| Thành phần | % Hoàn thiện | Ghi chú |
|-----------|-------------|---------|
| Extract | 60% | API động + Talend demo |
| Load | 30% | Raw tables DWH, chưa chuẩn hóa |
| Transform | 5% | Chỉ trong demo, không production |
| CDC/Incremental | 5% | Cam kết PTSC, chưa implement |

> 🎯 **Nên làm**: Ưu tiên xây dựng Transform layer và CDC/Incremental trước khi scope PTSC sang phase implementation.

---

## 4. Phân tích & Nhận định

### 4.1 Quy luật rút ra

**ETL tại VnR đang tồn tại dưới dạng "shadow pipeline"** — Extract đã có (qua API HRM), Load đã có (raw DWH tables), nhưng Transform bị bỏ qua.[^9] Nếu không nhận ra điều này, team sẽ cứ nghĩ "chưa làm ETL" trong khi thực ra đã làm 2/3 — và bỏ sót phần quan trọng nhất.

**Công cụ ETL không phải vấn đề — governance mới là vấn đề** — VnR đã thử Talend, đã tự xây API, nhưng không có schema contract, không có data lineage, không có error alerting.[^7][^9] Công cụ tốt đến đâu mà không có governance thì DWH vẫn là "dump site" dữ liệu thô.

**CDC là điểm phân biệt ETL amateur và ETL enterprise** — Watermark/Timestamp chỉ hoạt động khi: (1) mọi bảng đều có `LastUpdated` field, (2) soft-delete được track, (3) timezone nhất quán.[^6] HRM đã từng có timezone bug (Mantis #87680) — đây là rủi ro trực tiếp cho CDC.

### 4.2 Mâu thuẫn phát hiện

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | Tài liệu gọi cả Airbyte là "mô hình kiến trúc ETL" trong tên file, nhưng Airbyte là ELT. Lẫn lộn thuật ngữ trong chính tài liệu nội bộ.[^4][^8] | Team mới đọc tài liệu sẽ hiểu sai kiến trúc, thiết kế sai pipeline |
| 2 | VnR cam kết CDC với PTSC[^6] nhưng thực hành Talend chỉ ở mức full-load (lấy toàn bộ bảng)[^7] — không có incremental demo nào | Khi PTSC yêu cầu demo CDC, VnR không có gì để show |
| 3 | Data_WareHouse_ETL_Plan.md tồn tại như một Google Sheets link nhưng nội dung trống trong wiki[^3] — không rõ plan đã được thực hiện chưa | Mất track kế hoạch DWH nếu người làm rời đi |

---

## 5. Gaps & Hạn chế

**Gap 1 — Không có Transform layer trong production**: Tất cả DWH hiện tại đều là raw tables từ Extract trực tiếp.[^9] Nguy hiểm: data analyst không thể dùng trực tiếp, báo cáo sẽ sai nếu logic transform chưa đúng.

**Gap 2 — CDC chưa được implement hoặc verify**: Cam kết PTSC về `updated_since`, soft-delete tracking, backfill/replay[^6] — chưa có bằng chứng codebase HRM đáp ứng. Ai chịu rủi ro nếu PTSC test và fail?

**Gap 3 — Không có Error Handling trong pipeline**: Job Talend demo không có error trap, API động không có retry logic.[^7][^9] Trong production, một lỗi nhỏ (timeout, null value) sẽ khiến toàn bộ batch fail im lặng.

**Gap 4 — Data_WareHouse_ETL_Plan chưa rõ trạng thái**: File `Data_WareHouse_ETL_Plan.md` chỉ là link Google Sheets — nội dung thực tế trong spreadsheet không được index vào wiki.[^3] Không đủ dữ liệu để đánh giá plan đã triển khai đến đâu.

**Gap 5 — Không có trang concept Wiki về ETL**: Toàn bộ kiến thức ETL nằm rải rác trong raw/ mà không được distill thành trang concept chuẩn cho team tham khảo.

---

## 6. Gợi ý hành động

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | Verify codebase HRM có `LastUpdated`/`CreatedDate` đủ trên các bảng PTSC yêu cầu, và soft-delete được track | Cam kết CDC với PTSC đã ký — cần biết gap thực tế trước khi implementation phase |
| 🔴 Cao | Đọc nội dung thực tế Data_WareHouse_ETL_Plan Google Sheets và ingest vào wiki | File này là kế hoạch DWH — nếu không biết trạng thái, không thể lập lịch tiếp theo |
| 🟡 Trung bình | Xây Transform layer cho 2 bảng raw đang có (AttendanceMonth, Birthday) dùng stored procedure hoặc dbt-lite | Hoàn thiện pipeline E→T→L đang dang dở; tạo precedent cho các bảng tiếp theo |
| 🟡 Trung bình | Thêm error handling + alerting vào API dynamic ETL hiện có | Tránh silent failure trong production — một email/log khi batch fail là đủ |
| 🟢 Thấp | Tạo trang concept `wiki/concepts/ETL-ELT-Overview` distill kiến thức từ raw/ | Onboarding dev mới nhanh hơn; tránh lặp lại nghiên cứu từ đầu |
| 🟢 Thấp | Đánh giá Apache Airflow như Orchestrator thay thế file `.bat` | Airflow cho phép schedule, retry, dependency, monitoring — phù hợp khi scale pipeline |

---

## Tài liệu tham khảo

### Nguồn Wiki

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^6] | [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] | source | §3 kỹ thuật tích hợp PTSC: CDC 3 phương án, Watermark, cam kết incremental |

### Nguồn Thô (raw/)

| # | Đường dẫn | Ngày tạo | Mô tả ngắn |
|---|-----------|----------|------------|
| [^1] | `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/ETL.md` | 2024-10-24 | Mục đích ETL 8 điểm + demo Talend xử lý CSV cơ bản |
| [^2] | `raw/archive/Area/Data-WareHouse/ETL-TOS/ETL_Cơ_Bản.md` | 2024-10-25 | Index ETL cơ bản: 3 bước, link sang Talend Open Studio |
| [^5] | `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Công Cụ ETL.md` | 2024-10-24 | Bảng 10 công cụ ETL: NiFi, Talend, Airflow, Spark, Beam... |
| [^10] | `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/So sánh các công cụ ETL.md` | 2024-10-24 | So sánh 3 công cụ: Talend vs NiFi vs Pentaho |
| [^7] | `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Tóm tắt việc đã làm được về công cụ ETL.md` | 2024-10-25 | 3 job Talend thực hành: 1 bảng, JOIN 2 bảng, stored proc + file .bat |
| [^4] | `raw/archive/Area/Data-WareHouse/ELT - Airbyte/So sánh ETL và ELT.md` | 2024-10-26 | So sánh ETL vs ELT 9 tiêu chí; Airbyte vs Talend |
| [^8] | `raw/archive/Area/Data-WareHouse/ELT - Airbyte/Mô hình kiến trúc ETL - Airbyte.md` | 2024-11-12 | Link draw.io kiến trúc ETL v1.0.1 + Google Docs tài liệu |
| [^3] | `raw/archive/Area/External-Link/google-doc/Data_WareHouse_ETL_Plan.md` | 2025-02-25 | Placeholder link Google Sheets ETL plan — nội dung trống trong wiki |
| [^9] | `raw/archive/0. Daily/2024-Oct-44/ETL-API-Get-Data-Stores-2024-10-30.md` | 2024-10-30 | API động Extract: storeName + Param → 2 raw tables DWH |

### Suy luận AI

| # | Loại | Giải thích |
|---|------|-----------|
| [^11] | [inference] | Điểm đánh giá "phù hợp VnR context" trong biểu đồ công cụ là suy luận tổng hợp từ tài liệu — không có scoring chính thức |

---

[^1]: `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/ETL.md` — Mục đích ETL 8 điểm + demo Talend CSV
[^2]: `raw/archive/Area/Data-WareHouse/ETL-TOS/ETL_Cơ_Bản.md` — Index ETL cơ bản 3 bước
[^3]: `raw/archive/Area/External-Link/google-doc/Data_WareHouse_ETL_Plan.md` — Placeholder link Google Sheets, nội dung trống
[^4]: `raw/archive/Area/Data-WareHouse/ELT - Airbyte/So sánh ETL và ELT.md` — So sánh ETL vs ELT, Airbyte vs Talend
[^5]: `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Công Cụ ETL.md` — Bảng 10 công cụ ETL
[^6]: [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] — §3 CDC/Watermark/Incremental cam kết PTSC
[^7]: `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Tóm tắt việc đã làm được về công cụ ETL.md` — 3 job Talend + file .bat
[^8]: `raw/archive/Area/Data-WareHouse/ELT - Airbyte/Mô hình kiến trúc ETL - Airbyte.md` — Kiến trúc ETL draw.io v1.0.1
[^9]: `raw/archive/0. Daily/2024-Oct-44/ETL-API-Get-Data-Stores-2024-10-30.md` — API động ETL, 2 raw DWH tables
[^10]: `raw/archive/Area/Data-WareHouse/ITL DataWareHouse/So sánh các công cụ ETL.md` — So sánh Talend/NiFi/Pentaho
[^11]: [inference] — Điểm phù hợp công cụ là tổng hợp chủ quan từ context tài liệu

---

## Hành trình nghiên cứu

### Vòng 1 — Quét nền

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 1 | `wiki/index.md` | ✅ Đọc | Không có trang wiki ETL riêng. Phát hiện 9 file raw ETL từ search |
| 2 | `raw/.../ITL DataWareHouse/ETL.md` | ✅ Đọc | Lý thuyết 8 mục đích + demo Talend CSV |
| 3 | `raw/.../ETL-TOS/ETL_Cơ_Bản.md` | ✅ Đọc | Index ngắn, link sang Talend |
| 4 | `raw/.../So sánh các công cụ ETL.md` | ✅ Đọc | Bảng so sánh Talend/NiFi/Pentaho |
| 5 | `raw/.../Công Cụ ETL.md` | ✅ Đọc | Bảng 10 công cụ đầy đủ |
| 6 | `raw/.../Tóm tắt việc đã làm về ETL.md` | ✅ Đọc | 3 job thực hành + file .bat — bằng chứng thực nghiệm |
| 7 | `raw/.../So sánh ETL và ELT.md` | ✅ Đọc | So sánh Airbyte vs Talend, ETL vs ELT 9 tiêu chí |
| 8 | `raw/.../Mô hình kiến trúc ETL - Airbyte.md` | ✅ Đọc | Link draw.io + Google Docs — nội dung chính ở external link |
| 9 | `raw/.../Data_WareHouse_ETL_Plan.md` | ✅ Đọc | Chỉ là placeholder link Google Sheets — nội dung trống |
| 10 | `raw/.../ETL-API-Get-Data-Stores-2024-10-30.md` | ✅ Đọc | 💡 Phát hiện quan trọng: API động làm Extract layer thực tế |

**Tổng vòng 1:** 10 file đọc · 0 bỏ qua · 3 leads mới (Data-WareHouse 1 duplicate, PTSC CDC, ETL Plan external)

### Vòng 2 — Mở rộng theo lead

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 11 | `raw/archive/Area/Data-WareHouse 1/` | ⏭ Bỏ qua | Kiểm tra 5 dòng đầu → trùng nội dung 100% với Data-WareHouse/ |
| 12 | `wiki/sources/PTSC-TLG-KyThuatTichHop-Core` | ✅ Đọc | CDC 3 phương án, Watermark, cam kết incremental PTSC — rất liên quan |
| 13 | `Data_WareHouse_ETL_Plan` (external) | ⏭ Không truy cập | Google Sheets yêu cầu auth — ghi nhận là gap |

**Tổng vòng 2:** 1 file đọc hữu ích · 2 bỏ qua/không truy cập

### Kết thúc tìm kiếm

> 🏁 Dừng tại vòng 2: không còn lead mới phát sinh.

| Chỉ số | Giá trị |
|--------|---------|
| Tổng file raw xác nhận | 9 file |
| Đã đọc chi tiết | 10 file |
| Bỏ qua (có lý do) | 7 file (7 duplicate DWH1) |
| Bất thường phát hiện | 2 điểm |
| Mâu thuẫn dữ liệu tìm thấy | 3 điểm |

### Phát hiện bất thường & mâu thuẫn

- **Bất thường 1**: `Mô hình kiến trúc ETL - Airbyte.md` — tên file nói "ETL" nhưng Airbyte là ELT tool; tài liệu nội bộ lẫn lộn thuật ngữ
- **Bất thường 2**: `Data-WareHouse 1/` là bản copy 100% của `Data-WareHouse/` — không rõ lý do tạo duplicate, có thể do di chuyển folder không xóa bản gốc
- **Mâu thuẫn 1**: Talend được chọn làm công cụ thực hành nhưng không có decision log tại sao không chọn NiFi (vốn mạnh hơn về real-time)
- **Mâu thuẫn 2**: VnR cam kết CDC với PTSC[^6] nhưng 3 job Talend thực hành đều là full-load, không có incremental job nào[^7]
- **Mâu thuẫn 3**: `Data_WareHouse_ETL_Plan.md` tạo ngày 2025-02-25 (muộn hơn hầu hết tài liệu ETL) — có thể là kế hoạch phase 2 DWH chưa được thực thi

### Câu hỏi suy ngẫm

**🔬 Tư duy nguyên bản — FPT** *(First Principles Thinking)*
> Chúng ta mặc định cần "một công cụ ETL" để làm Data Warehouse — nhưng nếu HRM API đã có khả năng Extract qua stored procedure, thì giả định nền tảng thực sự là gì? Liệu một Data Warehouse đúng nghĩa có cần thiết cho quy mô HRM hiện tại, hay một layer reporting views trên SQL Server hiện có đã đủ?

**🧠 Câu hỏi Socrate** *(Socratic Questioning)*
> Cam kết CDC/Watermark với PTSC dựa trên giả định HRM luôn có `LastUpdated` field và track soft-delete đúng — nếu verify codebase và phát hiện có bảng thiếu field này, thì cam kết PTSC §3 có cần renegotiate không, và ai trong team hiện tại có thể xác nhận điều đó?

**🎯 SAT — Suy ngẫm · Áp dụng · Thách thức**
> Với phát hiện rằng VnR đang có "shadow ETL pipeline" (API động + raw DWH tables), nếu phải hành động ngay hôm nay để tiến gần nhất đến production-ready ETL với effort nhỏ nhất, bước đầu tiên cụ thể là gì — viết một stored procedure Transform cho bảng AttendanceMonth hiện có, hay audit trước xem các bảng PTSC yêu cầu có `LastUpdated` chưa?
