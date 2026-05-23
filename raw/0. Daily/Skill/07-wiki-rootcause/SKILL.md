---
name: 07-wiki-rootcause
description: Dùng để giải trình nguyên nhân nhật ký một lỗi hoặc một sự cố vừa xảy ra, phân tích nguyên nhân, viết báo cáo sự cố
---

# Skill: 07-wiki-rootcause — Phân Tích Nguyên Nhân Gốc Rễ

## Khi nào dùng skill này

Dùng khi người dùng muốn:
- Ghi nhật ký một lỗi / sự cố vừa xảy ra
- Phân tích nguyên nhân sâu của một vấn đề
- Viết báo cáo RCA tháng gửi sếp
- "rootcause", "phân tích lỗi", "giải trình nguyên nhân", "báo cáo sự cố", "/07-wiki-rootcause"

---

## PHASE 0 — THU THẬP THÔNG TIN & GIẢI TRÌNH CHAT NHANH (BẮT BUỘC)

**Trước khi làm bất cứ điều gì, luôn chạy phase này.**

### Bước 0.0 — Tiền xử lý mô tả sự cố (InfraGraph — BẮT BUỘC)

Ngay khi nhận mô tả sự cố / lỗi từ người dùng, gọi InfraGraph trước:

```
mcp__InfraGraph__preprocess(query="<mô tả sự cố / lỗi đầy đủ từ người dùng>")
```

Dùng kết quả:
- `core_keywords` → từ khóa chính để tra wiki và GitNexus
- `glossary_matches` → nhận diện term kỹ thuật / nghiệp vụ đã có định nghĩa
- `optimized_queries` → query tối ưu cho bước tra atlas và GitNexus
- `detected_intents` → xác định đây là `fix-bug`, `config`, hay `query`

---

### Bước 0.1 — Thu thập thông tin vấn đề

Hỏi người dùng (gộp vào 1 lượt, không hỏi từng cái):

> "Cho mình biết nhanh:
> 1. Vấn đề / lỗi là gì? *(1–2 dòng)*
> 2. Người dùng / hệ thống đang thấy gì? *(triệu chứng bề ngoài)*
> 3. Đã xử lý chưa, hay đang xử lý?"

*(Nếu người dùng đã mô tả đầy đủ trong câu lệnh ban đầu — bỏ qua bước hỏi, tự suy luận.)*

---

### Bước 0.2 — Tạo & hiển thị giải trình chat NGAY

Sau khi có đủ thông tin, **không hỏi thêm, không giải thích** — in ngay block sau ra terminal:

```
─── 📋 GIẢI TRÌNH  ───

[Dòng mở đầu phù hợp tình huống — tự chọn, không hard-code:]
  • Lỗi đã fix xong       → "Tôi đã xử lý xong, anh/chị xem qua nhé:"
  • Đang xử lý / chờ      → "Anh/chị ơi, em cập nhật tình hình:"
  • Giải trình với KH     → "Dạ bên em xin phản hồi về vấn đề này:"
  • Không chắc tình huống → "Em cập nhật thông tin task này như sau:"

Vấn đề: [Tên lỗi / sự cố ngắn gọn]

Hiện trạng: [Triệu chứng người dùng/hệ thống gặp phải]

Nguyên nhân:
- [Nguyên nhân bề mặt]
- [Nguyên nhân sâu hơn nếu có]
- Root: [Nguyên nhân gốc rễ — suy luận tốt nhất từ thông tin hiện có]

Khắc phục: [Hành động đã/đang thực hiện]

Cách phòng tránh: [Hành động phòng ngừa tái diễn]

────────────────────────────────────────────
```

**Quy tắc cứng cho block này:**
- Tối đa **12 dòng nội dung**, tối thiểu **6 dòng**
- Không bảng, không Markdown heading, không horizontal rule bên trong nội dung
- Nguyên nhân tối đa **3 bullet**, bullet cuối luôn prefix `Root:`
- Nếu chưa có root cause chắc chắn → ghi `Root: [đang điều tra]`, không bịa

---

### Bước 0.3 — Hỏi có cần báo cáo chi tiết không

