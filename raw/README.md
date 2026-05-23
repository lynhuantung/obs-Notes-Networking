# raw/

Thư mục chứa tài liệu nguồn (source documents).

## Quy tắc

- **LLM chỉ ĐỌC** — không bao giờ tạo hoặc sửa file trong thư mục này
- Đây là nguồn sự thật (source of truth) bất biến
- Bạn (người dùng) thêm file vào đây, LLM ingest vào wiki

## Cách thêm nguồn

1. Copy/paste tài liệu vào đây dưới dạng `.md`
2. Nói với LLM: `"ingest raw/ten-file.md"`
3. LLM sẽ xử lý và cập nhật wiki

## Đề xuất: nguồn cần ingest

Dựa trên vault hiện tại, các tài liệu sau nên được ingest:

### VnPay Project
- `1. Projects/Dự án 2026/VnPay-Project/BrainStorming/Links/GAP_VNP.xlsx.md`
- `1. Projects/Dự án 2026/VnPay-Project/BrainStorming/Links/QC TEST - HRM Project Upgrade Plan.md`

### TrungDong Project
- `3. ARCHIEVED/Dự án 2025/TrungDong-Project/Meeting_Notes/H-TrungDong-Eva-14042025.md`
- `3. ARCHIEVED/Dự án 2025/TrungDong-Project/Meeting_Notes/H-TrungDong-Eva-31122024.md`
- `3. ARCHIEVED/Dự án 2025/TrungDong-Project/BrainStorming/Brain Storming 1.md`

### HongNgoc Project
- `3. ARCHIEVED/Dự án 2025/HongNgoc-Project/Tài liệu xử lý đánh giá Hồng Ngọc.md`

### Archived Projects (Lessons Learned)
- Các file `0.H-*.md` trong các dự án 2024
