---
name: 10-code-ingest-raw
description: "Dùng sau khi xử lý bug xong — thu thập thông tin vấn đề, hỏi thiếu gì, build draft, chỉnh sửa, rồi ingest vào raw/ trong LLM Wiki. Ví dụ: \"ingest vấn đề vừa fix\", \"ghi lại bug vừa xử lý\", \"/10-code-ingest-raw\""
---

# Skill: 10-code-ingest-raw — Nạp Vấn Đề Sau Bug Fix vào Wiki Raw

## Khi nào dùng skill này

Dùng khi người dùng muốn:
- Ghi lại kinh nghiệm / bài học sau khi xử lý xong một bug
- Nạp tóm tắt vấn đề vào `raw/` để chuẩn bị ingest wiki
- "ingest vấn đề vừa fix", "ghi lại bug vừa xử lý", "nạp raw wiki"
- `/10-code-ingest-raw`

---

## TỔNG QUAN LUỒNG

```
PHASE 0 — Parse input từ người dùng
    ↓
PHASE 1 — AI hỏi bổ sung thông tin còn thiếu
    ↓
PHASE 2 — AI build draft tài liệu
    ↓
PHASE 3 — Người dùng chỉnh sửa / xác nhận
    ↓
PHASE 4 — Hỏi thư mục đích → Ingest vào raw/
```

---

## PHASE 0 — PARSE INPUT

Khi người dùng kích hoạt skill, nhận và phân tích thông tin đã cung cấp.

Người dùng có thể cung cấp theo dạng:
- Mô tả tự do: *"fix bug schedule không chạy, nguyên nhân do thiếu config"*
- Paste log / đoạn code
- Kết quả từ `09-code-bug-fix` (copy/paste block phân tích)

**Trích xuất tự động từ input (nếu có):**

| Trường | Gợi ý tìm trong input |
|--------|----------------------|
| `bug_title` | Tên bug / chức năng bị lỗi |
| `symptom` | Triệu chứng bề ngoài người dùng thấy |
| `root_cause` | Nguyên nhân gốc rễ đã xác định |
| `fix_applied` | Phương án / đoạn code đã sửa |
| `module` | Module / service / file liên quan |
| `domain` | Lĩnh vực: `system` / `payroll` / `ins` / `attendance` / `other` |
| `verified` | Đã test / xác nhận chưa? `yes / no / partial` |
| `lesson_learned` | Bài học / lưu ý cho lần sau |

---

## PHASE 1 — HỎI BỔ SUNG THÔNG TIN THIẾU

Sau khi parse, kiểm tra các trường bắt buộc:

**Trường BẮT BUỘC** (phải có đủ trước khi build draft):
- `bug_title`
- `root_cause`
- `fix_applied`

**Trường tùy chọn nhưng nên có:**
- `symptom`, `module`, `lesson_learned`

**Nếu thiếu trường bắt buộc**, hỏi gộp 1 lượt — KHÔNG hỏi từng cái một:

```
📋 Mình cần thêm một vài thông tin để ghi lại đúng:

[Chỉ hỏi các trường còn thiếu, ví dụ:]
1. Tên bug / vấn đề ngắn gọn là gì?
2. Nguyên nhân gốc rễ (root cause) đã xác định là gì?
3. Đã fix bằng cách nào? (mô tả ngắn hoặc paste đoạn code chính)

[Nếu đã biết một số trường, không hỏi lại — chỉ liệt kê những gì còn thiếu]
```

**Nếu đủ thông tin → bỏ qua Phase 1, chuyển ngay Phase 2.**

---

## PHASE 2 — BUILD DRAFT

Sau khi có đủ thông tin, build draft theo template chuẩn:

### Template Draft

```markdown
---
title: "<bug_title>"
date: <YYYY-MM-DD>
code: <xxxx>
domain: <system|payroll|ins|attendance|other>
module: "<tên module / service>"
tags:
  - "bug-fix"
  - "<domain>"
  - "<module-tag>"
verified: <yes|no|partial>
related:
  - "[[wiki/sources/ten-nguon]]"
  - "[[wiki/projects/ten-du-an]]"
---

# <bug_title>

## Tóm tắt

<2–3 câu mô tả bối cảnh: chức năng gì, hệ thống nào, phát hiện khi nào>

## Triệu chứng

<Mô tả triệu chứng bề ngoài người dùng / hệ thống thấy>
<Nếu có log → paste log ngắn gọn>

## Phân tích nguyên nhân

### Root Cause

<Nguyên nhân gốc rễ — 1–3 câu rõ ràng, actionable>

### Chuỗi nguyên nhân (nếu có)

```
Triệu chứng
  ← Nguyên nhân trực tiếp
    ← Nguyên nhân gốc
```

## Giải pháp đã áp dụng

<Mô tả phương án fix + đoạn code / config đã thay đổi>

```<ngôn ngữ>
// Code trước khi fix (nếu có)

// Code sau khi fix
```

File đã sửa: `<đường dẫn file>`

## Kết quả kiểm tra

- Verified: <yes / no / partial>
- <Cách đã test để xác nhận fix hoạt động>

## Bài học / Lưu ý

- <Lesson 1: điều cần nhớ cho lần sau>
- <Lesson 2: edge case / cạm bẫy cần tránh>
- <Lesson 3: cải thiện process / quy trình nếu có>

## Liên kết

- [[wiki/sources/...]] ← nếu có trang wiki liên quan
- [[wiki/projects/...]] ← dự án liên quan
```

### Hiển thị draft cho người dùng

Sau khi build, hiển thị toàn bộ draft trong code block và thông báo:

