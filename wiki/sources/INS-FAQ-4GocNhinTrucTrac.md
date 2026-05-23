---
type: source
code: r7cx
tags:
  - bao-hiem
  - phan-tich-bh
  - checklist
  - 4m-framework
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-FishBone-Analysis]]"
  - "[[wiki/sources/INS-TruyNguyenNhan]]"
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
description: "Checklist 4 góc nhìn khoanh vùng nguyên nhân khi phân tích bảo hiểm thất bại, dựa trên framework 4M Kaizen."
---

# INS FAQ — 4 Góc Nhìn Trục Trặc Khi Phân Tích Bảo Hiểm

## Tóm tắt

Tài liệu cung cấp checklist thực tế để khoanh vùng nguyên nhân khi phân tích BH thất bại, dựa trên sơ đồ 4 góc nhìn gốc từ tài liệu Kaizen INS. Được bổ sung chi tiết từ trao đổi SE 2026-05-02. Dùng khi PE báo lỗi phân tích BH — đi qua 4 góc nhìn để xác định module/nguyên nhân trước khi đào sâu.

## Key Takeaways

- **Góc 1 — Bộ phận liên quan**: 5 module ảnh hưởng — HRE (nơi đóng BH, chức danh, tạm hoãn), ATT (duyệt nghỉ, tổng hợp công), SAL (lương BHXH), INS (cấu hình, công thức), SYS (múi giờ, IIS)
- **Góc 2 — Loại trục trặc**: công thức BH sai, công thức tên công việc sai, thiếu field, sai tiền tệ
- **Góc 3 — Qui trình**: đi theo 5 bước — kiểm tra từng bước NV có bị loại không, dữ liệu có đủ không
- **Góc 4 — 4M**: Man (PE cấu hình sai), Machine (IIS OOM, múi giờ), Material (dữ liệu lương/công thức/tạm hoãn), Method (quy trình 5 bước chưa đúng thứ tự)

## Trích dẫn quan trọng

> Khi phân tích BH không thành công — đi qua 4 góc nhìn theo thứ tự: Bộ phận liên quan → Loại trục trặc → Qui trình → 4M để khoanh vùng trước khi vào code.

> Máy chủ đủ bộ nhớ không? IIS OOM → phân tích bị treo/lỗi giữa chừng không có thông báo rõ ràng.

## Liên kết

- [[wiki/sources/INS-FishBone-Analysis]] — 4M framework chi tiết
- [[wiki/sources/INS-TruyNguyenNhan]] — phương pháp 4M Root Cause Analysis
- [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] — 5 bước phân tích BH
