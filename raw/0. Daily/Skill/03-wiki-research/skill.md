---
name: 03-wiki-research
description: "Dùng khi người dùng muốn nghiên cứu chuyên sâu một chủ đề, đọc cả wiki lẫn file thô, xuất báo cáo lưu vào synthesis/. Ví dụ: \"nghiên cứu <chủ đề>\", \"viết báo cáo về <chủ đề>\", \"tổng hợp toàn bộ về <chủ đề>\", \"/03-wiki-research\""
---

# Skill: 03-wiki-research

Nghiên cứu chuyên sâu một chủ đề theo phong cách **Gemini Deep Research**: lập kế hoạch → tìm kiếm lặp nhiều vòng (multi-hop) → phân tích → xuất báo cáo chuẩn. Khác với `02-wiki-query` (trả lời nhanh), skill này dành cho nghiên cứu có chiều sâu, đọc nhiều nguồn, hiển thị tiến trình trực quan từng bước.

---

## 🧠 NGUYÊN TẮC TƯ DUY — BẮT BUỘC ÁP DỤNG XUYÊN SUỐT

> Bạn là chuyên gia phân tích hệ thống với tư duy sắc bén. **Không tóm tắt cơ học — phải phân tích và chỉ ra vấn đề ẩn.**

**5 nguyên tắc không thể bỏ qua:**

1. **Không mô tả hiển nhiên** — nếu chỉ viết lại những gì nguồn đã nói, bỏ đi
2. **Luôn hỏi "vấn đề thật sự nằm ở đâu?"** — biểu hiện ≠ nguyên nhân
3. **Tìm pattern lặp lại** — 1 vấn đề đơn lẻ hay dấu hiệu hệ thống?
4. **Đánh giá rủi ro lan rộng** — nếu không xử lý → hệ quả gì?
5. **Insight hơn số lượng** — 3 nhận xét sắc bén tốt hơn 10 dòng mô tả nhạt

**Khi viết mỗi mục phân tích, áp dụng lens sau:**
- 🔍 **Core Insight**: Đây là triệu chứng hay gốc rễ? Có design smell không?
- ⚠️ **Rủi ro**: Nếu bỏ qua → hệ quả cụ thể là gì?
- 🎯 **Hành động**: Fix ngay / theo dõi / redesign / training?

**Nếu không đủ dữ liệu để kết luận → ghi rõ "không đủ dữ liệu"**, không phỏng đoán.

## Kích hoạt

- `nghiên cứu <chủ đề>`
- `research <chủ đề>`
- `viết báo cáo về <chủ đề>`
- `/03-wiki-research <chủ đề>`
- `/03-wiki-research` *(không có chủ đề → hỏi người dùng)*

## Đường dẫn quan trọng

```
Vault root    : C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/
Nguồn wiki    : .../HRM-Knowledge-Base/wiki/
Nguồn thô     : .../HRM-Knowledge-Base/raw/  |  src/
Báo cáo output: .../HRM-Knowledge-Base/wiki/synthesis/
Log           : .../HRM-Knowledge-Base/wiki/log.md
```

---

## PHASE 0 — Lập kế hoạch nghiên cứu (hiển thị trước, chờ xác nhận)

### Bước 0.0 — Tiền xử lý chủ đề (InfraGraph — BẮT BUỘC)

Trước khi lập kế hoạch, gọi InfraGraph để normalize alias, xác định core keywords và optimized queries:

```
mcp__InfraGraph__preprocess(query="<chủ đề nghiên cứu đầy đủ từ người dùng>")
```

Dùng kết quả:
- `core_keywords` → từ khóa chính để tra `wiki_search_links`
- `optimized_queries` → query tối ưu cho vòng tìm kiếm
- `glossary_matches` → term chuyên ngành đã được định nghĩa → bổ sung vào kế hoạch

---

Ngay khi nhận chủ đề, **in ra kế hoạch** theo format sau rồi **dừng lại chờ người dùng duyệt**:

