---
Mã:
aliases:
date: 2026-02-23
tags:
  - daily
Project:
---
**Tổng hợp toàn cảnh Project “công việc – VnR” năm 2025**, dựa trên các nội dung đã triển khai, tối ưu và nghiên cứu trong năm.

---

# I. Kiến trúc hệ thống & Hạ tầng

## 1. Hiện đại hóa hệ thống HRM

- Chuyển đổi dần từ mô hình monolith IIS → microservice
    
- Tách các service:
    
    - MainCore
        
    - EmpPortalCore
        
    - Hr.ServiceCore
        
    - System.ServiceCore
        
    - SC.Service.ApiCore
        
    - SC.Service.Identity
        
- Ứng dụng:
    
    - Kubernetes (Pod, HPA)
        
    - Prometheus (metrics)
        
    - Grafana (monitor dashboard)
        

### Trọng tâm 2025:

- Tối ưu CPU / RAM request-limit
    
- Xử lý high load test bằng JMeter
    
- Theo dõi p50/p95/p99 latency
    
- Giảm cardinality trong metrics
    

---

# II. Performance & Monitoring

## 1. SQL Server Optimization

### Các stored procedure trọng điểm:

- `hrm_rec_sp_get_CandidateProfilePortalV3`
    
- `hrm_rec_sp_get_CandidateProfilePortalV3_1`
    
- `Get_Data_Permission_New`
    
- `hrm_get_DynamicStore`
    

### Các vấn đề xử lý:

- Msg 701 (out of memory)
    
- Dynamic SQL phức tạp
    
- Query permission theo tổ chức
    
- EAV dynamic field
    
- Bảng tạm (#ProfileQuit…)
    

### Hướng tối ưu:

- Giảm temp table scan
    
- Tối ưu join permission
    
- Tránh string cắt SQL sai
    
- Phân tách logic nặng sang bước riêng
    

---

## 2. Redis & Distributed Cache

### Vấn đề chính:

- Cache không đồng nhất giữa 6 web
    
- Key lớn (~700KB Sys_AllSetting)
    
- Race condition khi nhiều pod
    

### Giải pháp triển khai:

- Version-based invalidation
    
- Redis publish/subscribe
    
- ConcurrentDictionary wrapper
    
- Redis SLOWLOG phân tích key nặng
    
- PermissionSignature cache theo user
    

---

# III. Security & Identity

## 1. IdentityServer4 + Ocelot

- Cấu hình OIDC
    
- Xử lý callback lỗi khi qua gateway
    
- `UseForwardedHeaders`
    
- Redirect login lỗi khi multi domain
    
- Load balancing qua gateway
    

## 2. JWT & Token

- Token gồm:
    
    - access_token
        
    - refresh_token
        
    - expires_in
        
    - userName
        
- Vấn đề:
    
    - Token hết hạn 15 phút
        
    - Airbyte gọi API bị expire
        
- Hướng nghiên cứu:
    
    - Refresh token tự động
        
    - API key thay thế
        
    - Gia hạn token
        

---

# IV. Frontend & UI/UX

## 1. Angular 19 + Kendo UI

### Các module phức tạp:

- Dynamic Form No-code
    
- ContentReportDynamicChart
    
- Permission structural directive
    
- Kendo Grid sticky column
    
- Kendo Editor custom mention (@user)
    

### Các vấn đề giải quyết:

- Overlay mất focus
    
- Xử lý caret trong iframe
    
- ProseMirror transaction
    
- Lazy load diagram (GoJS 100k+ node)
    
- Virtualization tránh treo
    

---

# V. ETL & Data Warehouse

## 1. Airbyte

- Load data SQL Server → Warehouse
    
- Chuẩn hóa tên bảng (Hre_Profile)
    
- Token expire khi gọi API
    
- Format datetime lỗi
    

## 2. Talend Open Studio

- tInput → tMap → tDBOutput
    
- ETL quy trình báo cáo HRM
    
- Kéo thả component
    
- Sinh Data Warehouse
    

## 3. Redash

- Trực quan hóa dữ liệu
    
- Phân quyền trước khi query
    
- Kiểm soát bảo mật
    

---

# VI. Tích hợp API bên ngoài

## 1. MISA AMIS Task

- Gọi API
    
- Xử lý JSON Task
    
- Thống kê:
    
    - Task trễ
        
    - Task sắp hết hạn
        
    - Priority
        

## 2. TS24 – Danh mục bảo hiểm

- Mapping danh mục nội bộ
    
- Thiết kế kiến trúc mở
    
- Chuẩn bị tích hợp thêm Viettel / MISA
    
- Không thay đổi danh mục core
    

---

# VII. Assembly & CLR

- Load động DLL
    
- AssemblyLoadContext
    
- Lỗi:
    
    - “Assembly with same name already loaded”
        
    - Object reference null trong ExecuteTask
        
- AWS RDS / Azure SQL Managed Instance
    
- Ký số assembly SAFE
    

---

# VIII. Knowledge System tích hợp vào công việc

## 1. Obsidian

- Zettelkasten
    
- Graph Analysis
    
- Spread Activation
    
- Smart Connections v4
    
- Digital Garden
    
- Layered Knowledge Structure
    

## 2. NotebookLM

- Deep research
    
- Hệ 100 câu hỏi:
    
    - FPT
        
    - Socratic
        
    - Spread Activation
        

## 3. Cursor AI

- Agent rule file
    
- Memory bank
    
- So sánh note
    
- Auto backlink
    

---

# IX. Hướng phát triển chiến lược 2026

Dựa trên toàn bộ 2025, có 5 trục lớn:

1. Chuẩn hóa Dynamic Form → Low-code nội bộ
    
2. Tách permission engine thành service riêng
    
3. Xây cache orchestration layer chuẩn microservice
    
4. Chuẩn hóa Data Warehouse → BI Portal riêng
    
5. Chuẩn hóa kiến thức nội bộ thành “Digital Knowledge Hub”
    

---

# Tổng kết 2025

Năm 2025 có thể tóm gọn là:

- Năm tối ưu hiệu năng
    
- Năm chuẩn hóa kiến trúc
    
- Năm xử lý cache & permission phức tạp
    
- Năm tích hợp mạnh AI + PKM vào workflow
    
- Năm chuyển từ “làm tính năng” sang “xây nền tảng”
    

Nếu anh muốn, tôi có thể:

- Vẽ roadmap chiến lược 2025–2026 dạng sơ đồ hệ thống
    
- Hoặc tách thành 1 bộ ghi chú Zettelkasten 20 note để đưa vào Obsidian
    
- Hoặc làm báo cáo PowerPoint trình bày nội bộ team
    

Anh muốn đào sâu phần nào tiếp?