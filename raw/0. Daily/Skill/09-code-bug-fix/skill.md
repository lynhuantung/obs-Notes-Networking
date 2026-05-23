---
name: 09-code-bug-fix
description: "Dùng khi người dùng muốn debug và fix một bug — tra wiki tìm context → phân tích nguyên nhân → xem code thực tế → đưa ra kế hoạch fix. Ví dụ: \"fix bug schedule không chạy\", \"debug lỗi X\", \"tại sao Y không hoạt động\", \"/09-code-bug-fix <mô tả bug>\""
---

# Skill: 09-code-bug-fix — Debug & Fix Bug Toàn Diện

## Khi nào dùng skill này

Dùng khi người dùng muốn:
- Debug một bug cụ thể end-to-end
- Hiểu nguyên nhân rồi fix luôn
- Kết hợp wiki context + phân tích code + kế hoạch sửa
- "fix bug", "debug lỗi", "tại sao không chạy", "/09-code-bug-fix"

---

## Tại sao phải tiền xử lý trước khi tra wiki?

> **1. LLM không chạy được thuật toán đồ thị** — Tiền xử lý chạy Betweenness Centrality + Modularity để tìm từ khóa cốt lõi và phân cụm chủ đề, biến mô tả bug thô thành đồ thị tri thức nhỏ trước khi truy xuất.
>
> **2. Chuẩn hóa ngôn ngữ tự động** — Đối chiếu với `dictionary_alias` + `glossary` để lemmatize từ viết tắt, từ lóng, cách gọi khác nhau → dữ liệu đưa cho AI luôn sạch và nhất quán.
>
> **3. Triệt tiêu ảo giác** — Sinh 3–5 query đã tối ưu, buộc AI đi theo node wiki có thật thay vì tự đoán, ngăn AI bịa module/code không tồn tại.
>
> **4. Tiết kiệm token** — Giới hạn phạm vi xuống 5–7 node liên quan nhất, thay vì quét hàng trăm file không liên quan.
>
> **5. Phát hiện yêu cầu mơ hồ** — Nếu phát hiện Structural Gap (liên kết rời rạc), AI chủ động hỏi lại thay vì đoán mò và fix sai chỗ.

---

## TỔNG QUAN LUỒNG

```
PHASE 0 — Thu thập thông tin bug
    ↓
PHASE 1 — Trích xuất từ khóa (trích từ khóa) → Bóc tách chức năng từng từ khóa
         → Mạng lưới liên kết → Tra wiki → Vẽ flowchart luồng → In block 📚
    ↓
PHASE 2 — Xem code thực tế (GitNexus + file search)
    ↓
PHASE 3 — Gợi ý fix + kế hoạch hành động
    ↓
PHASE 4 — (Tuỳ chọn) Ghi wiki log + nhật ký
```

---

## PHASE 0 — THU THẬP THÔNG TIN BUG

**Nếu người dùng đã mô tả đầy đủ → bỏ qua, tự suy luận và bắt đầu PHASE 1 ngay.**

Nếu thiếu thông tin, hỏi gộp 1 lượt:

> "Cho mình biết nhanh:
> 1. Bug là gì? *(tên module / chức năng bị lỗi)*
> 2. Triệu chứng bề ngoài là gì? *(người dùng thấy gì, log báo gì)*
> 3. Đã xảy ra bao giờ chưa, hay lần đầu?"

---

## PHASE 1 — TRÍCH XUẤT TỪ KHÓA + TRA WIKI + FLOWCHART

> ⚠️ **BẮT BUỘC thực hiện đúng các bước theo thứ tự — KHÔNG bỏ qua bước nào, KHÔNG gộp bước.**

### Bước 1.1 — Thông báo kế hoạch

**BẮT BUỘC in đầy đủ block sau, không rút gọn:**

