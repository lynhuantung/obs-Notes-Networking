---
type: source
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "sherlock-holmes"
  - "deductive-reasoning"
  - "hypothesis"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/01-Sherlock-Holmes.md
related:
  - "[[wiki/concepts/PKM-Methods]]"
  - "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
---

# Phương pháp Sherlock Holmes — Quan sát · Loại trừ · Lập giả thuyết

> **Nhóm**: Phương pháp luận Debug  
> **Phù hợp**: Có logs rõ, triệu chứng cụ thể, có thể liệt kê giả thuyết

---

## Nguyên tắc cốt lõi

> "Khi bạn đã loại bỏ những điều không thể, bất cứ điều gì còn lại, dù khó tin đến đâu, cũng phải là sự thật." — Sherlock Holmes

Mỗi bug là một "tội ác chống lại logic". Lập trình viên = thám tử tại hiện trường.

**3 trụ cột:**
1. **Quan sát** — Thu thập bằng chứng khách quan (logs, stack trace, facts)
2. **Giả thuyết** — Liệt kê mọi nguyên nhân khả dĩ
3. **Loại trừ** — Kiểm tra từng giả thuyết, loại bỏ những gì không thể

---

## Bảng phân tích hiện trường

| Thành phần điều tra | Tương quan trong phần mềm | Hành động |
|--------------------|--------------------------|----------|
| Hiện trường vụ án | Trạng thái hệ thống + môi trường thực thi | Tái hiện lỗi trong điều kiện kiểm soát |
| Dấu vết vật lý | Logs, Stack traces, Core dumps | Truy vết luồng thực thi và dữ liệu |
| Danh sách nghi phạm | Modules, dependencies, thay đổi gần đây | Cô lập thành phần qua unit testing |
| Bằng chứng ngoại phạm | Code đúng ở test/staging | So sánh sự khác biệt môi trường |
| Công cụ giám định | Debugger, Profilers | Quan sát giá trị biến thực tế |

---

## Các bước áp dụng

### Bước 1 — Quan sát và ghi nhận triệu chứng
- Kiểm tra log, thông báo lỗi, dấu hiệu bất thường
- Lập danh sách **facts** (sự kiện thực tế đã xảy ra, không suy đoán)
- Ghi rõ: *"Server bị crash SAU KHI cập nhật X"* — không phải *"Server crash vì X"*

### Bước 2 — Lập giả thuyết
- Xác định các nguyên nhân khả dĩ
- Mỗi giả thuyết = 1 kịch bản có thể kiểm chứng
- Ví dụ: "Server crash?" → (a) lỗi bộ nhớ, (b) lỗi cấu hình, (c) xung đột thư viện

### Bước 3 — Kiểm tra và loại trừ
- Thử nghiệm từng giả thuyết có hệ thống
- Loại bỏ những gì không thể xảy ra dựa vào dữ liệu
- **KHÔNG** loại trừ dựa vào cảm tính — chỉ dựa vào bằng chứng

### Bước 4 — Kết luận
- Giả thuyết còn sót lại = nguyên nhân gốc
- Dù có vẻ bất khả thi — đó là sự thật
- Lập kế hoạch sửa + test case kiểm chứng

---

## Ví dụ trừu tượng

**Tình huống**: Dịch vụ web bất ngờ ngắt kết nối database.

| Bước | Hành động | Kết quả |
|------|----------|--------|
| Facts | Log: "timeout khi kết nối" | — |
| Giả thuyết | (a) DB quá tải, (b) timeout config ngắn, (c) lỗi mạng | — |
| Test (a) | Ping DB → thành công | ✅ Loại bỏ lỗi mạng |
| Test (b) | Tăng timeout → vẫn lỗi | ✅ Loại bỏ config |
| Test (c) | CPU DB bình thường | ✅ Loại bỏ quá tải |
| Kết luận | **Driver kết nối lỗi** — nhỏ nhoi nhưng là sự thật | 🎯 Root cause |

---

## Nguyên tắc cảm xúc

> Thám tử giỏi không yêu quý mã nguồn của mình đến mức không dám nghi ngờ nó.
> **Mọi dòng code đều là nghi phạm cho đến khi được chứng minh ngược lại.**

> "Dữ liệu! Dữ liệu! Dữ liệu! Tôi không thể làm gạch mà không có đất sét." — Holmes

---

## Ưu / Nhược điểm

| Ưu điểm | Nhược điểm |
|---------|-----------|
| Chi tiết, có hệ thống | Dễ sa vào loại trừ quá lâu |
| Hiệu quả với log/stack trace rõ | Phụ thuộc chất lượng dữ liệu/quan sát |
| Gợi nhớ từng giả thuyết | Cần kiên nhẫn thu thập facts đủ |

---

## Công cụ / Artifact
- Log analysis, debugger, breakpoint
- Danh sách giả thuyết (bảng hoặc mind-map)
- Test case cô lập từng thành phần

---

## Liên kết
- [[wiki/concepts/HRM-IIS-Troubleshooting]] — Lỗi IIS thường gặp
- [[wiki/concepts/HRM-SQL-Troubleshooting]] — Lỗi SQL thường gặp
- [[wiki/sources/INS-Chan-Doan-Su-Co]] — Chẩn đoán sự cố BH 3 trục trắc
- `02-Einstein-ThuNghiemTuDuy.md` — Khi Holmes không đủ: hệ thống phức tạp
