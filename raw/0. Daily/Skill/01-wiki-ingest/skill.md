---
name: 01-wiki-ingest
description: "Dùng khi người dùng muốn nạp một hoặc nhiều file nguồn vào LLM Wiki. Ví dụ: \"ingest raw/file.md\", \"ingest raw/\", \"ingest tài liệu X\", \"/01-wiki-ingest\""
---

# Skill: 01-wiki-ingest

Ingest một hoặc nhiều file nguồn vào LLM Wiki. Dùng khi người dùng nói "ingest <tên file>", "ingest raw/<tên>", hoặc chỉ "ingest" (không chỉ định file → quét toàn bộ HRM-Knowledge-Base/ trừ wiki/).

## Khai mạc — Nêu kế hoạch trước khi làm

Ngay sau khi nhận yêu cầu ingest, **trước khi đọc file nguồn**, Claude nêu kế hoạch:

```
📥 Wiki-Ingest: "<tên file hoặc thư mục>"

Tôi sẽ làm:
1. Đọc file nguồn
2. Tạo wiki/sources/<tên>.md (tóm tắt + key takeaways)
3. Cập nhật trang wiki liên quan (dự kiến: project X, concept Y)
4. Cập nhật wiki/index.md và wiki/log.md

⏸ Xác nhận trước khi bắt đầu?
```

Nếu là **batch ingest**: hiển thị danh sách file chưa ingest, nhóm theo thư mục, chờ xác nhận trước khi đọc.

## Kết thúc — Câu hỏi Socrate & Tư duy nguyên bản

Sau khi ingest xong, **luôn** đặt đúng **3 câu hỏi** — mỗi câu từ một góc tư duy khác nhau. Câu hỏi phải **cụ thể với nội dung vừa ingest**, không dùng template chung chung.

**Quy tắc chọn câu hỏi:**

| Vị trí | Framework | Nguyên tắc tạo câu hỏi |
|--------|-----------|------------------------|
| Câu 1 | **FPT — Truy bản chất** | Bóc hết lớp diễn giải — nếu chỉ giữ lại 1 nguyên lý từ tài liệu này, đó là gì? Câu hỏi phải buộc người dùng tự diễn đạt lại bằng ngôn ngữ của mình |
| Câu 2 | **Socrate — Giả định ngầm** | Tìm điều tài liệu *coi là hiển nhiên* mà chưa kiểm chứng — đặt câu hỏi về chính tiền đề đó, không phải về kết luận |
| Câu 3 | **SAT — Kích hoạt liên kết** | Chỉ ra khái niệm/pattern/tình huống cụ thể trong tài liệu có thể mở ra ghi chú mới hoặc kết nối với dự án khác |

**Nguyên tắc viết câu hỏi:**
- ❌ Không dùng `<X>`, `<Y>` — phải điền nội dung thật từ tài liệu vừa đọc
- ❌ Không hỏi chung: "Điều gì là bản chất?" → phải hỏi: "Nếu bỏ hết tờ khai và mốc API, lý do tồn tại của module Bảo hiểm là gì?"
- ✅ Câu hỏi Socrate phải chạm vào một giả định *cụ thể* trong tài liệu, không phải giả định giả tưởng
- ✅ Câu SAT phải chỉ ra *tên khái niệm / tên dự án thật* trong vault

**Format output:**
```
---
💬 3 câu hỏi để khai thác sâu hơn:

1. 🔍 [Bản chất] <Câu hỏi buộc người dùng tự tóm gọn nguyên lý cốt lõi
   bằng ngôn ngữ của họ — không phải nhắc lại tài liệu>

2. 🧠 [Giả định ngầm] <Câu hỏi chỉ thẳng vào 1 tiền đề tài liệu
   coi là đương nhiên — và hỏi: điều đó có luôn đúng không?>

3. 🌱 [Kết nối] <Câu hỏi gợi mở 1 khái niệm/tình huống cụ thể
   trong tài liệu có thể trở thành ghi chú riêng hoặc link sang dự án khác>
```

