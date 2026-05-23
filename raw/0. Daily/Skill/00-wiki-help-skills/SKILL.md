---
name: 00-wiki-help-skills
description: "Dùng khi không nhớ skill nào làm gì, muốn xem danh sách toàn bộ skill kèm mô tả rõ ràng. Ví dụ: \"skill nào để debug?\", \"có skill gì?\", \"help skills\", \"/00-wiki-help-skills\""
---

# Skill: 00-wiki-help-skills

Hiển thị toàn bộ danh sách skill hiện có, mô tả rõ **dùng khi nào** và **không dùng khi nào**.

---

## Khi được gọi, in ra bảng sau:

---

## 📋 Danh sách Skills — HRM Wiki & Code

### 🗂️ WIKI — Quản lý kiến thức

| Skill | Dùng khi nào | KHÔNG dùng khi |
|---|---|---|
| `/01-wiki-ingest` | Muốn **nạp tài liệu mới** vào wiki (1 file, nhiều file, hoặc cả thư mục raw/) | Chỉ muốn đọc/hỏi |
| `/02-wiki-query` | **Hỏi nhanh** 1 câu hỏi từ wiki — dự án, khách hàng, kỹ thuật, bài học | Nghiên cứu sâu nhiều nguồn |
| `/03-wiki-research` | **Nghiên cứu chuyên sâu** 1 chủ đề → xuất báo cáo lưu vào `synthesis/` | Hỏi nhanh 1-2 câu |
| `/04-wiki-analyze` | **Kiểm tra tổng thể** wiki — đếm trang, orphan, cập nhật `overview.md` | Kiểm tra chi tiết từng trang |
| `/05-wiki-lint` | **Soi chi tiết** từng trang — dead links, orphan, mâu thuẫn, stale data | Muốn tổng quan nhanh |
| `/06-wiki-tonghop` | **Bức tranh toàn cảnh** 1 chủ đề hoặc **tổng kết cuối ngày** — có chart + sơ đồ Mermaid | Hỏi 1 điểm cụ thể |

---

### 🐛 CODE & BUG

| Skill | Dùng khi nào | KHÔNG dùng khi |
|---|---|---|
| `/07-wiki-rootcause` | **Phân tích nguyên nhân gốc rễ** sự cố — viết báo cáo RCA gửi sếp | Bug chưa rõ triệu chứng |
| `/09-code-bug-fix` | **Debug + fix bug** end-to-end — tra wiki → xem code → kế hoạch fix | Chỉ hỏi lý thuyết |
| `/10-code-ingest-raw` | **Sau khi fix bug xong** — ghi lại bài học, nạp vào `raw/` wiki | Đang fix dở, chưa xong |

---

### ⚙️ NGHIỆP VỤ & TIỆN ÍCH

| Skill | Dùng khi nào | KHÔNG dùng khi |
|---|---|---|
| `/08-nghiepvu-query` | Hỏi **nghiệp vụ HRM chuyên sâu**: BHXH/BHYT, Lương/Thuế TNCN, Chấm công/OT | Hỏi về code/kỹ thuật |
| `/00-wiki-help-skills` | **Không nhớ skill nào dùng khi nào** → xem bảng này | — |

---

### 🔍 GITNEXUS — Phân tích codebase

| Skill | Dùng khi nào |
|---|---|
| `/gitnexus-exploring` | Hiểu code hoạt động ra sao, trace luồng thực thi |
| `/gitnexus-debugging` | Trace lỗi, tìm nguyên nhân bug trong code |
| `/gitnexus-impact-analysis` | Kiểm tra cái gì bị ảnh hưởng trước khi sửa code |
| `/gitnexus-refactoring` | Rename, extract, move code an toàn |
| `/gitnexus-pr-review` | Review pull request, đánh giá rủi ro merge |
| `/gitnexus-cli` | Index repo, reanalyze, generate wiki từ code |
| `/gitnexus-guide` | Hỏi về GitNexus — tools, schema, workflow |

---

### 💡 Quy tắc chọn skill nhanh

```
Tôi muốn...
├── ...hỏi 1 câu về wiki           → /02-wiki-query
├── ...nghiên cứu sâu 1 chủ đề     → /03-wiki-research
├── ...nạp tài liệu mới            → /01-wiki-ingest
├── ...fix bug                     → /09-code-bug-fix
├── ...ghi lại bug vừa fix         → /10-code-ingest-raw
├── ...phân tích sự cố / RCA       → /07-wiki-rootcause
├── ...hỏi nghiệp vụ HRM           → /08-nghiepvu-query
├── ...tổng kết hôm nay            → /06-wiki-tonghop
├── ...kiểm tra wiki healthy       → /05-wiki-lint
└── ...không nhớ dùng gì           → /00-wiki-help-skills (đang ở đây rồi 😄)
```
