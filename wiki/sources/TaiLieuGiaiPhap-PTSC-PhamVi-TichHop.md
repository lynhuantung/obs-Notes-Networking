---
description: "Phạm vi và tài liệu thiết kế tích hợp PTSC: 30 dataset/interface ESB, HR Master Data Hub, Dimension Model, Crosswalk Table và KPI Catalog."
type: source
code: p7k2
tags:
  - "ptsc"
  - "integration"
  - "proposal"
  - "data-platform"
domain: system
created: 2026-04-30
updated: 2026-04-30
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# TaiLieuGiaiPhap PTSC — §1–2: Phạm Vi & Tài Liệu Thiết Kế Tích Hợp

> Covers: `s1-YcDichVu-TrienKhai-TuyChon`, `s2-Yc-TaiLieu-ThietKe-BaoCao`, `s2a-TaiLieu-ThietKe-TichHop`, `s2b-BaoCao-MappingID-DataPlatform`

## Tóm tắt

Tài liệu giải pháp VnResource HRM cho dự án đấu  PTSC (Tổng Công ty Dịch vụ Kỹ thuật Dầu khí). Phần §1–2 mô tả phạm vi dịch vụ tích hợp tùy chọn và toàn bộ yêu cầu về tài liệu thiết kế kỹ thuật. VnResource cam kết cung cấp 30 dataset/interface tích hợp qua ESB, bao gồm tích hợp với Data Platform, ERP, E-learning, SSO/RBAC và MDM. Đây là tài liệu đấu  — chưa có hợp đồng ký kết (2026-04-30).

## Key Takeaways

- **Phạm vi §2.1**: 30 dataset → Data Platform + 30 interface tích hợp (API/ESB/queue/file); HRM là HR Master Data Hub → đồng bộ RBAC toàn hệ sinh thái PTSC qua ESB
- **Kiến trúc tích hợp bắt buộc**: HRM ↔ ESB ↔ Hệ thống đích — không kết nối point-to-point; ESB đảm nhiệm orchestration, routing, transform, audit
- **Tích hợp E-learning** (2.1.5): đồng bộ 2 chiều nhân sự/chức danh/kế hoạch đào tạo/kết quả/chứng chỉ; loosely-coupled để thay E-learning tương lai
- **Tích hợp ERP** (2.1.6): chi phí nhân sự, quỹ lương, ngân sách — chỉ qua ESB, không kết nối trực tiếp SAP
- **MDM trên Data Platform** (2.1.4): HRM là System of Record, Data Platform duy trì Golden Employee ID; Identity Mapping Service qua ESB
- **Tài liệu §2.2** yêu cầu NCC cung cấp: Business/Process Blueprint (swimlane, exception flow), Integration Technical Design Package (DFD, API Catalog, Data Contract, Data Mapping, Status Tracking, Error/Retry rules)
- **KPI Catalog §2.2.2**: Headcount, Turnover Rate, Training Completion Rate, Labor Cost Ratio, Certificate Validity Compliance Rate — mỗi KPI có Business Definition, Formula, Source Dataset
- **Dimension Model**: Star schema — Employee, Organization, Position, Cost Center, Project, Training, Time, Contract, Certificate
- **Crosswalk Table §2.2.2.3**: mapping internal_id ↔ master_id — 3 API: `/master-data/lookup`, `/crosswalk/register`, `/crosswalk/batch-sync`; Soft Delete, PENDING state, Source of Truth = Master Data PTSC
- **Báo cáo §2.3**: HRM → Data Platform qua ESB WSO2 → Data Lake/Warehouse → BI/AI; RBAC + Audit Trail; Hybrid Data Platform architecture

## Trích dẫn quan trọng

> Nhà  cam kết cung cấp **dịch vụ tích hợp, đồng bộ và thu thập dữ liệu dùng chung và dữ liệu phục vụ phân tích -- báo cáo trên Nền tảng dữ liệu (Data Platform)** theo yêu cầu của Hồ sơ mời , với khối lượng tạm tính **30 dataset / cấu trúc bảng dữ liệu / biểu mẫu dữ liệu**

> Hệ thống HRM được thiết kế theo mô hình HR Master Data Hub tích hợp ESB và SSO theo kiến trúc event-driven và loosely-coupled integration architecture, cho phép PTSC triển khai cơ chế RBAC tập trung trên toàn hệ sinh thái ứng dụng mà không cần thay đổi các hệ thống hiện hữu

> Tất cả kết nối giữa HRM và các hệ thống khác đều đi theo mô hình HRM ↔ ESB ↔ Hệ thống đích. Không triển khai kết nối trực tiếp point-to-point giữa các hệ thống nhằm tránh phụ thuộc chặt, khó quản trị và khó mở rộng.

> Master Data là nguồn chính thức (Source of Truth) cho các trường danh mục dùng chung. Khi Master Data thay đổi → Phần mềm tự động cập nhật qua ESB event

## Liên kết

- [[wiki/projects/PTSC-Project]] — dự án đấu 
- [[wiki/sources/TaiLieuGiaiPhap-PTSC-KyThuat-TichHop]] — §3 kỹ thuật tích hợp chi tiết
- [[wiki/sources/TaiLieuGiaiPhap-PTSC-PhiChucNang-KienTruc]] — §4.1–4.9 phi chức năng
- [[wiki/concepts/HRM-Modules]] — các phân hệ HRM
