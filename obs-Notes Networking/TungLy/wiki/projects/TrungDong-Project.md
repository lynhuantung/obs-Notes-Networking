---
type: wiki-project
tags:
  - trungdong
  - hrm
  - training
  - danh-gia
  - kpi
  - "2025"
date-updated: 2026-04-26
related:
- "[[wiki/entities/TrungDong]]"
- "[[wiki/entities/Hai.NguyenNgoc]]"
- "[[wiki/entities/Minh.NguyenVan]]"
- "[[wiki/concepts/Project-Phases]]"
- "[[wiki/concepts/HRM-Modules]]"

# --- CHART FIELDS ---
status: archived
start-date: 2024-09-21
end-date: 2025-01-22
project-type: new-deployment
industry: manufacturing
team-size: 4
effort-mandays: 29.5
modules:
  - evaluation
  - insurance
  - talent
---

# Dự án TrungDong

## Thông tin cơ bản

| Trường | Giá trị |
|--------|---------|
| Khách hàng | [[wiki/entities/TrungDong]] |
| Loại dự án | Triển khai mới HRM |
| Bắt đầu | 21/09/2024 |
| Trạng thái | Đang thực hiện (Phase II) |
| Năm | 2025 (archived) |

## Nhân sự phụ trách

| Tên | Vai trò | Phân hệ |
|-----|---------|---------|
| [[wiki/entities/Hai.NguyenNgoc]] | Hỗ trợ chính | Lương, Đánh giá |
| [[wiki/entities/Minh.NguyenVan]] | SE chuyên Đánh giá | Đánh giá |
| Nông Quốc Ngọc | SE | Đánh giá |
| Tiến.Đặng | BA | — |

## Scope Phase II

| Loại task | Số lượng | Độ khó |
|----------|----------|--------|
| Đánh giá | 7 | Khó |
| Bảo hiểm | 1 | Dễ |
| Nhân tài | 2 | Trung bình |
| **Tổng** | **10** | **29,5 manday** |

**Timeline Phase II**: 30/12/2024 – 22/01/2025

## Các quyết định kỹ thuật đã thống nhất

### Phân hệ Đánh giá — Bảng đánh giá

- Đổi tên: "Sửa thông tin phòng ban tham khảo" → **"Bảng đánh giá tham khảo"**
- Bổ sung **checkbox** phân biệt bảng đánh giá nhân viên vs. bảng phòng ban
- Logic enum trọng số: bảng cha bỏ qua bảng đã vô hiệu; bảng nhân viên tìm bảng cha cùng **OrgList**
- Nguồn: [[wiki/sources/H-TrungDong-Eva-14042025]]

### Phân hệ Đánh giá — KPI nhân viên

- **KPI con bắt buộc cùng đơn vị tính với KPI cha**
- Cảnh báo loại 3 (KPI con vượt KPI cha) đang chờ xác nhận nghiệp vụ với khách hàng
- Nguồn: [[wiki/sources/H-TrungDong-Eva-14042025]]

## Meeting Notes (đã ingest)

- [[wiki/sources/H-TrungDong-Eva-31122024]] — 31/12/2024: xin nguồn lực Phase II
- [[wiki/sources/H-TrungDong-Eva-14042025]] — 14/04/2025: quyết định kỹ thuật Đánh giá

## Lessons Learned

- Phase nặng Đánh giá → **bắt buộc có SE chuyên sâu phân hệ Đánh giá** trong team
- Cấu trúc bảng đánh giá phức tạp (cha-con, OrgList) → cần phân tích kỹ trước khi code
- Validation KPI cần **xác nhận nghiệp vụ với KH** trước, không tự quyết định

## Cross-links

- [[wiki/concepts/HRM-Modules]] — phân hệ Đánh giá, Bảo hiểm, Nhân tài
- [[wiki/concepts/Project-Phases]] — Phase II
- [[wiki/concepts/Nguon-Luc]] — phân công nguồn lực