```
🔍 Bug-Fix: "<tên bug>"

Bước 1 — Tiền xử lý mô tả bug (InfraGraph) — Tại sao bắt buộc?
   1. LLM không tự chạy thuật toán đồ thị — cần Betweenness Centrality + Modularity
      để tìm từ khóa cốt lõi và phân cụm chủ đề trước khi truy xuất
   2. Chuẩn hóa ngôn ngữ — lemmatize từ viết tắt, từ lóng qua dictionary_alias + glossary
   3. Triệt tiêu ảo giác — sinh 3–5 query tối ưu, buộc AI đi theo node wiki có thật
   4. Tiết kiệm token — giới hạn xuống 5–7 node liên quan, không quét hàng trăm file
   5. Phát hiện mơ hồ — Structural Gap → hỏi lại thay vì đoán mò và fix sai chỗ
Bước 2 — Trích xuất từ khóa: trích từ khóa từ mô tả đã chuẩn hóa
Bước 3 — Bóc tách chức năng: định nghĩa từng từ khóa trong HRM
Bước 4 — Mạng lưới liên kết: nối các chức năng thành chuỗi phụ thuộc nhân quả
Bước 5 — Tra wiki tìm context liên quan
Bước 6 — Phác thảo flowchart luồng chạy thực tế
Bước 7 — Phân tích nguyên nhân từ wiki
Bước 8 — Xem code thực tế (nếu cần)
Bước 9 — Gợi ý fix
```

---

### Bước 1.2 — Trích xuất từ khóa: Trích từ khóa từ mô tả bug

> **Mục đích:** Tìm ra các từ khóa quan trọng để tra wiki chính xác — tránh bỏ sót domain.

Áp dụng lên **mô tả bug** từ PHASE 0, trích xuất:
- Danh từ + động từ quan trọng, bỏ stopword
- **Lemmatize — đưa về dạng gốc:**
  - Động từ → nguyên thể: "không chạy", "đã chạy", "tự động chạy" → `chạy`
  - Danh từ ghép → giữ nguyên cụm: `bảo hiểm`, `phân tích lương`, `hợp đồng lao động`
  - Loại bỏ duplicate sau khi normalize
- Từ khóa bổ sung (domain nghiệp vụ liên quan có thể bị bỏ sót)

**Format output:**
```
📊 TRÍCH XUẤT TỪ KHÓA
────────────────────────
NODES: [keyword-1], [keyword-2], [keyword-3], ...
EXPAND: + [keyword-new-1], [keyword-new-2]  ← từ khóa nghiệp vụ bổ sung
────────────────────────
```

---

### Bước 1.2 — Tiền xử lý bằng MCP InfraGraph (BẮT BUỘC)

> **Tại sao phải tiền xử lý mô tả bug thô?**
> Người dùng thường mô tả bug bằng từ thông thường, viết tắt hoặc sai thuật ngữ hệ thống — ví dụ: "lỗi lương" có thể là lỗi tính lương, lỗi hiển thị, hay lỗi export; "bh không ra" chưa rõ là phân tích BH, báo cáo D02, hay dữ liệu thiếu. Nếu AI tìm kiếm bằng từ thô sẽ tra nhầm module, đọc sai file, rồi đưa ra hướng fix không liên quan (ảo giác).
> Bước này đưa từ về dạng chuẩn trong hệ thống (ví dụ: "bh" → "Bảo Hiểm", "nv" → "nhân viên", "ko ra" → "không hiển thị"), xác định người dùng đang báo lỗi / hỏi cách dùng / yêu cầu tính năng, rồi chọn đúng từ khóa để tìm đúng node wiki và đúng module code — tránh fix nhầm chỗ.

> **Thay thế hoàn toàn** bước trích xuất từ khóa thủ công.

Gọi tool MCP:
```
mcp__InfraGraph__preprocess(query="<mô tả bug đầy đủ>")
```

Đọc JSON output, in tóm tắt:
```
📊 ANALYZER REPORT
  B1 Tokens    : [...]
  B3 Glossary  : [Term → context module]
  B4 Intent    : [fix-bug | ...]
  B5 Core KW   : [kw-1, kw-2, ...]
  B6 Queries   : [q1, q2, ...]
  B10 Gaps     : <"Không có" | câu hỏi làm rõ>
```

⛔ **KHÔNG ĐƯỢC BỎ QUA** — Ngay sau block ANALYZER REPORT, phải in NGAY block sau (lấy từ `reconstructed_text` trong MCP output, KHÔNG tóm tắt, KHÔNG rút gọn):

