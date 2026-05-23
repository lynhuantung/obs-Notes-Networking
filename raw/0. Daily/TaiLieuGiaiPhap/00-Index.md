---
tags: [tailieu-giaiphap, index]
date: 2026-04-30
aliases: [Tài Liệu Giải Pháp Index]
---

# Tài Liệu Giải Pháp — Index (tailieugiaiphap01)

> VnResource HRM — Tài liệu giải pháp tích hợp & phi chức năng cho PTSC

---

## §1–2 Phạm Vi Dịch Vụ Triển Khai Tích Hợp

| File | Mô tả |
|------|-------|
| [[s1-YcDichVu-TrienKhai-TuyChon]] | 30 dataset, 30 interface, Master Data Hub, E-learning, ERP |
| [[s2-Yc-TaiLieu-ThietKe-BaoCao]] | Chi tiết yêu cầu tài liệu §2.2 |
| [[s2a-TaiLieu-ThietKe-TichHop]] | Blueprint, API Catalog, Data Contract |
| [[s2b-BaoCao-MappingID-DataPlatform]] | KPI Catalog, Dimension Model, Crosswalk |

---

## §3 Kỹ Thuật Tích Hợp

### 3.1 Chuẩn giao tiếp & API

| File | Mô tả |
|------|-------|
| [[s3-Chuan-GiaoTiep-DataPlatform-ESB]] | REST/OpenAPI, Bulk Export, ISO8601 |
| [[s3.1-Chuan-GiaoTiep-API-ESB]] | Chi tiết chuẩn giao tiếp |
| [[s3b-Inbound-Channels]] | Inbound channels |
| [[s3a-LuongDuLieu-2Chieu-ESB]] | Luồng 2 chiều |
| [[s3c-CamKet-SaaS-Inbound]] | SaaS commitments |
| [[s3d-CapNhat-AnToan-KiemSoat]] | Safe update mechanisms |

### 3.2 CDC & Khóa chính

| File | Mô tả |
|------|-------|
| [[s3e-CDC-TruyXuat-GiaTang]] | Incremental data extraction |
| [[s3.3-CDC-KhoaChinh-BaoMat-IAM]] | Chi tiết CDC, Stable PK, IAM |
| [[s3e1-CDC-Watermark-Timestamp]] | Watermark CDC |
| [[s3e2-CDC-Version-Based]] | Version-based CDC |
| [[s3e3-DongBo-DataPlatform-ChatLuong]] | Sync & data quality |
| [[s3f-OnDinh-KhoaChinh-DinhDanh]] | Stable Primary Key |

### 3.3 Bảo mật & Metadata

| File | Mô tả |
|------|-------|
| [[s3g-BaoMat-TichHop-IAM]] | OAuth2, mTLS, SSO/IAM |
| [[s3h-QuanLy-Metadata-MoHinhDuLieu]] | ERD, Data Dictionary, API Schema |
| [[s3h2-PhanMem-SaaS-Cloud]] | SaaS model |
| [[s3h3-QuanTri-KienTruc-DuLieu]] | Data governance |
| [[s3h6-API-Schema-TichHop-SaaS]] | ERD Logic + Data Dictionary + API Schema |

### 3.4 Hiệu năng & Idempotent

| File | Mô tả |
|------|-------|
| [[s3i-HieuNang-KenhTichHop-PTSC]] | Performance requirements |
| [[s3j-API-Idempotent-CorrelationId]] | Idempotent API, CorrelationId |
| [[s3j1-Retry-Backoff-GioiHan]] | Retry + backoff |
| [[s3j2-Idempotent-Deduplicate]] | Deduplication |
| [[s3j3-PhanLoai-Loi-Retry]] | Retry error classification |

### 3.5 Kiểm thử & Vận hành

| File | Mô tả |
|------|-------|
| [[s3k-MoiTruong-KiemThu-TichHop]] | Sandbox/UAT, Reprocess |
| [[s3k1-Reprocess-TimeWindow]] | Time window reprocess |
| [[s3k2-Redrive-Batch-Job]] | Batch re-drive |
| [[s3k3-Redrive-CorrelationId]] | CorrelationId re-drive |
| [[s3k4-KiemSoat-TaiXuLy]] | Reprocess control |
| [[s3l-CamKet-Mo-KhongKhoaChatTichHop]] | Open integration commitment |
| [[s3m-Yc-ChatLuong-DuLieu-Doicoat]] | Data quality & reconciliation |
| [[s3n-Yc-VanHanh-TichHop]] | Operations requirements |
| [[s3o-QuanLy-ThayDoi-Interface-Schema]] | Schema/interface change management |

---

## §4 Yêu Cầu Phi Chức Năng

### Chi tiết §4.x (files đã xóa stub, dùng link chi tiết trực tiếp)

### Chi tiết §4.x

| File | Section |
|------|---------|
| [[s4.1-KienTruc-NenTang-HeThong]] | §4.1 full |
| [[s4.2-HieuNang-KhaNangMoRong]] | §4.2 full |
| [[s4.3-TaiKhoan-DangNhap-ChungThuc]] | §4.3 full |
| [[s4.4-PhanQuyen-TaiKhoan-RBAC]] | §4.4 full |
| [[s4.5-LapTrinh-PhatTrien-HT]] | §4.5 full |
| [[s4.6-TichHop-HeThong]] | §4.6 full |
| [[s4.7-BaoMat-LopUngDung]] | §4.7 full |
| [[s4.8-BaoMat-LopDatabase]] | §4.8 full |
| [[s4.9-BaoMat-LopOS]] | §4.9 full |
| [[s4.10-BaoMat-LopMang-HaTang]] | §4.10 full |
| [[s4.11-KiemSoat-TruyCap-AuditLog]] | §4.11 full |
| [[s4.13-CanBangTai-LoadBalancing]] | §4.13 full |
| [[s4.14-HighAvailability]] | §4.14 full |
| [[s4.15-DisasterRecovery]] | §4.15 full |

---

← [[tailieugiaiphap]] (nguồn gốc)
