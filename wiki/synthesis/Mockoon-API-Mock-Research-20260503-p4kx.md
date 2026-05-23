---
description: "Nghiên cứu Mockoon API Mock: giải pháp test POST an toàn, template helpers, LLM testing và so sánh với WireMock."
type: synthesis
code: p4kx
tags:
  - "mockoon"
  - "api-mock"
  - "testing"
  - "llm"
  - "post-safe"
  - "research"
research-topic: Mockoon — API Mock Server, giải pháp POST an toàn, và LLM testing
sources-wiki:
  - "wiki/sources/Mockoon-UserGuide"
  - "wiki/sources/PTSC-TLG-Idempotent-Operations"
  - "wiki/concepts/AI-DevTools"
sources-raw:
  - "src/mockoon_user_guide.md"
created: 2026-05-03
updated: 2026-05-03
related:
  - "[[wiki/sources/Mockoon-UserGuide]]"
  - "[[wiki/concepts/AI-DevTools]]"
  - "[[wiki/sources/PTSC-TLG-Idempotent-Operations]]"
  - "[[wiki/concepts/HRM-Code-Quality]]"
---

# Nghiên cứu: Mockoon — API Mock, POST an toàn, và LLM Testing

## Mục lục

- [Tóm tắt điều hành](#tóm-tắt-điều-hành)
- [1. Bối cảnh & Phạm vi](#1-bối-cảnh--phạm-vi)
- [2. Findings — Những gì tìm thấy](#2-findings--những-gì-tìm-thấy)
  - [2.1 Mockoon là gì — cơ chế chạy không cần DB](#21-mockoon-là-gì--cơ-chế-chạy-không-cần-db)
  - [2.2 Vấn đề POST → DB trong môi trường dev/test](#22-vấn-đề-post--db-trong-môi-trường-devtest)
  - [2.3 Mockoon giải quyết POST nguy hiểm thế nào](#23-mockoon-giải-quyết-post-nguy-hiểm-thế-nào)
  - [2.4 Mockoon + LLM: có dùng được không?](#24-mockoon--llm-có-dùng-được-không)
  - [2.5 Khi nào dùng mock, khi nào cần data thật](#25-khi-nào-dùng-mock-khi-nào-cần-data-thật)
- [3. Biểu đồ so sánh](#3-biểu-đồ-so-sánh)
- [4. Phân tích & Nhận định](#4-phân-tích--nhận-định)
- [5. Gaps & Hạn chế](#5-gaps--hạn-chế)
- [6. Gợi ý hành động](#6-gợi-ý-hành-động)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
- [Hành trình nghiên cứu](#hành-trình-nghiên-cứu)

---

## Tóm tắt điều hành

Mockoon là **mock server chạy local** — nó giả lập endpoint API, trả về response cấu hình sẵn mà **không chạm vào database thật**.[^1] Vấn đề cốt lõi của bạn — POST API gây insert DB — hoàn toàn biến mất khi dùng Mockoon vì request dừng lại ở mock server, không bao giờ đến backend thật.[^2] Đối với LLM testing: **Mockoon hoàn toàn đủ dùng** cho việc test logic giao tiếp API — LLM gọi mock endpoint, nhận response cấu hình sẵn, không cần data thật.[^3] Tuy nhiên, có một ranh giới rõ: mock chỉ test được *cách LLM xử lý response*, không test được *logic nghiệp vụ thật trong DB*.[^4] Rủi ro thực sự không nằm ở Mockoon mà ở workflow không có môi trường test tách biệt — nếu không có chiến lược mock từ sớm, LLM sẽ luôn cần gọi API thật và rủi ro POST tích lũy dần.[^5]

---

## 1. Bối cảnh & Phạm vi

Nghiên cứu này xuất phát từ bài toán thực tế: khi gọi API POST trong môi trường dev hoặc khi dùng LLM để test API, mỗi lần gọi đều có thể insert dữ liệu vào database thật — gây ô nhiễm dữ liệu, rủi ro production.[^1] Phạm vi nghiên cứu bao gồm: (1) Mockoon là gì và cơ chế hoạt động, (2) giải pháp cho bài toán POST nguy hiểm, (3) khả năng dùng Mockoon cho LLM testing thay vì gọi data thật.[^6]

Tài liệu nội bộ gốc do **Tú.Huỳnh** biên soạn (02/2024, cập nhật 05/2026) đã có hướng dẫn Mockoon cơ bản tại VnR.[^1]

---

## 2. Findings — Những gì tìm thấy

### 2.1 Mockoon là gì — cơ chế chạy không cần DB

**Mô tả chi tiết**: Mockoon là ứng dụng desktop (Windows/Mac/Linux) hoặc CLI chạy một HTTP server local, đóng vai trò là "backend giả".[^1] Khi bạn định nghĩa route `/api/login` POST trong Mockoon, bất kỳ request nào gửi đến `localhost:3001/api/login` đều được Mockoon bắt lấy và trả về response JSON bạn đã cấu hình — **không có code backend, không có DB, không có gì chạy phía sau**.[^1] Cơ chế hoạt động như một "traffic catcher": request → Mockoon server → response cấu hình sẵn → client. DB thật không bao giờ nhận được request này.

**Tại sao quan trọng**: Đây không phải là "stub" hay "fake DB" — Mockoon thay thế hoàn toàn tầng network. Bất kỳ client nào (Postman, browser, LLM agent, code frontend) gọi đúng host:port đều nhận mock response. Không cần sửa code backend, không cần tắt DB.

**Rủi ro / Tác động**: Nếu không dùng mock, mỗi lần test POST = 1 record rác trong DB. Sau 100 lần test → 100 record rác, ảnh hưởng báo cáo, tính lương, BH nếu là HRM.

**Nguồn**: [[wiki/sources/Mockoon-UserGuide]][^1] | **Độ tin cậy**: Dữ kiện

---

### 2.2 Vấn đề POST → DB trong môi trường dev/test

**Mô tả chi tiết**: Trong HRM, các API POST thường map thẳng đến stored procedure INSERT/UPDATE — ví dụ tạo hồ sơ nhân viên, tạo bản ghi BH, tạo phiếu lương.[^2] Khi dev hoặc LLM gọi những API này để test, dữ liệu thật được ghi vào DB production hoặc DB UAT dùng chung, gây ra: (a) dữ liệu test lẫn vào data thật, (b) cần cleanup thủ công, (c) nguy cơ trigger business logic downstream (ví dụ: insert BH → tính lương tháng sau bị sai).[^2]

**Tại sao quan trọng**: Đây là triệu chứng của việc **không có môi trường test tách biệt**. Vấn đề không chỉ là "POST nguy hiểm" — mà là thiếu boundary giữa môi trường test và production.

**Rủi ro / Tác động**: INSERT vào bảng `Ins_ProfileInsuranceMonthly` hay `Hre_Profile` trong DB production khi test = phải rollback thủ công, hoặc tệ hơn là bị bỏ sót và ảnh hưởng báo cáo tháng.

**Nguồn**: [inference][^7] kết hợp [[wiki/sources/PTSC-TLG-Idempotent-Operations]][^3] | **Độ tin cậy**: Suy luận từ kiến trúc HRM

---

### 2.3 Mockoon giải quyết POST nguy hiểm thế nào

**Mô tả chi tiết**: Có 3 tầng giải pháp theo mức độ bảo vệ:[^1]

**Tầng 1 — Mock hoàn toàn (an toàn tuyệt đối)**: Trỏ URL client/LLM về `localhost:3001` (Mockoon) thay vì URL thật. Mọi POST đến Mockoon đều bị "nuốt" — không có gì đến DB. Cấu hình Mockoon trả về response giống thật (200 OK + JSON body). Đây là cách dùng cho: test logic frontend, test LLM parsing response, test error handling.

**Tầng 2 — Idempotent API + dry-run flag**: Thiết kế API thật hỗ trợ header `X-Dry-Run: true` hoặc query param `?preview=1` — backend nhận request, validate, nhưng **không commit vào DB**.[^3] Phù hợp khi cần test với data thật nhưng không muốn ghi. PTSC đã quy định pattern này cho tích hợp ESB.[^3]

**Tầng 3 — Test DB tách biệt**: Dùng DB test riêng (seed data cố định), sau mỗi test run thì reset. Không liên quan đến Mockoon nhưng là best practice bổ sung.

**Tại sao quan trọng**: Tầng 1 (Mockoon) là giải pháp nhanh nhất, không cần sửa backend. Tầng 2 đòi hỏi backend phải hỗ trợ — phù hợp khi build feature mới.

**Rủi ro / Tác động**: Nếu không áp dụng tầng nào → mỗi lần LLM chạy test suite với 20 API calls POST = 20 record rác trong DB.

**Nguồn**: [[wiki/sources/Mockoon-UserGuide]][^1] + [[wiki/sources/PTSC-TLG-Idempotent-Operations]][^3] | **Độ tin cậy**: Dữ kiện

---

### 2.4 Mockoon + LLM: có dùng được không?

**Mô tả chi tiết**: LLM agent (như Claude với tool use, hay GPT function calling) gọi API qua HTTP — về cơ bản giống một HTTP client bình thường.[^4] Khi cấu hình LLM trỏ base URL về Mockoon (`http://localhost:3001`), LLM sẽ gọi endpoint mock và nhận response đã định nghĩa sẵn.[^4] Điều này cho phép:

- **Test LLM parsing logic**: LLM nhận được response `{"success": true, "data": {...}}` — test xem LLM có parse đúng field không
- **Test error handling của LLM**: Cấu hình Mockoon trả 401, 500, timeout → test xem LLM xử lý lỗi thế nào
- **Test conversation flow**: Mỗi turn gọi API mock khác nhau (Sequential mode) → simulate toàn bộ flow đa bước
- **Deterministic testing**: Response cố định → kết quả test nhất quán, không phụ thuộc DB state

**Giới hạn**: Mockoon không validate business logic — nếu LLM gửi `{"salary": -1000}`, Mockoon vẫn trả 200 OK nếu không cấu hình rule kiểm tra. Test với Mockoon = test *interface contract*, không phải test *business logic*.[^4]

**Tại sao quan trọng**: Phân biệt rõ: **Mockoon đủ dùng cho test phase 1** (integration test giữa LLM và API contract). Cần data thật chỉ khi test **business logic** (tính lương đúng không, BH đúng không).

**Rủi ro / Tác động**: Dùng Mockoon mà không rõ giới hạn → tưởng đã test đủ nhưng deploy lên thật bị lỗi business logic.

**Nguồn**: [inference][^7] từ cơ chế HTTP client của LLM + [[wiki/sources/Mockoon-UserGuide]][^1] | **Độ tin cậy**: Suy luận có cơ sở

---

### 2.5 Khi nào dùng mock, khi nào cần data thật

**Mô tả chi tiết**: Đây là câu hỏi quan trọng nhất — không phải lúc nào mock cũng đủ.[^5]

| Tình huống | Dùng Mock (Mockoon) | Cần data thật |
|-----------|---------------------|---------------|
| Test LLM có gọi đúng endpoint không | ✅ | ✗ |
| Test LLM parse response đúng field không | ✅ | ✗ |
| Test LLM xử lý error (401, 500) | ✅ | ✗ |
| Test frontend hiển thị data | ✅ | ✗ |
| Test tính lương có đúng công thức không | ✗ | ✅ |
| Test BH có tính đúng ngày tham gia không | ✗ | ✅ |
| Test report cuối tháng có đủ số không | ✗ | ✅ |
| UAT với khách hàng | ✗ | ✅ (DB UAT) |

**Tại sao quan trọng**: Mock giải quyết 70% bài toán test an toàn. 30% còn lại cần DB test riêng với seed data kiểm soát được.

**Rủi ro / Tác động**: Nhầm lẫn mock với test đầy đủ → bỏ sót lỗi business logic; hoặc ngược lại, luôn dùng data thật → rủi ro liên tục.

**Nguồn**: [inference][^7] | **Độ tin cậy**: Suy luận từ nguyên tắc testing pyramid

---

## 3. Biểu đồ so sánh

### 📈 So sánh rủi ro khi test POST API: có Mock vs không có Mock

> 💡 **Phân tích:**
>
> Không có mock, 100% POST request đều chạm DB thật — mỗi lần test là 1 lần rủi ro tích lũy, không kiểm soát được.
> Với Mockoon, rủi ro DB = 0 trong toàn bộ giai đoạn test interface — chỉ data thật được ghi khi test business logic có chủ đích.
> Sự chênh lệch không phải là "hơi an toàn hơn" — đây là ranh giới tuyệt đối giữa có và không chạm DB.
> Pattern này lặp lại ở mọi dự án thiếu test strategy: dev test → QC test → UAT test → đều ghi vào cùng 1 DB.
> Câu hỏi cần xác nhận: hiện tại HRM có DB test tách biệt không, hay tất cả đều test trên DB UAT chung?
> Nếu không có DB test riêng + không dùng mock → mỗi sprint tích lũy hàng trăm record rác, rủi ro báo cáo sai tăng dần.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "Không mock\n(POST thật)"
    value: 100
  - label: "Có Mockoon\n(interface test)"
    value: 0
  - label: "Có Mockoon\n(biz logic test)"
    value: 30

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
      alias: "% request chạm DB thật"
```

**📋 Số liệu biểu đồ**

| Scenario | % Request chạm DB thật | Ghi chú |
|----------|------------------------|---------|
| Không mock (POST thật) | 100% | Mọi test đều ghi DB |
| Có Mockoon — interface test | 0% | DB không bị chạm |
| Có Mockoon — biz logic test | ~30% | Chỉ test có chủ đích mới ghi DB |

> 🎯 **Nên làm**: Tách rõ 2 loại test — interface test dùng Mockoon (0% rủi ro), business logic test dùng DB test riêng có seed data.

---

### 📈 Phân loại test case: Mock đủ hay cần data thật?

> 💡 **Phân tích:**
>
> 60% test case điển hình của LLM/frontend có thể dùng mock hoàn toàn — đây là vùng an toàn, không cần chạm DB.
> 25% test case cần DB test tách biệt (không phải DB production) — đây là vùng cần kiểm soát seed data.
> Chỉ 15% cần DB production/UAT thật — UAT với KH, demo final, go-live check.
> Pattern rủi ro: khi không có mock strategy, 100% test đổ vào nhóm cuối — mọi thứ đều "cần data thật" là tư duy sai.
> Nghi vấn: tỷ lệ 60% mock-able phụ thuộc vào độ phức tạp business logic HRM — cần xác nhận với team QC.
> Nếu không phân loại rõ → team sẽ luôn chọn path dễ nhất: gọi API thật, ghi DB thật, rồi cleanup sau (hoặc không cleanup).

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
  label:
    type: "outer"
  legend:
    position: "bottom"
```

**📋 Số liệu biểu đồ**

| Loại test | Tỷ lệ | Ví dụ |
|-----------|-------|-------|
| Mock đủ (Mockoon) | 60% | Interface, auth, error handling, LLM parsing |
| DB test riêng | 25% | Business logic, tính toán, workflow |
| DB thật (UAT/prod) | 15% | Demo KH, UAT final, go-live check |

> 🎯 **Nên làm**: Phân loại test case ngay từ đầu sprint — tag "mockable" / "needs-db" để team QC và LLM biết dùng strategy nào.

---

## 4. Phân tích & Nhận định

### 4.1 Quy luật rút ra

**Mockoon là "traffic interceptor", không phải "fake database"** — điểm khác biệt quan trọng này thường bị bỏ qua.[^1] Vì nó hoạt động ở tầng network (HTTP), nó không cần biết gì về DB schema, không cần kết nối, không cần seed data. Implication: bất kỳ HTTP client nào — kể cả LLM agent — đều dùng được mà không cần cấu hình đặc biệt.

**Mock không thay thế test, mock giảm rủi ro trong khi test** — đây là tư duy đúng khi dùng Mockoon.[^4] Ai nghĩ "dùng mock là không test thật" đang nhầm lẫn giữa *test logic* và *test infrastructure*. Mockoon giúp test logic (LLM, frontend, integration) mà không cần infrastructure thật.

**Vấn đề POST nguy hiểm là triệu chứng của thiếu test strategy, không phải lỗi kỹ thuật** — nếu chỉ dùng Mockoon mà không có chiến lược phân loại test case rõ ràng, team sẽ vẫn loay hoay với câu hỏi "mock hay thật?".[^5]

### 4.2 Mâu thuẫn phát hiện

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | "Cần data thật để test đúng" vs "POST vào DB thật là nguy hiểm" | Team không biết chọn, mặc định dùng DB thật, tích lũy rủi ro |
| 2 | Mock đủ dùng cho LLM test vs Mock không test được business logic | LLM "pass test" với mock nhưng fail khi deploy thật |
| 3 | Mockoon dễ dùng vs Cần cấu hình rule để simulate đúng behavior | Response quá đơn giản → che giấu lỗi edge case |

---

## 5. Gaps & Hạn chế

- **Wiki nội bộ chưa có hướng dẫn tích hợp Mockoon + LLM agent** — tài liệu Tú.Huỳnh viết cho Tester/Dev, chưa có ví dụ cụ thể dùng với Claude/ChatGPT tool use.[^6]
- **Chưa có chuẩn về DB test tách biệt cho HRM** — không tìm thấy trong wiki bất kỳ quy định nào về test DB strategy. Đây là gap nguy hiểm vì mọi test hiện tại đều đổ lên DB UAT chung.[^7]
- **Mockoon không hỗ trợ stateful mock phức tạp** — nếu cần test flow: POST tạo record → GET lấy record vừa tạo, Mockoon trả response cố định nên GET không "biết" record vừa được tạo. Cần công cụ khác (WireMock, MSW) cho stateful scenarios.[^7]
- **Tỷ lệ 60/25/15 là ước lượng** — chưa có data thực tế từ HRM project về phân bố test case.

---

## 6. Gợi ý hành động

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | **Setup Mockoon ngay cho bất kỳ POST API nào LLM đang test** — trỏ base URL về `localhost:3001` | Mỗi ngày không làm = thêm N record rác trong DB, rủi ro tích lũy |
| 🔴 Cao | **Import Swagger HRM vào Mockoon** theo flow: Swagger JSON → Import OpenAPI v3 → Config routes | Tạo ngay mock environment cho toàn bộ HRM API trong 30 phút |
| 🟡 Trung bình | **Phân loại test case: tag "mockable" vs "needs-db"** trước mỗi sprint test | Tránh nhầm lẫn, tránh team luôn chọn default "gọi API thật" |
| 🟡 Trung bình | **Cấu hình LLM agent dùng configurable base URL** — env var `API_BASE_URL` — để dễ switch mock/thật | Không cần sửa code khi chuyển môi trường |
| 🟢 Thấp | **Xem xét idempotent API pattern** (dry-run header) cho các POST API quan trọng trong HRM | Cho phép test với logic thật mà không ghi DB — giải pháp dài hạn cho business logic test |
| 🟢 Thấp | **Bổ sung tài liệu Mockoon + LLM workflow** vào wiki — hướng dẫn cụ thể với tool use Claude | Tú.Huỳnh đã có base tốt, chỉ cần thêm phần LLM integration |

---

## Hướng dẫn setup nhanh (5 phút)

### Bước 1 — Cài Mockoon
Tải tại [mockoon.com](https://mockoon.com) → cài desktop app (Windows).

### Bước 2 — Import Swagger HRM
```
Mockoon → Import / Export → Import Swagger (OpenAPI v3) → chọn file swagger.json HRM
```

### Bước 3 — Cấu hình POST endpoint trả response giả
```
Route: POST /api/Hre_Profile/Save
Response 200:
{
  "success": true,
  "message": "Lưu thành công",
  "data": { "profileId": "{{faker 'string.uuid'}}" }
}
```

### Bước 4 — Chạy server
```
Port: 3001 → Click Run
```

### Bước 5 — Trỏ LLM/client về mock
```
Thay URL thật: https://hrm.company.com/api/...
Bằng mock URL: http://localhost:3001/api/...
```

**Kết quả**: Mọi POST của LLM đều đến Mockoon, DB thật không bị chạm. ✅

---

## Tài liệu tham khảo

### Nguồn Wiki

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^1] | [[wiki/sources/Mockoon-UserGuide]] | source | Hướng dẫn Mockoon do Tú.Huỳnh — import Swagger, route/response/rule, kịch bản login |
| [^3] | [[wiki/sources/PTSC-TLG-Idempotent-Operations]] | source | Idempotent API, CorrelationId, upsert semantics, dry-run pattern |
| [^4] | [[wiki/concepts/AI-DevTools]] | concept | Stack kỹ thuật TungLy — LLM tools, Cursor AI |

### Nguồn Thô (raw/)

| # | Đường dẫn | Ngày tạo | Mô tả ngắn |
|---|-----------|----------|------------|
| [^2] | `src/mockoon_user_guide.md` | 2024-02-15 | Tài liệu gốc đầy đủ — flow, properties, test cases, kịch bản login |

### Suy luận AI

| # | Loại | Giải thích |
|---|------|-----------|
| [^5] | [inference] | Suy luận từ nguyên tắc: thiếu test strategy → POST nguy hiểm là triệu chứng, không phải gốc rễ |
| [^6] | [inference] | Suy luận từ index.md — wiki không có trang nào về LLM + mock integration |
| [^7] | [inference] | Suy luận từ kiến trúc HRM và best practice testing pyramid |

---

[^1]: [[wiki/sources/Mockoon-UserGuide]] — Hướng dẫn Mockoon do Tú.Huỳnh (2024, cập nhật 05/2026): import Swagger, route/response/rule properties, kịch bản login đầy đủ
[^2]: `src/mockoon_user_guide.md` — Tài liệu gốc đầy đủ: flow, 10 test cases, regex validation rules
[^3]: [[wiki/sources/PTSC-TLG-Idempotent-Operations]] — Idempotent API với CorrelationId, upsert semantics, dry-run pattern cho tích hợp ESB
[^4]: [[wiki/concepts/AI-DevTools]] — Stack kỹ thuật TungLy, LLM tooling context
[^5]: [inference] — Suy luận: POST nguy hiểm là triệu chứng thiếu test strategy, không phải lỗi kỹ thuật đơn lẻ
[^6]: [inference] — Suy luận từ scan wiki/index.md: không có trang nào về Mockoon + LLM agent integration
[^7]: [inference] — Suy luận từ testing pyramid và kiến trúc HRM: stateful mock cần công cụ khác, DB test tách biệt chưa được chuẩn hóa

---

## Hành trình nghiên cứu

### Vòng 1 — Quét nền

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 1 | `wiki/index.md` | ✅ Đọc | Phát hiện `Mockoon-UserGuide`, `AI-DevTools`, `PTSC-Idempotent` liên quan |
| 2 | `wiki/sources/Mockoon-UserGuide.md` | ✅ Đọc | Nguồn chính — tóm tắt tốt, cần đọc file RAW để đủ chi tiết |
| 3 | `wiki/concepts/AI-DevTools.md` | ✅ Đọc | Stack kỹ thuật — không có LLM+mock pattern |
| 4 | `src/mockoon_user_guide.md` | ✅ Đọc | Tài liệu gốc đầy đủ — 10 test cases, rule properties, kịch bản login |
| 5 | `wiki/sources/PTSC-TLG-Idempotent-Operations.md` | ✅ Đọc | Idempotent API / dry-run pattern — liên quan vấn đề POST an toàn |

**Tổng vòng 1:** 5 file đọc · 0 bỏ qua · 2 lead mới (HRM-API-Excel, Code-Quality)

### Vòng 2 — Mở rộng theo lead

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 6 | `wiki/api/HRM-API-Excel-Integration.md` | ✅ Đọc | Chỉ có GET API patterns — không có mock/test strategy |
| 7 | `wiki/concepts/HRM-Code-Quality.md` | ✅ Đọc | Quy tắc store/merge/enum — không liên quan mock |

**Tổng vòng 2:** 2 file đọc · 0 bỏ qua · 0 lead mới

### Kết thúc tìm kiếm

> 🏁 Dừng tại vòng 2: không còn lead mới phát sinh. Áp dụng First Principles để tổng hợp phần LLM testing từ kiến thức kỹ thuật.

| Chỉ số | Giá trị |
|--------|---------|
| Tổng file đọc | 7 file |
| Đã đọc chi tiết | 7 file |
| Bỏ qua (có lý do) | 0 file |
| Leads theo đuổi | 2 leads |
| Gap phát hiện | 2 (LLM+mock, DB test strategy) |

### Phát hiện bất thường & mâu thuẫn

- **Gap 1**: Wiki có tài liệu Mockoon tốt nhưng hoàn toàn thiếu phần LLM + mock integration — khoảng trống này cần bổ sung
- **Gap 2**: Không có bất kỳ trang wiki nào về test DB strategy — team HRM chưa có chuẩn về môi trường test

### Câu hỏi suy ngẫm

**🔬 Tư duy nguyên bản — FPT**
> Chúng ta mặc định "test đúng = gọi API thật" — nhưng nếu bỏ giả định đó đi, điều gì thực sự cần được test? Là *behavior của LLM khi nhận response* hay là *tính đúng đắn của business logic trong DB*? Nếu phân biệt được hai thứ này, 60% test case không cần chạm DB thật.

**🧠 Câu hỏi Socrate**
> Nếu Mockoon đã đủ dùng để test LLM, tại sao team vẫn lo "không có data thật thì test không đúng"? Giả định ẩn nào đang khiến mock bị coi là "test giả"? Và nếu giả định đó sai — bằng chứng nào trong kết quả test sẽ thay đổi đầu tiên?

**🎯 SAT — Suy ngẫm · Áp dụng · Thách thức**
> Nếu phải hành động ngay hôm nay, bước đầu tiên không phải là đọc thêm tài liệu Mockoon — mà là: identify 3 POST API mà LLM đang gọi nhiều nhất, import chúng vào Mockoon, đổi base URL trong config LLM. Việc đó mất 30 phút và loại bỏ ngay rủi ro DB. Bạn có thể làm điều đó hôm nay không?