```
📝 TÁI TẠO VĂN BẢN

  Văn bản thô:
  "<original_query nguyên văn>"

  Văn bản sau xử lý:
  "<layer2_annotated — đã chuẩn hóa alias + chú thích thuật ngữ>"
```

> Nếu B10 có `clarification_needed` → **DỪNG**, hỏi người dùng trước.
> Các bước tiếp theo (Bóc tách, Tra wiki, Flowchart) dựa vào **"Văn bản sau xử lý"** làm mô tả bug chính thức.
> Dùng `core_keywords` cho Bước 1.3, `optimized_queries` cho Bước 4 tra wiki.

---

### Bước 1.3 — Bóc tách chức năng: Định nghĩa từng từ khóa trong HRM

> **Mục đích:** Làm rõ từng từ khóa là **chức năng nghiệp vụ gì** trong HRM — tránh hiểu nhầm tên gọi, buộc phải tư duy sâu về input/logic/output/guard trước khi đụng code.

Với **từng node chức năng** trong NODES (ưu tiên node trung tâm + EXPAND):

```
🔬 BÓC TÁCH CHỨC NĂNG: [keyword / tên chức năng]
────────────────────────
❓ CÂU HỎI GỐC
   Chức năng này tồn tại để giải quyết bài toán gì?
   Nếu bỏ nó đi, hệ thống thiếu điều gì?

⚙️ INPUT — Cần gì để chạy?
   Dữ liệu:   [bảng / trường / giá trị bắt buộc]
   Điều kiện: [trạng thái hệ thống phải thỏa mãn]
   Trigger:   [ai/gì kích hoạt — manual / schedule / event / màn hình nào]

🔄 LOGIC — Biến đổi như thế nào?
   Thực thi:  [SP / service / công thức core]
   Quy tắc:   [rule bất biến trong logic này]

📤 OUTPUT — Sinh ra cái gì?
   Ghi vào:      [bảng / trường nào thay đổi]
   Ảnh hưởng đến:[chức năng nào phụ thuộc output này]

🚫 GUARD — Khi nào KHÔNG chạy?
   Skip khi:  [điều kiện bị bỏ qua / silent]
   Fail khi:  [điều kiện báo lỗi]

🤔 PHẢN BIỆN
   - Nếu input đúng mà output sai → logic sai ở đâu?
   - Nếu logic đúng mà vẫn sai → guard có đang skip nhầm không?
   - Ta có thực sự biết output "đúng" trông như thế nào không?
   - Giả định nào đang được coi là hiển nhiên nhưng chưa verify?

⚠️ GAP DETECTION — Ô nào còn "?" sau khi bóc tách = điểm cần điều tra trước
   - INPUT còn ?: → chưa biết dữ liệu đầu vào → phải xác nhận trước khi xem code
   - TRIGGER còn ?: → chưa biết ai/gì kích hoạt → tra wiki/config ngay
   - GUARD còn ?: → chưa biết điều kiện skip/fail → nguy cơ silent bug cao
────────────────────────
```

**Ví dụ** — keyword "phân tích bảo hiểm":
```
🔬 BÓC TÁCH CHỨC NĂNG: phân tích bảo hiểm
────────────────────────
❓ CÂU HỎI GỐC
   Tính toán mức đóng BH và xác định trạng thái tăng/giảm/nghỉ cho từng NV trong tháng.
   Nếu bỏ: không có dữ liệu để kê khai BHXH, lương sẽ không trừ đúng BH.

⚙️ INPUT — Cần gì để chạy?
   Dữ liệu:   NV, tháng phân tích, lương BHXH, Cat_InsuranceElement, chế độ BH
   Điều kiện: NV có hợp đồng còn hiệu lực, chế độ BH đã cấu hình đầy đủ
   Trigger:   Manual — BH > Phân tích bảo hiểm > chọn tháng > bấm "Phân tích"

🔄 LOGIC — Biến đổi như thế nào?
   Thực thi:  SP usp_InsuranceAnalysis (hoặc tương đương)
   Quy tắc:   Mức đóng = lương BHXH × tỷ lệ từ Cat_InsuranceElement; không âm, không vượt trần

📤 OUTPUT — Sinh ra cái gì?
   Ghi vào:      Bảng Insurance_Analysis — mức đóng, trạng thái từng NV
   Ảnh hưởng đến: Kê khai BHXH, phân tích lương, bảng lương cuối kỳ

🚫 GUARD — Khi nào KHÔNG chạy?
   Skip khi:  NV đã nghỉ trước kỳ phân tích / chưa có chế độ BH gắn → silent skip
   Fail khi:  Cat_InsuranceElement không tồn tại / công thức rỗng → exception

🤔 PHẢN BIỆN
   - Nếu input đúng mà output sai → công thức trong Cat_InsuranceElement có vấn đề?
   - Nếu logic đúng mà vẫn sai → guard đang silent skip NV nào đó không?
   - "Phân tích đúng" trông như thế nào — so sánh với tháng trước hay với file kê khai?
   - Giả định lương BHXH đã được cập nhật trước khi phân tích — đã verify chưa?
────────────────────────
```

