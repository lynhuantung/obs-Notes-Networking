---
type: source
code: ck7m3
description: "Biên bản họp hạ tầng K8S & S3 Circle K 07/05/2026: lựa chọn storage (S3 vs ViNiU), dựng UAT, phân vai trò VNR/CircleK."
domain: devops
tags:
  - circlek
  - k8s
  - s3
  - meeting
  - ha-tang
created: 2026-05-07
updated: 2026-05-07
source-file: "raw/archive/1. Projects/LTG/H-CIRCLEK-HaTang-07052026.md"
related:
  - "[[wiki/flows/k8d2p-flow-deploy-k8s-hrm]]"
  - "[[wiki/sources/k8d2p-flow-capnhat-k8s-hrm]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
---

# Source: Biên Bản Họp Hạ Tầng K8S & S3 — Circle K (07/05/2026)

## Tóm tắt

Biên bản cuộc họp ngày 07/05/2026 giữa VNR (TungLy, MinhNguyenDat, TienDang) và Circle K về hạ tầng triển khai HRM. VNR đã hoàn thành gửi thông tin kỹ thuật (Network, Sizing, Middleware) và đề xuất dùng S3 miễn phí để dựng UAT trên K8S ngay trong tuần. Điểm chưa thống nhất là Circle K chưa phản hồi về lựa chọn storage (S3 hay ViNiU) và chưa xác nhận tình trạng sẵn sàng K8S. VNR cần làm rõ vai trò S3 trong hệ thống (IndependentConfig + User Storage) — anh Minh xác nhận lại.

## Key Takeaways

- **Ranh giới rõ ràng**: VNR chuẩn bị image + ConfigMap + thông tin kỹ thuật; Circle K quyết định hạ tầng (K8S, storage) và dựng môi trường
- **S3 giữ 2 vai trò**: (1) IndependentConfig — XML/JSON cho Cold Start + đồng bộ nodes; (2) User Storage — hình ảnh, tập tin người dùng
- **Điểm mở chưa chốt**: Circle K chưa chọn S3 hay ViNiU; K8S chưa xác nhận sẵn sàng
- **Đề xuất của VNR**: dùng S3 miễn phí trước; nếu Circle K không dùng K8S → VNR điều chỉnh phương án
- **Pipeline CI**: VNR cần dựng pipeline build + push Docker image lên Registry trong tuần này
- **Mốc quan trọng**: dựng UAT (K8S + S3) trong tuần 07/05/2026 để đáp ứng tiến độ UAT

## Trích dẫn quan trọng

> Hệ thống sử dụng AWS S3 làm Middleware lưu trữ nhờ đặc tính Serverless và khả năng mở rộng cao. S3 đảm nhiệm hai vai trò quan trọng: (1) IndependentConfig — XML, JSON để hỗ trợ Cold Start và đồng bộ hóa trạng thái giữa các nodes; (2) Lưu trữ bền vững tài nguyên từ phía người dùng như hình ảnh và tập tin.

> VNR đề xuất sử dụng bản S3 miễn phí để triển khai trước trên môi trường K8S. Nếu Circle K không dùng K8S, VNR kiểm tra điều chỉnh lại.

> Circle K: Trao đổi nội bộ và phản hồi lại cho VNR về việc lựa chọn sử dụng S3 hay ViNiU, kèm theo thời gian dự kiến sẵn sàng hệ thống.

## Action tiếp theo (trích từ biên bản)

| # | Nội dung | Người thực hiện | Deadline |
|---|---------|----------------|---------|
| 1 | Dựng pipeline CI — build và push Docker image lên Registry | VNR | Tuần 07/05 |
| 2 | Cung cấp thông tin ConfigMap (cấu hình UAT) | VNR + Circle K | Tuần 07/05 |
| 3 | Anh Minh xác nhận lại nội dung mô tả vai trò S3 | MinhNguyenDat | Sớm nhất |
| 4 | Circle K phản hồi lựa chọn S3 hay ViNiU + mốc thời gian | Circle K | Tuần 07/05 |
| 5 | Circle K phản hồi tình trạng K8S (sẵn sàng hay chưa) | Circle K | Tuần 07/05 |

## Liên kết

- [[wiki/flows/k8d2p-flow-deploy-k8s-hrm]] — Quy trình deploy HRM lên K8S (CI VNR / CD khách hàng)
- [[wiki/sources/k8d2p-flow-capnhat-k8s-hrm]] — Tài liệu quy trình cập nhật K8S tổng thể
- [[wiki/architecture/HRM-Deployment-Architecture]] — Kiến trúc deploy HRM: IIS, K8S, S3