Ngay sau block giải trình chat, **hiển thị đủ 3 mẫu thu nhỏ** rồi mới hỏi chọn.
Dùng đúng format dưới đây — điền nội dung thực tế từ sự cố vừa phân tích vào chỗ `[...]`:

```
────────────────────────────────────────────
Bạn cần xuất thêm dạng nào?

 [A] NHẬT KÝ NHANH — ghi vào wiki log
 ┌─────────────────────────────────────────┐
 │ ## Sys00025 — [Tên lỗi ngắn]           │
 │ Lỗi: [Mô tả < 25 từ]                   │
 │ Lý do: [Nguyên nhân bề mặt]            │
 │ Nguyên nhân gốc: [Root cause]           │
 │ Phòng tránh: [Hành động cụ thể]        │
 │ SE | DD/MM/YYYY                         │
 └─────────────────────────────────────────┘

 [B] PHÂN TÍCH VẤN ĐỀ — 5 Whys + email giải trình
 ┌─────────────────────────────────────────┐
 │ PHÂN TÍCH VẤN ĐỀ — OPA_001            │
 │ NỘI DUNG: [Mô tả ngắn]                │
 │ NGUYÊN NHÂN (5 Whys):                  │
 │   (1) Tại sao? → ...                   │
 │   (2) Tại sao? → ...                   │
 │   → Root: [Kết luận]                   │
 │ PHƯƠNG ÁN: [Phương án chọn + lý do]   │
 └─────────────────────────────────────────┘

 [C] BÁO CÁO THÁNG — PDCA đầy đủ
 ┌─────────────────────────────────────────┐
 │ BÁO CÁO THÁNG MM/YYYY                  │
 │ Bug: [N-1] → [N]  |  Won't Fix: ...    │
 │ ROOT CAUSE (Pareto):                    │
 │   1. [Nhóm lỗi chính] ~X%              │
 │   2. [Nhóm lỗi phụ]   ~Y%             │
 │ PLAN:  [Hành động 1] | DD/MM | New     │
 │ CHECK: [Hành động đã làm] | Done       │
 │ ACT:   [Follow-up] | Doing             │
 └─────────────────────────────────────────┘

 [Enter / Không] — dừng ở đây, giải trình chat là đủ
────────────────────────────────────────────
```

Nếu người dùng chọn **Không / Enter / bỏ qua** → **kết thúc, không làm thêm gì**.
Nếu chọn A/B/C → tiến hành phase tương ứng bên dưới.

---

## PHASE 1A — NHẬT KÝ NHANH

### Thu thập thông tin

```
- ID: Sys/NV + số thứ tự (ví dụ: Sys00024)
- Lỗi: [Mô tả ngắn gọn, < 25 từ]
- Lý do: [Nguyên nhân bề mặt]
- Nguyên nhân: [Danh sách các yếu tố góp phần]
- Nguyên nhân gốc: [Root cause thực sự]
- Cách phòng tránh: [Hành động cụ thể]
- Phòng ban / Ngày
```

### Output — Entry thêm vào nhật ký

Append vào `wiki/sources/Nhat-ky-van-de-he-thong.md` (lỗi hệ thống)
hoặc `wiki/sources/Nhat-ky-van-de-nghiep-vu.md` (lỗi nghiệp vụ):

~~~markdown
## [ID] — [Tên lỗi ngắn gọn]

- **Lỗi:** [Mô tả < 25 từ]

**Lý Do**
- [Lý do bề mặt]

**Nguyên nhân**
- [Nguyên nhân 1]
- [Nguyên nhân 2]
- [Nguyên nhân 3]

**Nguyên nhân gốc:**
- [Root cause]

**Cách phòng tránh**
- [Hành động phòng ngừa]

| Tên | ID | Phòng ban | Ngày |
|-----|----|-----------|------|
| [Tên] | [ID] | SE | DD/MM/YYYY |
~~~

---

## PHASE 1B — PHÂN TÍCH VẤN ĐỀ

### Thu thập thông tin

