---
name: 00-wiki-guide
description: "Dùng khi người dùng hỏi wiki là gì, muốn giới thiệu hệ thống, hoặc cần hướng dẫn bắt đầu. Ví dụ: \"wiki là gì\", \"giới thiệu wiki\", \"hướng dẫn cho người mới\", \"kiến trúc wiki hoạt động thế nào\", \"ingest / query / lint là gì\""
---

# Skill: 00-wiki-guide

Trang giới thiệu toàn diện LLM Wiki — triết lý, kiến trúc, flow chart, diễn giải từng bước, hướng dẫn dùng từng skill kèm ví dụ thực tế.
**Chỉ đọc, không tạo file mới, không ghi log.**

## Kích hoạt

- `/00-wiki-guide`
- "wiki là gì", "giới thiệu wiki", "hướng dẫn cho người mới"
- "kiến trúc wiki", "flow wiki hoạt động thế nào"
- "raw là gì", "wiki folder là gì", "schema là gì"
- "ingest / query / lint / research / tonghop là gì"
- "cách dùng wiki-ingest", "ví dụ wiki-query"

---

## Nguyên tắc của skill này

| ✅ Được làm | ❌ Không làm |
|------------|-------------|
| Giải thích thuật ngữ bằng ngôn ngữ đơn giản | Tạo file mới |
| Vẽ sơ đồ ASCII minh họa | Ghi vào wiki/log.md |
| Kể chuyện theo từng bước | Ingest hoặc sửa wiki |
| Đưa ví dụ thực tế từ wiki của người dùng | Chạy skill khác thay người dùng |

---

## BƯỚC 0 — In tiêu đề khi được gọi

```
📖 Wiki Guide — Hướng dẫn toàn diện cho người mới
══════════════════════════════════════════════════
Skill KHÁM PHÁ — không thay đổi bất kỳ file nào.
```

---

## BƯỚC 1 — Trình bày theo thứ tự cố định

Khi gọi `/00-wiki-guide` **không có câu hỏi cụ thể**, trình bày đầy đủ theo thứ tự:

```
PHẦN 1 → Tổng quan & Triết lý
PHẦN 2 → Kiến trúc 3 lớp (raw / wiki / schema)
PHẦN 3 → Flow chart + Kể chuyện dữ liệu
PHẦN 4 → Diễn giải từng bước vận hành
PHẦN 5 → Hướng dẫn từng skill kèm ví dụ
PHẦN 6 → Gợi ý bắt đầu
```

Nếu người dùng hỏi **thuật ngữ cụ thể** → nhảy thẳng vào phần liên quan.

---

## PHẦN 1 — Tổng quan & Triết lý

### LLM Wiki là gì?

> **LLM Wiki** = kho tri thức cá nhân do AI tự xây dựng và duy trì, tích lũy theo thời gian.
> Bạn cung cấp tài liệu thô. AI đọc, tổng hợp, tổ chức thành wiki có cấu trúc.
> Bạn chỉ cần **đặt câu hỏi** và **đọc kết quả** — không cần tự viết gì.

### Vì sao không dùng ChatGPT upload file / NotebookLM?

```
❌ CÁCH THÔNG THƯỜNG (RAG)
[Câu hỏi 1] ──► Tìm file gốc ──► Trả lời
[Câu hỏi 2] ──► Tìm file gốc ──► Trả lời
[Câu hỏi 3] ──► Tìm file gốc ──► Trả lời

=> Mỗi lần hỏi = tìm lại từ đầu
=> Không có tích lũy tri thức


✅ CÁCH LLM WIKI

        Nguồn mới (PDF / Docs / Code)
                     │
                     ▼
              LLM đọc + phân tích
                     │
                     ▼
          Lưu vào WIKI (tri thức tích lũy)
                     │
        ┌────────────┼────────────┐
        ▼            ▼            ▼
   Trả lời nhanh  Trả lời nhanh  Trả lời nhanh

=> Hỏi càng nhiều → Wiki càng giàu
=> Không cần đọc lại từ đầu
```

### 🔑 Cơ chế then chốt: index.md tiết kiệm token như thế nào?

```
❌ KHÔNG CÓ WIKI (RAG thông thường)
───────────────────────────────────────────────────────────────
  Câu hỏi → Scan 200 file raw/ → Nhét hết vào context
  Token tiêu thụ: 200 file × 2.000 token = ~400.000 token/lần hỏi
  ✗ Đắt, chậm, dễ tràn context

✅ CÓ LLM WIKI — nhờ index.md
───────────────────────────────────────────────────────────────
  Câu hỏi → Đọc index.md (500 token) → Xác định 3 trang liên quan
           → Đọc 3 trang wiki (3 × 800 = 2.400 token)
           → Trả lời
  Token tiêu thụ: ~3.000 token/lần hỏi
  ✓ Rẻ hơn 100×, nhanh, chính xác
```

**Tại sao index.md tiết kiệm được token?**

