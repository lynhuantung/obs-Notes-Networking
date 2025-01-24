---
Trạng thái:
  - Hoàn thành
aliases: 
title: 
tags:
  - "#chi-huy-du-an"
  - "#truong-du-an"
  - "#report"
  - "#issuelog"
date: 2025-01-22
Related: "[[0.Chỉ huy dự án]]"
Amis Link: 
Link: 
Project: "[[Dự án INOAC]]"
---
### **Báo cáo Giải Trình Lỗi Redis Cache**

Dưới đây là phần giải trình của em về lỗi Redis cache.

---

## **1. Vấn đề**

- Khi đăng ký **tăng ca** trên **portal V3**, ca làm việc hiển thị sai do **Redis cache nhóm ca (Att_RosterGroup)** không đồng bộ với **database**.

## **2. Giải pháp**

- **Xóa Redis cache key Att_RosterGroup** để làm mới dữ liệu và khắc phục lỗi hiển thị.

---

## **3. Nguyên nhân gây sai lệch Redis cache**

1. **Trigger trong database** tác động đến **Att_RosterGroup** và các bảng liên quan.
2. **Job SQL & Scheduler task trong HRM** ảnh hưởng đến dữ liệu trong cache.
3. **Cập nhật trực tiếp trên SQL & API tích hợp** không cập nhật lại cache.
4. **Import dữ liệu trong HRM** làm thay đổi nhóm ca nhưng không đồng bộ cache.
5. **Cập nhật gián tiếp giữa các danh mục cache**, khiến cache bị lệch so với database.

---

## **4. Hướng xử lý**

- Điều chỉnh **trigger, job, scheduler** để tránh ảnh hưởng đến Redis cache.
- Bổ sung chức năng **xóa toàn bộ cache Redis**.
- Khi nghi ngờ cache sai, kiểm tra và **clear cache trên Redis Insight**.
- **@Trần Hiệp**: Tiến hành tái hiện lỗi trên môi trường khách hàng bằng cách:
    - Vào chức năng nhóm ca, cập nhật dữ liệu và import nhóm ca.
    - Nếu phát hiện lỗi, đội kỹ thuật sẽ xử lý và cập nhật fix.

---

## **5. Ghi chú**

- Việc sử dụng **trigger trong database** có thể tác động đến **Redis cache** và ảnh hưởng đến các chức năng vận hành hệ thống. Cần cân nhắc điều chỉnh hợp lý để tránh lỗi tương tự trong tương lai.