```
- Mã vấn đề: [AAA_001 hoặc tên tự đặt]
- Nội dung: [Mô tả ngắn gọn < 25 từ]
- Hiện trạng: [Mô tả chi tiết + bối cảnh]
- Thời gian xảy ra / phát hiện
- Phạm vi ảnh hưởng
```

### Tra GitNexus (nếu liên quan đến code)

```
gitnexus_query({query: "<triệu chứng>"})
gitnexus_context({name: "<function nghi ngờ>"})
```

**Tra Atlas wiki (song song GitNexus):**
```
wiki_search_links("<từ khóa triệu chứng>")   → định vị node liên quan
wiki_local_graph("<node_id>")                 → neighbors, chấm điểm
```
Đọc node ≥4 điểm (tối đa 5). Fallback `wiki/index.md` nếu Atlas không có kết quả.

### Phân tích 5 Whys

> ⚠️ **Quy tắc citation bắt buộc trong 5 Whys**: Mỗi bước suy luận phải ghi rõ nguồn:
> - Rút ra từ wiki: kèm `([[wiki/sources/...]])` hoặc `([[wiki/concepts/...]])`
> - Rút ra từ GitNexus / code: kèm `(code: <file:line>)`
> - Suy luận AI chưa xác nhận: ghi rõ `[inference]`

```
Tại sao (1): ... → vì ...  [nguồn: ...]
Tại sao (2): ... → vì ...  [nguồn: ...]
Tại sao (3): ... → vì ...  [nguồn: ...]
Tại sao (4): ... → vì ...  [nguồn: ...]
Root cause:  [Nguyên nhân gốc rễ]  [fact / inference]
```

### Methodology Fallback (Kích hoạt khi 5 Whys bị stuck)

> **Trigger**: Khi `Tại sao (N)` trả lời là `[inference]` ≥2 lần liên tiếp, hoặc chuỗi Why đi vào vòng lặp / không dẫn đến actionable root cause.

Hiển thị block escalation và chọn phương pháp bổ sung:

```
─── 🧠 5 WHYS BỊ STUCK — KÍCH HOẠT PHƯƠNG PHÁP BỔ SUNG ───
Phân tích dừng ở bước [N] vì: [lý do stuck — thiếu data / vòng lặp / quá phức tạp]

Phương pháp bổ sung phù hợp:
```

**Sơ đồ quyết định phương pháp bổ sung:**

```
                    [5 Whys bị stuck]
                             |
              _______________↓_______________
             |                               |                        |
    Triệu chứng rõ?              Độ phức tạp?              Yêu cầu sáng tạo?
             |                               |                        |
      Yes ───┤─── No              Đa tầng ───┤─── Nhiều    Liên ngành ─┤─── Hiểu sâu
      |           |               |          |    yếu tố   |                |
  Sherlock      Einstein       Contact    Genchi+        Leonardo         Feynman
  Holmes        Tư duy         Tracing    PDCA           da Vinci
  (liệt kê      (đơn giản      (chuỗi     (SSH vào       (vẽ diagram,     (giải thích
  giả thuyết    hóa 2 node)    nhân quả)  server thực)   tìm thắt cổ)    lại đơn giản)
  loại trừ)
             |_______________|___________________________|_______________|
                                          |
                              Quay lại điền tiếp chuỗi Why
                              với data mới → root cause rõ
```

> Áp dụng xong → quay lại điền tiếp chuỗi Why với data mới, hoặc ghi thẳng root cause nếu đã rõ.

### Output — Trang wiki + Bản email

**Lưu wiki:** `wiki/synthesis/<xxxx>-rca-<ten-van-de>-<YYYYMMDD>.md`

> **Dùng template**: `2. RESOURCE/template/wiki-synthesis.md`
> Thêm tags `rca`, `incident`, `<project>` và property `code: <xxxx>` vào frontmatter.
> `tags`, `related` phải dạng danh sách YAML:
> ```yaml
> code: <xxxx>
> tags:
>   - "rca"
>   - "incident"
>   - "<project>"
> related:
>   - "[[wiki/projects/ten-du-an]]"
>   - "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
> ```

~~~markdown
# [Mã] : [Nội dung vấn đề]