```
index.md chỉ ~300-500 token NHƯNG chứa "bản đồ" toàn bộ wiki:

  │ Projects : VnPay-Project, Bitex-Project, CircleK...  ← LLM biết ngay
  │ Concepts : IIS-Troubleshoot, Net8-Migration...            trang nào tồn tại
  │ Sources  : bien-ban-hop-vnpay, nhat-ky-loi...        │
  │ Entities : VnPay.md, Hai.NguyenNgoc.md...            │

→ LLM đọc 1 file duy nhất → định vị chính xác 2-3 trang cần đọc
→ Không bao giờ scan toàn bộ raw/
```

### 📊 Bảng So Sánh Chi Tiết: Trước và Sau khi có Wiki

```
Tình huống             ❌ Trước (không wiki)          Token   ✅ Sau (có wiki)                Token    Nhờ cơ chế
─────────────────────  ──────────────────────────────  ───────  ──────────────────────────────  ───────  ─────────────────
Hỏi 1 câu thông thường Nhét 5-10 file raw vào context  ~20-50K  Đọc index.md → 2-3 trang wiki  ~2-4K    index.md điều hướng
Hỏi về 1 dự án cụ thể  Scan tất cả file liên quan dự án~80-150K index.md → 1 trang projects/   ~3-5K    index.md + cross-link
Nghiên cứu sâu chủ đề  Đọc toàn bộ tài liệu thô        ~200-400K index.md → 5-8 trang wiki     ~8-15K   index.md + tags
Onboard nhân viên mới  Nhét hết tài liệu vào 1 lần     ~300K+   Hỏi từng phần nhỏ → wiki trả   ~3K/câu  wiki đã tóm tắt sẵn
Tìm lỗi kỹ thuật cũ    Tìm lại file log/biên bản thô   ~30-80K  index.md → concepts/ + sources/ ~3-6K    index.md + frontmatter
Báo cáo tiến độ        Đọc nhiều file Excel, chat, email~100K+  index.md → 1-2 trang projects/  ~2-4K    wiki đã tổng hợp sẵn
```

### 🧠 Tại Sao Không Dùng ChatGPT Upload File / NotebookLM?

```
  CHATGPT UPLOAD FILE / NOTEBOOKLM         LLM WIKI
  ──────────────────────────────────────   ──────────────────────────────────────
  ✗ Session-based: mỗi chat mới = quên     ✓ Tích lũy vĩnh viễn vào wiki/
    hết, phải upload lại                     Không cần upload lại

  ✗ Không biết file nào liên quan nhau     ✓ Cross-link [[wiki/path]] kết nối
    → trả lời rời rạc, mất context           mọi trang thành mạng lưới tri thức

  ✗ Mâu thuẫn giữa 2 file → không phát    ✓ ingest phát hiện mâu thuẫn,
    hiện → trả lời sai                       đánh dấu rõ trong wiki

  ✗ Giới hạn số file upload (thường 10-20) ✓ Không giới hạn — wiki/ là file hệ
                                             thống, raw/ không bị đọc lại

  ✗ Không nhớ quyết định cũ               ✓ log.md append-only ghi lại mọi
    → mỗi lần hỏi phải giải thích lại       thao tác và ngữ cảnh

  ✗ Không tự cập nhật khi có nguồn mới    ✓ ingest mới → wiki/ tự enriched
    → tài liệu cũ = câu trả lời cũ          → câu trả lời ngày càng chính xác

  ✗ Tốn token cao mỗi lần hỏi             ✓ index.md định vị nhanh → chỉ đọc
    vì phải nhét nhiều file vào context      đúng trang cần → tiết kiệm 100×
```

> **Kết luận:** ChatGPT upload file / NotebookLM phù hợp cho tra cứu **1 lần**.
> LLM Wiki phù hợp khi bạn cần **tích lũy tri thức theo thời gian** — mỗi tài liệu
> mới làm toàn bộ wiki thông minh hơn, không chỉ thêm 1 file vào danh sách.

### Phân công nhiệm vụ

```
  👤 BẠN                          🤖 LLM - AI
  ──────────────────────          ──────────────────────────
  • Tìm & đặt tài liệu            • Đọc, tóm tắt, tổ chức
  • Đặt câu hỏi          ◄────►   • Tổng hợp, đối chiếu nguồn
  • Quyết định hướng đi  Obsidian  • Phát hiện & đánh dấu mâu thuẫn
  • Đọc wiki kết quả     hiển thị  • Duy trì cross-link nhất quán
```

---

### 🤖 Agent là gì trong hệ thống này?

> **Agent = LLM + Bộ nhớ + Lập kế hoạch + Công cụ**

```
  ┌───────────────────────────────────────────────────────────┐
  │                        AGENT                              │
  │                                                           │
  │  🧠 LLM (bộ não)     → Suy luận, hiểu ngữ cảnh,         │
  │                          tổng hợp câu trả lời             │
  │                                                           │
  │  💾 Bộ nhớ dài hạn   → LLM Wiki (Karpathy-style)        │
  │                          Source of truth — bất biến       │
  │                                                           │
  │  📋 Lập kế hoạch     → Chia nhiệm vụ lớn → bước nhỏ,   │
  │                          chọn skill phù hợp               │
  │                                                           │
  │  🔧 Công cụ          → File, code, API, MCP servers,     │
  │                          Mermaid, tài liệu, hệ thống ngoài│
  └───────────────────────────────────────────────────────────┘
```

