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
date: 2024-12-17
Related:
  - "[[INOAC-Project]]"
Amis Link: 
Link: 
Project: "[[Dự án INOAC]]"
---
### **Giải pháp hạn chế rủi ro khi cập nhật phần mềm**

#### **1. Vấn đề**

- Lỗi xảy ra trên **GOLIVE**, ảnh hưởng vận hành khách hàng.

#### **2. Giải pháp đề xuất**

- **Dựng link UAT**: Test trước khi đưa lên **GOLIVE**.
- **Tạo evidence**: Ghi nhận ảnh chụp, testcase để chứng minh đã fix.

#### **3. Lý do cần UAT**

✅ **Tránh rủi ro trên hệ thống thật** – Kiểm tra trước, tránh lỗi ảnh hưởng khách hàng.  
✅ **Khách hàng kiểm tra trước** – Xác nhận **PASS** trước khi lên **GOLIVE**.  
✅ **Phát hiện lỗi sớm, tiết kiệm chi phí** – Sửa lỗi trên **UAT** dễ hơn trên **GOLIVE**.  
✅ **Dễ rollback nếu lỗi** – UAT giúp kiểm tra trước, tránh rollback phức tạp trên **GOLIVE**.
👉 **UAT giúp kiểm tra an toàn, giảm rủi ro trước khi Golive.**

---

### **4. Triển khai**

#### **Mô hình 2 môi trường**

- **UAT** (Test trước khi Golive).
- **GOLIVE** (Môi trường chính thức).

#### **Quy trình kiểm soát lỗi**

1. **Ghi nhận lỗi** – Quản lý trên **Excel**.
2. **Fix & Test nội bộ** – Đảm bảo lỗi được sửa.
3. **Khách hàng test trên UAT** – Xác nhận trước khi Golive.
4. **Tạo evidence** – Ghi nhận ảnh chụp, testcase.
5. **Khách hàng duyệt trên UAT trước khi deploy GOLIVE**.

#### **Hướng dẫn khách hàng**

- Đào tạo khách hàng test trên **UAT** trước khi cập nhật chính thức.

👉 **Giảm thiểu rủi ro, đảm bảo cập nhật ổn định, tránh lỗi trên Golive.**