```
╔══════════════════════════════════════════════════════╗
║  🔬 WIKI DEEP RESEARCH — "<Chủ đề>"                 ║
╚══════════════════════════════════════════════════════╝

📋 KẾ HOẠCH NGHIÊN CỨU
────────────────────────────────────────
Chủ đề chính  : <chủ đề>
Góc nhìn      : <ví dụ: lịch sử, kỹ thuật, tổ chức, ...>
Phạm vi       : <ví dụ: từ Q3/2025 đến nay>

🗂 Nguồn dự kiến sẽ quét:
  wiki/        → index.md, synthesis/, projects/, entities/, sources/, concepts/
  HRM-Knowledge-Base/raw/  → file thô chưa ingest
  HRM-Knowledge-Base/src/   → tài liệu kỹ thuật

📝 Dàn ý báo cáo dự kiến:
  1. Bối cảnh & Phạm vi
  2. Findings — Những gì tìm thấy
     2.1 <nhánh A>
     2.2 <nhánh B>
  3. Biểu đồ số liệu — nếu có số liệu
  4. Phân tích & Nhận định
  5. Gaps & Hạn chế
  6. Gợi ý hành động

📊 Báo cáo có biểu đồ không?
   Nếu chủ đề có số liệu (thống kê, so sánh, tỷ lệ, xu hướng theo thời gian...),
   tôi sẽ vẽ ít nhất 2 biểu đồ (cột / tròn) kèm nhận xét & gợi ý hành động.
   → Gõ "có biểu đồ" hoặc "ok" để bật tính năng này (mặc định: bật nếu có số liệu).

⏸ Bạn có muốn chỉnh dàn ý hoặc thêm góc nhìn trước khi tôi bắt đầu không?
   (Gõ "ok" để chạy, hoặc chỉnh sửa bên trên)
```

> **Lưu ý**: Người dùng **có thể sửa dàn ý** trước khi xác nhận — giống Gemini cho phép edit research plan.

---

## PHASE 1 — Nghiên cứu lặp (Iterative Multi-Hop Search)

> 🎯 **Nguyên tắc cốt lõi**: Không tìm một lần rồi dừng. Mỗi tài liệu đọc xong → kiểm tra có **lead mới** không → nếu có thì **mở rộng tìm tiếp**. Lặp cho đến khi không còn lead mới.

### Hiển thị tiến trình trực quan

In ra **từng hành động** khi thực hiện, dùng icon chuẩn:

| Icon | Ý nghĩa |
|------|---------|
| `🔍` | Đang tìm kiếm / quét thư mục |
| `📄` | Đang đọc file |
| `💡` | Phát hiện lead mới / thông tin quan trọng |
| `🔄` | Mở rộng tìm kiếm sang hướng mới |
| `⏭` | Bỏ qua (không liên quan) |
| `✅` | Hoàn tất một nguồn |
| `🏁` | Kết thúc vòng tìm kiếm |

### Vòng lặp tìm kiếm

**Vòng 1 — Quét nền:**
```
🔍 Dùng Atlas định vị node (wiki_search_links + wiki_local_graph) trước khi đọc file...
  📍 wiki_search_links("<keyword>") → N node
  🕸 wiki_local_graph("<node>") → neighbors, chấm điểm
  → Đọc node ≥4 điểm (tối đa 5 node)
🔍 Quét wiki/index.md → fallback nếu Atlas không tìm được...
  📄 Đọc: wiki/synthesis/[tên].md
  📄 Đọc: wiki/projects/[tên].md
  💡 Phát hiện lead: "[từ khóa Y]" chưa có wiki riêng → thêm vào queue tìm tiếp
  📄 Đọc: wiki/sources/[tên].md
  ✅ Xong wiki/ — tìm được N trang, M lead mới

🔍 Quét HRM-Knowledge-Base/ (raw/, src/)...
  📄 Đọc: raw/[tên].md
  ⏭ Bỏ qua: [tên].md — không liên quan chủ đề
  💡 Phát hiện lead: nhắc đến "[sự kiện Z]" → cần đọc thêm Daily/...
  ✅ Xong HRM-Knowledge-Base/ — tìm được N file, M lead mới
```

**Vòng 2+ — Mở rộng theo lead:**
```
🔄 Mở rộng tìm kiếm: có [N] lead mới từ vòng trước
  Lead 1: "[từ khóa Y]" → 🔍 Quét wiki/concepts/...
    📄 Đọc: [tên].md → ✅ Có thông tin hữu ích
  Lead 2: "[sự kiện Z]" → 🔍 Quét Daily/tháng X...
    📄 Đọc: [tên].md → 💡 Phát hiện thêm lead mới: ...
    📄 Đọc: [tên].md → ⏭ Bỏ qua — trùng thông tin đã có
```