**Cách Agent xử lý một yêu cầu (ReAct loop):**

```
  Yêu cầu đến
       │
       ▼
  1. TRA CỨU WIKI     ← ưu tiên raw/, domain/, architecture/,
       │                 flows/, bugs/, decision-log/, lessons-learned/
       ▼
  2. LẬP KẾ HOẠCH    ← chia task lớn → các bước nhỏ, chọn skill
       │
       ▼
  3. HÀNH ĐỘNG       ← dùng công cụ, gọi MCP, đọc/ghi file
       │
       ▼
  4. QUAN SÁT        ← đánh giá kết quả, phát hiện mâu thuẫn
       │
       ▼
  5. PHẢN TƯ         ← cải thiện câu trả lời, đề xuất cập nhật Wiki
```

**Nguyên tắc quan trọng:**

```
  ✅ Wiki là SOURCE OF TRUTH — LLM chỉ là bộ não suy luận tạm thời
  ✅ Không suy đoán tùy tiện — phải tra Wiki trước khi trả lời
  ✅ Nếu câu hỏi mâu thuẫn với Wiki → nêu rõ điểm mâu thuẫn
     và đề xuất cập nhật Wiki nếu cần
  ❌ Không bỏ qua Wiki dù LLM "nghĩ mình đã biết"
  ❌ Không nhét toàn bộ raw/ vào context — dùng index.md điều hướng
```

---

## PHẦN 2 — Kiến trúc 3 Lớp

```
┌─────────────────────────────────────────────────────────────┐
│  🔧 LỚP 3 — SCHEMA (Lược đồ vận hành)                      │
│  📋 CLAUDE.md — Quy tắc tổng thể                           │
│  📋 .claude/skills/wiki-*/ — Hướng dẫn từng thao tác       │
└──────────────────────┬──────────────────────────────────────┘
                       │ điều khiển LLM
                       ▼
┌─────────────────────────────────────────────────────────────┐
│  📚 LỚP 2 — WIKI (Tri thức đã tổ chức)                     │
│  ├── index.md       — Mục lục toàn bộ wiki                 │
│  ├── projects/      — Một trang per dự án                  │
│  ├── entities/      — Khách hàng, nhân sự, đối tác         │
│  ├── concepts/      — Khái niệm kỹ thuật / nghiệp vụ       │
│  ├── sources/       — Tóm tắt từng nguồn đã ingest         │
│  ├── synthesis/     — Phân tích tổng hợp, bài học          │
│  └── log.md         — Lịch sử (append-only)                │
└──────────────────────▲──────────────────────────────────────┘
                       │ LLM đọc → tổng hợp
┌─────────────────────────────────────────────────────────────┐
│  📁 LỚP 1 — RAW (Nguồn thô — bất biến)                     │
│  *.pdf   — Báo cáo, hợp đồng                               │
│  *.md    — Biên bản họp, ghi chú                           │
│  *.txt   — Nhật ký hệ thống, log                           │
│  *.xlsx  — Dữ liệu bảng tính                               │
└─────────────────────────────────────────────────────────────┘
```

> **Quy tắc vàng:** `raw/` là bất biến — LLM chỉ ĐỌC, không bao giờ sửa.

### Diễn giải từng lớp

**LỚP 1 — raw/ (Kho tài liệu gốc)**

```
raw/ chứa tài liệu NGUYÊN BẢN của bạn:

  PDF       → báo cáo, tài liệu kỹ thuật, hợp đồng
  .md       → biên bản họp, ghi chú, hướng dẫn deploy
  log/txt   → nhật ký lỗi hệ thống, output terminal
  xlsx/csv  → danh sách nhân sự, timeline, budget

Quy tắc vàng của raw/:
  ✅ Bạn tự do thêm bất kỳ file nào
  ✅ LLM đọc để hiểu nội dung
  ❌ LLM KHÔNG BAO GIỜ sửa file trong raw/
  ❌ Bạn không cần format đẹp — để nguyên cũng được

Ví dụ thực tế (wiki này):
  raw/bien-ban-hop-vnpay-17042025.md   ← biên bản họp thô
  raw/huong-dan-deploy-hrm.md          ← hướng dẫn kỹ thuật
  raw/nhat-ky-loi-he-thong.md          ← log lỗi IIS/SQL
```

**LỚP 2 — wiki/ (Tri thức có cấu trúc)**