- [Mô tả ngắn gọn < 25 từ]

## Hiện trạng

- [Mô tả hiện trạng]
- [Mô tả bối cảnh — khi nào, ở đâu, ai bị ảnh hưởng]

## Nguyên nhân

- **Tại sao (1):** ...
- **Tại sao (2):** ...
- **Tại sao (3):** ...
- **Root cause:** [Kết luận]

## Phương án

- [Phương án 1 — mô tả + ưu/nhược]
- [Phương án 2 — mô tả + ưu/nhược]
- **Phương án chọn:** [Giải thích lý do chọn]

## Hành động

| Hành động | Người thực hiện | Deadline | Trạng thái |
|-----------|----------------|---------|-----------|
| ... | ... | DD/MM | ✅ / 🔄 / ⏳ |

## Bài học

- [Lesson 1]
- [Lesson 2]
~~~

**Bản email/Word clean:**

```
PHÂN TÍCH VẤN ĐỀ — [Mã]
Ngày: DD/MM/YYYY | Người lập: [Tên] | Dự án: [Tên]

NỘI DUNG
────────
[Mô tả ngắn gọn vấn đề, < 25 từ]

HIỆN TRẠNG
──────────
[Mô tả hiện trạng và bối cảnh]

NGUYÊN NHÂN
────────────
Phân tích 5 Whys:
  (1) Tại sao xảy ra? → ...
  (2) Tại sao điều đó xảy ra? → ...
  (3) Tại sao? → ...
  → Root cause: [Kết luận nguyên nhân gốc rễ]

PHƯƠNG ÁN
──────────
[Phương án được chọn và lý do]

Các phương án đã xem xét:
  - PA1: [Mô tả] — [Ưu/nhược]
  - PA2: [Mô tả] — [Ưu/nhược]

[Tên] — [Ngày]
```

---

## PHASE 1C — BÁO CÁO TỔNG HỢP THÁNG (PDCA)

### Thu thập thông tin

```
- Tháng báo cáo
- Mục tiêu của tháng (đặt ra từ tháng trước)
- Số liệu: Bug / Won't Fix tháng này vs tháng trước
- Danh sách các hành động đã thực hiện
- Kết quả đạt được
- Kế hoạch tháng tới
```

### Phân tích Pareto (Root cause)

Từ danh sách lỗi, phân loại theo nhóm nguyên nhân:
- Phân hệ bảo hiểm, lương, chấm công...
- Code logic, config, quy trình, môi trường...

Xếp hạng từ cao xuống thấp → xác định 20% nguyên nhân gây 80% lỗi.

### Output — Trang wiki + Bản báo cáo đầy đủ

**Lưu wiki:** `wiki/synthesis/<xxxx>-monthly-rca-<YYYY-MM>.md`

> **Dùng template**: `2. RESOURCE/template/wiki-synthesis.md`
> Thêm `code: <xxxx>`, tags `rca`, `monthly-report`, `pdca` vào frontmatter dạng danh sách YAML.

~~~markdown
# Báo Cáo Tóm Tắt Mục Tiêu Tháng MM/YYYY

## Mô Tả Vấn Đề
- [Vấn đề trọng tâm tháng này]

## Hiện Trạng

| Chỉ số | Tháng [N-1] | Tháng [N] | Thay đổi |
|--------|------------|----------|---------|
| Bug    | X          | Y        | ±Z      |
| Won't Fix | X       | Y        | ±Z      |

## Mục Tiêu
Mục tiêu phân hệ [tên] tháng [N] sẽ **giảm [chỉ số] từ [X] xuống [Y]** đến hết ngày DD/MM/YYYY.

## Root Cause (Phân Tích Pareto)

Nhóm nguyên nhân chiếm nhiều nhất:
1. [Nhóm 1] — X% — [Mô tả]
2. [Nhóm 2] — Y% — [Mô tả]
3. [Nhóm 3] — Z% — [Mô tả]

→ **Tập trung xử lý nhóm 1+2 để giải quyết ~80% vấn đề.**

## Plan — Kế Hoạch