**Kết thúc vòng lặp khi:**
```
🏁 Dừng tìm kiếm:
   Vòng [N] không phát sinh lead mới.
   Tổng: [X] nguồn đã đọc | [Y] nguồn bỏ qua | [Z] lead đã theo

📊 Tổng kết thu thập:
   ✅ Sẽ dùng : [N] nguồn
   ⏭ Đã đọc, bỏ: [M] nguồn
```

---

## PHASE 1.5 — METHODOLOGY ESCALATION (Kích hoạt khi research bí)

> **Trigger tự động** khi **một trong các điều kiện sau** xảy ra trong PHASE 1:
> - Vòng 2+ không ra lead mới nhưng vẫn chưa đủ dữ liệu để trả lời chủ đề
> - Findings đều là mô tả hiển nhiên, không có insight sắc bén
> - Nhiều nguồn mâu thuẫn nhau, không xác định được nguồn nào đúng
> - Chủ đề quá rộng / quá mơ hồ để biết tìm ở đâu tiếp

### Bước 1.5.1 — Chẩn đoán và chọn phương pháp

```
─── 🧠 RESEARCH METHODOLOGY ESCALATION ─────────────────
Research bí. Kích hoạt phương pháp luận.

Tình huống:
  • Đã đọc: [N] nguồn
  • Vấn đề: [leads cạn / mâu thuẫn / thiếu insight / chủ đề mơ hồ]

Phương pháp kích hoạt:
  [✅ Phương pháp] — [lý do]
─────────────────────────────────────────────────────────
```

**Bảng chọn phương pháp (tự suy luận từ tình huống):**

```
                    [Research bị stuck]
                             |
           __________________|__________________
          |                  |                  |
  Không biết tìm ở đâu  Nguồn mâu thuẫn   Findings nhạt,
  tiếp / chủ đề mơ hồ   nhau              không có insight
          |                  |                  |
   First Principles      Aristotle          Socrates
   Strip giả định về     Bóc tam đoạn      35 câu hỏi chất
   bản chất chủ đề       luận từng nguồn   vấn từng finding
   → Rebuild câu hỏi     → xác định đúng   → tìm kẽ hở
     tìm kiếm mới        → sai             → insight thật
          |                  |                  |
          |__________________|__________________|
                             |
                    SAT — Lan truyền kích hoạt
                    Tag chủ đề → tìm node liên quan
                    bất ngờ trong wiki chưa nghĩ tới
```

### Bước 1.5.2 — Áp dụng

**First Principles** *(khi không biết tìm gì tiếp)*:
```
Strip    → Bỏ hết giả định về chủ đề, câu hỏi ban đầu
Identify → Sự thật cơ bản nhất về chủ đề này là gì?
Rebuild  → Từ đó, câu hỏi tìm kiếm nên là gì?
Compare  → Lead mới nào xuất hiện từ câu hỏi rebuilt?
```

**Socrates** *(khi findings nhạt)*:
```
Với mỗi finding hiện có, hỏi:
  "Đây là triệu chứng hay gốc rễ?"
  "Giả định ẩn nào đang được coi là hiển nhiên?"
  "Nếu điều ngược lại đúng, bằng chứng nào thay đổi trước?"
→ Finding nào không trả lời được → đó là insight thật cần đào sâu
```

**Aristotle** *(khi nguồn mâu thuẫn)*:
```
Với mỗi cặp nguồn mâu thuẫn, bóc:
  Tiền đề lớn nguồn A: [quy tắc tổng quát A giả định]
  Tiền đề lớn nguồn B: [quy tắc tổng quát B giả định]
  → Tiền đề nào đúng với ngữ cảnh HRM cụ thể?
  → Kết luận từ tiền đề đó
```

**SAT** *(luôn chạy sau khi áp dụng phương pháp trên)*:
```
Tag chủ đề hiện tại → Tìm wiki theo tag
  "Bug này gợi nhớ pattern nào trong nhật ký hệ thống?"
  "Module nào có behavior tương tự?"
  "Lần deploy/sự cố nào gần đây có liên quan?"
→ Mở rộng tìm kiếm theo node bất ngờ phát hiện
```

---

## PHASE 2 — Phân tích & Tổng hợp

Sau khi kết thúc vòng lặp, in thông báo:

```
⚙️ Đang phân tích [N] nguồn...
   • Gom nhóm thông tin theo chủ đề con
   • Đối chiếu mâu thuẫn giữa các nguồn
   • Xác định gaps — những gì chủ đề cần nhưng chưa có tài liệu
   • Chuẩn bị dàn ý báo cáo cuối
```

