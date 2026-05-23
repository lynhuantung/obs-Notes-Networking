---
name: 06-wiki-tonghop
description: "Dùng khi người dùng muốn có bức tranh toàn cảnh về một chủ đề hoặc tổng kết cuối ngày — kết hợp biểu đồ Charts View, sơ đồ Mermaid và 3 câu hỏi suy ngẫm. Ví dụ: \"tổng hợp toàn diện về <X>\", \"cho tôi bức tranh toàn cảnh về <X>\", \"tổng kết hôm nay\", \"/06-wiki-tonghop\""
---

# Skill: 06-wiki-tonghop

Tổng hợp tri thức đa nguồn từ wiki, kết hợp biểu đồ Charts View + phân tích sắc bén + 3 câu hỏi Socrate.

Dùng khi người dùng muốn có cái nhìn toàn cảnh về một chủ đề, so sánh nhiều dự án/khái niệm, hoặc tổng kết hoạt động trong ngày.

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

- `/06-wiki-tonghop <chủ đề>`
- "tổng hợp toàn diện về <X>"
- "cho tôi bức tranh toàn cảnh về <X>"
- "so sánh và tổng hợp <A> và <B>"
- "tổng kết hôm nay"

---

## BƯỚC 1 — Kế hoạch ngắn gọn (TRƯỚC KHI LÀM)

```
📋 Wiki-Tổng hợp: "<chủ đề>"

Kế hoạch:
1. Đọc wiki/index.md → xác định tất cả nguồn liên quan
2. Đọc [danh sách trang dự kiến] → lấy facts, patterns, mâu thuẫn
3. Tổng hợp báo cáo có biểu đồ quan hệ
4. Lưu vào wiki/synthesis/<ten>.md nếu có giá trị

Bắt đầu...
```

---

## BƯỚC 2 — Thực hiện & Báo cáo

### 2a. Đọc wiki/index.md trước

**Dùng Atlas trước (wiki_search_links + wiki_local_graph)** → định vị node, chấm điểm, đọc node ≥4 điểm.  
Fallback `wiki/index.md` nếu Atlas không có kết quả.

### 2b. Đọc các trang — BẮT BUỘC ĐỌC HẾT, không dừng sớm

> ⚠️ **Quy tắc đọc nguồn — CRITICAL**: Không được dừng sau 2–3 trang. Phải đọc **tất cả** trang liên quan đến chủ đề trong index. Nếu có 6 nguồn liên quan → đọc đủ 6. Báo cáo chất lượng thấp thường do đọc thiếu nguồn.

Thứ tự đọc:
1. `wiki/synthesis/` — kiểm tra đã có phân tích sẵn chưa (tránh làm lại)
2. `wiki/projects/` và `wiki/entities/` — bức tranh tổng quan
3. **`wiki/sources/`** — đọc TẤT CẢ source liên quan, đây là nơi chứa dữ liệu thực tế nhất
4. `wiki/flows/` — nếu có flow liên quan đến chủ đề
5. `wiki/concepts/` và `wiki/architecture/` — nếu chủ đề liên quan kỹ thuật

Sau khi đọc xong, liệt kê rõ: **"Đã đọc X trang: [danh sách]"** trước khi viết báo cáo.

### 2c. Viết báo cáo tổng hợp

**Ngôn ngữ báo cáo: TOÀN BỘ tiếng Việt.**

> ⚠️ **Quy tắc citation bắt buộc**: Mọi fact, số liệu trong báo cáo đều phải kèm nguồn rõ ràng:
> - Từ wiki: `([[wiki/sources/ten-file]])`, `([[wiki/projects/ten-du-an]])`, `([[wiki/concepts/ten-khai-niem]])`
> - Suy luận chưa có nguồn: ghi thêm `[inference]`

---

### 📐 QUY TẮC ĐỊNH DẠNG BÁO CÁO — BẮT BUỘC

**1. Tiêu đề chính**
- Không quá 10 từ
- Định dạng `# H1` (heading level 1)
- Ví dụ: `# Tổng hợp Phân quyền HRM8`