---

### Bước 1.4 — Mạng lưới liên kết: Nối các chức năng thành chuỗi nhân quả

> **Mục đích:** Kết nối các chức năng đã bóc tách thành **mạng lưới liên kết** — tìm ra mắt xích nào đứt gây ra bug.

Tạo **sơ đồ mạng lưới liên kết** từ các chức năng đã bóc tách:

```
🕸 MẠNG LƯỚI LIÊN KẾT
────────────────────────
[chức năng A]
  → phụ thuộc → [chức năng B] (vì: B cung cấp dữ liệu đầu vào cho A)
  → gây ra    → [chức năng C] (nếu A sai → C nhận dữ liệu sai → ...)
  → liên quan → [danh mục D] (A đọc cấu hình từ D)

[chức năng B]
  → phụ thuộc → [danh mục E]
  → xung đột? → [chức năng F] (conflict khi: cùng NV, cùng tháng)

Chuỗi nghi ngờ gây bug:
  [chức năng X] → [chức năng Y] → [chức năng Z] ← ⚠️ điểm có thể vỡ
────────────────────────
```

**Quy tắc:**
- Mỗi liên kết phải có **lý do** (vì / nếu sai thì / khi / dẫn đến)
- Đánh dấu `⚠️ điểm có thể vỡ` — nơi chain có thể đứt gây ra bug
- Ưu tiên nối với **danh mục cấu hình** (Cat_*) khi chức năng đọc công thức / phần tử

---

### Bước 1.5 — Đọc wiki index

Dùng **NODES + EXPAND** từ bước Trích xuất từ khóa + **tên chức năng** từ bước Bóc tách chức năng làm search terms để tra wiki:

**Dùng Atlas trước:**
```
wiki_search_links("<keyword>")   → định vị node liên quan
wiki_local_graph("<node_id>")    → neighbors, chấm điểm ≥4 → bắt buộc đọc
```
Fallback về `wiki/index.md` nếu Atlas không tìm được kết quả.

Đọc `wiki/index.md` → xác định các trang liên quan đến từng từ khóa / chức năng quan trọng.

**Đường dẫn wiki:**
```
Wiki root: C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/wiki/
  index.md       ← ĐỌC ĐẦU TIÊN
  projects/      ← Dự án liên quan
  sources/       ← Nhật ký lỗi đã gặp
  concepts/      ← Khái niệm kỹ thuật (IIS, Windows Service, SQL Job...)
  synthesis/     ← Phân tích tổng hợp đã có
```

---

### Bước 1.6 — Đọc các trang wiki liên quan (song song với GitNexus)

**Wiki (ưu tiên theo thứ tự):**
1. `sources/Nhat-ky-van-de-he-thong.md` — nhật ký lỗi hệ thống tương tự
2. `sources/Nhat-ky-van-de-nghiep-vu.md` — nhật ký lỗi nghiệp vụ
3. Trang project liên quan (`projects/<ten-du-an>.md`)
4. Trang concept kỹ thuật liên quan (`concepts/HRM-*.md`)
5. Trang synthesis đã có nếu có phân tích trước đó

**GitNexus (chạy song song):**
```
gitnexus_query({ query: "<triệu chứng bug>" })
gitnexus_query({ query: "<tên module / service liên quan>" })
```

---

### Bước 1.7 — Phác thảo Workflow Flowchart