## Kích hoạt

Các cụm từ kích hoạt skill này:
- `ingest` *(không có tên file → chế độ batch: quét toàn bộ HRM-Knowledge-Base/ trừ wiki/)*
- `ingest raw/` *(ingest tất cả file trong raw/)*
- `ingest raw/<tên-file>`
- `ingest <tên-file>`
- `ingest tài liệu <...>`
- `ingest <thư-mục>/` *(ingest tất cả file trong thư mục đó)*
- `/01-wiki-ingest`
- `/01-wiki-ingest <tên-file>`

## Đường dẫn quan trọng

```
Vault root  : C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/
Nguồn hợp lệ: Bất kỳ file nào NGOẠI TRỪ thư mục wiki/
  Các thư mục nguồn thường dùng:
    raw/              ← Tài liệu chuẩn bị sẵn để ingest
    src/              ← Tài nguyên, hình ảnh, tài liệu kỹ thuật

Wiki root   : .../HRM-Knowledge-Base/wiki/   ← CHỈ ĐỌC / GHI wiki tại đây — không bao giờ ingest wiki/
  index.md        ← LUÔN cập nhật
  log.md          ← LUÔN append
  overview.md     ← Cập nhật sources-ingested và date-updated
  projects/       ← Cập nhật nếu source liên quan đến dự án
  entities/       ← Cập nhật nếu source liên quan đến khách hàng/nhân sự
  concepts/       ← Cập nhật nếu source giới thiệu khái niệm mới
  sources/        ← Tạo trang mới tại đây
  synthesis/      ← Không cập nhật khi ingest
```

## Các bước thực hiện (theo thứ tự)

### Bước 0 — Xác định nguồn cần ingest

**Nếu người dùng chỉ định file cụ thể** (ví dụ `ingest raw/ten-file.md`):
- Chuyển thẳng sang Bước 1 với file đó.

**Nếu người dùng chỉ định thư mục** (ví dụ `ingest raw/`):
1. Liệt kê toàn bộ file `.md` và `.pdf` trong thư mục đó
2. Tiếp tục như "không chỉ định file" nhưng chỉ trong phạm vi thư mục đó