```
wiki/ là kết quả LLM xây dựng từ raw/:

  projects/   → Mỗi file = 1 dự án đầy đủ thông tin
  entities/   → Mỗi file = 1 khách hàng hoặc 1 nhân sự
  concepts/   → Mỗi file = 1 khái niệm kỹ thuật/nghiệp vụ
  sources/    → Mỗi file = tóm tắt 1 tài liệu raw/ đã ingest
  synthesis/  → Mỗi file = bài phân tích tổng hợp đa nguồn

Đặc điểm của wiki/:
  ✅ Mọi file có frontmatter chuẩn (type, tags, date, related)
  ✅ Cross-link giữa các trang bằng [[wiki/path/to/page]]
  ✅ Tự động cập nhật khi có nguồn mới
  ✅ Ghi chú mâu thuẫn khi 2 nguồn nói khác nhau
  ❌ Bạn không sửa trực tiếp — để LLM duy trì nhất quán

Ví dụ thực tế (wiki này):
  wiki/projects/VnPay-Project.md        ← toàn bộ dự án VnPay
  wiki/entities/VnPay.md               ← hồ sơ công ty VnPay
  wiki/concepts/HRM-IIS-Troubleshooting.md  ← lỗi IIS thường gặp
  wiki/sources/H-VnPay-Att-17042025.md ← tóm tắt biên bản họp
  wiki/synthesis/VnPay-Lessons-Learned.md   ← bài học từ VnPay
```

**LỚP 3 — schema/ (Quy tắc vận hành)**

```
Schema = "luật" mà LLM phải tuân theo khi làm việc với wiki:

  CLAUDE.md                         ← quy tắc tổng thể, cấu trúc wiki
  .claude/skills/00-wiki-guide/     ← trang giới thiệu (đang đọc)
  .claude/skills/01-wiki-ingest/    ← cách ingest tài liệu
  .claude/skills/02-wiki-query/     ← cách trả lời câu hỏi
  .claude/skills/03-wiki-research/  ← cách nghiên cứu chuyên sâu
  .claude/skills/04-wiki-analyze/   ← cách phân tích sức khỏe wiki
  .claude/skills/05-wiki-lint/      ← cách kiểm tra chi tiết
  .claude/skills/06-wiki-tonghop/   ← cách tổng kết ngày
  .claude/skills/07-wiki-rootcause/ ← giải trình / phân tích nguyên nhân sự cố
  .claude/skills/08-nghiepvu-query/ ← hỏi chuyên sâu nghiệp vụ HRM
  .claude/skills/09-code-bug-fix/   ← debug & fix bug toàn diện
  .claude/skills/10-code-ingest-raw/← nạp vấn đề sau bug fix vào raw/

Tại sao Schema quan trọng?
  Không có Schema → LLM là chatbot chung chung, quên hết sau mỗi session
  Có Schema       → LLM biết chính xác phải làm gì, theo quy ước nào,
                    ghi file ở đâu, format thế nào → wiki nhất quán
```

---

## PHẦN 3 — Flow Chart Vận Hành Wiki

### 3.1 — Flow Chart Tổng Thể (Decision Flow)

```
             🚀 Bắt đầu — Có input mới
                          │
                          ▼
               ┌─────────────────────┐
               │  Loại input là gì?  │
               └──────┬──────────────┘
                       │
          ┌────────────┴────────────┐
          │                         │
          ▼                         ▼
  [Câu hỏi / cần hiểu]      [Tài liệu mới]
          │                         │
          ▼                         ▼
  📌 QUERY                  📥 INGEST
  /02-wiki-query            /01-wiki-ingest
          │                         │
          ▼                         ▼
  Đọc wiki/index.md         LLM đọc file raw/
  Xác định trang liên quan  tóm tắt + trích xuất
          │                         │
          ▼                         ▼
  Truy relevant pages       Tạo wiki/sources/
          │                 theo format chuẩn
          ▼                         │
  Tổng hợp câu trả lời              ▼
  có citation               Cập nhật projects/
          │                 entities/ concepts/
          ▼                         │
  Có insight đáng lưu?              ▼
     │         │            Thêm cross-link
    Có        Không         giữa các trang
     │         │                    │
     ▼         │                    ▼
  📝 CREATE NOTE            Update index.md
  wiki/synthesis/           + append log.md
     │         │                    │
     ▼         └──────┬─────────────┘
  Viết insight          │
  Thêm backlink         ▼
  Update index.md   ✅ Hoàn tất
  + append log.md
                        │
                        ▼
               Định kỳ tuần/tháng?
                 │           │
                Có          Không
                 │           │
                 ▼           ▼
           🔎 LINT       Kết thúc phiên
           /05-wiki-lint
                 │
        ┌────────┴────────────────┐
        ▼        ▼        ▼       ▼
    Orphan   Mâu thuẫn  Link   Concept
    pages              gãy    thiếu
```

