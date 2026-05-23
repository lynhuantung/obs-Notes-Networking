---
name: 08-nghiepvu-query
description: "Dùng khi người dùng hỏi chuyên sâu về nghiệp vụ HRM: Bảo hiểm (BHXH/BHYT/BHTN), Lương (Payroll/Thuế TNCN), Chấm công (Attendance/OT/Nghỉ phép). Ví dụ: \"quy trình đóng BHXH\", \"cách tính thuế TNCN\", \"chính sách OT của Circle K\", \"/08-nghiepvu-query <câu hỏi>\""
---

# Skill: 08-nghiepvu-query — Hỏi chuyên sâu nghiệp vụ HRM

Trả lời câu hỏi chuyên sâu về nghiệp vụ **Bảo hiểm**, **Lương**, **Chấm công** — kết hợp kiến thức pháp lý chuẩn (luật VN) với dữ liệu thực tế từ wiki vault.

---

## Kích hoạt

- `ins`, `insurance`, `bảo hiểm`, `BHXH`, `BHYT`, `BHTN`
- `payroll`, `lương`, `tính lương`, `thuế TNCN`, `phụ cấp`, `khấu trừ`
- `attendance`, `chấm công`, `OT`, `overtime`, `nghỉ phép`, `ca làm việc`
- `/08-nghiepvu-query <câu hỏi>`
- Bất kỳ câu hỏi nào liên quan đến 3 domain trên trong bối cảnh dự án HRM

---

## Khai mạc — Nêu kế hoạch trước khi làm

### Bước 0 — Tiền xử lý câu hỏi (InfraGraph — BẮT BUỘC)

Trước khi đọc bất kỳ file nào, gọi InfraGraph để normalize thuật ngữ nghiệp vụ:

```
mcp__InfraGraph__preprocess(query="<câu hỏi đầy đủ từ người dùng>")
```

Dùng kết quả:
- `glossary_matches` → nhận diện term BH/Lương/Chấm công đã có định nghĩa trong hệ thống
- `core_keywords` → từ khóa chính để tra `wiki_search_links`
- `optimized_queries` → query tối ưu cho bước đọc wiki
- `detected_intents` → xác định đây là `query` (tra cứu), `config` (cấu hình dự án), hay `feature`

---

Ngay sau khi nhận câu hỏi, **trước khi đọc file nào**, Claude nêu kế hoạch:

```
⚙️ Nghiệp vụ-Query: "<câu hỏi>"

Domain: [Bảo hiểm / Lương / Chấm công]
Góc nhìn:
  - Quy định pháp lý hiện hành (Luật VN, Nghị định, Thông tư)
  - Thực tế triển khai tại dự án (từ wiki vault)

Tôi sẽ đọc:
  - wiki/index.md → xác định trang liên quan
  - wiki/concepts/<domain>.md → quy định chuẩn
  - wiki/projects/<khach-hang>.md → cấu hình thực tế (nếu có)
→ Trả lời phân 2 tầng: Chuẩn pháp lý | Thực tế dự án
```

---

## Domain Reference

### 🏥 Bảo hiểm (Insurance)

| Loại | Mức đóng NLĐ | Mức đóng NSDLĐ | Căn cứ |
|------|-------------|----------------|--------|
| BHXH | 8% | 17% | Luật BHXH 2014, sửa đổi 2024 |
| BHYT | 1.5% | 3% | Luật BHYT 2008 sửa đổi |
| BHTN | 1% | 1% | Luật VL 2013 |
| KPCĐ | 0% | 2% | Luật CĐ 2012 |

**Mức lương tối thiểu vùng 2025** (Nghị định 74/2024/NĐ-CP):
- Vùng I: 4.960.000 đ/tháng
- Vùng II: 4.410.000 đ/tháng
- Vùng III: 3.860.000 đ/tháng
- Vùng IV: 3.450.000 đ/tháng

**Checklist câu hỏi chẩn đoán BH:**
- [ ] Loại hợp đồng (HD thử việc / HĐLĐ / cộng tác viên)?
- [ ] Mức lương đóng BH (lương cơ bản hay toàn bộ)?
- [ ] Khu vực địa lý (vùng lương)?
- [ ] Công ty có tham gia BH bổ sung không?
- [ ] Trường hợp đặc biệt: thai sản, ốm đau, tai nạn?

---

### 💰 Lương & Thuế TNCN (Payroll)

**Công thức tính lương net cơ bản:**
```
Thu nhập chịu thuế = Tổng thu nhập
                   - Các khoản miễn thuế (phụ cấp đặc thù)
                   - BHXH/BHYT/BHTN NLĐ đóng
                   - Giảm trừ bản thân (11tr/tháng)
                   - Giảm trừ người phụ thuộc (4.4tr/người)

Thuế TNCN = Áp bảng lũy tiến 7 bậc (5% → 35%)
```

**Bảng lũy tiến thuế TNCN 2024:**
| Bậc | Thu nhập tính thuế/tháng | Thuế suất |
|-----|--------------------------|-----------|
| 1 | ≤ 5 triệu | 5% |
| 2 | 5 – 10 triệu | 10% |
| 3 | 10 – 18 triệu | 15% |
| 4 | 18 – 32 triệu | 20% |
| 5 | 32 – 52 triệu | 25% |
| 6 | 52 – 80 triệu | 30% |
| 7 | > 80 triệu | 35% |

