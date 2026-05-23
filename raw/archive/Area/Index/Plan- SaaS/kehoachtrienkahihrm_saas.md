---
title: Kế hoạch xây dựng hệ thống Multi Tenant — HRM SaaS
type: plan
status: in-progress
domain: SaaS / Infrastructure
created: 2023-09-01
updated: 2026-05-02
tags:
  - saas
  - multi-tenant
  - k8s
  - misa
  - amis
  - hrm
owners:
  - Tùng.Lý
  - Phúc.Dương
  - Luân.Nguyễn
  - Đăng.Vũ
---

# Kế hoạch xây dựng hệ thống Multi Tenant — HRM SaaS

---

## A. Tích hợp VnR HRM vào chợ ứng dụng AMIS

### 1. Xây dựng giải pháp triển khai hàng loạt KH trên cloud
> Độc lập web và các service — Ưu tiên: 1

| Task | PIC | Bắt đầu | Deadline | Trạng thái |
|------|-----|---------|----------|------------|
| Testing | Luân.Nguyễn | 01/10/2023 | 10/10/2023 | Open |

---

## B. Xây dựng kiến trúc hệ thống Multi Tenant

### 2. Kiến trúc Multi Tenant
> Ưu tiên: 2

| Task | PIC | Bắt đầu | Deadline | Trạng thái | Kết quả mong đợi |
|------|-----|---------|----------|------------|------------------|
| Test hệ thống vận hành Multi Tenant | Tùng.Lý | 01/09/2023 | 15/09/2023 | Open | Test vận hành multi tenant (21/7); Test tích hợp và auto deployment (28/7) |

---

## C. Nghiên cứu và chuẩn bị về K8s

### 3. K8s
> Deadline nhóm: 08/2023

| Task | PIC | Bắt đầu | Deadline | Trạng thái |
|------|-----|---------|----------|------------|
| Triển khai K8s trên môi trường thử nghiệm | Phúc.Dương | 01/09/2023 | 01/09/2023 | Open |
| Xử lý sự cố | Phúc.Dương | 01/09/2023 | 20/09/2023 | Open |

---

## D. Tích hợp VnR HRM vào chợ ứng dụng MISA

### 4. Chợ ứng dụng MISA
> Deadline nhóm: 10/2023 | Ưu tiên: 3

| Task | PIC | Bắt đầu | Deadline | Trạng thái | Kết quả mong đợi |
|------|-----|---------|----------|------------|------------------|
| Đưa hệ thống HRM lên chợ ứng dụng MISA | Phúc.Dương | 01/10/2023 | 10/10/2023 | Open | |
| Quản lý phiên bản, nâng cấp ứng dụng, nâng cấp DB | Tùng.Lý | 01/10/2023 | 01/10/2023 | Open | |
| Test Performance (load test) — đảm bảo độ chịu tải | Luân.Nguyễn | 01/10/2023 | 01/10/2023 | Open | Kịch bản test + test script với JMeter |
| Backup dự trù và xử lý các vấn đề phát sinh | Phúc.Dương | 01/10/2023 | 15/10/2023 | Open | |

---

## E. Cài đặt ứng dụng & dữ liệu cho khách hàng

### 5. Onboarding khách hàng
> Ưu tiên: 3

| Task | PIC | Bắt đầu | Deadline | Trạng thái |
|------|-----|---------|----------|------------|
| Xử lý cài đặt ứng dụng và cài đặt dữ liệu cho khách hàng | Tùng.Lý | 01/10/2023 | 05/11/2023 | Open |

---

## F. Xây dựng nội dung hệ thống (Danh sách chức năng)

### 6. Content & Cấu hình
> Ưu tiên: 3

| Task | PIC | Bắt đầu | Deadline | Trạng thái | Kết quả / Ghi chú |
|------|-----|---------|----------|------------|-------------------|
| Lựa chọn danh sách chức năng/màn hình cho SaaS v1.0.0 | Luân.Nguyễn | 01/10/2023 | 05/11/2023 | Doing | Có file danh sách màn hình |
| Thiết lập link mẫu (phân quyền, ẩn hiện, ngôn ngữ) | Luân.Nguyễn | 01/09/2023 | 16/10/2023 | Doing | Hoàn thành phân quyền user; đang cấu hình ẩn hiện + ngôn ngữ (~80%) — CẬP NHẬT 05/10 |
| Thiết lập các mẫu import | Luân.Nguyễn | 01/09/2023 | 16/10/2023 | Doing | ~20% — bị ảnh hưởng do QC hỗ trợ nhiều dự án; deadline cũ: 07/10/2023 |
| Thiết lập cấu hình danh mục chung | Luân.Nguyễn | 01/09/2023 | 23/10/2023 | Doing | ~50% danh mục chung |
| Thiết lập các mẫu báo cáo | Luân.Nguyễn | 01/09/2023 | 05/11/2023 | Open | |
| Thiết lập cấu hình hệ thống | Luân.Nguyễn | — | 05/11/2023 | Open | |

---

## G. Giao diện cấu hình lần đầu (First-time Setup)

### 7. Wizard cấu hình lần đầu
> Ưu tiên: 3

| Task | Nhóm | PIC | Bắt đầu | Deadline | Trạng thái |
|------|-------|-----|---------|----------|------------|
| Thiết lập nhân sự | Thiết lập dữ liệu | Đăng.Vũ | 20/11/2023 | 09/12/2023 | Open |
| Thiết lập công | Thiết lập dữ liệu | Đăng.Vũ | 20/11/2023 | 09/12/2023 | Open |
| Quy trình công | Quy trình nghiệp vụ | Đăng.Vũ | 20/11/2023 | 09/12/2023 | Open |
| Quy trình lương | Quy trình nghiệp vụ | Đăng.Vũ | 20/11/2023 | 09/12/2023 | Open |
| Hướng dẫn sử dụng (Step by step) | Quy trình nghiệp vụ | Đăng.Vũ | 20/11/2023 | 09/12/2023 | Open |

---

*Nguồn gốc: Kế hoạch triển khai HRM SaaS — Multi Tenant. Tái cấu trúc 2026-05-02.*
