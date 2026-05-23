---
type: source
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "contact-tracing"
  - "causal-chain"
  - "distributed-tracing"
  - "cascading-failure"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/05-ContactTracing-ChuoiNhanQua.md
related:
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]]"
  - "[[wiki/bugs/Sys025-iis-oom-vnpay]]"
---

# Phương pháp Contact Tracing — Truy vết chuỗi nhân quả lan truyền

> **Nhóm**: Phương pháp luận Debug  
> **Phù hợp**: Lỗi phức tạp qua nhiều tầng, lỗi ngẫu nhiên / không thường xuyên, hệ thống có distributed tracing

---

## Nguyên tắc cốt lõi

Lấy cảm hứng từ **truy vết dịch tễ học** — lần theo chuỗi tiếp xúc để tìm nguồn phát tán.

> Xây dựng **chuỗi nhân quả** từ triệu chứng ngược về gốc rễ. Tìm **"bệnh nhân 0"** — điểm phát sinh lỗi đầu tiên trong toàn bộ chuỗi.

---

## Mô hình SIR áp dụng vào phần mềm

| Trạng thái dịch tễ | Tương quan phần mềm | Chiến lược ứng phó |
|-------------------|-------------------|------------------|
| **Susceptible** (Dễ bị tổn thương) | Module thiếu validation / chưa patch | Static analysis, security review |
| **Infected** (Đã nhiễm lỗi) | Node chạy mã lỗi / trả dữ liệu sai | Circuit Breaker để cô lập node |
| **Recovered** (Đã hồi phục) | Module đã vá, kiểm thử xong | Tái deploy + giám sát chặt |
| **Contact Tracing** | Phân tích call stack, distributed tracing | Xác định nguồn gốc và phạm vi |

### Chỉ số R₀ trong phần mềm

**R₀ = β / γ**
- **β** = Tốc độ lây lan (mức độ kết nối của module lỗi trong dependency graph)
- **γ** = Tốc độ phục hồi (khả năng tự phục hồi / tốc độ deploy bản vá)

> **Nếu R₀ > 1** → lỗi lan truyền khắp hệ thống → **cascading failure**

---

## Super-Spreaders trong kiến trúc phần mềm

Tương tự "siêu lây nhiễm" trong dịch tễ = thành phần mà nhiều module khác phụ thuộc vào:
- Dịch vụ trung tâm (API Gateway, Auth Service)
- Thư viện dùng chung (shared utility)
- Database lõi

**Chiến lược "tiêm vaccine" cho super-spreader:**
- Circuit Breaker để cô lập khi super-spreader lỗi
- Bulkhead pattern — ngăn cascade failure
- Health check chủ động
- Timeout + retry với backoff

> Nghiên cứu COVID-19: cách ly (quarantine) hiệu quả hơn chỉ kiểm tra đơn thuần.
> Trong phần mềm: **cô lập** component lỗi hiệu quả hơn cố sửa trong khi nó vẫn tương tác.

---

## Các bước áp dụng

### Bước 1 — Xác định đầu mối ("bệnh nhân 0")
- Bắt đầu từ triệu chứng lỗi cuối cùng: crash, exception, deadlock, HTTP 500
- Ghi lại: timestamp, thread/process liên quan, input đầu vào
- Đây là điểm kết thúc của chuỗi — cần truy ngược về điểm bắt đầu

### Bước 2 — Xác định "tiếp xúc" (causal chain)
- Lần ngược qua các bước/điểm ảnh hưởng
- Lập mạng causal: `X lỗi ← Y truyền data cho X ← Z khởi chạy Y`
- Câu hỏi: "Component này nhận dữ liệu từ đâu? Ai gọi nó?"

### Bước 3 — Xác nhận chuỗi
- Dùng logs / distributed tracing để kiểm chứng từng liên kết
- Tool: Zipkin, Jaeger, Grafana Tempo, Sentry, ELK Stack
- Mỗi liên kết phải được xác nhận bằng bằng chứng — không suy đoán

### Bước 4 — Lặp lại đến gốc
- Tiếp tục đến khi không thể phân tích thêm
- Hoặc chạm nguyên nhân "chung": phần cứng / sai cấu hình / thay đổi gần nhất / cron job

---

## Ví dụ trừu tượng

**Tình huống**: Ứng dụng web đôi khi trả về HTTP 500.

```
Causal chain (truy ngược từ triệu chứng → gốc):

HTTP 500 (triệu chứng cuối)
  ← API A timeout
    ← Service B không phản hồi
      ← DB C bận (đang backup)
        ← Cron job backup chạy lúc giờ peak
          ← Cron được đặt mặc định khi setup

"Bệnh nhân 0" = Cron job đặt sai giờ
```

| Bước | Hành động | Bằng chứng |
|------|----------|----------|
| Triệu chứng | HTTP 500 lúc 10h-11h | Error log |
| Trace | API A → Service B → DB C | Distributed trace |
| Điều tra DB C | `SHOW PROCESSLIST` → thấy backup đang chạy | DB query |
| Trace cron | Cron schedule → mặc định lúc 10h | crontab -l |
| Kết luận | **Cron backup trùng giờ peak** | 🎯 Root cause |

---

## Ưu / Nhược điểm

| Ưu điểm | Nhược điểm |
|---------|-----------|
| Khoanh vùng nhanh qua causal chain | Cần hệ thống log/tracing tốt |
| Tốt với lỗi ngẫu nhiên / domino | Dễ bỏ sót liên kết nếu thiếu dữ liệu |
| Nhìn toàn cảnh luồng dữ liệu | Phức tạp khi chuỗi quá dài |

---

## Công cụ / Artifact
- Distributed tracing: Zipkin, Jaeger, Grafana Tempo
- Log correlation: ELK Stack, Splunk
- APM: Sentry, Datadog, New Relic
- Causal graph (tự vẽ trên whiteboard)

---

## Liên kết
- [[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]] — RCA thực tế: API double-wrap sau .NET 8
- [[wiki/bugs/Sys025-iis-oom-vnpay]] — IIS OOM cascading failure VnPay
- `01-Sherlock-Holmes.md` — Kết hợp để loại trừ nghi phạm trong chuỗi
- `04-Toyota-5Whys-PDCA.md` — Sau khi tìm causal chain → 5 Whys để đào sâu hơn