| What | Who | Notes | When | Status |
|------|-----|-------|------|--------|
| [Hành động 1] | [Tên] | | DD/MM | New |
| [Hành động 2] | [Tên] | | DD/MM | New |

## Check — Hiệu Quả Giải Pháp

| What | Who | Notes | When | Status |
|------|-----|-------|------|--------|
| [Hành động 1] | [Tên] | | DD/MM | Done |
| [Hành động 2] | [Tên] | | DD/MM | Doing |

## Act — Follow Up

| What | Who | Notes | When | Status |
|------|-----|-------|------|--------|
| [Việc cần tiếp tục] | [Tên] | | DD/MM | Doing |

## Bài Học Tháng Này
- [Lesson 1]
- [Lesson 2]
~~~

**Bản Word/Email:**

```
BÁO CÁO TÓM TẮT MỤC TIÊU THÁNG MM/YYYY
═══════════════════════════════════════════

MÔ TẢ VẤN ĐỀ
─────────────
- [Vấn đề trọng tâm]

HIỆN TRẠNG
──────────
             Tháng [N-1]    Tháng [N]
  Bug:           X              Y
  Won't Fix:     X              Y

MỤC TIÊU
─────────
Mục tiêu phân hệ [tên] tháng [N] sẽ GIẢM [chỉ số]
từ [X] task XUỐNG [Y] task đến hết ngày DD/MM/YYYY.

ROOT CAUSE (PARETO)
────────────────────
Nguyên nhân chính (xếp theo tần suất):
  1. [Nhóm 1]  —  X lỗi  (~X%)
  2. [Nhóm 2]  —  X lỗi  (~X%)
  3. [Nhóm 3]  —  X lỗi  (~X%)
→ Tập trung vào nhóm 1+2 để xử lý ~80% vấn đề.

PLAN (Kế hoạch)
────────────────
  STT  What                      Who         When      Status
   1   [Hành động]               [Tên]       DD/MM     New
   2   [Hành động]               [Tên]       DD/MM     New

CHECK (Hiệu quả giải pháp)
──────────────────────────
  STT  What                      Who         When      Status
   1   [Hành động]               [Tên]       DD/MM     Done
   2   [Hành động]               [Tên]       DD/MM     Doing

ACT (Follow up)
────────────────
  STT  What                      Who         When      Status
   1   [Việc tiếp tục]           [Tên]       DD/MM     Doing

═══════════════════════════════════════════
[Tên] — Tháng MM/YYYY
```

---

## Bước cuối — Lưu log & cập nhật wiki

Sau khi hoàn thành A/B/C (nếu người dùng chọn):

1. Append vào `wiki/log.md`:
   - A: `## [YYYY-MM-DD] rootcause | Nhật ký — <ID> <Tên lỗi>`
   - B: `## [YYYY-MM-DD] rootcause | Phân tích — <Mã> <Tên vấn đề>`
   - C: `## [YYYY-MM-DD] rootcause | Báo cáo tháng — MM/YYYY`

2. Cập nhật trang project liên quan nếu sự cố thuộc dự án cụ thể.

3. Cập nhật trang concept liên quan nếu có pattern mới
   (ví dụ: `wiki/concepts/HRM-IIS-Troubleshooting.md`, `wiki/concepts/HRM-SQL-Troubleshooting.md`).

---

## Quy tắc quan trọng

- **Phase 0 là bắt buộc** — luôn thu thập thông tin → ra giải trình chat → mới hỏi A/B/C
- **Giải trình chat ra trước, báo cáo hỏi sau** — người dùng có thể dừng ở giải trình chat mà không cần chọn A/B/C
- **Dòng mở đầu phải phù hợp tình huống** — tự suy luận từ ngữ cảnh, không dùng câu cố định
- **Không đổ lỗi cá nhân** — tập trung vào hệ thống và quy trình
- **Root cause phải actionable** — phải có hành động cụ thể để khắc phục
- **Nếu liên quan đến code** — bắt buộc chạy `gitnexus_query` + `gitnexus_context` trước khi kết luận
- **Pareto (type C)** — luôn xếp hạng nguyên nhân theo tần suất, không liệt kê flat