Nội dung phân tích:
- **Gom nhóm**: Sắp xếp thông tin vào các nhánh của dàn ý đã duyệt
- **Đối chiếu**: Tìm điểm đồng nhất và mâu thuẫn giữa các nguồn
- **Phân loại**: Nguồn nào dùng / không dùng (và lý do)
- **Gaps**: Những gì thiếu trong wiki/raw so với nhu cầu của chủ đề

---

## PHASE 3 — Tạo báo cáo

Sinh **mã 4–5 ký tự ngẫu nhiên** (`<XXXX>`) từ bộ `abcdefghijklmnopqrstuvwxyz0123456789`, sau đó in thông báo:

```
📝 Đang viết báo cáo...
   File: wiki/synthesis/<XXXX>-<ten-chu-de>-Research-<YYYYMMDD>.md
   Mã  : <XXXX>
```

Tạo file `wiki/synthesis/<XXXX>-<ten-chu-de>-Research-<YYYYMMDD>.md` dùng template `2. RESOURCE/template/wiki-synthesis.md`.

> **Quy tắc mã**: 4–5 ký tự chữ thường + số, sinh ngẫu nhiên mỗi lần chạy, **đặt ở đầu tên file**, không được trùng với báo cáo đã có trong synthesis/. Ví dụ: `a3k9-ins-research-20260505.md`, `q1bx-auth-research-20260505.md`.

**Frontmatter bắt buộc** — `id`, `tags`, `sources-wiki`, `related` phải dạng danh sách YAML:

```yaml
---
type: synthesis
code: <xxxx>
tags:
  - "<chu-de>"
  - "research"
research-topic: <Tên chủ đề>
sources-wiki:
  - "wiki/projects/ten-du-an"
  - "wiki/sources/ten-nguon"
sources-raw: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
related:
  - "[[wiki/projects/ten-du-an]]"
  - "[[wiki/concepts/ten-khai-niem]]"
  - "[[wiki/sources/ten-nguon]]"
---
```

> ⚠️ **Quy tắc citation bắt buộc — dùng Obsidian footnote**
>
> Mọi fact, số liệu, nhận định phải kèm số footnote **ngay sau câu** theo cú pháp Obsidian:
>
> ```
> VnResource tái cấu trúc TT PTSP ngày 25/03.[^1] KPI bộ phận vẫn chưa chốt.[^2]
> ```
>
> Cuối tài liệu (sau section "Gợi ý hành động") đặt **block định nghĩa footnote**:
>
> ```
> [^1]: [[wiki/sources/GiaoBan-2026-TongHop]] — Tổng hợp giao ban Q1/2026
> [^2]: `raw/archive/1. Projects/Dự án 2026/Giao ban 2026 - Project/gb-03-2026.md`
> [^3]: [inference] — Suy luận từ xu hướng các kỳ giao ban trước
> ```
>
> **Quy tắc loại nguồn:**
> - Wiki page : `[[wiki/projects/ten]]`, `[[wiki/sources/ten]]`, `[[wiki/concepts/ten]]`
> - File thô  : đường dẫn đầy đủ trong backtick, ví dụ `` `raw/archive/.../ten-file.md` ``
> - Suy luận AI chưa có nguồn: `[inference]`
>
> **Không** nhét đường dẫn/wikilink thẳng vào giữa câu văn — luôn dùng số footnote.

### Cấu trúc báo cáo bắt buộc

> ⚠️ **Quy tắc Obsidian anchor — BẮT BUỘC để TOC link hoạt động khi click:**
> - Anchor = text heading, **lowercase toàn bộ**
> - Dấu cách → `-`
> - Ký tự đặc biệt (`. , ! ? ( ) [ ] { } ' " / \ & * ^ % $ # @ ~`) → **xóa bỏ hoàn toàn**
> - Dấu `-` đã có trong text giữ nguyên
> - Ví dụ: `## 1. Bối cảnh & Phạm vi` → `#1-bối-cảnh--phạm-vi` (`&` xóa, 2 cách → 2 `-`)
> - Ví dụ: `## 2.1 Chủ đề con A` → `#21-chủ-đề-con-a` (`.` xóa)
> - Ví dụ: `## Findings — Những gì tìm thấy` → `#findings--những-gì-tìm-thấy` (`—` xóa, 2 cách)
>
> ⚠️ **Quy tắc khớp heading — BẮT BUỘC:**
> - Text trong `[...]` của TOC phải **khớp chính xác** với text heading `#` thực tế
> - **KHÔNG thêm, bớt, đổi chữ** trong heading
> - Luồng đúng: **viết heading cố định trước → tạo TOC từ heading thực tế**

