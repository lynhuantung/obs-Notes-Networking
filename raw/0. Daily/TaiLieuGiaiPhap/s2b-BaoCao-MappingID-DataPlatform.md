---
tags: [tailieu-giaiphap, bao-cao, mapping, data-platform]
---

# s2b — Báo Cáo, Mapping ID & Data Platform

← [[s2a-TaiLieu-ThietKe-TichHop]]
**Tiếp theo:** [[s3.1-Chuan-GiaoTiep-API-ESB]]

---

## 2.2.2 Yêu cầu báo cáo & quản trị dữ liệu

### 2.2.2.1 Tùy chỉnh báo cáo / trường dữ liệu
Phần mềm cho phép PTSC **tùy chỉnh qua cấu hình** (không can thiệp mã nguồn) các nội dung: cấu trúc báo cáo, trường dữ liệu, công thức/KPI, ad-hoc reporting, dashboard.

### 2.2.2.2 Tài liệu thống nhất yêu cầu báo cáo (Reporting & Data Governance Specification)

Trong giai đoạn Khảo sát–Thiết kế, NCC xây dựng:

**KPI Catalog** — mỗi báo cáo gồm: Report Name, Business Purpose, Data Source, Update Frequency, Owner, Access Role.

**KPI định nghĩa**: Headcount, Turnover Rate, Training Completion Rate, Labor Cost Ratio, Certificate Validity Compliance Rate...

**Dimension Model** (Star schema / Data Warehouse compatible):
- Employee, Organization, Position, Cost Center, Project, Training, Time, Contract, Certificate

**Data Mapping Matrix**: HRM, ERP, E-learning, SSO, CMMS → Data Platform

**Dataset chuẩn**: Employee Snapshot, Workforce Movement, Payroll Cost, Training Dataset, Certificate Dataset

**Đặc tả kỹ thuật export/API/ESB**:
- Export: CSV, JSON, XML, Parquet — schedule/event-trigger/on-demand
- API: `GET /api/v1/hrm/employees`, `POST /api/v1/hrm/training-results`
- ESB spec: message schema, routing rule, transform, retry policy, correlation ID

**Metadata Catalog**: dataset definition, field definition, business glossary, data lineage, data ownership, data classification.

---

## 2.2.2.3 Tài liệu Mapping ID với Master Data PTSC

NCC xây dựng cơ chế mapping ID nội bộ (OrganizationID, UserID, ProjectID...) với Master Data dùng chung qua ESB/Data Platform.

**Crosswalk Table** — cấu trúc: internal_id, master_id, entity_type, sync_direction, status (ACTIVE/INACTIVE/PENDING).

**Quy tắc đồng bộ:**
- Khởi tạo: tạo mới → gọi ESB API nhận Master ID; nếu chưa có → PENDING chờ phê duyệt
- Cập nhật: Master Data là Source of Truth cho trường danh mục dùng chung
- Xung đột: ưu tiên theo `updated_at` hoặc `version`
- Deactivation: Soft Delete, lưu lý do, archive theo chính sách PTSC

**API Đồng bộ chính:**
```
POST /esb/api/v1/master-data/lookup      -- Tra cứu Master ID
POST /esb/api/v1/crosswalk/register      -- Đăng ký mapping mới
POST /esb/api/v1/crosswalk/batch-sync    -- Đồng bộ Batch (Incremental)
```

---

## 2.3 Báo cáo & lưu trữ trên Data Platform

### 2.3.1 Kiến trúc báo cáo HRM → Data Platform
- Tự động trích xuất dữ liệu HRM lên Data Platform qua **ESB WSO2**
- Lưu trữ tập trung tại Data Lake/Data Warehouse
- Sẵn sàng BI/AI (dự báo nghỉ việc, thiếu hụt năng lực)
- Phân quyền RBAC + Audit Trail
- Tuân thủ kiến trúc **Hybrid Data Platform PTSC**

### 2.3.2 Đồng bộ báo cáo với E-learning
Tích hợp 2 chiều: đồng bộ danh sách nhân sự/chức danh, kế hoạch đào tạo theo vị trí, kết quả học/điểm/số giờ, chứng chỉ. Kiến trúc loosely-coupled.

---

← [[s2a-TaiLieu-ThietKe-TichHop]] | **Tiếp:** [[s3.1-Chuan-GiaoTiep-API-ESB]]
