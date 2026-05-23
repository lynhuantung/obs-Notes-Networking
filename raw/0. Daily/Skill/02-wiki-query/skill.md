---
name: 02-wiki-query
description: "Dùng khi người dùng đặt câu hỏi có thể trả lời từ wiki — về dự án, khách hàng, kỹ thuật, bài học. Ví dụ: \"VnPay đang ở giai đoạn nào?\", \"lỗi IIS xử lý thế nào?\", \"tổng hợp <chủ đề>\", \"/02-wiki-query <câu hỏi>\""
---

# Skill: 02-wiki-query

Trả lời câu hỏi dựa trên LLM Wiki theo pipeline **GraphRAG 10 bước**.

## Kích hoạt

- `/02-wiki-query <câu hỏi hoặc đoạn văn>`
- Bất kỳ câu hỏi nào có thể trả lời từ nội dung wiki

## Tại sao phải tiền xử lý trước khi tra wiki?

> **1. LLM không chạy được thuật toán đồ thị** — Tiền xử lý chạy Betweenness Centrality + Modularity để tìm từ khóa cốt lõi và phân cụm chủ đề, biến câu hỏi thô thành đồ thị tri thức nhỏ trước khi truy xuất.
>
> **2. Chuẩn hóa ngôn ngữ tự động** — Đối chiếu với `dictionary_alias` + `glossary` để lemmatize từ viết tắt, từ lóng, cách gọi khác nhau → dữ liệu đưa cho AI luôn sạch và nhất quán.
>
> **3. Triệt tiêu ảo giác** — Sinh 3–5 query đã tối ưu, buộc AI đi theo node wiki có thật thay vì tự đoán, ngăn AI bịa cấu trúc code không tồn tại.
>
> **4. Tiết kiệm token** — Giới hạn phạm vi tìm kiếm xuống 5–7 node liên quan nhất, thay vì quét hàng trăm file không liên quan.
>
> **5. Phát hiện yêu cầu mơ hồ** — Nếu phát hiện Structural Gap (liên kết rời rạc), AI chủ động hỏi lại thay vì đoán mò và trả lời sai.

---

## Khai mạc — Nêu kế hoạch trước khi làm

Ngay sau khi nhận câu hỏi, **trước khi đọc bất kỳ file nào**, Claude nêu kế hoạch ngắn. **BẮT BUỘC in đầy đủ, không rút gọn:**

```
🔍 Wiki-Query: "<câu hỏi>"

Pipeline: GraphRAG 10 bước
→ B1-B6+B10: Tiền xử lý (InfraGraph) — Tại sao bắt buộc?
   1. LLM không tự chạy thuật toán đồ thị — cần Betweenness Centrality + Modularity
      để tìm từ khóa cốt lõi và phân cụm chủ đề trước khi truy xuất
   2. Chuẩn hóa ngôn ngữ — lemmatize từ viết tắt, từ lóng qua dictionary_alias + glossary
   3. Triệt tiêu ảo giác — sinh 3–5 query tối ưu, buộc AI đi theo node wiki có thật
   4. Tiết kiệm token — giới hạn xuống 5–7 node liên quan, không quét hàng trăm file
   5. Phát hiện mơ hồ — Structural Gap → hỏi lại thay vì đoán mò
→ B7-B9: Claude đọc Atlas + wiki theo từ khóa đã chuẩn hóa
```

## Kết thúc — Câu hỏi Socrate & Tư duy nguyên bản

Sau khi trả lời, **luôn** đặt đúng **3 câu hỏi**:

| Vị trí | Framework | Nguyên tắc |
|--------|-----------|------------|
| Câu 1 | **Socrate** | Tìm 1 tiền đề trong câu trả lời mà người dùng *có thể đang ngầm coi là đúng* |
| Câu 2 | **FPT** | Đặt nội dung vào bối cảnh *hoàn toàn khác* để kiểm tra nguyên lý |
| Câu 3 | **SAT** | Chỉ ra 1 khái niệm/dự án/pattern *cụ thể trong vault* mà câu trả lời gợi mở |

## Đường dẫn quan trọng

```
Wiki root  : C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/wiki/
  index.md           ← B7: đọc đầu tiên
  projects/          ← Chi tiết dự án
  entities/          ← Khách hàng, nhân sự
  concepts/          ← Khái niệm nghiệp vụ
  sources/           ← Tóm tắt từng nguồn đã ingest
  synthesis/         ← Phân tích tổng hợp đã có
  glossary.md        ← B3: neo ngữ nghĩa (Term/Context/Related/Intent-Tags)
  dictionary_alias.md← B2: chuẩn hóa alias

Analyzer   : c:\Code\HRM-AGENT-AI\Tools\request_graph_analyzer.py
```

---

## Pipeline 10 bước

### B1-B6, B10 — Gọi MCP InfraGraph (BẮT BUỘC)

> **Tại sao phải tiền xử lý văn bản thô?**
> Người dùng thường viết tắt hoặc dùng từ thông thường thay cho thuật ngữ hệ thống — ví dụ: "bảo hiểm" → cần hiểu là "BHXH/BHYT/BHTN", "nghỉ" → "nghỉ việc" hay "nghỉ phép"?, "lương" → "lương cơ bản" hay "lương đóng BH"? Nếu AI tìm kiếm bằng từ thô sẽ tra nhầm hoặc bịa ra câu trả lời không có trong wiki (ảo giác).
> Bước này đưa từ về dạng chuẩn trong hệ thống (ví dụ: "bh" → "Bảo Hiểm", "nv" → "nhân viên", "nghi viec" → "nghỉ việc"), xác định người dùng đang hỏi dữ liệu / báo lỗi / hỏi cách dùng, rồi chọn đúng từ khóa để tìm trong wiki — tránh suy luận từ từ sai nghĩa.