```markdown
# Nghiên cứu: <Chủ đề>

## Mục lục

- [Tóm tắt điều hành](#tóm-tắt-điều-hành)
- [1. Bối cảnh & Phạm vi](#1-bối-cảnh--phạm-vi)
- [2. Findings — Những gì tìm thấy](#2-findings--những-gì-tìm-thấy)
  - [2.1 <Chủ đề con A>](#21-chủ-đề-con-a)
  - [2.2 <Chủ đề con B>](#22-chủ-đề-con-b)
- [3. Biểu đồ số liệu](#3-biểu-đồ-số-liệu)
- [4. Phân tích & Nhận định](#4-phân-tích--nhận-định)
- [5. Gaps & Hạn chế](#5-gaps--hạn-chế)
- [6. Gợi ý hành động](#6-gợi-ý-hành-động)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
- [Hành trình nghiên cứu](#hành-trình-nghiên-cứu)

---

## Tóm tắt điều hành
> 🧠 Không liệt kê — phải **kết luận sắc bén**. Người đọc chỉ đọc phần này phải biết ngay: vấn đề thật là gì, rủi ro nào đang ẩn, và cần làm gì ngay.
[3–5 câu kết luận chính — mỗi câu kèm số footnote. Ưu tiên: điều bất ngờ, điều bị bỏ qua, tension đang tồn tại]

## 1. Bối cảnh & Phạm vi
[Mỗi fact kèm footnote ngay sau câu. Ví dụ: "Phạm vi báo cáo: 13 biên bản giao ban tuần từ 07/01 đến 08/04/2026.[^2]"]

## 2. Findings — Những gì tìm thấy
> 🧠 Không liệt kê — phải **chỉ ra điểm không hiển nhiên**. Mỗi finding phải có "giá trị insight": tại sao điều này quan trọng hơn những gì đã biết?
> Số lượng: tối thiểu 5 findings, không giới hạn tối đa nếu dữ liệu phong phú.

**Cấu trúc mỗi finding — BẮT BUỘC đủ 4 phần:**

```
### 2.N <Tên finding — ngắn gọn, có tính mô tả>

**Mô tả chi tiết**: [2–4 câu giải thích rõ finding này là gì, xảy ra ở đâu, trong bối cảnh nào. Dùng data cụ thể từ nguồn — số liệu, tên store, tên màn hình, ngày tháng nếu có. Kèm footnote.[^N]]

**Tại sao quan trọng**: [1–2 câu phân tích — đây là triệu chứng hay gốc rễ? Nếu bỏ qua → hệ quả cụ thể là gì?]

**Rủi ro / Tác động**: [Mô tả rủi ro lan rộng — ảnh hưởng đến phân hệ nào, quy trình nào, ai phải xử lý]

**Nguồn**: [[wiki/sources/...]][^N] | **Độ tin cậy**: Dữ kiện / Suy luận
```

> ⚠️ **Không dùng bảng tóm tắt cho phần này** — bảng làm mất chi tiết. Viết từng finding thành block riêng như ví dụ trên.

### 2.1 <Chủ đề con A>
[Xem cấu trúc 4 phần bắt buộc bên trên. Nếu chỉ mô tả lại nguồn → bỏ đi.]

### 2.2 <Chủ đề con B>
[Tương tự — ưu tiên mâu thuẫn, pattern lặp, dấu hiệu hệ thống. Số footnote liên tục xuyên suốt.]

## 3. Biểu đồ số liệu
[Bắt buộc ít nhất 2 biểu đồ nếu chủ đề có số liệu. Mỗi biểu đồ gồm **4 phần bắt buộc**:]

#### 📈 [Tên biểu đồ mô tả rõ nội dung]

> 💡 **Phân tích — đúng 6 dòng, mỗi dòng là 1 insight:**
>
> [Dòng 1 — Hook: mở bằng điểm bất thường hoặc đáng chú ý nhất, không mô tả lại biểu đồ]
> [Dòng 2 — Xung đột: so sánh tạo chênh lệch — khoảng cách đó nói lên điều gì?]
> [Dòng 3 — Xu hướng + ý nghĩa: không chỉ "tăng/giảm" — tăng có bền không, giảm có nguy hiểm không?]
> [Dòng 4 — Pattern: hành vi lặp lại hay dấu hiệu hệ thống — không phải cá nhân?]
> [Dòng 5 — Nghi vấn: khoảng trống dữ liệu, điều chưa rõ, anomaly cần xác nhận]
> [Dòng 6 — Hệ quả + câu hỏi chiến lược: nếu không hành động → điều gì xảy ra?]
>
> ⚠️ **Quy tắc bắt buộc**: Không dùng bullet `-`, không đánh số, không viết "biểu đồ cho thấy". Mỗi dòng phải có insight — không phải mô tả. Nếu dữ liệu mâu thuẫn hoặc có tăng trưởng ảo → bắt buộc đưa vào phân tích.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "NhanA"
    value: 5
  - label: "NhanB"
    value: 3
  - label: "NhanC"
    value: 2

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
      alias: "Nhãn trục Y"
```