> **📖 Câu chuyện dữ liệu — Flow tổng thể vận hành như thế nào?**
>
> Sáng thứ Hai, bạn nhận được file biên bản cuộc họp VnPay hôm qua từ email — bạn lưu vào
> `raw/bien-ban-hop-vnpay-28042026.md` rồi gọi ingest. LLM đọc file thô, nhận ra đây là
> cuộc họp về sự cố IIS Pool crash tuần trước — nó tạo `wiki/sources/bien-ban-hop-vnpay-28042026.md`,
> cập nhật `wiki/projects/VnPay-Project.md` (ghi thêm timeline sự cố), cập nhật
> `wiki/concepts/HRM-IIS-Troubleshooting.md` (thêm nguyên nhân mới phát hiện),
> rồi append một dòng vào `wiki/log.md`. Buổi chiều, đồng nghiệp hỏi bạn:
> "Lỗi IIS hôm trước fix kiểu gì?" — bạn hỏi wiki, LLM đọc index → truy 2 trang liên quan
> → trả lời ngay kèm citation, không cần mở lại file biên bản thô. Cuối tuần,
> bạn chạy lint — wiki phát hiện `concepts/Net8-Migration.md` chưa ai link đến, nhắc bạn
> bổ sung cross-link từ VnPay-Project. Đó là một vòng tích lũy hoàn chỉnh: **raw → ingest
> → wiki giàu hơn → query nhanh hơn → lint giữ wiki sạch**.

> **📖 Câu chuyện dữ liệu — Flow tổng thể vận hành như thế nào?**
>
> Sáng thứ Hai, bạn nhận được file biên bản cuộc họp VnPay hôm qua từ email — bạn lưu vào
> `raw/bien-ban-hop-vnpay-28042026.md` rồi gọi ingest. LLM đọc file thô, nhận ra đây là
> cuộc họp về sự cố IIS Pool crash tuần trước — nó tạo `wiki/sources/bien-ban-hop-vnpay-28042026.md`,
> cập nhật `wiki/projects/VnPay-Project.md` (ghi thêm timeline sự cố), cập nhật
> `wiki/concepts/HRM-IIS-Troubleshooting.md` (thêm nguyên nhân mới phát hiện),
> rồi append một dòng vào `wiki/log.md`. Buổi chiều, đồng nghiệp hỏi bạn:
> "Lỗi IIS hôm trước fix kiểu gì?" — bạn hỏi wiki, LLM đọc index → truy 2 trang liên quan
> → trả lời ngay kèm citation, không cần mở lại file biên bản thô. Cuối tuần,
> bạn chạy lint — wiki phát hiện `concepts/Net8-Migration.md` chưa ai link đến, nhắc bạn
> bổ sung cross-link từ VnPay-Project. Đó là một vòng tích lũy hoàn chỉnh: **raw → ingest
> → wiki giàu hơn → query nhanh hơn → lint giữ wiki sạch**.

---

### 3.2 — Diễn Giải Từng Bước Theo Flow

**① Bắt đầu — Bạn có gì?**

```
Mỗi lần dùng wiki, bạn bắt đầu từ 1 trong 3 tình huống:

  📄 Tài liệu mới  → "ingest raw/ten-file.md"
  ❓ Câu hỏi       → hỏi thẳng, ví dụ: "VnPay gặp lỗi gì?"
  💡 Ý tưởng       → ghi lại insight, link về trang liên quan
```

**② Decision: Loại input là gì?**

```
  ◇ Câu hỏi / cần hiểu   ──────────────► nhánh QUERY   → /02-wiki-query
  ◇ Tài liệu mới          ──────────────► nhánh INGEST  → /01-wiki-ingest
  ◇ Ý tưởng / insight     ──────────────► nhánh CREATE NOTE
                                          (từ kết quả QUERY)
```

**③ Nhánh QUERY — Bạn hỏi, LLM trả lời từ wiki**

```
  Bạn hỏi: "Dự án VnPay đang ở giai đoạn nào?"
       │
       ▼ LLM đọc wiki/index.md
       │   → Xác định trang liên quan: VnPay-Project, entities/VnPay
       │
       ▼ LLM truy relevant pages
       │   → Đọc wiki/projects/VnPay-Project.md
       │   → Đọc wiki/sources/VnPay-Performance-Incident.md
       │
       ▼ Tổng hợp câu trả lời
           "Phase 4 UAT — tháng 06/2025.
            Bảo hiểm MISA dự kiến T9/2025.
            [nguồn: wiki/projects/VnPay-Project]"
       │
       ▼ Có insight mới? ◇
         Có  → CREATE NOTE (ghi synthesis)
         Không → Hoàn tất
```

**④ Nhánh INGEST — Tài liệu mới vào wiki**

```
  Bạn copy file vào raw/ rồi gọi: ingest raw/ten-file.md
       │
       ▼ Đưa vào Raw Sources
       │   → LLM xác nhận file cần đọc
       │
       ▼ LLM đọc + tóm tắt
       │   → Hiểu nội dung, trích xuất key info
       │   → Xác định liên quan đến project/entity/concept nào
       │
       ▼ Tạo / update page trong Wiki
       │   → Tạo mới: wiki/sources/ten-file.md  (tóm tắt)
       │   → Cập nhật: wiki/projects/VnPay-Project.md
       │   → Cập nhật: wiki/entities/VnPay.md
       │   → Cập nhật: wiki/concepts/HRM-BaoHiem.md
       │   → Ghi chú mâu thuẫn nếu có
       │
       ▼ Tạo backlink liên quan
       │   → Thêm [[cross-link]] giữa các trang
       │
       ▼ Update index.md + log.md
           → index.md: thêm dòng vào bảng Sources
           → log.md: append "[YYYY-MM-DD] ingest | Tên file"
```

