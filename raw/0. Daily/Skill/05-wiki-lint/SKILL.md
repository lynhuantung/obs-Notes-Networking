---
name: 05-wiki-lint
description: "Dùng khi người dùng muốn kiểm tra chi tiết từng trang wiki — orphan pages, dead links, thiếu cross-link, mâu thuẫn dữ liệu, thông tin cũ. Ví dụ: \"lint wiki\", \"kiểm tra wiki\", \"health check wiki\", \"/05-wiki-lint\""
---

# Skill: 05-wiki-lint

Kiểm tra sức khỏe của LLM Wiki: orphan pages, mâu thuẫn, thiếu cross-links, thông tin cũ.

## Khai mạc — Nêu kế hoạch trước khi làm

```
🔧 Wiki-Lint: Kiểm tra sức khỏe toàn bộ wiki

Tôi sẽ kiểm tra:
1. Orphan pages — trang không có trong index.md
2. Dead links — cross-link trỏ đến trang không tồn tại
3. Sources thiếu cross-link
4. Projects thiếu evidence (không có sources)
5. Mâu thuẫn dữ liệu giữa các trang
6. Thông tin stale (source mới nhưng project page chưa cập nhật)
7. Khái niệm xuất hiện nhiều nhưng chưa có trang concept

Tôi sẽ tự fix lỗi nhỏ rõ ràng, báo cáo lỗi lớn để bạn quyết định.
Bắt đầu không? [Y/n]
```

## Kết thúc — Câu hỏi Socrate

Sau khi báo cáo lint, **luôn** đưa ra đúng **3 câu hỏi** cụ thể với kết quả vừa tìm thấy.

## Kích hoạt

- `lint wiki`
- `kiểm tra wiki`
- `health check wiki`
- `/05-wiki-lint`

## Đường dẫn quan trọng

```
Wiki root : C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/wiki/
  index.md      ← Danh mục tất cả trang — source of truth
  log.md        ← Lịch sử hoạt động
  overview.md   ← Stats tổng quan
```

## Các bước thực hiện

### Bước 1 — Đọc wiki/index.md

Lấy danh sách đầy đủ tất cả trang đang đăng ký.

### Bước 2 — Đọc tất cả trang wiki

Đọc tuần tự tất cả file trong: `wiki/projects/`, `wiki/entities/`, `wiki/concepts/`, `wiki/sources/`, `wiki/synthesis/`, `wiki/overview.md`

### Bước 3 — Kiểm tra các vấn đề

#### 3a. Orphan Pages
Trang có trong `wiki/` nhưng **không có** trong `wiki/index.md`

#### 3b. Dead Links
Cross-link `[[wiki/...]]` trỏ đến trang **không tồn tại**

#### 3c. Sources không có cross-link
Trang `wiki/sources/` không link đến bất kỳ project/entity/concept nào

#### 3d. Projects không link đến Sources
Dấu hiệu: project page không có `[[wiki/sources/...]]` → thiếu evidence

#### 3e. Mâu thuẫn dữ liệu
- Timeline: ngày tháng mâu thuẫn
- Nhân sự: cùng người nhưng vai trò khác nhau ở 2 trang
- Số liệu: con số khác nhau

#### 3f. Thông tin cũ (Stale)
So sánh `updated` của project page vs `created` của sources liên quan

#### 3g. Khái niệm thiếu trang concept
Thuật ngữ được đề cập nhiều lần nhưng chưa có trang concept riêng

#### 3h. Stats overview.md không khớp
`sources-ingested` có khớp với số trang thực tế trong `wiki/sources/` không?

### Bước 4 — Tạo báo cáo

```markdown
# Wiki Health Check — YYYY-MM-DD

## 🔴 Nghiêm trọng (cần fix ngay)
### Orphan Pages
### Dead Links

## 🟡 Cần chú ý
### Sources không có cross-link
### Thông tin có thể stale

## 🟢 Đề xuất cải thiện
### Khái niệm nên có trang riêng
### Nguồn nên ingest thêm
```

### Bước 5 — Fix nếu vấn đề rõ ràng

- Lỗi nhỏ rõ ràng → tự fix, báo cáo những gì đã fix
- Mâu thuẫn dữ liệu → chỉ báo cáo, hỏi người dùng để xác nhận

### Bước 6 — Append wiki/log.md

```markdown
## [YYYY-MM-DD] lint | Health check

Tìm thấy: X vấn đề nghiêm trọng, Y cần chú ý, Z đề xuất
Fix tự động: <danh sách nếu có>
```

## Sự khác biệt với 04-wiki-analyze

| | 04-wiki-analyze | 05-wiki-lint |
|--|-----------------|-------------|
| Phạm vi | Thống kê tổng thể | Kiểm tra chi tiết từng trang |
| Tốc độ | Nhanh | Chậm hơn |
| Output | Số liệu, gaps | Danh sách lỗi cụ thể |
| Khi dùng | Sau đợt ingest lớn | Khi muốn kiểm tra kỹ |