**2. Lịch sử chỉnh sửa tài liệu**
Đặt ngay sau tiêu đề, dạng bảng:

```markdown
## Document History

| Ngày | Phiên bản | Mô tả | Người tạo |
|------|-----------|-------|-----------|
| DD/MM/YYYY | 1.0.0 | Tạo tài liệu | Tên.Người |
```

**3. Mục lục có thể click (Table of Contents)**

> ⚠️ **Quy tắc Obsidian anchor — BẮT BUỘC để link hoạt động:**
> - Anchor = text heading, **lowercase toàn bộ**
> - Dấu cách → `-`
> - Ký tự đặc biệt (`. , ! ? ( ) [ ] { } ' " / \ & * ^ % $ # @ ~`) → **xóa bỏ hoàn toàn**
> - Dấu `-` đã có trong text giữ nguyên
> - Ví dụ: `# 1. Giới thiệu tài liệu` → `#1-giới-thiệu-tài-liệu`
> - Ví dụ: `## 1.1 Mục tiêu` → `#11-mục-tiêu` (dấu `.` bị xóa)
> - Ví dụ: `# 4. Biểu đồ & Sơ đồ` → `#4-biểu-đồ--sơ-đồ` (`&` bị xóa, 2 dấu cách → 2 `-`)

> ⚠️ **Quy tắc khớp heading — BẮT BUỘC:**
> - Text trong `[...]` của TOC phải **khớp chính xác** với text trong heading `#`
> - **KHÔNG thêm, bớt, đổi chữ** trong heading so với TOC
> - Luồng đúng: **viết heading cố định trước → tạo TOC từ heading thực tế**
> - Ví dụ SAI: TOC có `[3. Các điểm cốt lõi]` nhưng heading thực tế là `# 3. Các điểm cốt lõi từ biên bản họp` → anchor KHÔNG KHỚP

```markdown
## Nội dung – Content

- [1. Giới thiệu tài liệu](#1-giới-thiệu-tài-liệu)
  - [1.1 Mục tiêu tài liệu](#11-mục-tiêu-tài-liệu)
  - [1.2 Từ viết tắt](#12-từ-viết-tắt)
- [2. Nội dung chính](#2-nội-dung-chính)
  - [2.1 ...](#21-)
```

**4. Đánh số mục — quy tắc bắt buộc**
- Cấp 1: `# 1. Tên mục` → heading H1 (hoặc H2 nếu tiêu đề chính dùng H1)
- Cấp 2: `## 1.1 Tên mục`
- Cấp 3: `### 1.1.1 Tên mục`
- Không dùng chữ số La Mã, không bỏ cấp
- **Heading text phải cố định — không được tự ý thêm chữ khi viết nội dung**

**5. Phần giới thiệu tài liệu — BẮT BUỘC ở đầu nội dung**

```markdown
# 1. Giới thiệu tài liệu

## 1.1 Mục tiêu tài liệu
[1–2 câu nêu rõ tài liệu này dùng để làm gì, dành cho ai]

## 1.2 Từ viết tắt
| STT | Thuật ngữ | Ý nghĩa |
|-----|-----------|---------|
| 1   | HRM Pro   | Giải pháp phần mềm nhân sự VnResource |
```

**6. Biểu đồ**
- Thêm biểu đồ Charts View khi nội dung có số liệu cần trực quan hóa
- Đặt ngay sau đoạn văn mô tả liên quan — không nhét cuối file

---

Báo cáo phải có đủ các phần sau — **theo đúng thứ tự này**:

