---
Mã cuộc họp: H-TrungDong-Eva-14042025
aliases: 
title: Biên bản họp đánh giá
tags:
  - "#meeting"
date: 2025-04-14
members:
  - tungly
  - tiendang
  - phuoc.trandac
  - do.nguyenvan
Related:
  - "[[0.H-TrungDong]]"
Link: 
Project: "[[Dự án TrungDong]]"
Liên kết:
---
## Biên bản họp: 14/04/2025
- Mã cuộc họp: **H-TrungDong-Eva-14042025**
- **Người tham gia**: TungLy , tiendang, phuoc.trandac, do.nguyenvan
- Cuộc họp liên quan 
- Thông tin thêm
	- GAP list [^1]
	- Cuộc họp liên quan: [[H-TrungDong-Eva-04032025]]]

---

## 🎯 Mục tiêu:

1. Điều chỉnh bảng đánh giá: đổi tên, phân biệt bảng đánh giá nhân viên, và cập nhật logic enum tính trọng số.
    
2. Tạo xử lý kiểm tra mục tiêu nhân viên: đảm bảo hợp lệ về đơn vị tính và cảnh báo khi chỉ tiêu bảng con vượt bảng cha.
    

---

## 📝 Các ý chính

### Nội dung:

#### 1. **Task TRUNGDONG (P2)90 – Bảng đánh giá**

- Đổi tên **“Sửa thông tin phòng ban tham khảo”** thành **“Bảng đánh giá tham khảo”**.
    
- Thêm **checkbox** để xác định bảng đánh giá đó có phải là **đánh giá nhân viên** hay không.
    
- Điều chỉnh lại **logic enum tính trọng số** khi tạo bảng đánh giá:
    
    - **Khi xác định bảng cha**: bỏ qua các bảng đánh giá **đã vô hiệu**.
        
    - **Với bảng đánh giá nhân viên**: nếu được check là bảng nhân viên, thì tìm bảng cha là bảng **không phải đánh giá nhân viên**, có cùng **OrgList** (phòng ban).
        

#### 2. **Task – Tạo mục tiêu nhân viên**

- Khi tạo KPI cho nhân viên, cần đảm bảo:
    
    - **KPI con phải có cùng đơn vị tính với KPI cha**.
        
- **Loại cảnh báo loại 3** (tổng chỉ tiêu KPI con vượt KPI cha) **không hợp lý**, vì:
    
    - Không kiểm soát được các bảng con trước có giao đúng chỉ tiêu hay chưa.
        
    - Cần **trao đổi lại với khách hàng** để xác nhận hướng xử lý phù hợp.
        

---

## ✅ Action tiếp theo:
  
1. Phuoc.Tran: Trao đổi lại với khách hàng về xử lý hợp lý hơn cho cảnh báo khi KPI con vượt KPI cha.    

---

## 🧾 Tóm tắt nội dung họp:

Dưới đây là 5 ý chính của cuộc họp:

1. Thống nhất đổi tên “Sửa thông tin phòng ban tham khảo” → “Bảng đánh giá tham khảo”.
    
2. Bổ sung checkbox xác định bảng đánh giá nhân viên.
    
3. Làm rõ logic enum tính trọng số: phân biệt bảng cha và bảng con theo checkbox + OrgList.
    
4. Khi tạo mục tiêu nhân viên, KPI con bắt buộc phải cùng đơn vị tính với KPI cha.
    
5. Cảnh báo loại 3 chưa hợp lý → cần xác nhận lại với KH vì không thể kiểm soát các bảng con trước đó.