```
─── 📝 DRAFT TÀI LIỆU ──────────────────────────────

[Nội dung draft hiển thị ở đây]

─────────────────────────────────────────────────────

Draft đã sẵn sàng. Bạn muốn:

  [OK]       — Xác nhận, tiến hành ingest vào raw/
  [Chỉnh]    — Paste nội dung đã chỉnh để tôi cập nhật
  [Thêm]     — Bổ sung thêm thông tin (mô tả điều muốn thêm)
  [Hủy]      — Dừng, không ingest

─────────────────────────────────────────────────────
```

---

## PHASE 3 — NGƯỜI DÙNG CHỈNH SỬA

**Nếu người dùng chọn [Chỉnh]:**
- Nhận nội dung đã chỉnh sửa từ người dùng
- Cập nhật draft theo yêu cầu
- Hiển thị lại draft đã cập nhật → lặp lại hỏi [OK/Chỉnh/Thêm/Hủy]

**Nếu người dùng chọn [Thêm]:**
- Hỏi cụ thể nội dung muốn bổ sung
- Tích hợp vào draft
- Hiển thị lại → lặp lại

**Nếu người dùng chọn [OK]:**
- Chuyển sang Phase 4

**Nếu người dùng chọn [Hủy]:**
- Kết thúc, không ghi file

---

## PHASE 4 — HỎI THƯ MỤC ĐÍCH → INGEST VÀO RAW/

### Bước 4.1 — Hỏi thư mục đích

**BẮT BUỘC hỏi người dùng** trước khi ghi file — không tự ý chọn thư mục:

```
─── 📁 LƯU VÀO ĐÂU? ────────────────────────────────

Tài liệu sẽ được lưu vào thư mục nào trong raw/ (nêu cụ thể đường dẫn thư mục raw full path)?

  Các thư mục hiện có:
  [Liệt kê các thư mục trong raw/ nếu có thể đọc được]

  Hoặc nhập tên thư mục mới để tạo.
  Để trống → lưu thẳng vào raw/ (không subfolder)

  Ví dụ:
    raw/              → raw/ten-file.md
    raw/bug-fixes/    → raw/bug-fixes/ten-file.md
    raw/he-thong/     → raw/he-thong/ten-file.md

─────────────────────────────────────────────────────
```

### Bước 4.2 — Xác định tên file

Tên file được tạo tự động từ `bug_title`:
- Sinh mã `<xxxx>` = 4–5 ký tự random, đặt **ở đầu** tên file
- Lowercase, thay khoảng trắng bằng `-`
- Bỏ dấu tiếng Việt (nếu có)
- Suffix ngày: `-<YYYY-MM-DD>`

Ví dụ: `bug_title = "Schedule VNWs không tự chạy"` → `m5rp-schedule-vnws-khong-tu-chay-2026-04-28.md`

Hiển thị để người dùng xác nhận:

```
Tên file: raw/<thư-mục-đích>/<tên-file>.md

Xác nhận? [Enter = OK / Nhập tên khác]
```

### Bước 4.3 — Ghi file

Ghi draft đã xác nhận vào đường dẫn:
```
C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/raw/<thư-mục-đích>/<tên-file>.md
```

### Bước 4.4 — Thông báo kết quả

```
─── ✅ ĐÃ LƯU THÀNH CÔNG ────────────────────────────

File: raw/<đường-dẫn-đầy-đủ>

─────────────────────────────────────────────────────
Bước tiếp theo:

  [I] Ingest ngay  — Chạy /01-wiki-ingest để nạp vào wiki
  [Enter]          — Để sau, tôi tự ingest khi cần

─────────────────────────────────────────────────────
```

**Nếu chọn [I]** → Tự động kích hoạt skill `01-wiki-ingest` với file vừa tạo.
**Nếu Enter** → Kết thúc.

---

## VÍ DỤ THỰC TẾ

### Trigger mẫu:

```
/10-code-ingest-raw
/10-code-ingest-raw Bug schedule VNWs không chạy — đã fix bằng cách thêm config vào appsettings
ingest vấn đề vừa fix
ghi lại bug vừa xử lý xong
```

### Flow thực tế:

```
1. Người dùng: "/10-code-ingest-raw Bug schedule không chạy, fix thêm config"
2. Phase 0: Parse → có bug_title, có hint fix, thiếu root_cause chi tiết
3. Phase 1: Hỏi root_cause + module + verified
4. Người dùng trả lời
5. Phase 2: Build draft → hiển thị → hỏi [OK/Chỉnh/Thêm/Hủy]
6. Người dùng chỉnh 1 đoạn → Claude update → hỏi lại
7. Người dùng OK
8. Phase 4: Hỏi thư mục (raw/ hay raw/bug-fixes/?)
9. Người dùng: "raw/bug-fixes/"
10. Xác nhận tên file → Ghi file → Hỏi ingest ngay không
```

---

## QUY TẮC QUAN TRỌNG

| Rule | Nội dung |
|------|----------|
| **Hỏi thư mục trước khi ghi** | Không bao giờ tự chọn thư mục — LUÔN hỏi người dùng |
| **Hỏi gộp 1 lượt** | Không hỏi từng trường thiếu — gộp tất cả vào 1 câu hỏi |
| **Draft trước, ingest sau** | Phải show draft và chờ [OK] trước khi ghi file |
| **Raw immutable** | File đã ingest vào wiki không sửa raw — raw chỉ là staging |
| **Tên file tự động** | Tạo tên file từ bug_title + ngày — hỏi xác nhận nếu không chắc |
| **Kết nối 01-wiki-ingest** | Sau khi ghi raw xong → gợi ý chạy /01-wiki-ingest ngay |