**⑤ Nhánh CREATE NOTE — Ghi lại ý tưởng / insight**

```
  Xuất hiện khi: Query trả về insight đáng lưu, hoặc bạn có ý tưởng mới
       │
       ▼ Viết note (idea / insight)
       │   → Tạo wiki/synthesis/Ten-Chu-De.md
       │
       ▼ Link về note cũ (backlink)
       │   → Thêm [[related]] đến trang liên quan
       │
       ▼ Tag / phân loại
       │   → Thêm tags vào frontmatter
       │
       ▼ Update index.md + log.md
           → index.md: thêm vào bảng Synthesis
           → log.md: append "[YYYY-MM-DD] query | Câu hỏi ngắn"
```

**⑥ Hoàn tất → Decision: Định kỳ không?**

```
  ◇ Có (hàng tuần / sau đợt ingest lớn) → chạy LINT  → /05-wiki-lint
  ◇ Không → Kết thúc phiên làm việc
```

**⑦ LINT — Bảo trì wiki định kỳ**

```
  /05-wiki-lint hoặc /04-wiki-analyze chạy 4 kiểm tra song song:

  ┌──────────────┬──────────────┬───────────────┬─────────────────┐
  │ Tìm note     │ Tìm mâu      │ Tìm thiếu     │ Gợi ý câu      │
  │ mồ côi       │ thuẫn        │ liên kết      │ hỏi mới        │
  │              │              │               │                │
  │ Trang nào    │ Cùng thông   │ Trang nào     │ Khái niệm nào  │
  │ không ai     │ tin xuất     │ có outbound   │ được nhắc      │
  │ link đến     │ hiện khác    │ link nhưng    │ nhiều nhưng    │
  │ → Orphan     │ nhau ở 2     │ target không  │ chưa có trang  │
  │              │ trang        │ tồn tại       │ riêng          │
  └──────────────┴──────────────┴───────────────┴─────────────────┘

  Ví dụ phát hiện:
    Orphan   : concepts/Vault-Structure (0 inbound links)
    Mâu thuẫn: VnPay "Phase 4 T6" vs nguồn khác "kế hoạch T7"
    Thiếu link: Bitex-Project không có entity tương ứng
    Gợi ý mới : "BaoHiem-Module" được nhắc 8 lần, chưa có concept page
```

---

### 3.3 — Quan Hệ Giữa Các Loại Trang Wiki

```
  📁 raw/                    wiki/sources/
  ────────────────           ─────────────────────────
  bien-ban-hop-vnpay.md  ──► H-VnPay-Att-17042025.md ──┐
  nhat-ky-loi-he-thong.md──► Nhat-ky-van-de-he-thong.md│
  huong-dan-deploy.md    ──► VnPay-Deploy-Guide.md    ──┤
       /01-wiki-ingest                                  │
                                                        │ cập nhật
                            ┌───────────────────────────┤
                            │           │               │
                            ▼           ▼               ▼
                    wiki/projects/  wiki/entities/  wiki/concepts/
                    ─────────────  ──────────────  ─────────────────
                    VnPay-         VnPay.md        HRM-IIS-
                    Project.md     Hai.NguyenNgoc  Troubleshooting.md
                         │         .md             Net8-Migration.md
                         │
                         ▼ tổng hợp
                    wiki/synthesis/
                    ─────────────────
                    VnPay-Lessons-
                    Learned.md
                         │
                         └──(related)──► wiki/projects/
                                         wiki/entities/
```

---

## PHẦN 4 — Vòng Đời 1 Ngày Làm Việc

```
  GIỜ    HOẠT ĐỘNG                          SKILL
  ─────  ──────────────────────────────     ──────────────────
  08:00  Hỏi hôm nay cần làm gì?           /02-wiki-query
  09:00  Nhận tài liệu mới → ingest raw/   /01-wiki-ingest
  11:00  Hỏi câu hỏi nghiệp vụ            /02-wiki-query
  13:00  Nghiên cứu sâu chủ đề            /03-wiki-research
  17:00  Tổng kết cuối ngày               /06-wiki-tonghop
  ─────  ──────────────────────────────     ──────────────────
  📅 Định kỳ (hàng tuần):
  18:00  Thống kê tổng thể wiki           /04-wiki-analyze  ⚠️
  19:00  Kiểm tra chi tiết lỗi            /05-wiki-lint     ⚠️
```

---

## PHẦN 5 — Hướng Dẫn Từng Skill

### Bản đồ 11 skill theo thứ tự sử dụng