**📋 Số liệu biểu đồ** *(hiển thị khi in PDF)*

| Nhãn | Giá trị | Ghi chú |
|------|---------|----------|
| NhanA | 5 | [diễn giải ngắn nếu cần] |
| NhanB | 3 | [diễn giải ngắn nếu cần] |
| NhanC | 2 | [diễn giải ngắn nếu cần] |

> 🎯 **Nên làm**: [1 câu hành động cụ thể]

[Biểu đồ thứ 2 trở đi theo cùng cấu trúc 4 phần — nhận xét (có số) → chart → bảng số liệu → hành động]

> ⚠️ Quy tắc cú pháp & số liệu bắt buộc:
> - Dùng code block ` ```chartsview ` (plugin Charts View của caronchen) — KHÔNG dùng ` ```chart `
> - Data theo format **object array** với field rõ ràng (label/value, type/value…)
> - Options theo cú pháp AntV G2Plot: `xField`, `yField`, `angleField`, `colorField`…
> - Biểu đồ tròn dùng `type: Pie` với `angleField`/`colorField`, không có `xField`/`yField`
> - Chỉ vẽ khi có số liệu thực từ nguồn — không bịa dữ liệu
> - **Bắt buộc**: sau mỗi chart block phải có bảng markdown với đầy đủ nhãn + giá trị — đảm bảo số liệu hiển thị khi xuất PDF (chart không render trong PDF)
> - Câu nhận xét `💡` phải nêu ít nhất 1–2 số liệu cụ thể (ví dụ: "NhanA chiếm 5/10, cao hơn NhanB 67%")

## 4. Phân tích & Nhận định
> 🧠 Đây là phần quan trọng nhất — phải chỉ ra **pattern lặp lại, giả định sai, mâu thuẫn nội tại, rủi ro ẩn**.
> Áp dụng 3 lens: 🔍 Core Insight (triệu chứng hay gốc rễ?) · ⚠️ Rủi ro (hệ quả nếu bỏ qua?) · 🎯 Hành động (fix ngay / redesign / training?)
> Nếu không có insight → ghi rõ "không đủ dữ liệu để kết luận".

[Nhận định từ dữ liệu kèm footnote.[^N] Ưu tiên: điểm gây rủi ro, pattern lặp nhiều nguồn, dấu hiệu thiết kế sai từ đầu.]

### 4.1 Quy luật rút ra
> 🧠 Không viết quy luật hiển nhiên. Mỗi quy luật phải trả lời: "Nếu không biết điều này → sẽ sai ở đâu?"

[Mỗi quy luật: **1 câu tên in đậm** + 1–2 câu giải thích tại sao quan trọng + footnote nguồn]

### 4.2 Mâu thuẫn phát hiện
> 🧠 Chỉ ra các điểm không nhất quán giữa các nguồn hoặc giữa thực tế và kỳ vọng — kèm hệ quả nếu không xử lý.

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | ... | ... |
| 2 | ... | ... |

## 5. Gaps & Hạn chế
> 🧠 Gaps không chỉ là "thiếu tài liệu" — phải chỉ ra **tại sao gap này nguy hiểm** và ai chịu rủi ro nếu không lấp.

["Không tìm thấy nguồn về X → rủi ro: ...", "Thông tin Y mâu thuẫn giữa 2 nguồn → cần xác nhận với ..."]

## 6. Gợi ý hành động
> 🧠 Mỗi hành động phải **cụ thể, có người chịu trách nhiệm, có lý do rõ ràng**.
> Không viết kiểu "cần cải thiện X" — phải là "ai làm gì, vì sao ưu tiên cao".

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | ... | ... |
| 🟡 Trung bình | ... | ... |
| 🟢 Thấp | ... | ... |

