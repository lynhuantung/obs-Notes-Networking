---
Mã cuộc họp: H-CIRCLEK-HaTang-07052026
aliases:
title: Biên bản họp hạ tầng K8S & S3 — Circle K
tags:
  - "#meeting"
  - "#ha-tang"
  - "#k8s"
  - "#s3"
date: 2026-05-07
members:
  - tungly
  - minhnguyendat
Related: "[[0.Meeting]]"
Link:
Project: CircleK
---

## Họp hạ tầng K8S & S3 — Dự án Circle K
## Biên bản họp: 07/05/2026

- Mã cuộc họp: H-CIRCLEK-HaTang-07052026
- **Người tham gia**: TungLy, MinhNguyenDat, khách hàng
- Cuộc họp liên quan: [[0.H-CIRCLEK]]

---

# Tóm tắt

**5 ý chính:**

1. **Thông tin kỹ thuật**: VNR đã hoàn thành gửi link thông tin Network, Sizing và Middleware cho Circle K.
2. **Hạ tầng S3**: VNR cần mô tả rõ mục đích sử dụng S3 và phân công trách nhiệm triển khai — nhờ anh Minh xác nhận lại nội dung.
3. **Kế hoạch UAT**: VNR phối hợp Circle K dựng link UAT (K8S + S3) ngay trong tuần này; đề xuất dùng S3 miễn phí trước.
4. **Lựa chọn storage**: Circle K cần phản hồi nội bộ về việc dùng S3 hay ViNiU, kèm mốc thời gian sẵn sàng.
5. **K8S Circle K**: Circle K phản hồi tình trạng sẵn sàng K8S; nếu chưa có, cung cấp mốc thời gian cụ thể.

---

## Mục tiêu

- Thống nhất lựa chọn hạ tầng S3 (S3 miễn phí vs ViNiU) và thời gian sẵn sàng
- Dựng môi trường UAT trên K8S trong tuần 07/05/2026
- Làm rõ vai trò và trách nhiệm triển khai S3 giữa VNR và Circle K

---

## 📝 Các ý chính

### 1. Phía VNR

**Thông tin kỹ thuật**
- Đã hoàn thành gửi link thông tin về **Network, Sizing và Middleware** cho Circle K.

**Hạ tầng S3**
- VNR cần mô tả rõ mục đích sử dụng S3 và phân công trách nhiệm triển khai.
- *(Nhờ anh Minh kiểm tra và xác nhận lại nội dung này)*

> **Mô tả vai trò S3 trong hệ thống:**
> Hệ thống sử dụng AWS S3 làm Middleware lưu trữ nhờ đặc tính Serverless và khả năng mở rộng cao. S3 đảm nhiệm hai vai trò:
> - **(1) IndependentConfig**: Lưu trữ cấu hình độc lập (XML, JSON) để hỗ trợ Cold Start và đồng bộ hóa trạng thái giữa các nodes.
> - **(2) User Storage**: Lưu trữ bền vững tài nguyên người dùng (hình ảnh, tập tin upload).

**Kế hoạch triển khai**
- Phối hợp cùng Circle K dựng link trên môi trường **UAT (K8S + S3) ngay trong tuần này** để đáp ứng tiến độ UAT.
- **Đề xuất**: Sử dụng bản S3 miễn phí để triển khai trước trên môi trường K8S.
- Nếu Circle K không dùng K8S → VNR kiểm tra và điều chỉnh lại phương án.

---

### 2. Phía Circle K (Khách hàng)

**Lựa chọn Storage**
- Trao đổi nội bộ và phản hồi lại VNR về việc lựa chọn sử dụng **S3 hay ViNiU**.
- Cung cấp thời gian dự kiến hệ thống sẵn sàng.

**Môi trường K8S**
- Phản hồi về tình trạng sẵn sàng của K8S.
- Trường hợp K8S chưa sẵn sàng → cung cấp mốc thời gian cụ thể có thể đáp ứng.

---

## Action tiếp theo

| # | Nội dung | Người thực hiện | Deadline |
|---|---------|----------------|---------|
| 1 | Dựng pipeline CI — build và push Docker image lên Registry | VNR | Tuần này |
| 2 | Cung cấp thông tin ConfigMap (cấu hình ứng dụng theo môi trường UAT) | VNR + Circle K | Tuần này |
| 3 | Cung cấp đầy đủ thông tin Sizing, Network, Middlewares | VNR | Đã xong ✅ |
| 4 | Anh Minh xác nhận lại nội dung mô tả vai trò S3 | MinhNguyenDat | Sớm nhất |
| 5 | Circle K phản hồi lựa chọn S3 hay ViNiU + mốc thời gian sẵn sàng | Circle K | Tuần này |
| 6 | Circle K phản hồi tình trạng K8S (sẵn sàng hay chưa, mốc thời gian) | Circle K | Tuần này |

---

### Liên kết

[[0.H-CIRCLEK]]