```
  00-wiki-guide          ← ĐỌC ĐẦU TIÊN (đang đọc)
       │
       ▼
  01-wiki-ingest         ← Nạp tài liệu raw/ vào wiki
       │
       ▼
  02-wiki-query          ← Hỏi câu hỏi, lấy thông tin
       │
       ├──────────────► 06-wiki-tonghop  (cuối ngày)
       │
       ▼
  03-wiki-research       ← Nghiên cứu sâu 1 chủ đề
       │
       ├──────────────► 06-wiki-tonghop  (cuối ngày)
       │
       ▼ (định kỳ)
  04-wiki-analyze        ← Thống kê tổng thể wiki
       │
       ▼
  05-wiki-lint           ← Kiểm tra chi tiết từng trang
       │
       ▼ (khi có sự cố)
  07-wiki-rootcause      ← Giải trình / phân tích nguyên nhân
       │
       ├──────────────► 10-code-ingest-raw (ghi vào raw/ sau fix)
       │
  08-nghiepvu-query      ← Hỏi chuyên sâu nghiệp vụ HRM
  09-code-bug-fix        ← Debug & fix bug toàn diện
```

| Skill | Lệnh | Làm gì | Ghi file? |
|-------|------|--------|-----------|
| **00-wiki-guide** | `/00-wiki-guide` | Giới thiệu hệ thống (đang đọc) | ❌ |
| **01-wiki-ingest** | `ingest raw/file.md` | Đọc raw/ → viết vào wiki/ | ✅ sources/ |
| **02-wiki-query** | hỏi thẳng | Hỏi → trả lời từ wiki | Tùy |
| **03-wiki-research** | `nghiên cứu [chủ đề]` | Nghiên cứu sâu đa nguồn | ✅ synthesis/ |
| **04-wiki-analyze** | `/04-wiki-analyze` | Thống kê sức khỏe wiki | ✅ overview.md |
| **05-wiki-lint** | `/05-wiki-lint` | Kiểm tra chi tiết lỗi | Tùy |
| **06-wiki-tonghop** | `/06-wiki-tonghop` | Tổng kết cuối ngày | ✅ synthesis/ |
| **07-wiki-rootcause** | `/07-wiki-rootcause` | Giải trình / phân tích sự cố | ✅ sources/synthesis/ |
| **08-nghiepvu-query** | `/08-nghiepvu-query` | Hỏi chuyên sâu nghiệp vụ HRM | Tùy |
| **09-code-bug-fix** | `/09-code-bug-fix` | Debug & fix bug toàn diện | Tùy |
| **10-code-ingest-raw** | `/10-code-ingest-raw` | Nạp vấn đề sau bug fix vào raw/ | ✅ raw/ |

---

## PHẦN 6 — Bảng Tra Cứu Thuật Ngữ