> ⚠️ **Vẽ flowchart TRƯỚC khi in block phân tích** — đây là bước bắt buộc.

Dựa trên context wiki vừa đọc được, **vẽ flowchart ASCII** thể hiện **luồng chạy thực tế** của chức năng/module bị bug.

**Quy tắc flowchart:**
- Dùng dạng **box ASCII** với `+---+`, `|`, `v`, nhánh `Yes / No`
- Thể hiện **luồng chạy thực tế** của chức năng/module bị bug (không phải cây nguyên nhân)
- Đánh dấu rõ bước nào là **điểm nghi ngờ gây bug** bằng `⚠️` hoặc `← BUG?`
- Mỗi box mô tả 1 bước xử lý hoặc 1 điều kiện rẽ nhánh

**Format chuẩn:**
```
+----------------------+
|        START         |
+----------------------+
           |
           v
+------------------------------+
| Bước xử lý 1                 |
| (mô tả ngắn)                 |
+------------------------------+
           |
           v
+------------------------------+
| Điều kiện kiểm tra?          |   ← BUG? (nếu nghi ngờ)
+------------------------------+
        | Yes                      | No
        v                          v
+-------------------+   +----------------------+
| Xử lý nhánh Yes   |   | Xử lý nhánh No       |
+-------------------+   +----------------------+
        \_____________________/
                   |
                   v
+------------------------------+
| Bước tiếp theo               |
+------------------------------+
           |
           v
+----------------------+
|         END          |
+----------------------+
```

---

### Bước 1.8 — In block 📚 PHÂN TÍCH TỪ WIKI

Sau flowchart, in ngay block phân tích chi tiết rồi hỏi next step:

```
─── 📚 PHÂN TÍCH TỪ WIKI ───────────────────────────

Bug: [Tên bug]

Từ wiki tìm thấy [N] nguồn liên quan:
  • [Nguồn 1] → [Fact chính 1 dòng]
  • [Nguồn 2] → [Fact chính 1 dòng]
  • [Nguồn 3] → [Fact chính 1 dòng]

Nguyên nhân khả dĩ (từ wiki):
  1. [Nguyên nhân A] — fact [[wiki/sources/...]]
  2. [Nguyên nhân B] — fact [[wiki/concepts/...]]
  3. [Nguyên nhân C] — inference (chưa có nguồn wiki)

─────────────────────────────────────────────────────
Bạn muốn tiếp theo làm gì?

  [C] Xem code — Kiểm tra code thực tế để xác nhận nguyên nhân
  [F] Fix ngay — Dựa trên wiki, tiến hành fix luôn (PA ưu tiên nhất)
  [L] Log wiki — Ghi nhật ký bug vào wiki
  [Enter]      — Dừng ở đây

─────────────────────────────────────────────────────
```

**Quy tắc block:**
- Mỗi nguyên nhân phải ghi rõ nguồn: `fact` (từ wiki) hoặc `inference` (suy luận)
- Tối đa 5 nguyên nhân, xếp theo xác suất cao → thấp
- Nếu wiki không có thông tin → ghi "Wiki chưa có thông tin, tự động chuyển xem code" và chạy PHASE 2

**Nếu chọn C** → Tiếp tục PHASE 2 xem code.
**Nếu chọn F** → Bỏ qua PHASE 2, nhảy thẳng PHASE 3 với nguyên nhân wiki làm root cause.
**Nếu chọn L** → Chạy logic `07-wiki-rootcause` Phase 1A.
**Nếu Enter** → Kết thúc.

---

## PHASE 2 — XEM CODE THỰC TẾ

### Bước 2.1 — Định vị code liên quan

Dùng GitNexus để tìm các symbol, file, process liên quan:

```
# Tìm execution flow
gitnexus_query({ query: "<tên job / service / schedule>" })

# Xem chi tiết symbol nghi ngờ
gitnexus_context({ name: "<tên class / method>" })

# Xem impact nếu cần
gitnexus_impact({ target: "<tên symbol>", direction: "upstream" })
```

Nếu GitNexus không có index → dùng Glob + Grep để tìm file:

```
Glob: **/*<keyword>*.cs (hoặc .ts, .js tuỳ project)
Grep: pattern liên quan đến bug
```

### Bước 2.2 — Đọc code

