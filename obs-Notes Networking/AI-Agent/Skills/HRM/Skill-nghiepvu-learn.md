---
name: nghiepvu-learn
description: Nạp hoặc cập nhật knowledge nghiệp vụ HRM vào mạng lưới 2.RESOURCE/Nghiep-vu-HRM. Dùng khi phát hiện nghiệp vụ mới, bug nghiệp vụ, hoặc cần cập nhật quy trình. AI sẽ hỏi và tự tạo/cập nhật file đúng chỗ.
---

# nghiepvu-learn — Nạp Knowledge Nghiệp Vụ HRM

## Mục tiêu
Hỏi đủ thông tin → tạo/cập nhật file đúng module → liên kết mạng lưới ATT/SAL/INS → KHÔNG làm tay.

---

## Khi nào dùng
- Khám phá nghiệp vụ mới (quy trình, quy định)
- Phát hiện bug nghiệp vụ
- Cập nhật quy trình đã thay đổi
- Thêm vấn đề thường gặp vào note có sẵn

---

## Modules HRM & Mã chuẩn

| Module | Prefix | Thư mục |
|---|---|---|
| Chấm công | `ATT` | `ATT/` |
| Lương | `SAL` | `SAL/` |
| Bảo hiểm | `INS` | `INS/` |
| Nhân sự | `HRE` | `HRE/` |
| Hệ thống | `SYS` | `SYS/` |

**Mã note**: `{PREFIX}{số thứ tự 2 chữ số}` — VD: `ATT01`, `SAL03`
**Mã issue**: `{PREFIX}-BUG{số}` hoặc `{PREFIX}-ISS{số}` — VD: `ATT-BUG01`

---

## Quy trình xử lý

### Bước 1 — Xác định loại nạp

**Câu hỏi 1**: "Đây là loại gì?"
- **Note nghiệp vụ mới** — quy trình, định nghĩa, chính sách mới
- **Bug / Issue** — lỗi nghiệp vụ vừa phát hiện hoặc đã fix
- **Cập nhật note cũ** — bổ sung thông tin vào note đã có
- **Vấn đề thường gặp** — thêm vào section "Vấn đề thường gặp"

**Câu hỏi 2**: "Thuộc module nào?" (ATT / SAL / INS / HRE / SYS)

### Bước 2 — Thu thập thông tin

**Nếu Note nghiệp vụ mới**:
- Tên nghiệp vụ là gì?
- Định nghĩa ngắn gọn?
- Quy trình (các bước)?
- Quy định / chính sách liên quan?
- Liên quan đến note nào khác? (để tạo backlink)
- Ảnh hưởng đến module nào?

**Nếu Bug / Issue**:
- Mô tả lỗi là gì?
- Nghiệp vụ liên quan? (để link `[[ATTxx]]`)
- Nguyên nhân?
- Đã fix chưa? Fix như thế nào?
- Bài học rút ra?

**Nếu Cập nhật / Thêm vấn đề**:
- Note cần cập nhật là gì?
- Thêm thông tin gì?

### Bước 3 — Định vị file

```
Note mới    → 2.RESOURCE/Nghiep-vu-HRM/{MODULE}/{PREFIX}{N} - {Tên}.md
Bug/Issue   → 2.RESOURCE/Nghiep-vu-HRM/{MODULE}/Issues/{PREFIX}-BUG{N}-{ten-ngan}.md
Cập nhật    → Edit file có sẵn
```

**Tìm số thứ tự tiếp theo**:
- Đọc các file hiện có trong thư mục module
- Lấy số lớn nhất + 1

### Bước 4 — Tạo/cập nhật file

Dùng template tương ứng bên dưới.

**Luôn đảm bảo**:
- Backlink 2 chiều: note mới link đến note liên quan VÀ cập nhật note liên quan link ngược lại
- Liên kết xuyên module: ATT → SAL nếu ảnh hưởng lương
- Tag đúng chuẩn: `#nghiepvu_{module}` + tag phụ

### Bước 5 — Gợi ý lan toả

Sau khi tạo xong, hỏi:
- "Bug này có nên nạp vào Knowledge Base kỹ thuật không?" (dùng `kb-learn`)
- "Có note nào cần cập nhật backlink không?"
- "Cần tạo Zettelkasten note kỹ thuật liên quan không?"

---

## Templates nội tuyến

### Template: Note nghiệp vụ

```markdown
---
Mã: {PREFIX}{N}
aliases:
  - {PREFIX}{N} - {Tên}
date: {YYYY-MM-DD}
tags:
  - "#nghiepvu_{module_lowercase}"
Liên quan:
---

# {PREFIX}{N} - {Tên}

## 1. Định nghĩa
- {Định nghĩa ngắn gọn 1-2 câu}

## 2. Quy trình
1. {Bước 1}
2. {Bước 2}
3. {Bước 3}

## 3. Quy định / Chính sách
- {Quy định 1}
- {Quy định 2}

## 4. Liên quan (Backlink)
- [[{note liên quan 1}]]
- [[{note liên quan 2}]]

## 5. Ảnh hưởng
- {Ảnh hưởng đến module/note nào}

## 6. Vấn đề thường gặp
- {Vấn đề 1}
- {Vấn đề 2}
```

---

### Template: Bug / Issue

```markdown
---
Mã: {PREFIX}-BUG{N}
aliases:
  - {PREFIX}-BUG{N}-{ten-ngan}
date: {YYYY-MM-DD}
tags:
  - "#nghiepvu_{module}"
  - "#bug"
  - "#issue"
Liên quan:
---

# {Tên lỗi ngắn gọn} – Lỗi

**Nghiệp vụ liên quan:** [[{note nghiệp vụ}]]
**Ngày phát hiện:** {YYYY-MM-DD}
**Mức độ:** High / Medium / Low
**Trạng thái:** Open / Fixed

## Mô tả
- {Mô tả lỗi}

## Nguyên nhân
- {Nguyên nhân gốc rễ}

## Cách xử lý
- {Fix đã áp dụng}
- Store/code liên quan: `{tên store/function}`

## Bài học
- {Insight để tránh lần sau}
```

---

## Output bắt buộc

```
## ✅ Nghiệp vụ đã nạp

**Loại**: Note mới / Bug / Cập nhật
**File**: `2.RESOURCE/Nghiep-vu-HRM/{MODULE}/{tên file}`
**Backlinks đã tạo**:
  - [[{note A}]] → thêm link đến note mới
  - [[{note B}]] → thêm link đến note mới
**Gợi ý tiếp theo**:
  - [ ] Nạp kỹ thuật: dùng `kb-learn` cho bug này
  - [ ] Cập nhật Zettelkasten: [[{note kỹ thuật liên quan}]]
```

---

## Ví dụ thực tế

**User**: "tôi vừa phát hiện bug: phép năm trùng ngày lễ bị trừ 2 lần, module ATT"

**AI làm**:
1. Loại → Bug ✓
2. Module → ATT ✓
3. Hỏi: nghiệp vụ liên quan? → ATT01, ATT04
4. Hỏi: nguyên nhân? fix?
5. Tạo: `ATT/Issues/ATT-BUG02-phep-nam-trung-le.md`
6. Cập nhật backlink trong `ATT01` và `ATT04`
7. Gợi ý: "Bug này liên quan store SQL → dùng `kb-learn` để nạp vào patterns/sql/"
