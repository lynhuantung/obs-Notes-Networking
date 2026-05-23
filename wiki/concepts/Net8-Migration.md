---
description: "Lộ trình và kế hoạch nâng cấp HRM từ .NET Framework lên .NET 8, cải thiện hiệu suất hệ thống."
type: concept
tags:
  - net8
  - dotnet
  - migration
  - upgrade
  - technical
date-updated: 2026-04-25
related: 
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/entities/VnPay]]"
---

# .NET 8 Migration — Nâng Cấp Framework

## Bối cảnh

HRM ban đầu được xây dựng trên .NET Framework cũ. Nâng cấp lên .NET 8 nhằm:
- Cải thiện hiệu suất (performance improvements của .NET 8)
- Bảo mật tốt hơn (security patches, modern TLS)
- Long-term support (LTS release)
- Chuẩn bị cho các tính năng mới

## Quy trình Migration (từ dự án VnPay)

### Bước 1: Xây dựng Migration Tool
- Tool tự động chuyển đổi code sang .NET 8 syntax
- Xử lý breaking changes (namespace, API changes)
- Phụ trách: Nguyễn Huỳnh Huy Hoàng

### Bước 2: Chuyển đổi
- Chạy migration tool trên codebase
- Manual review các phần phức tạp
- Thời gian thực tế (VnPay): ~2.5 tuần (01/02–17/02/2025)

### Bước 3: Kiểm thử hồi quy
- Test toàn bộ tính năng hiện có
- Phụ trách QA: Dương Hồng Thắm, Cẩm Hân
- Thời gian thực tế (VnPay): ~1.5 tuần

### Bước 4: Triển khai
- Deploy lên môi trường production
- Đào tạo lại nếu cần
- Thời gian thực tế (VnPay): ~1.5 tuần (20/03–31/03/2025)

## Lessons Learned

*(Cần ingest GAP document và QC test plan của VnPay để bổ sung)*

## Thời gian tổng thể (VnPay reference)

- Tổng: ~8 tuần từ kick-off đến go-live
- Đây là dự án **upgrade only** — không có customization mới

## ⚠️ Rủi ro đã gặp: API Response Double-Wrap (VNPAY1538)

Sau khi thêm `GlobalResponseFilter` vào .NET 8 pipeline, các controller **đã tự wrap** response (`new ApiResponse { Data = data }`) sẽ bị wrap thêm 1 tầng nữa:

```
Controller tự wrap + GlobalResponseFilter = Obj.Data.Data  ← double-wrap
```

Frontend đọc `Obj.Data` vẫn nhận được giá trị (object wrapper) nên **không throw error — chỉ render trống**. Lỗi này đặc biệt nguy hiểm ở luồng **list→detail** vì 2 màn hình gọi 2 API khác nhau.

**Checklist bắt buộc sau migration:**
- [ ] API response có `Obj.Data.Data` hay `Obj.Data`?
- [ ] Có Global Response Wrapper Filter không?
- [ ] Controller có tự wrap response không?
- [ ] Frontend đọc đúng tầng data?
- [ ] Có integration test cho luồng list→detail không?

→ Chi tiết RCA: [[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]]

## Cross-links

- [[wiki/projects/VnPay-Project]] — case study thực tế
- [[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]] — RCA bug double-wrap Mobile App
- [[wiki/sources/Daily-2025-CursorAI-Net8]] — ghi chú migration hàng ngày