Đọc các file liên quan theo thứ tự:
1. Entry point của job/service/schedule
2. Logic xử lý chính
3. Config / appsettings liên quan
4. Dependency (service, repository, helper được gọi)

### Bước 2.3 — In kết quả phân tích code

```
─── 🔎 PHÂN TÍCH CODE ──────────────────────────────

File chính: [đường dẫn file]
  Line [N]: [đoạn code nghi ngờ]
  → Vấn đề: [mô tả vấn đề cụ thể]

File liên quan: [đường dẫn]
  → [Observation]

Xác nhận nguyên nhân:
  ✅ [Nguyên nhân A từ wiki] — ĐÚNG, thấy tại [file:line]
  ❌ [Nguyên nhân B từ wiki] — SAI, code cho thấy...
  🔍 [Nguyên nhân C mới phát hiện từ code]

ROOT CAUSE: [Kết luận nguyên nhân gốc rễ]

─────────────────────────────────────────────────────
```

---

## PHASE 2.5 — METHODOLOGY ESCALATION (Kích hoạt khi bí)

> **Trigger tự động** khi **một trong các điều kiện sau** xảy ra sau PHASE 2:
> - Root cause vẫn là `[inference]` — chưa confirm từ code/log
> - Còn ≥2 nguyên nhân chưa loại được
> - PHASE 1 đã vào thẳng PHASE 3 (chọn F) nhưng fix không giải quyết được

### Bước 2.5.1 — Chẩn đoán tình huống & chọn phương pháp

Hiển thị block sau, điền thực tế vào `[...]`:

```
─── 🧠 METHODOLOGY ESCALATION ──────────────────────
Debug chưa ra kết quả. Kích hoạt phương pháp luận.

Tình huống hiện tại:
  • Đã thử: [liệt kê những gì đã kiểm tra]
  • Chưa loại được: [các nguyên nhân còn nghi ngờ]
  • Loại lỗi: [có logs rõ / phức tạp đa tầng / cần nhìn rộng / ...]

Phương pháp phù hợp:
  [✅ Phương pháp 1] — [lý do 1 dòng]
  [   Phương pháp 2] — [lý do 1 dòng, nếu có]
─────────────────────────────────────────────────────
```

**Sơ đồ quyết định chọn phương pháp:**

```
                    [Bug chưa ra root cause]
                             |
              _______________↓_______________
             |                               |                        |
    Triệu chứng rõ?              Độ phức tạp?              Yêu cầu sáng tạo?
             |                               |                        |
      Yes ───┤─── No              Đa tầng ───┤─── Nhiều    Liên ngành ─┤─── Hiểu sâu
      |      |    |               |          |    yếu tố   |           |    |
  Sherlock  Einstein           Contact    5 Whys+        Leonardo    Feynman
  Holmes    Tư duy             Tracing    PDCA           da Vinci
  (logs +   (đơn giản          (chuỗi     (hỏi Tại       (diagram,   (giải thích
  loại trừ) hóa 2 node)        nhân quả)  sao ≥5 lần)    analogy)    đơn giản)
             |_______________|___________________________|_____________|
                                          |
                                  Kết luận root cause
                                          |
                                  Fix + Kiểm thử
```

> Một bug có thể kích hoạt **nhiều nhánh song song** — ví dụ: logs rõ (Sherlock) + đa tầng (Contact Tracing).

### Bước 2.5.2 — Áp dụng phương pháp đã chọn

**Sherlock Holmes:**
```
1. Liệt kê tất cả facts đã biết (logs, stack trace, behavior)
2. Lập danh sách giả thuyết
3. Với mỗi giả thuyết: thiết kế 1 test nhỏ để loại trừ
4. Chạy test → loại → còn gì thì đó là root cause
```

**Einstein (Thought Experiment):**
```
1. Thu hệ thống về tối giản: 2 node, 1 user, 1 request
2. Trong môi trường tối giản đó, lỗi còn xảy ra không?
   - Có → lỗi logic core (không phải scale/config)
   - Không → lỗi do tương tác/scale/env
3. Tìm điểm khác biệt giữa "tối giản OK" và "thực tế lỗi"
```

