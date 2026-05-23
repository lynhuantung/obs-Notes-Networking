---
name: 12-thau-query
description: "Dùng khi người dùng hỏi về thầu dự án, giải pháp kỹ thuật, yêu cầu đấu thầu, tích hợp ESB/DataPlatform, bảo mật, hạ tầng trong ngữ cảnh đấu thầu. Ví dụ: \"yêu cầu tích hợp ESB là gì?\", \"checklist phân quyền HRM\", \"giải pháp CDC\", \"/12-thau-query <câu hỏi>\""
---

# Skill: 12-thau-query

Trả lời câu hỏi về **thầu dự án** dựa trên tài liệu giải pháp tại:

```
C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/raw/0. Daily/TaiLieuGiaiPhap/
```

Pipeline tương tự `/02-wiki-query` nhưng **nguồn chính là thư mục TaiLieuGiaiPhap** — không qua Atlas wiki thông thường.

---

## Kích hoạt

- `/12-thau-query <câu hỏi>`
- Câu hỏi liên quan: đấu thầu, giải pháp kỹ thuật, yêu cầu dịch vụ, tích hợp, bảo mật, hạ tầng, SaaS, ESB, DataPlatform, IAM, CDC, API, checklist triển khai...

---

## Thư mục tài liệu

```
TaiLieuGiaiPhap/
  00-Index.md                          ← Đọc đầu tiên — mục lục toàn bộ
  CheckList-PhanQuyen-HRM.md
  s1-YcDichVu-TrienKhai-TuyChon.md    ← Yêu cầu dịch vụ & triển khai
  s2-*.md                              ← Thiết kế, báo cáo, mapping
  s3-*.md                              ← Chuẩn giao tiếp, ESB, CDC, bảo mật tích hợp
  s4-*.md                              ← Kiến trúc nền tảng, hạ tầng, bảo mật, HA/DR
  Thau_01/                             ← Hồ sơ thầu cụ thể (bổ sung dần)
```

---

## Pipeline xử lý

### Bước 1 — Tiền xử lý (InfraGraph)

```
mcp__InfraGraph__preprocess(query="<câu hỏi>")
```

In tóm tắt:

```
📊 PHÂN TÍCH CÂU HỎI
  Từ khóa cốt lõi : [kw-1, kw-2, ...]
  Loại yêu cầu   : [giải pháp | yêu cầu kỹ thuật | checklist | so sánh | ...]
  Sẽ tìm kiếm   : [file/chủ đề cần đọc]

📝 TÁI TẠO VĂN BẢN
  Văn bản thô: "<câu hỏi gốc>"
  Sau xử lý  : "<câu hỏi đã chuẩn hóa thuật ngữ>"
```

---

### Bước 2 — Đọc Index

Luôn đọc `00-Index.md` trước để định vị các file liên quan.

---

### Bước 3 — Chọn & đọc file liên quan

Ưu tiên theo từ khóa:

| Từ khóa | File ưu tiên |
|---------|-------------|
| Tích hợp, ESB, API, giao tiếp | `s3-*.md`, `s3a-s3n` |
| CDC, đồng bộ dữ liệu | `s3e*.md` |
| Bảo mật, IAM, phân quyền | `s3g`, `s4.3`, `s4.4`, `s4.7-s4.10` |
| Hạ tầng, kiến trúc | `s4.1`, `s4.2`, `s4.13`, `s4.14`, `s4.15` |
| Yêu cầu dịch vụ, triển khai | `s1-*.md` |
| Tài liệu thiết kế, báo cáo | `s2-*.md` |
| Phân quyền HRM | `CheckList-PhanQuyen-HRM.md` |
| Thầu cụ thể | `Thau_01/`, `Thau_XX/` |

Đọc tối đa **5–7 file** cho câu hỏi thông thường. Research sâu: không giới hạn.

---

### Bước 4 — Blueprint trước khi trả lời

```
🗺 TÓM TẮT TRƯỚC KHI TRẢ LỜI
  Loại yêu cầu  : [giải pháp / yêu cầu kỹ thuật / checklist / ...]
  Tình huống    : <mô tả ngắn>
  File đã đọc  : [file-1, file-2, ...]
  Điều đã biết : [fact-1, fact-2]
  Còn thiếu    : [thông tin chưa có]
```

---

### Bước 5 — Trả lời

- Phân biệt nguồn rõ ràng:
  - `✅ FACT` — có trong tài liệu, ghi rõ tên file
  - `🔍 INFER` — suy luận từ nhiều file
  - `❓ UNKNOWN` — không có trong tài liệu hiện tại
- Citation: `(→ s3-Chuan-GiaoTiep-DataPlatform-ESB.md)` hoặc tương tự
- Nếu câu hỏi liên quan nhiều file → trình bày theo **mục/section** rõ ràng

---

### Bước 6 — Câu hỏi Socrate & Tư duy nguyên bản

Sau khi trả lời, đặt **3 câu hỏi**:

| # | Framework | Mục đích |
|---|-----------|---------|
| 1 | **Socrate** | Thách thức 1 tiền đề ngầm trong câu trả lời |
| 2 | **Ngữ cảnh khác** | Đặt giải pháp vào bối cảnh thầu/khách hàng khác để kiểm tra nguyên lý |
| 3 | **Gợi mở** | Chỉ ra 1 file/chủ đề trong TaiLieuGiaiPhap mà câu trả lời gợi mở nên đọc thêm |

---

## Quy tắc chất lượng

| Yếu tố | Yêu cầu |
|--------|---------|
| Nguồn | Mọi fact quan trọng phải ghi tên file nguồn |
| Không bịa | Chỉ nói những gì có trong tài liệu. Ghi rõ "chưa có tài liệu" nếu thiếu |
| Tài liệu mới | Khi có file mới trong `TaiLieuGiaiPhap/` → tự động đọc khi liên quan |
| Structural Gap | Nếu câu hỏi phân mảnh, không đủ tài liệu → hỏi lại trước khi trả lời |

---

## Ghi chú về tài liệu

- Thư mục `TaiLieuGiaiPhap/` sẽ được **bổ sung dần** theo từng hồ sơ thầu mới
- Mỗi thầu mới sẽ có thư mục riêng: `Thau_02/`, `Thau_03/`...
- Khi có thư mục mới → đọc `00-Index.md` của thầu đó trước
