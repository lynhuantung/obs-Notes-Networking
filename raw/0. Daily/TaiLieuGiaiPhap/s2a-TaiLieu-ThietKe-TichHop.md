---
tags: [tailieu-giaiphap, thiet-ke, tich-hop]
---

# s2a — Tài Liệu Thiết Kế Tích Hợp

← [[s1-YcDichVu-TrienKhai-TuyChon]]
**Tiếp theo:** [[s2b-BaoCao-MappingID-DataPlatform]]

---

## 2.2.1.1 Business/Process Blueprint (Sơ đồ số hoá quy trình)

Sau giai đoạn Khảo sát–Thiết kế, NCC cam kết lập **Bộ Sơ đồ số hoá quy trình** cho tất cả quy trình có tích hợp, gồm:

1. **Luồng nghiệp vụ end-to-end**: khởi tạo → kiểm tra → phê duyệt & ký số → cập nhật trạng thái → lưu trữ
2. **Swimlane/Role mapping**: đơn vị đề xuất, bộ phận kiểm tra, lãnh đạo phê duyệt, kế toán, nhân sự vận hành
3. **Mapping từng bước với phần mềm**: ERP, eOffice, CMMS, HRM, ESB
4. **Decision Points**: Yes/No gate, trạng thái (Pending/Approved/Rejected/Completed/Archived)
5. **Exception Flow**: hồ sơ không hợp lệ, từ chối, quá hạn SLA, lỗi hệ thống, huỷ yêu cầu

---

## 2.2.1.2 Integration Technical Design Package

NCC cam kết cung cấp bộ tài liệu kỹ thuật tích hợp đầy đủ:

### 1. Sơ đồ luồng & dòng dữ liệu
- **Integration Flow**: điểm tích hợp, chuỗi bước xử lý, hệ thống nguồn/đích, ESB
- **Data Flow Diagram (DFD)**: dữ liệu đi/về, điểm phát sinh, transform, enrich, persist
- Cơ chế đồng bộ: real-time / near real-time / batch
- Luồng phản hồi: ack/nack, trả trạng thái, trả lỗi

### 2. Danh mục API & Data Contract
- **API Catalog**: tên, mục đích, method, URL, payload (JSON/XML), auth (OAuth2/JWT/mTLS), mã lỗi
- **Data Contract**: schema, kiểu dữ liệu, độ dài, format ngày giờ, ràng buộc
- **Data Mapping**: trường nguồn → đích, transform rules, xử lý thiếu dữ liệu
- **Status Tracking**: Pending/Approved/Rejected/Completed/Sent/Received/Failed/Retrying

### 3. Quy tắc xử lý lỗi & Retry
- Phân loại lỗi: nghiệp vụ (validate fail) vs kỹ thuật (timeout, network, auth fail)
- Retry: backoff (linear/exponential), max retries, idempotency key, DLQ
- Phân tách: bước user thao tác vs bước ESB tự động đồng bộ

---

← [[s1-YcDichVu-TrienKhai-TuyChon]] | **Tiếp:** [[s2b-BaoCao-MappingID-DataPlatform]]
