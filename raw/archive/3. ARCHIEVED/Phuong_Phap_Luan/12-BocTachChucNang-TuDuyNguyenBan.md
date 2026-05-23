---
type: source
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "boc-tach-chuc-nang"
  - "first-principles"
  - "input-output-guard"
  - "phan-bien"
created: 2026-05-03
updated: 2026-05-03
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/12-BocTachChucNang-TuDuyNguyenBan.md
related:
  - "[[wiki/concepts/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-Debug]]"
  - "[[wiki/concepts/PKM-Methods]]"
---

# Bóc tách chức năng — Tư duy nguyên bản trước khi debug

> **Nhóm**: Phương pháp luận Debug  
> **Phù hợp**: Chưa biết bug ở đâu, module xa lạ, mô tả bug mơ hồ, hoặc cần hiểu hệ thống từ gốc trước khi điều tra

---

## Nguyên tắc cốt lõi

> "Trước khi hỏi *lỗi gì*, hãy hỏi *chức năng này tồn tại để làm gì*."

Đây là **bước 0** — chạy trước tất cả phương pháp debug khác.  
6 phương pháp còn lại (Sherlock, Einstein, Da Vinci...) đều bắt đầu từ triệu chứng. Phương pháp này bắt đầu từ **bản chất chức năng** — xây dựng mô hình INPUT/LOGIC/OUTPUT/GUARD trong đầu trước, rồi mới chọn phương pháp debug phù hợp.

**Nguyên lý nền:**
- Nhiều bug không phải "code sai" — mà là **giả định sai** về chức năng
- Guard lỗi im lặng (silent skip) là nguyên nhân phổ biến nhất bị bỏ qua
- Không biết OUTPUT "đúng" trông như thế nào → không thể xác nhận bug đã fix

---

## Template áp dụng

```
🔬 BÓC TÁCH CHỨC NĂNG: [keyword / tên chức năng]
────────────────────────
❓ CÂU HỎI GỐC
   Chức năng này tồn tại để giải quyết bài toán gì?
   Nếu bỏ nó đi, hệ thống thiếu điều gì?

⚙️ INPUT — Cần gì để chạy?
   Dữ liệu:   [bảng / trường / giá trị bắt buộc]
   Điều kiện: [trạng thái hệ thống phải thỏa mãn]
   Trigger:   [ai/gì kích hoạt — manual / schedule / event / màn hình nào]

🔄 LOGIC — Biến đổi như thế nào?
   Thực thi:  [SP / service / công thức core]
   Quy tắc:   [rule bất biến trong logic này]

📤 OUTPUT — Sinh ra cái gì?
   Ghi vào:      [bảng / trường nào thay đổi]
   Ảnh hưởng đến:[chức năng nào phụ thuộc output này]

🚫 GUARD — Khi nào KHÔNG chạy?
   Skip khi:  [điều kiện bị bỏ qua / silent — không báo lỗi]
   Fail khi:  [điều kiện báo lỗi rõ ràng]

🤔 PHẢN BIỆN
   - Nếu input đúng mà output sai → logic sai ở đâu?
   - Nếu logic đúng mà vẫn sai → guard có đang skip nhầm không?
   - Ta có thực sự biết output "đúng" trông như thế nào không?
   - Giả định nào đang được coi là hiển nhiên nhưng chưa verify?
────────────────────────
```

---

## Các bước áp dụng

### Bước 1 — Xác định chức năng cần bóc tách
- Từ mô tả bug → trích keyword chính (tên chức năng / module / màn hình)
- Ưu tiên chức năng **trực tiếp liên quan đến triệu chứng**

### Bước 2 — Điền CÂU HỎI GỐC
- Hỏi: "Nếu bỏ chức năng này đi, hệ thống thiếu điều gì?"
- Nếu không trả lời được → chưa hiểu đủ → đọc wiki/code trước

### Bước 3 — Điền INPUT
- Dữ liệu bắt buộc phải có: bảng nào, trường nào, giá trị phải thỏa mãn gì
- Điều kiện hệ thống: trạng thái nào phải đúng mới chạy được
- Trigger: ai/gì kích hoạt — đặc biệt chú ý **schedule/event** dễ bị quên

### Bước 4 — Điền LOGIC
- SP hoặc service nào thực thi — tên cụ thể
- Rule bất biến: điều gì phải luôn đúng bất kể input

### Bước 5 — Điền OUTPUT
- Bảng/trường nào bị ghi — để biết nơi kiểm tra sau khi chạy
- **Ảnh hưởng đến**: chức năng nào đọc output này — đây là nơi bug "di chuyển" nếu fix nhầm chỗ