**Contact Tracing (Chuỗi nhân quả):**
```
1. Bắt đầu từ triệu chứng cuối (exception / wrong output / crash)
2. Lần ngược: X lỗi ← Y gọi X ← Z kích hoạt Y ← ...
3. Xác nhận từng liên kết bằng log / breakpoint / query
4. Dừng khi chạm điểm: "ở đây không ai gây ra, đây là gốc"
   → "bệnh nhân 0" = root cause
```

**Toyota 5 Whys:**
```
1. Nêu vấn đề rõ ràng: "Hệ thống X làm Y thay vì Z"
2. Tại sao (1)? → [Trả lời + xác nhận từ data]
3. Tại sao (2)? → [Trả lời + xác nhận]
4. ... (lặp đến khi ra nguyên nhân actionable)
5. Genchi Genbutsu: nếu lỗi môi trường → SSH vào server xem trực tiếp
```

**Leonardo da Vinci:**
```
1. Vẽ flowchart / dependency diagram đầy đủ (bao gồm external deps)
2. So sánh với hệ thống tương tự hoạt động tốt
3. Tìm điểm "thắt cổ chai" hoặc "nút bất thường" trong diagram
4. Zoom vào điểm đó để kiểm tra
```

**Feynman:**
```
1. Viết ra: "Bug này xảy ra vì..." bằng ngôn ngữ đơn giản nhất
2. Đọc lại — chỗ nào giải thích không trôi chảy? → đó là kẽ hở
3. Lấp kẽ hở: đọc code / docs / log để hiểu rõ chỗ đó
4. Lặp đến khi giải thích hoàn toàn trơn tru → root cause đã rõ
```

### Bước 2.5.3 — Kết quả và tiếp theo

Sau khi áp dụng, cập nhật block PHASE 2 với kết quả mới:
- Nếu root cause đã rõ → tiếp tục PHASE 3
- Nếu vẫn chưa rõ → thử phương pháp thứ 2 trong bảng, hoặc hỏi user cung cấp thêm log/data

---

## PHASE 3 — GỢI Ý FIX + KẾ HOẠCH HÀNH ĐỘNG

### Bước 3.1 — Trình bày các phương án fix

```
─── 🛠️ KẾ HOẠCH FIX ────────────────────────────────

Root cause đã xác định:
  [Mô tả root cause ngắn gọn]

PHƯƠNG ÁN FIX:

  PA1 — [Tên phương án] ⭐ (Khuyến nghị)
  ├─ Sửa: [file] tại [line/method]
  ├─ Thay đổi: [mô tả cụ thể cần làm]
  ├─ Ưu: [lý do nên chọn]
  └─ Nhược: [rủi ro / hạn chế]

  PA2 — [Tên phương án thay thế]
  ├─ Sửa: [file]
  ├─ Thay đổi: [mô tả]
  ├─ Ưu: [...]
  └─ Nhược: [...]

PHƯƠNG ÁN CHỌN: PA[N] — [Lý do ngắn gọn]

─────────────────────────────────────────────────────
```

### Bước 3.2 — Hành động cụ thể

```
KẾ HOẠCH THỰC HIỆN:

  STT  Hành động                          File                    Ưu tiên
  ──────────────────────────────────────────────────────────────────────
   1   [Hành động cụ thể nhất]            [file:line]             🔴 Ngay
   2   [Hành động tiếp theo]              [file]                  🟡 Sau
   3   [Test / verify]                    [test file]             🟢 Cuối
   4   [Deploy / restart service]         —                       🟢 Cuối

TEST PLAN:
  - [ ] [Cách kiểm tra sau khi fix]
  - [ ] [Edge case cần test]
  - [ ] [Xác nhận bug đã hết]
```

### Bước 3.3 — Hỏi có cần Claude thực hiện fix không

```
────────────────────────────────────────────────────
Bạn muốn tiếp theo làm gì?

  [F] Fix ngay  — Claude sửa code theo PA được chọn
  [R] Review    — Xem lại code trước khi sửa
  [L] Log wiki  — Ghi nhật ký bug vào wiki (07-rootcause)
  [Enter]       — Dừng ở đây

────────────────────────────────────────────────────
```