> **KHÔNG dùng Bash.** Gọi trực tiếp MCP tool:

```
mcp__InfraGraph__preprocess(query="<đoạn văn / câu hỏi thực tế>")
```

Đọc JSON output và in tóm tắt bằng tiếng Việt dễ hiểu:

```
📊 PHÂN TÍCH CÂU HỎI
  Từ khóa nhận ra  : [từ-1, từ-2, ...]
  Tên đã chuẩn hóa : X từ (vd: "bảo hiểm" → "Bảo Hiểm")
  Thuật ngữ HRM    : [Thuật ngữ A → giải thích ngắn, Thuật ngữ B → ...]
  Loại yêu cầu     : [hỏi dữ liệu | tính năng | bug | cấu hình]
  Từ khóa cốt lõi  : [kw-1, kw-2, kw-3]
  Sẽ tìm kiếm      : [câu tìm 1, câu tìm 2]
  Liên kết graph   : <"Ổn" | câu hỏi cần làm rõ>
```

⛔ **KHÔNG ĐƯỢC BỎ QUA** — Ngay sau block PHÂN TÍCH CÂU HỎI, phải in NGAY block sau (lấy từ `reconstructed_text` trong MCP output, KHÔNG tóm tắt, KHÔNG rút gọn):

```
📝 TÁI TẠO VĂN BẢN

  Văn bản thô:
  "<original_query nguyên văn>"

  Văn bản sau xử lý:
  "<layer2_annotated — đã chuẩn hóa alias + chú thích thuật ngữ>"
```

> Các bước B7–B9 tiếp theo **dựa vào "Văn bản sau xử lý"** làm câu hỏi chính thức, không dùng lại văn bản thô.

> Nếu B10 có `clarification_needed` → **DỪNG**, hỏi người dùng trước khi tiếp tục.

---

### B7 — Đọc Index/MOC

Dùng `core_keywords` từ B5 để tra Atlas:

```
wiki_search_links(keyword)     → tìm node theo từ khóa
wiki_local_graph(node_id)      → lấy neighbors
```

Fallback về `wiki/index.md` nếu Atlas không tìm được kết quả.

Ưu tiên đọc: **MOC / Index** → toàn cảnh trước khi đi sâu.

---

### B8 — Đọc Node liên quan (Zettelkasten)

Chấm điểm node theo quy tắc Graph Traversal (CLAUDE.md):

| Điểm | Nguồn |
|------|-------|
| +3 | nằm trong `related` |
| +2 | backlink trực tiếp trong body |
| +2 | cùng `domain` |
| +1 | tag trùng |
| +2 | parent project/entity |

- ≥ 4 điểm → bắt buộc đọc
- 2–3 điểm → đọc nếu thiếu context
- < 2 → bỏ qua

Tối đa 5–7 node. Dùng `optimized_queries` từ B6 để định hướng.

Đọc theo thứ tự ưu tiên:
1. `synthesis/` (nếu đã có phân tích phù hợp)
2. `projects/` / `entities/` liên quan trực tiếp
3. `sources/` (chi tiết, trích dẫn)
4. `concepts/` (khái niệm nền)

---

### B9 — Phác thảo Blueprint

Trước khi viết câu trả lời cuối, tóm tắt nội bộ:

```
🗺 TÓM TẮT TRƯỚC KHI TRẢ LỜI
  Loại yêu cầu : [hỏi dữ liệu / tính năng / bug / ...]
  Tình huống   : <mô tả bằng tiếng Việt rõ ràng, ai đang gặp vấn đề gì>
  Luồng xử lý : Bước 1 → Bước 2 → Bước 3 (theo logic hệ thống)
  Điều đã biết : [fact-1, fact-2]
  Còn thiếu    : [thông tin chưa có để trả lời đầy đủ]
```

---

### B10 — Kiểm tra Structural Gap (đã chạy trong script)

Nếu script báo `clarification_needed`:
- **Hỏi người dùng** cụ thể theo nội dung câu hỏi từ JSON
- **Không đoán mò** khi graph bị phân mảnh

---

## Tổng hợp câu trả lời

Câu trả lời phải:
- Có **citation** rõ ràng: `([[wiki/sources/...]])`
- Phân biệt nguồn:
  - `✅ FACT` — có trong wiki
  - `🔍 INFER` — AI suy luận từ nhiều nguồn
  - `❓ UNKNOWN` — không có trong wiki

---

## Ghi log & Lưu synthesis

### Lưu synthesis (nếu có giá trị)

Nếu câu trả lời là phân tích tổng hợp mới → tạo `wiki/synthesis/<xxxx>-<chu-de>.md`

### Append wiki/log.md

```markdown
## [YYYY-MM-DD] query | <câu hỏi ngắn>

Intent: [fix-bug / query / ...]
Core KW: [kw-1, kw-2]
Đọc: `wiki/projects/<...>`, `wiki/sources/<...>`
Tạo synthesis: `wiki/synthesis/<xxxx>-<tên>.md` (nếu có)
```

---

## Quy tắc chất lượng

| Yếu tố | Yêu cầu |
|--------|---------|
| Citation | Mỗi fact quan trọng phải có nguồn `([[wiki/...]])` |
| Độ chính xác | Chỉ nói những gì có trong wiki. Ghi rõ "chưa có nguồn" nếu thiếu |
| B10 | Không bỏ qua gap — hỏi lại khi graph phân mảnh |
| Hành động tiếp theo | Đề xuất ingest thêm nguồn nào để bổ sung |