**Checklist câu hỏi chẩn đoán Lương:**
- [ ] Cơ cấu lương gồm những khoản nào (lương cơ bản, phụ cấp, thưởng)?
- [ ] Kỳ tính lương (ngày 1–31 hay ngày 26 tháng trước – 25 tháng này)?
- [ ] Phương pháp tính ngày công (365, 26, thực tế)?
- [ ] Có người phụ thuộc không? Đã đăng ký MST chưa?
- [ ] Hình thức nộp thuế: khấu trừ tại nguồn hay tự quyết toán?

---

### 🕐 Chấm công & OT (Attendance)

**Quy định chuẩn (Bộ Luật Lao Động 2019):**
- Giờ làm tiêu chuẩn: 8h/ngày, 48h/tuần (hoặc 44h nếu thỏa thuận)
- Giờ OT tối đa: 40h/tháng, 200h/năm (300h với ngành đặc thù)
- Lương OT: 150% (ngày thường), 200% (CN/lễ trong tuần), 300% (CN/lễ nghỉ lễ)
- Nghỉ phép năm: 12 ngày (≥ 1 năm), +1 ngày mỗi 5 năm thâm niên
- Nghỉ thai sản: 6 tháng (nữ), 5–14 ngày (nam)

**Checklist câu hỏi chẩn đoán Chấm công:**
- [ ] Loại ca làm việc (hành chính / ca xoay / linh hoạt)?
- [ ] Phương pháp xác định OT (so với ca chuẩn hay giờ làm việc thực)?
- [ ] Quy tắc làm tròn giờ (15 phút, 30 phút)?
- [ ] Phân loại nghỉ (phép năm, không lương, nghỉ BH, nghỉ lễ)?
- [ ] Bù giờ thay OT có được không?

---

## Các bước thực hiện

### Bước 1 — Xác định domain & phân tích câu hỏi

Phân loại câu hỏi vào 1 hoặc nhiều domain: **BH / Lương / Chấm công**. Xác định:
- Đây là câu hỏi về **quy định** (luật) hay **cấu hình dự án** (thực tế)?
- Có khách hàng/dự án cụ thể không?

### Bước 2 — Đọc wiki

```
Wiki root: C:/Code/HRM-AGENT-AI/HRM-WIKI/obs-Notes-Networking/HRM-Knowledge-Base/wiki/
```

**Dùng Atlas trước:**
```
wiki_search_links(keyword)    → định vị node theo từ khóa domain
wiki_local_graph(node_id)     → lấy neighbors liên quan
```
Chấm điểm → đọc node ≥4 điểm. Fallback `wiki/index.md` nếu Atlas không có kết quả.

Thứ tự đọc:
1. `wiki/index.md` → trang nào liên quan domain này? (fallback)
2. `wiki/concepts/<domain>.md` → quy định chuẩn đã ingest
3. `wiki/projects/<khach-hang>.md` → cấu hình thực tế (nếu câu hỏi liên quan dự án cụ thể)
4. `wiki/sources/<...>.md` → chi tiết từ meeting note / spec (nếu cần)

### Bước 3 — Trả lời phân 2 tầng

```
## 📋 Quy định pháp lý
[Luật / Nghị định / Thông tư hiện hành]
Nguồn: [tên văn bản pháp lý]

## 🏗️ Thực tế tại dự án [Tên khách hàng]
[Cấu hình thực tế theo wiki]
Nguồn: ([[wiki/projects/...]] hoặc [[wiki/sources/...]])

## ⚠️ Lưu ý / Điểm cần confirm
[Các điểm mơ hồ, cần xác nhận với khách hàng]
```

Nếu **không có dữ liệu wiki** → chỉ trả lời tầng pháp lý và ghi rõ:
> *"Chưa có dữ liệu dự án trong wiki. Để bổ sung: ingest meeting note / spec liên quan."*

### Bước 4 — Checklist câu hỏi chẩn đoán

Sau khi trả lời, nếu câu hỏi còn thiếu context → đưa ra **checklist chẩn đoán** tương ứng domain (xem Domain Reference ở trên).

### Bước 5 — 3 câu hỏi Socrate

Kết thúc bằng đúng **3 câu hỏi** từ 3 góc tư duy:

| Vị trí | Framework | Mục đích |
|--------|-----------|----------|
| Câu 1 | **Socrate** | Thách thức 1 giả định ngầm trong câu trả lời |
| Câu 2 | **FPT** | Đặt vào bối cảnh khác (khách hàng khác / ngành khác) |
| Câu 3 | **SAT** | Liên kết với dự án / pattern cụ thể trong vault |

### Bước 6 — Append wiki/log.md

```markdown
## [YYYY-MM-DD] nghiepvu-query | <domain>: <câu hỏi ngắn>

Domain: [BH / Lương / Chấm công]
Đọc: `wiki/concepts/<...>`, `wiki/projects/<...>`
Ghi chú: <phát hiện quan trọng nếu có>
```

---

## Quy tắc chất lượng

| Yếu tố | Yêu cầu |
|--------|---------|
| Tầng pháp lý | Luôn trích dẫn tên văn bản pháp lý cụ thể |
| Tầng dự án | Chỉ nói những gì có trong wiki, không suy đoán |
| Mâu thuẫn | Nếu wiki khác với luật → nêu rõ và hỏi lại |
| Khoảng trống | Ghi rõ "chưa có dữ liệu" thay vì bỏ qua |
| Hành động | Đề xuất ingest thêm nguồn nào nếu thiếu dữ liệu |