```markdown
# <Tiêu đề ngắn gọn — tối đa 10 từ>

## Document History

| Ngày | Phiên bản | Mô tả | Người tạo |
|------|-----------|-------|-----------|
| DD/MM/YYYY | 1.0.0 | Tạo tài liệu | Tên.Người |

---

## Nội dung – Content

- [1. Giới thiệu tài liệu](#1-giới-thiệu-tài-liệu)
  - [1.1 Mục tiêu tài liệu](#11-mục-tiêu-tài-liệu)
  - [1.2 Từ viết tắt](#12-từ-viết-tắt)
- [2. Bức tranh toàn cảnh](#2-bức-tranh-toàn-cảnh)
- [3. Các điểm cốt lõi](#3-các-điểm-cốt-lõi)
- [4. Biểu đồ](#4-biểu-đồ)
- [5. Quy luật & Mâu thuẫn](#5-quy-luật--mâu-thuẫn)
- [6. Khuyến nghị](#6-khuyến-nghị)

---

# 1. Giới thiệu tài liệu

## 1.1 Mục tiêu tài liệu
[1–2 câu nêu rõ tài liệu này dùng để làm gì, dành cho ai]

## 1.2 Từ viết tắt
| STT | Thuật ngữ | Ý nghĩa |
|-----|-----------|---------|
| 1   | ...       | ...     |

# 2. Bức tranh toàn cảnh
> 🧠 Không chỉ mô tả trạng thái — phải chỉ ra **điều bất thường, điều bị bỏ qua, hoặc tension đang tồn tại**.
[1–2 đoạn: trạng thái hiện tại + ít nhất 1 nhận xét phân tích không hiển nhiên]

# 3. Các điểm cốt lõi

> 🧠 **Đây là phần trọng tâm — KHÔNG được viết chung chung hay tóm tắt lại nguồn.**
> Mỗi điểm cốt lõi phải viết đủ 4 thành phần bắt buộc (xem bên dưới).
> Số lượng: tối thiểu 5 điểm, không giới hạn tối đa nếu dữ liệu phong phú.

**Cấu trúc mỗi điểm cốt lõi — BẮT BUỘC đủ 4 phần:**

```
### [Số thứ tự]. [Tên điểm — ngắn gọn, có tính mô tả]

**Mô tả chi tiết**: [2–4 câu giải thích rõ điểm này là gì, xảy ra ở đâu, trong bối cảnh nào. Dùng data cụ thể từ nguồn — số liệu, tên store, tên màn hình, ngày tháng nếu có.]

**Tại sao quan trọng**: [1–2 câu phân tích — đây là triệu chứng hay gốc rễ? Nếu bỏ qua → hệ quả cụ thể là gì?]

**Rủi ro / Tác động**: [Mô tả rủi ro lan rộng — ảnh hưởng đến phân hệ nào, KH nào, SE nào phải xử lý]

**Nguồn**: [[wiki/sources/...]] | **Độ tin cậy**: Dữ kiện / Suy luận
```

> ⚠️ **Không dùng bảng tóm tắt cho phần này** — bảng làm mất chi tiết. Viết từng điểm thành block riêng như ví dụ trên.

# 4. Biểu đồ

## 4.1 Biểu đồ số liệu (Charts View)

**Bắt buộc ít nhất 2 biểu đồ.** Mỗi biểu đồ viết theo cấu trúc 3 phần:

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

[khối chart]

> 🎯 **Nên làm**: [1 câu hành động cụ thể — ai làm gì, không viết chung chung]

**Cú pháp chuẩn — biểu đồ cột (Column):**
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

**Cú pháp chuẩn — biểu đồ tròn (Pie):**
```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Pie

#-----------------#
#- chart data    -#
#-----------------#
data:
  - type: "NhanA"
    value: 5
  - type: "NhanB"
    value: 3
  - type: "NhanC"
    value: 2

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

> ⚠️ Plugin **Charts View** (caronchen) dùng code block ` ```chartsview ` (KHÔNG phải ` ```chart `). Data theo format object array với các field rõ ràng. Options theo cú pháp AntV G2Plot.

# 5. Quy luật & Mâu thuẫn
> 🧠 Đây là phần quan trọng nhất — phải chỉ ra **pattern lặp lại, giả định sai, mâu thuẫn nội tại**.
> Không viết quy luật hiển nhiên. Mỗi quy luật phải trả lời: "Nếu không biết điều này → sẽ sai ở đâu?"

**Quy luật rút ra:**
[Mỗi quy luật: 1 câu tên + 1–2 câu giải thích tại sao nó quan trọng + nguồn]

**Mâu thuẫn phát hiện:**
| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | ... | ... |