---

## Tài liệu tham khảo

> Liệt kê **toàn bộ nguồn đã dùng** theo định dạng bảng, nhóm theo loại nguồn. Mỗi footnote phải có dòng định nghĩa tương ứng bên dưới bảng.

### Nguồn Wiki

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^1] | [[wiki/concepts/TenKhái-niệm]] | concept | [Mô tả: ví dụ "Trang concept tổng hợp: 3 cấp Kaizen, 4 phương pháp"] |
| [^2] | [[wiki/sources/TenNguon]] | source | [Mô tả: ví dụ "Nhật ký gốc #08: kế hoạch Pareto, số liệu thực chiến"] |
| [^3] | [[wiki/synthesis/TenTongHop]] | synthesis | [Mô tả: ví dụ "Báo cáo tổng hợp trước đó — đã xem, không trùng"] |

### Nguồn Thô (raw/)

| # | Đường dẫn | Ngày tạo | Mô tả ngắn |
|---|-----------|----------|------------|
| [^4] | `raw/Nghiệp vụ HRM/INS/ten-file.md` | YYYY-MM-DD | [Mô tả: ví dụ "Tài liệu gốc 20/03/2017: 3 cấp Kaizen, 5S"] |
| [^5] | `raw/archive/1. Projects/ten-folder/ten-file.md` | YYYY-MM-DD | [Mô tả ngắn] |

### Suy luận AI

| # | Loại | Giải thích |
|---|------|-----------|
| [^6] | [inference] | [Giải thích: ví dụ "Suy luận từ xu hướng 3 kỳ giao ban liên tiếp — chưa có nguồn xác nhận"] |

---

[^1]: [[wiki/concepts/TenKhái-niệm]] — [mô tả ngắn]
[^2]: [[wiki/sources/TenNguon]] — [mô tả ngắn]
[^3]: [[wiki/synthesis/TenTongHop]] — [mô tả ngắn]
[^4]: `raw/Nghiệp vụ HRM/INS/ten-file.md` — [mô tả ngắn]
[^5]: `raw/archive/1. Projects/ten-folder/ten-file.md` — [mô tả ngắn]
[^6]: [inference] — [giải thích suy luận]

> ⚠️ **Quy tắc bắt buộc cho mục này:**
> - Mọi `[^N]` xuất hiện trong thân báo cáo **đều phải có dòng định nghĩa** ở đây — không được thiếu
> - Bảng wiki và bảng raw giúp người đọc thấy tổng quan nguồn mà không cần lướt cả báo cáo
> - Suy luận AI (`[inference]`) phải giải thích rõ logic suy luận — không để trống

## Hành trình nghiên cứu
> Nhật ký quyết định đầy đủ — ghi lại **từng bước** theo thứ tự thực hiện: đọc gì, thấy gì, quyết định gì, tại sao bỏ qua, phát hiện bất thường nào.

### Vòng 1 — Quét nền

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 1 | `wiki/index.md` | ✅ Đọc | Phát hiện [N] trang liên quan: `[file1]`, `[file2]` |
| 2 | `wiki/sources/[tên].md` | ✅ Đọc | Nguồn tổng hợp chính — chứa [X nội dung chính] |
| 3 | `wiki/synthesis/[tên].md` | ✅ Đọc | ⚠️ BÁO CÁO ĐÃ TỒN TẠI (`[tên file]`) — kiểm tra coverage |
| 4 | `raw/[tên].md` | ⏭ Bỏ qua | Chứa ảnh base64 lớn, không có text content hữu ích |
| 5 | `raw/[tên].md` | ⏭ Bỏ qua | Không liên quan chủ đề / trùng nội dung đã có |

**Tổng vòng 1:** [X] file đọc · [Y] bỏ qua · [Z] lead mới phát sinh

### Vòng 2 — Mở rộng theo lead

