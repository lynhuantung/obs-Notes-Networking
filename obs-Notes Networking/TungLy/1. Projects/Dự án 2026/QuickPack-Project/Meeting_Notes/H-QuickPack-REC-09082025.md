---
Mã cuộc họp: H-QuickPack-GAP-09082025
aliases: 
title: Biên bản họp tuyển dụng
tags:
  - "#meeting"
date: 2025-08-09
members:
  - tungly
  - thong.trinh
  - hac.tranphuoc
  - nhut.nguyen
  - thao.phanthiphuong
Related:
  - "[[0.H-QuickPack]]"
Link: 
Project: "[[Dự án QuickPack]]"
Liên kết:
---
## Biên bản họp: 09/08/2025

- **Mã cuộc họp**: **H-Recruitment-GAP-09082025**
    
- **Người tham gia**: Thông, Hạc, Thảo, Hải
    
- **Cuộc họp liên quan**: Họp GAP phân hệ Tuyển dụng
    
- **Thông tin thêm**:
    
    - [[DỰ ÁN QUICKPACK] HỌP GAP PHÂN HỆ TUYỂN DỤNG - tung.ly@vnresource.vn - VnResource Mail](https://mail.google.com/mail/u/0/#label/H%E1%BB%8Dp+GAP/FMfcgzQbgcXPzMVzzvZsgdBbFrLhMsfq)
        

---

## 🎯 Mục tiêu:

1. Thống nhất 04 task cải tiến và kiểm tra logic phân hệ Tuyển dụng.
    

---

## 📝 Các ý chính

1. **Danh sách Vị trí tuyển (Portal + Main)**
    
    - Thêm cảnh báo **"Chặn"** khi tạo mới/chỉnh sửa nếu **SL Tuyển > (SL định biên - SL hiện tại)**.
        
    - Thêm cột **"SL tuyển"**: tự động đếm số ứng viên đã trở thành nhân viên theo thời gian thực.
        
    - Sửa logic **Hủy**: chỉ cho phép khi yêu cầu chưa được duyệt cuối.
        
2. **Danh sách Chờ lịch phỏng vấn**
    
    - Thêm field **Từ ngày - Đến ngày**.
        
    - Thêm field **Giờ**.
        
    - Chặn tạo trùng lịch phỏng vấn (Ngày - Giờ) cho cùng một ứng viên.
        
3. **Kết quả phỏng vấn**
    
    - Hỗ trợ store động để **PE** có thể tự chỉnh sửa **enum** khi xuất file Word.
        
4. **Chờ nhận việc**
    
    - Thêm chức năng **"Từ chối nhận việc"**: nhập lý do, cập nhật vào màn hình **DS đen** và đồng thời update trạng thái, lý do trong màn hình **Hồ sơ ứng viên**.
        
    - Thêm điều kiện lọc và field dưới lưới.
        
5. **Task BA cần kiểm tra lại logic**:
    
    1. Logic nút **"Phân tích"** ở màn hình Vị trí tuyển: cảnh báo khi SL tuyển > SL định biên - SL NV hiện tại.
        
    2. Logic **"Chặn phân chia nhỏ yêu cầu"** để vượt định biên ở màn hình DS Vị trí tuyển (Main + Portal).
        
    3. Logic sinh dữ liệu qua màn hình Chờ lịch phỏng vấn.
        

---

## ✅ Action tiếp theo:

1. **PE**: Raise task AMIS.
    
2. **Anh Tùng**: Đánh giá độ khó và phân bổ nguồn lực thực hiện.
    

---

## 📄 Tóm tắt nội dung họp:

1. Bổ sung cảnh báo, tính toán tự động và điều kiện hủy trong màn hình Vị trí tuyển.
    
2. Thêm bộ lọc thời gian, giờ và chặn trùng lịch trong màn hình Chờ lịch phỏng vấn.
    
3. Cập nhật store động để PE chỉnh enum khi xuất Word.
    
4. Thêm chức năng từ chối nhận việc và lọc dữ liệu trong màn hình Chờ nhận việc.
    
5. BA rà soát và xác nhận lại logic ở các màn hình chính của quy trình tuyển dụng.
    

---


## Footnotes

1.  [DS GAP](https://docs.google.com/spreadsheets/d/1uhtcnp6X5uern3ZMFKDac6HNwSgnkAIcoTgV-Xd1PWo/edit?gid=1319735300#gid=1319735300)