**Nếu chọn F** → Claude thực hiện sửa code theo action plan, dùng Edit tool.
**Nếu chọn R** → Hiển thị lại đoạn code cụ thể cần sửa để user review.
**Nếu chọn L** → Chạy logic của `07-wiki-rootcause` Phase 1A (Nhật ký nhanh).
**Nếu Enter** → Kết thúc.

---

## PHASE 4 — GHI WIKI LOG (Nếu chọn L)

Append vào `wiki/log.md`:

```markdown
## [YYYY-MM-DD] bug-fix | <Tên bug ngắn>

Wiki: `wiki/sources/<file>`, `wiki/concepts/<file>`
Code: `<file chính đã xem>`
Root cause: <1 dòng>
Fix: <1 dòng mô tả phương án đã chọn>
```

Nếu bug là lần đầu gặp / có pattern mới → append thêm vào:
- `wiki/sources/Nhat-ky-van-de-he-thong.md` (lỗi kỹ thuật)
- `wiki/sources/Nhat-ky-van-de-nghiep-vu.md` (lỗi nghiệp vụ)

---

## QUY TẮC QUAN TRỌNG

| Rule | Nội dung |
|------|----------|
| **Trích xuất từ khóa → Bóc tách chức năng → Mạng lưới liên kết trước** | Bước 1.2-1.4 bắt buộc chạy trước khi tra wiki — Trích xuất từ khóa trích từ khóa, Bóc tách chức năng làm rõ từng chức năng, Mạng lưới liên kết nối mạng lưới liên kết |
| **Wiki trước, code sau** | Luôn tra wiki trước — tránh reinvent the wheel |
| **Flowchart workflow trước block wiki** | Bước 1.7 vẽ flowchart → Bước 1.8 mới in block 📚 — thứ tự này không đổi |
| **Flowchart = luồng thực tế** | Flowchart mô tả luồng chạy thực tế của hệ thống, KHÔNG phải cây nguyên nhân |
| **Hỏi trước khi xem code** | Sau block 📚 → hỏi [C/F/L/Enter] trước khi tự ý chạy tiếp |
| **Citation bắt buộc** | Mỗi nguyên nhân từ wiki phải ghi nguồn `[[wiki/...]]` |
| **Fact vs Inference** | Phân biệt rõ fact (từ wiki/code) và inference (suy luận) |
| **Root cause actionable** | Root cause phải dẫn đến hành động fix cụ thể |
| **Không sửa code tự ý** | Luôn trình bày kế hoạch → hỏi user → mới sửa |
| **GitNexus ưu tiên** | Nếu có GitNexus index → dùng trước Glob/Grep |
| **Parallel reads** | Đọc wiki + chạy GitNexus query song song để tiết kiệm thời gian |

---

## VÍ DỤ THỰC TẾ

### Trigger mẫu:
```
/09-code-bug-fix BUG Schedule lấy hồ sơ ứng viên từ VNWs không tự động chạy
/09-code-bug-fix lỗi tính thuế TNCN sai với nhân viên part-time
/09-code-bug-fix Windows Service HRM bị crash sau 2 giờ
fix bug job đồng bộ dữ liệu bảo hiểm không chạy đúng giờ
```

### Flow thực tế cho "Schedule VNWs không chạy":
```
PHASE 0              : Thu thập mô tả bug
PHASE 1 Bước 1.2     : Trích xuất từ khóa → nodes: schedule, VNWs, tự động, chạy, job
PHASE 1 Bước 1.3     : Bóc tách chức năng → bóc tách "schedule": chức năng gì? màn hình nào? phụ thuộc gì?
PHASE 1 Bước 1.4     : Mạng lưới liên kết → schedule→job→trigger→config ⚠️ điểm vỡ
PHASE 1 Bước 1.5     : Đọc wiki/index.md (dùng nodes từ InfraNodus + tên chức năng FTP)
PHASE 1 Bước 1.6     : Đọc wiki + GitNexus query song song
PHASE 1 Bước 1.7     : Vẽ flowchart ASCII luồng Schedule → Trigger → Job → DB
PHASE 1 Bước 1.8     : In block 📚 → hỏi [C/F/L/Enter]
PHASE 2 (nếu chọn C) : Xem code JobScheduler, WindowsService entry point
PHASE 3              : Xác nhận root cause → kế hoạch fix
```