> 🔄 Lý do mở rộng: báo cáo cũ chỉ cover [N] file đại diện — còn [M] file chưa được phân tích chi tiết

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 6 | `raw/[tháng]/[tên].md` | ✅ Đọc | Phát hiện: [fact mới — nêu cụ thể, ví dụ: "doanh thu 2030 là 1.200 tỷ, khác báo cáo cũ ghi 1.000 tỷ"] |
| 7 | `raw/[tháng]/[tên].md` | ✅ Đọc | Xác nhận thông tin về [chủ đề con X] |
| 8 | `raw/[tên-bất-thường].md` | ⚠️ Bất thường | Tên file ghi năm [Y] nhưng nằm trong folder [Z] — ghi nhận, vẫn đọc |
| 9 | `raw/[tháng]/[batch N file].md` | ✅ Đọc nhóm | [N] file tháng [MM/YYYY]: tóm tắt nội dung chung + điểm nổi bật |

**Tổng vòng 2:** [X] file đọc · [Y] bỏ qua · [Z] lead mới

### Kết thúc tìm kiếm

> 🏁 Dừng tại vòng [N]: không còn lead mới phát sinh.

| Chỉ số | Giá trị |
|--------|---------|
| Tổng file raw xác nhận | [N] file |
| Đã đọc chi tiết | [X] file |
| Bỏ qua (có lý do) | [Y] file |
| Bất thường phát hiện | [Z] điểm |
| Mâu thuẫn dữ liệu tìm thấy | [K] điểm |

### Phát hiện bất thường & mâu thuẫn
> Ghi rõ các điểm không nhất quán tìm thấy trong quá trình nghiên cứu.

- **[Bất thường 1]**: `[tên file]` — [mô tả: vd tên ghi 2026 nhưng folder 2025, nội dung giao ban tháng 8/2025]
- **[Mâu thuẫn 1]**: `[nguồn A]` ghi [X], nhưng `[nguồn B]` ghi [Y] — **dùng [nguồn nào] vì [lý do]**
- **[Mâu thuẫn 2]**: Báo cáo cũ `[tên]` ghi [giá trị cũ], file thô `[tên]` cập nhật [giá trị mới]

### Câu hỏi suy ngẫm
> 3 câu hỏi kích thích tư duy sâu — mỗi câu dùng một lăng kính khác nhau, gắn chặt với nội dung vừa nghiên cứu.

**🔬 Tư duy nguyên bản — FPT** *(First Principles Thinking: phá vỡ giả định mặc định, về tận nền tảng)*
> [Câu hỏi đặt lại giả định căn bản nhất của chủ đề. Ví dụ: "Chúng ta mặc định X là đúng — nhưng nếu bỏ giả định đó đi, nền tảng thực sự là gì?"]

**🧠 Câu hỏi Socrate** *(Socratic Questioning: dẫn dắt bằng câu hỏi để lộ mâu thuẫn hoặc khoảng trống)*
> [Câu hỏi thách thức kết luận hoặc phát hiện chính trong báo cáo. Ví dụ: "Nếu điều ngược lại là đúng, bằng chứng nào sẽ thay đổi trước tiên?"]

**🎯 SAT — Suy ngẫm · Áp dụng · Thách thức** *(Kết nối lý thuyết → hành động thực tiễn cụ thể)*
> [Câu hỏi buộc người đọc phải kết nối phát hiện với quyết định thực tế. Ví dụ: "Nếu phải hành động ngay hôm nay với thông tin này, bước đầu tiên cụ thể là gì và tại sao?"]
```

---

## PHASE 4 — Hoàn tất

```
✅ Báo cáo đã lưu: wiki/synthesis/<XXXX>-<ten-chu-de>-Research-<YYYYMMDD>.md
📋 Đã cập nhật: wiki/index.md + wiki/log.md

📊 Thống kê:
   Vòng tìm kiếm : [N] vòng
   Tổng nguồn đọc: [X] (dùng: Y | bỏ: Z)
   Lead theo đuổi : [N] leads
```

Câu hỏi Socrate (FPT · Socratic · SAT) đã được tích hợp vào cuối phần **Hành trình nghiên cứu** trong file báo cáo — không cần đặt thêm ngoài chat.

---

## Phân biệt với 02-wiki-query

| | 02-wiki-query | 03-wiki-research |
|---|---|---|
| Nguồn | Chỉ wiki/ | wiki/ + toàn bộ HRM-Knowledge-Base/ |
| Tìm kiếm | 1 lần | Lặp multi-hop theo lead |
| Tiến trình | Ẩn | Hiển thị từng bước trực quan |
| Output | Trả lời trong chat | Báo cáo .md lưu vào synthesis/ |
| Kế hoạch | Không | Có — user duyệt trước khi chạy |
| Khi nào dùng | Câu hỏi nhanh | Nghiên cứu sâu, cần báo cáo |
