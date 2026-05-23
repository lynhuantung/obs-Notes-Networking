---
name: 04-wiki-analyze
description: "Dùng khi người dùng muốn kiểm tra tổng thể sức khỏe wiki — đếm trang, orphan, nội dung cũ, khoảng trống, cập nhật overview.md. Ví dụ: \"phân tích wiki\", \"wiki status\", \"kiểm tra sức khỏe wiki\", \"/04-wiki-analyze\""
---

# Skill: 04-wiki-analyze

Tương tự `npx gitnexus analyze` — quét toàn bộ wiki, đo sức khỏe, cập nhật index, phát hiện orphan/mâu thuẫn/khoảng trống, cập nhật `wiki/overview.md`.

Dùng khi muốn biết trạng thái tổng thể của wiki, hoặc sau một đợt nạp nguồn lớn.

## Kích hoạt

- `/04-wiki-analyze`
- "phân tích wiki"
- "kiểm tra sức khỏe wiki"
- "wiki status"
- "cập nhật overview"

---

## BƯỚC 0 — In kế hoạch ra chat TRƯỚC KHI LÀM BẤT CỨ ĐIỀU GÌ

```
🔍 Wiki Analyze — [ngày hôm nay]

Tôi sẽ làm những việc sau — tương tự `npx gitnexus analyze`:

| npx gitnexus analyze          | /04-wiki-analyze                           |
|-------------------------------|--------------------------------------------|
| Quét toàn bộ source code      | Quét toàn bộ wiki pages                    |
| Đếm symbols/relationships     | Đếm trang theo loại (projects/sources/...) |
| Phát hiện orphan nodes        | Phát hiện trang không có inbound link      |
| Phát hiện stale index         | Phát hiện trang lỗi thời (> 30 ngày)       |
| Coverage report theo module   | Dự án nào có < 3 nguồn (rủi ro mất tri thức) |
| Cập nhật CLAUDE.md            | Cập nhật wiki/overview.md                  |
| Ghi vào .gitnexus/            | Ghi vào wiki/log.md                        |

Bắt đầu quét...
```

---

## BƯỚC 1 — Quét toàn bộ wiki

Đọc tuần tự theo thứ tự này:

1. `wiki/index.md` → danh sách tất cả trang
2. `wiki/log.md` → hoạt động gần nhất, ngày cập nhật
3. `wiki/overview.md` → số liệu cũ (để so sánh thay đổi)
4. Đọc nhanh **tất cả** trang trong `wiki/projects/`
5. Đọc nhanh **tất cả** trang trong `wiki/sources/`
6. Đọc nhanh **tất cả** trang trong `wiki/concepts/`
7. Đọc nhanh **tất cả** trang trong `wiki/entities/`
8. Đọc **tất cả** trang trong `wiki/synthesis/`

---

## BƯỚC 2 — Đo các chỉ số

### Chỉ số số lượng
- Tổng trang Projects / Sources / Concepts / Entities / Synthesis
- Số dự án đang hoạt động vs đã kết thúc

### Chỉ số chất lượng

**Orphan pages** — trang không được link từ trang nào khác

**Trang lỗi thời** — `updated` cũ hơn 30 ngày

**Dự án thiếu nguồn** — dự án nào có < 3 nguồn

**Khái niệm chưa có trang** — khái niệm được nhắc nhiều lần nhưng chưa có `wiki/concepts/`

**Mâu thuẫn tiềm năng** — cùng thông tin xuất hiện khác nhau ở nhiều trang

---

## BƯỚC 3 — Xuất báo cáo analyze

```
🔍 Wiki Analyze — DD/MM/YYYY
════════════════════════════════

📦 Tổng quan kho tri thức
  Projects  : X trang  (X đang hoạt động, X đã kết thúc)
  Sources   : X trang  (+X so với lần analyze trước)
  Concepts  : X trang
  Entities  : X trang
  Synthesis : X trang
  ─────────────────────
  Tổng      : X trang

📊 Chỉ số chất lượng
  ✅ Cross-links đầy đủ  : X trang
  ⚠️  Orphan pages        : X trang  → [danh sách]
  ⚠️  Trang lỗi thời      : X trang  → [danh sách]
  ❌ Dự án thiếu nguồn   : X dự án  → [danh sách]

🕳️  Khoảng trống phát hiện
  - [Khái niệm X] được nhắc Y lần nhưng chưa có trang riêng

🎯 Khuyến nghị ưu tiên
  🔴 [Hành động cao nhất cần làm ngay]
  🟡 [Hành động trung bình]
  🟢 [Hành động thấp]

════════════════════════════════
Hoàn thành. Đã cập nhật wiki/overview.md
```

---

## BƯỚC 4 — Cập nhật wiki/overview.md

Cập nhật bảng "Trạng thái Wiki", `updated`, `sources-ingested`, Gaps & To-Do.

---

## BƯỚC 5 — Ghi log

```markdown
## [YYYY-MM-DD] analyze | Wiki Analyze

Stats: X sources, X projects, X concepts, X synthesis
Orphans: X trang
Gaps mới phát hiện: [danh sách ngắn]
Cập nhật: wiki/overview.md
```

---

## Đường dẫn quan trọng

```
Wiki root: C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/wiki/
  index.md      ← ĐỌC ĐẦU TIÊN
  overview.md   ← CẬP NHẬT SAU KHI ANALYZE
  log.md        ← APPEND KẾT QUẢ
```