| Thuật ngữ | Nghĩa đơn giản | Tương tự như |
|-----------|---------------|-------------|
| **raw/** | Kho tài liệu gốc — bạn đặt vào, LLM đọc, không bao giờ sửa | Hộp thư đến chưa xử lý |
| **wiki/** | Tri thức đã tổ chức — LLM viết, bạn đọc | Sổ tay nội bộ được cập nhật tự động |
| **schema** | Quy tắc vận hành wiki (CLAUDE.md + SKILL.md) | Coding convention / README |
| **ingest** | Nhập tài liệu gốc → tích hợp vào wiki | Nhân viên đọc tài liệu → cập nhật sổ tay |
| **query** | Hỏi câu hỏi → LLM đọc wiki → trả lời có citation | Hỏi đồng nghiệp đã đọc hết tài liệu |
| **research** | Nghiên cứu sâu → đọc nhiều nguồn → viết bài tổng hợp | Viết báo cáo phân tích |
| **lint** | Kiểm tra chi tiết từng trang — lỗi, mâu thuẫn, thiếu link | Spell-check / code review |
| **analyze** | Thống kê tổng thể wiki — đếm, orphan, gaps | Dashboard / git status |
| **tonghop** | Tổng kết hoạt động trong ngày | Daily standup / nhật ký cuối ngày |
| **source** | Tóm tắt của 1 tài liệu raw/ đã ingest | Book summary / meeting minutes đã format |
| **synthesis** | Bài phân tích tổng hợp đa nguồn | Báo cáo kết luận sau nhiều nghiên cứu |
| **project** | Trang tổng hợp về 1 dự án | Hồ sơ dự án / project brief |
| **entity** | Trang về 1 đối tượng: khách hàng hoặc nhân sự | Hồ sơ / profile card |
| **concept** | Trang về 1 khái niệm kỹ thuật/nghiệp vụ | Trang Wikipedia về 1 chủ đề |
| **orphan page** | Trang tồn tại nhưng không ai link đến | File code không ai import |
| **cross-link** | Liên kết `[[wiki/path]]` giữa các trang | Hyperlink Wikipedia |
| **frontmatter** | Metadata YAML ở đầu file (type, tags, date, related) | ID card / file header |
| **append-only** | Chỉ thêm vào cuối, không xóa/sửa entry cũ | Git commit history |
| **RAG** | Cách AI thông thường: tìm file gốc mỗi lần hỏi, không tích lũy | Google mỗi lần cần thông tin |

---

## PHẦN 7 — Gợi Ý Bắt Đầu (copy & paste để dùng ngay)

---

### 📥 01-wiki-ingest — Nạp tài liệu mới vào wiki

```
/01-wiki-ingest raw/Tài liệu đặc tả kiến trúc hệ thống _ VnR Docs.pdf
```
```
/01-wiki-ingest raw/bien-ban-hop-bitex-2026.md
```
```
/01-wiki-ingest raw/ket-qua-tich-hop-misa-sau-t9-2025.md
```

---

### 🔍 02-wiki-query — Hỏi câu hỏi, lấy thông tin từ wiki

```
/02-wiki-query Dự án Bitex hiện đang ở giai đoạn nào? Cần chuẩn bị gì?
```
```
/02-wiki-query Lỗi IIS Pool crash trên VnPay xử lý thế nào? Nguyên nhân và fix?
```
```
/02-wiki-query Tích hợp Bảo hiểm MISA lộ trình ra sao? Kết quả sau T9/2025?
```
```
/02-wiki-query các phương pháp debug khi gặp bế tắc
```

---

### 🔬 03-wiki-research — Nghiên cứu sâu một chủ đề

```
/03-wiki-research toàn bộ vấn đề kỹ thuật IIS và SQL Server trong wiki
```
```
/03-wiki-research bài học kinh nghiệm UAT và go-live từ VnPay, TrungDong, HongNgoc
```
```
/03-wiki-research nghiệp vụ Bảo hiểm: quy trình, chứng từ, tích hợp MISA
```

---

### 📊 04-wiki-analyze — Thống kê tổng thể sức khỏe wiki

```
/04-wiki-analyze
```
```
/04-wiki-analyze dự án nào đang thiếu nguồn tài liệu? Gap lớn nhất là gì?
```
```
/04-wiki-analyze có orphan page nào chưa được link đến không?
```

---

### 🔎 05-wiki-lint — Kiểm tra chi tiết lỗi trong wiki

```
/05-wiki-lint
```
```
/05-wiki-lint tìm các trang concept chưa có cross-link đến project nào
```
```
/05-wiki-lint kiểm tra wiki/entities/Bitex.md đã tồn tại chưa, thiếu gì?
```

---

### 📝 06-wiki-tonghop — Tổng kết cuối ngày

```
/06-wiki-tonghop
```
```
/06-wiki-tonghop hôm nay ingest những gì? Wiki thêm bao nhiêu trang mới?
```
```
/06-wiki-tonghop insight quan trọng nhất hôm nay là gì? Việc cần làm tiếp theo?
```

---

### 🔍 07-wiki-rootcause — Giải trình / phân tích sự cố

```
/07-wiki-rootcause lỗi IIS Pool crash sáng nay
```
```
/07-wiki-rootcause schedule đồng bộ bảo hiểm không chạy tối qua
```
```
/07-wiki-rootcause viết báo cáo tháng 04/2026
```

---

### ⚙️ 08-nghiepvu-query — Hỏi chuyên sâu nghiệp vụ HRM

```
/08-nghiepvu-query quy trình đóng BHXH cho nhân viên mới
```
```
/08-nghiepvu-query cách tính thuế TNCN cho nhân viên part-time
```
```
/08-nghiepvu-query chính sách OT của Circle K khác quy định luật chỗ nào?
```

---

### 🐛 09-code-bug-fix — Debug & fix bug

```
/09-code-bug-fix schedule lấy hồ sơ ứng viên từ VNWs không tự động chạy
```
```
/09-code-bug-fix lỗi tính thuế TNCN sai với nhân viên part-time
```
```
/09-code-bug-fix Windows Service HRM bị crash sau 2 giờ
```

---

### 💾 10-code-ingest-raw — Nạp vấn đề sau bug fix vào raw/

```
/10-code-ingest-raw
```
```
/10-code-ingest-raw Bug schedule VNWs không chạy — đã fix bằng cách thêm config appsettings
```
```
ingest vấn đề vừa fix
```

---

## Ghi chú cho Claude khi chạy skill này

- **Read-only tuyệt đối** — không tạo file, không ghi log, không sửa wiki
- Khi gọi `/00-wiki-guide` không có câu hỏi cụ thể → trình bày **đủ 7 phần** theo thứ tự (7 phần = cấu trúc bài, không tính số skill)
- Khi người dùng hỏi thuật ngữ cụ thể → nhảy thẳng vào PHẦN 6 + giải thích thêm
- Khi người dùng hỏi "flow" → nhảy vào PHẦN 3
- Ưu tiên ví dụ thực từ wiki hiện tại (đọc `wiki/index.md` nếu cần tên file thật)
- **Sơ đồ dùng ASCII** — KHÔNG dùng Mermaid vì Claude Code chat panel không render được
- Giải thích bằng ngôn ngữ đơn giản nhất có thể — người dùng là người mới bắt đầu
