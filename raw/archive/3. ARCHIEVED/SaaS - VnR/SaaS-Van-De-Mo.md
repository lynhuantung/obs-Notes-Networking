---
type: note
title: SaaS VnR — Vấn Đề Mở & Câu Hỏi Cần Trả Lời
tags: [saas, open-questions, risks, decisions-needed]
created: 2026-05-02
related: ["[[00-INDEX]]", "[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# SaaS VnR — Vấn Đề Mở & Câu Hỏi Cần Trả Lời

Danh sách các **câu hỏi chưa có câu trả lời** và **quyết định còn pending** khi dự án archived tháng 10/2023.

---

## Câu hỏi kỹ thuật chưa giải quyết

### 1. Biến static — cần audit toàn bộ
**Câu hỏi:** Có bao nhiêu `static` class/field trong codebase HRM cần phải refactor?

**Tại sao quan trọng:** Mỗi biến static không scope theo tenant là 1 điểm data leak tiềm năng. Ví dụ:
- Permission cache dùng chung
- Config object dùng chung
- Connection pool không phân biệt tenant

**Cần làm:**
- [ ] Liệt kê tất cả `static` field/property trong codebase
- [ ] Phân loại: an toàn dùng chung / cần per-tenant
- [ ] Lên kế hoạch refactor từng cái

---

### 2. Window Service — chọn kiến trúc nào?
**Câu hỏi:** Sub-process per tenant hay API-driven?

**Option A — Sub-process:**
- Pros: isolation tốt
- Cons: nhiều process chạy cùng lúc → tốn RAM; khó manage

**Option B — API-driven:**
- Pros: stateless, dễ scale
- Cons: phải convert toàn bộ Window Service jobs sang API calls

**Quyết định cần từ:** a.Hiền

---

### 3. MinIO SSL — tại sao chưa cài được?
**Câu hỏi:** Root cause là gì? Giải pháp tạm thời trong khi chờ?

**Hiện trạng:** Production không thể dùng MinIO không có SSL.

---

### 4. Database scale khi tenant lớn
**Câu hỏi:** Nếu 1 tenant có 10.000 NV, DB của họ sẽ scale thế nào?

**AWS approach:** RDS tự tạo DB đọc + DB ghi → tính phí riêng; auto-scale dung lượng.
**On-prem approach:** Chưa có giải pháp rõ ràng.

---

## Câu hỏi business chưa chốt

### 5. Mô hình Licence SaaS là gì?
**Câu hỏi:** Tính tiền khách hàng theo cách nào?

| Mô hình | Mô tả | Ưu / Nhược |
|---------|-------|-----------|
| Per tenant | Trả theo số công ty sử dụng | Đơn giản; không khuyến khích dùng nhiều |
| Per user | Trả theo số nhân viên (NV) | Phổ biến nhất với HRM SaaS; scale tự nhiên |
| Subscription monthly | Gói cố định theo tháng | Predictable revenue; khó với SME |
| Freemium | Free đến N NV, trả phí sau | Tăng trưởng nhanh nhưng conversion thấp |

**Ai cần quyết định:** Ban lãnh đạo + Sales + IT (Tung.Ly + Sáng + Hoàng)

---

### 6. SLA cho SaaS là bao nhiêu?
**Câu hỏi:** Cam kết uptime? Response time? Support time?

**Hiện chưa có:** SLA document cho HRM SaaS.

---

### 7. Khách hàng target đầu tiên là ai?
**Câu hỏi:** SME? Enterprise? Qua MISA marketplace hay direct?

**Biết từ archive:** MISA là channel marketplace chính. Nhưng chưa biết ICP (Ideal Customer Profile).

---

### 8. Giá bán tham khảo so với on-premise
**Câu hỏi:** SaaS pricing sẽ rẻ hơn hay đắt hơn on-premise theo thời gian?

---

## Câu hỏi vận hành chưa có quy trình

### 9. Quy trình onboarding tenant mới
**Câu hỏi:** Sau khi KH đăng ký xong → ai làm gì? Tự động bao nhiêu %?

**Hiện tại biết:**
- DB tạo tự động ✅
- Email kích hoạt ✅
- Đổi mật khẩu lần đầu ✅

**Chưa có:**
- Hướng dẫn setup ban đầu (onboarding wizard)
- Migration data từ system cũ của KH

---

### 10. Quy trình khi tenant muốn xóa tài khoản
**Câu hỏi:** Data retention? Xóa ngay hay sau N ngày? Backup trước khi xóa?

---

### 11. Monitoring & Alert cho production
**Câu hỏi:** Ai nhận alert? Quy trình escalate khi có sự cố?

---

## Câu hỏi về đội ngũ

### 12. Sau archive — ai tiếp tục dự án này?
**Câu hỏi:** Dự án SaaS VnR có được resume không? Nếu có, ai lead? Timeline?

**Bối cảnh hiện tại (2025-2026):** VnResource đang hướng tới mục tiêu doanh thu 1.000 tỷ năm 2030, tham gia MISA marketplace, thành lập P.QTNNL (06/2025). SaaS vẫn là chiến lược quan trọng.

---

## Priority nếu resume dự án

| # | Việc cần làm trước | Lý do |
|---|------------------|-------|
| 1 | Audit biến static | Rủi ro data leak cao nhất |
| 2 | Chốt licence model | Cần trước khi demo KH thật |
| 3 | MinIO SSL | Bắt buộc cho production |
| 4 | Window Service architecture | Core cho background jobs |
| 5 | K8s production plan (CMC) | Cần cho go-live |
| 6 | SLA document | Cần cho sales |