**Nếu người dùng KHÔNG chỉ định file** (chỉ nói `ingest`):
1. Liệt kê toàn bộ file `.md` và `.pdf` trong **HRM-Knowledge-Base/**
   - **Loại trừ hoàn toàn**: `wiki/**`, `wiki/sources/**`
   - Loại trừ các file meta: `README.md`
2. Đọc `wiki/index.md` → lấy danh sách sources đã ingest
3. **Lọc ra danh sách chưa ingest** = file tìm được nhưng chưa có trang tương ứng trong `wiki/sources/`
4. **Nhóm theo thư mục** và hiển thị cho người dùng:
   ```
   📂 Tìm thấy X file trong HRM-Knowledge-Base/, Y file chưa được ingest:

   raw/ (2 file)
     1. raw/ten-file-A.md
     2. raw/ten-file-B.md

   Ingest tất cả? Hoặc chỉ định số thứ tự / tên thư mục
   ```
5. Nếu người dùng xác nhận "tất cả" → ingest tuần tự từng file
6. Nếu người dùng chỉ định số hoặc thư mục → ingest file/nhóm tương ứng

### Bước 1 — Đọc file nguồn

```
Đọc file tại đường dẫn đã xác định (raw/, src/, v.v.)
Nếu là file PDF → đọc và trích xuất nội dung text
Nếu không tìm thấy → hỏi người dùng đường dẫn chính xác
```

### Bước 2 — Đọc wiki/index.md

Xác định các trang wiki hiện có liên quan đến nội dung source (projects, entities, concepts).

### Bước 3 — Tạo trang wiki/sources/<xxxx>-<tên-file>.md

> **Quy tắc đặt tên file**: Sinh mã `<xxxx>` = 4–5 ký tự random từ `abcdefghijklmnopqrstuvwxyz0123456789`, đặt **ở đầu** tên file (trước tên nội dung). Ví dụ: `a3k9-bitex-bien-ban-hop.md`, `qr7bx-ins-analysis.md`.
>
> **Dùng template**: `raw/archive/2. RESOURCE/template/wiki-source.md`
> Điền đầy đủ tất cả properties trong template. Chọn `domain` phù hợp nội dung: `ins | payroll | attendance | system`.
>
> **Frontmatter bắt buộc** — `tags` và `related` phải dạng danh sách YAML, thêm `code` 4–5 ký tự random, thêm `description` tối đa 30 từ mô tả nội dung chính:
> - Nếu file nguồn **đã có** property `description` → giữ nguyên, không ghi đè
> - Nếu file nguồn **chưa có** → tự tạo mô tả ≤ 30 từ, súc tích, dùng để tìm kiếm sau này
> ```yaml
> ---
> type: source
> code: <xxxx>
> description: "<mô tả nội dung chính, tối đa 30 từ>"
> tags:
>   - "ten-du-an"
>   - "ten-domain"
> domain: system
> created: YYYY-MM-DD
> updated: YYYY-MM-DD
> related:
>   - "[[wiki/projects/ten-du-an]]"
>   - "[[wiki/concepts/ten-khai-niem]]"
> ---
> ```

Nội dung trang sources phải có:
- **## Tóm tắt** — 3–5 câu mô tả tài liệu này là gì, từ khi nào, ai liên quan
- **## Key Takeaways** — danh sách bullet các điểm quan trọng nhất
- **## Trích dẫn quan trọng** — quote nguyên văn 2–5 đoạn đáng nhớ (dùng blockquote `>`)
- **## Liên kết** — cross-link đến các trang wiki liên quan

### Bước 3b — Phân loại nội dung → flows/ hoặc architecture/

> **Template flows**: `raw/archive/2. RESOURCE/template/wiki-flow.md`
> **Template architecture**: `raw/archive/2. RESOURCE/template/wiki-architecture.md`

Sau khi đọc file nguồn, **quyết định** nội dung nào cần trang riêng trong `flows/` hoặc `architecture/`:

**→ Tạo trang `wiki/flows/<xxxx>-<tên>.md` nếu** nội dung mô tả:
- Thứ tự bước thực hiện (bước 1 → bước 2 → ...)
- Ai làm gì (actor, người thực hiện)
- Điều kiện rẽ nhánh (nếu A thì B, nếu không thì C)
- Message gửi/nhận giữa các hệ thống
- Quy trình nghiệp vụ end-to-end

Diagram cho `flows/`:
```
✅ flowchart TD/LR     — luồng bước, decision node
✅ sequenceDiagram     — luồng message giữa actor
✅ stateDiagram-v2     — trạng thái và chuyển đổi
❌ subgraph mô tả cấu trúc hệ thống
❌ chỉ vẽ component và kết nối tĩnh
```

**→ Tạo trang `wiki/architecture/<xxxx>-<tên>.md` nếu** nội dung mô tả:
- Thành phần hệ thống là gì, thuộc layer nào
- Kết nối tĩnh giữa các component
- Cấu trúc folder, module, service
- Hạ tầng (server, database, network)

Diagram cho `architecture/`:
```
✅ flowchart + subgraph  — component và layer
✅ ASCII tree            — folder structure, config
✅ Code block            — folder tree, config files, SQL, C#
❌ sequenceDiagram       — không mô tả flow ở đây
❌ decision node (diamond) — không có rẽ nhánh theo bước
```

**Quy tắc cứng — KHÔNG BAO GIỜ vi phạm:**
- ❌ Không trộn flows và architecture trong cùng một sơ đồ Mermaid
- ❌ Không đặt sequenceDiagram vào file `architecture/`
- ❌ Không dùng subgraph cấu trúc hệ thống trong file `flows/`
- ✅ Một trang `architecture/` CÓ THỂ link sang trang `flows/` liên quan (và ngược lại)
- ✅ Nếu tài liệu vừa có flow vừa có architecture → tạo 2 trang riêng biệt

### Bước 4 — Cập nhật wiki/index.md

Thêm dòng vào bảng **Sources**:
```markdown
| [[wiki/sources/<xxxx>-<tên-file>]] | <mô tả 1 câu> | YYYY-MM-DD |
```

### Bước 5 — Cập nhật các trang liên quan

> **Templates tham chiếu**:
> - Trang project mới → `raw/archive/2. RESOURCE/template/wiki-project.md`
> - Trang entity mới → `raw/archive/2. RESOURCE/template/wiki-entity.md`
> - Trang concept mới → `raw/archive/2. RESOURCE/template/wiki-concept.md`
>
> **Schema chuẩn properties**: `created` + `updated` (không dùng `date-ingested`, `date-updated`)

Với mỗi trang `wiki/projects/`, `wiki/entities/`, `wiki/concepts/` liên quan:
- Thêm thông tin mới từ source
- Thêm cross-link đến `[[wiki/sources/<tên-file>]]`
- Nếu source mâu thuẫn với nội dung cũ: ghi chú rõ `> ⚠️ Mâu thuẫn: ...`
- Cập nhật `updated` trong frontmatter

### Bước 6 — Append wiki/log.md

```markdown
## [YYYY-MM-DD] ingest | <Tên nguồn ngắn gọn>

Tạo: `wiki/sources/<tên-file>.md`
Cập nhật: `wiki/projects/<nếu có>`, `wiki/entities/<nếu có>`, `wiki/index.md`
```

### Bước 7 — Cập nhật wiki/overview.md

- Tăng `sources-ingested` lên 1
- Cập nhật `updated`

### Bước 8 — Mini Lint (tự động sau mỗi ingest)

Sau khi ingest xong, chạy nhanh lint **chỉ trên các trang vừa tạo/cập nhật** trong session này.

Danh sách cần lint = trang sources mới + trang project/entity/concept đã cập nhật.

**Kiểm tra:**

| # | Check | Tự fix? |
|---|-------|---------|
| L1 | Source mới có trong `wiki/index.md` chưa? | ✅ Tự thêm nếu thiếu |
| L2 | Source mới có ít nhất 1 cross-link trong `related`? | ⚠️ Báo nếu thiếu |
| L3 | Cross-link `[[wiki/...]]` trong source mới trỏ đến file thật? | ⚠️ Báo nếu dead |
| L4 | Trang project/entity/concept đã cập nhật `updated` frontmatter? | ✅ Tự fix nếu quên |
| L5 | Trang project/entity/concept đã link ngược về source mới? | ✅ Tự thêm nếu thiếu |

**Output (hiển thị gọn sau báo cáo ingest):**

```
🔍 Mini Lint — <tên source>
  ✅ L1 Có trong index.md
  ✅ L2 Cross-link: [[wiki/projects/...]], [[wiki/concepts/...]]
  ✅ L3 Không có dead link
  ✅ L4 updated frontmatter OK
  ✅ L5 Back-link từ project page OK
  → Không có vấn đề
```

Hoặc nếu có lỗi:

```
🔍 Mini Lint — <tên source>
  ✅ L1 Có trong index.md
  ⚠️ L2 Thiếu cross-link — source chưa link đến project/entity nào
  🔴 L3 Dead link: [[wiki/projects/ten-khong-ton-tai]]
  ✅ L4 updated OK
  ⚠️ L5 wiki/projects/X chưa link về source này → Đã tự thêm
```

Lỗi nhỏ (L1, L4, L5) → tự fix và ghi chú. Lỗi cần người dùng quyết định (L2, L3) → chỉ báo.

## Quy tắc

- `raw/` là immutable — **không bao giờ sửa** file trong raw/
- Không bao giờ ingest file trong wiki/
- Trang sources phải link đến ít nhất 1 trang project/entity/concept
- Một lần ingest có thể chạm 5–15 trang wiki — bình thường