### Bước 6 — Điền GUARD ← Bước quan trọng nhất
- **Skip khi**: điều kiện nào khiến chức năng bị bỏ qua im lặng (không lỗi, không log)
- **Fail khi**: điều kiện nào báo lỗi rõ ràng (exception, log error)

### Bước 7 — Trả lời PHẢN BIỆN
- Câu 3 & 4 thường phát hiện root cause mà không cần đọc code

---

## Ví dụ thực tế — Phân tích bảo hiểm

```
🔬 BÓC TÁCH CHỨC NĂNG: phân tích bảo hiểm
────────────────────────
❓ CÂU HỎI GỐC
   Xác định trạng thái đóng BH (tăng/giảm/điều chỉnh/giữ nguyên)
   cho từng NV trong tháng → sinh dữ liệu kê khai D02-TS lên BHXH.
   Bỏ đi → không có cơ sở kê khai BH hàng tháng, vi phạm luật.

⚙️ INPUT — Cần gì để chạy?
   Dữ liệu:   NV, tháng phân tích, lương BHXH,
              Cat_InsuranceElement, chế độ BH gắn với NV
   Điều kiện: NV có hợp đồng còn hiệu lực trong tháng đó
   Trigger:   Manual — BH > Phân tích bảo hiểm > chọn tháng > bấm "Phân tích"

🔄 LOGIC — Biến đổi như thế nào?
   Thực thi:  SP usp_InsuranceAnalysis — duyệt từng NV,
              tính mức đóng theo công thức Cat_InsuranceElement
   Quy tắc:   Mức đóng = lương BHXH × tỷ lệ; không âm, không vượt trần;
              NV vào giữa tháng tính theo ngày thực tế tham gia

📤 OUTPUT — Sinh ra cái gì?
   Ghi vào:      Ins_ProfileInsuranceMonthly
                 (1 dòng/NV/tháng: trạng thái + mức đóng)
   Ảnh hưởng đến: C70 tổng hợp lương, D02-TS, kê khai iBHXH

🚫 GUARD — Khi nào KHÔNG chạy?
   Skip khi:  NV chưa có chế độ BH gắn → silent, không báo lỗi
              NV đã nghỉ trước kỳ → bỏ qua toàn bộ
   Fail khi:  Cat_InsuranceElement rỗng → exception "Expression expected"

🤔 PHẢN BIỆN
   - Input đúng mà không ra dữ liệu → guard đang silent skip?
   - "Không ra dữ liệu" = 0 dòng hay dòng có giá trị 0?
     Hai trường hợp này có root cause hoàn toàn khác nhau.
   - NV mới tháng 2 đã được gắn chế độ BH chưa? ← giả định hay đã verify từ DB?
   - Ai chịu trách nhiệm gắn chế độ BH khi tạo NV mới?
────────────────────────
```

**Phát hiện từ PHẢN BIỆN**: Câu hỏi cuối chỉ ra thiếu sót ở quy trình onboarding — không phải lỗi code.

---

## Khi nào dùng phương pháp này

```
Nhận bug → hỏi ngay:
  ├─ Chưa từng đụng module này?          → Bóc tách TRƯỚC
  ├─ Mô tả mơ hồ "không ra dữ liệu"?    → Bóc tách TRƯỚC
  ├─ Không biết bắt đầu debug từ đâu?   → Bóc tách TRƯỚC
  └─ Sau khi bóc tách xong:
       Có logs cụ thể    → Sherlock Holmes
       Lỗi nhiều tầng    → Contact Tracing
       Lỗi lặp lại       → Toyota 5 Whys
       Chỉ lỗi production → Einstein
```

---

## Ưu / Nhược điểm

| Ưu điểm | Nhược điểm |
|---------|-----------|
| Tìm ra giả định sai trước khi đọc code | Tốn thêm 5–10 phút ban đầu |
| GUARD thường chỉ thẳng root cause | Cần hiểu nghiệp vụ đủ để điền đúng |
| OUTPUT/Downstream ngăn fix sai chỗ | Không thay thế được việc đọc code |
| Phản biện buộc phải verify giả định | — |

---

## Liên kết
- [[wiki/concepts/PhuongPhapLuan-Debug]] — Tổng quan 6+5 phương pháp
- `01-Sherlock-Holmes.md` — Dùng sau khi bóc tách, khi đã có giả thuyết
- `05-ContactTracing-ChuoiNhanQua.md` — Dùng khi OUTPUT/Downstream có vấn đề
- `04-Toyota-5Whys-PDCA.md` — Dùng khi GUARD bị thiếu ở quy trình
- [[wiki/sources/INS-Chan-Doan-Su-Co]] — Ví dụ thực tế HRM