# 6. Khuyến nghị
> 🧠 Mỗi hành động phải **cụ thể, có người chịu trách nhiệm, có deadline ngầm**.
> Không viết khuyến nghị chung chung kiểu "cần cải thiện X".

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | ... | ... |
| 🟡 Trung bình | ... | ... |
| 🟢 Thấp | ... | ... |

---

## 💬 3 Câu hỏi suy ngẫm

1. 🧠 **[Giả định]** <câu hỏi Socrate cụ thể>

2. 🧪 **[Thí nghiệm]** <đặt kết luận vào bối cảnh khác trong domain ERP/HRM>

3. 🌐 **[Kết nối]** <tên trang wiki / dự án / khái niệm cụ thể trong vault>
```

### 2d. Lưu tổng hợp

**Quy tắc đặt tên file — BẮT BUỘC:**
- Tiếng Việt không dấu, có gạch nối
- Format: `<xxxx>-<noi-dung-cu-the>-<DD-MM-YYYY>.md`
- `<xxxx>` = 4–5 ký tự random từ `abcdefghijklmnopqrstuvwxyz0123456789`, sinh mỗi lần chạy, **đặt ở đầu tên file**

Ví dụ đúng: `k3bz-hoat-dong-wiki-26-04-2026.md` ✅
Ví dụ sai: `tong-hop-hom-nay-20260426.md` ❌

**Frontmatter bắt buộc** — dùng template `2. RESOURCE/template/wiki-synthesis.md`:
- Đổi `type: synthesis` thành `type: tong-hop`
- `code`: điền mã 4 ký tự random vừa sinh (giống mã trong tên file)
- `tags`: dạng danh sách YAML
- `sources-wiki`: dạng danh sách YAML (các trang wiki đã đọc)
- `related`: dạng danh sách YAML với wikilink

Ví dụ frontmatter chuẩn:
```yaml
---
type: tong-hop
code: k3bz
tags:
  - "bitex"
  - "project-management"
sources-wiki:
  - "wiki/projects/Bitex-Project"
  - "wiki/flows/Flow-Bitex-Phases"
created: 2026-04-30
updated: 2026-04-30
related:
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/sources/Bitex-Project-Overview]]"
---
```

### 2e. Append wiki/log.md

```markdown
## [YYYY-MM-DD] tonghop | <chủ đề ngắn>

Đọc: `wiki/projects/<...>`, `wiki/sources/<...>`
Tạo synthesis: `wiki/synthesis/<tên>.md`
```

---

## BƯỚC 3 — Kiểm tra trước khi kết thúc

- [ ] **Tiêu đề** H1, không quá 10 từ
- [ ] **Document History** — bảng ngày/phiên bản/mô tả/người tạo
- [ ] **Mục lục** — text trong `[...]` khớp chính xác với text heading thực tế
- [ ] **Anchor** đúng quy tắc Obsidian: lowercase, dấu cách→`-`, xóa `.()&/` v.v.
- [ ] **Đánh số mục** đúng cấp: 1 → 1.1 → 1.1.1
- [ ] **Phần 1. Giới thiệu tài liệu** — mục tiêu + từ viết tắt
- [ ] **Phần 3 (điểm cốt lõi)** — mỗi điểm viết đủ 4 thành phần: Mô tả chi tiết / Tại sao quan trọng / Rủi ro / Nguồn — KHÔNG dùng bảng tóm tắt
- [ ] Biểu đồ số liệu Charts View (ít nhất 2, dùng ` ```chartsview `)
- [ ] Bảng khuyến nghị có phân mức ưu tiên
- [ ] Phần **💬 3 Câu hỏi suy ngẫm** ở cuối file
- [ ] Tên file: `<xxxx>-<noi-dung>-<DD-MM-YYYY>.md` — mã 4–5 ký tự đặt **đầu** tên file, tiếng Việt không dấu
- [ ] Frontmatter có `code`, `tags` và `related` đúng dạng danh sách YAML

## Đường dẫn quan trọng

```
Wiki root: C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/wiki/
  index.md      ← ĐỌC ĐẦU TIÊN
  log.md        ← Append-only log
  synthesis/    ← Lưu kết quả tại đây
```
