---
Mã cuộc họp: H-QuickPack-GAP-01082025
aliases: 
title: Biên bản họp thiết bị
tags:
  - "#meeting"
date: 2025-08-01
members:
  - tungly
  - thong.trinh
  - hac.tranphuoc
  - nhut.nguyen
Related:
  - "[[0.H-QuickPack]]"
Link: 
Project: "[[Dự án QuickPack]]"
Liên kết:
---

## Biên bản họp: 01/08/2025

- **Mã cuộc họp**: **H-QuickPack-GAP-01082025**
    
- **Người tham gia**: TungLy, thong.trinh, Hac.tranphuoc, nhut.nguyen
    
- **Cuộc họp liên quan**: Họp GAP module Đồng phục
    
- **Thông tin thêm**:
    
    - [^1]Email biên bản họp
        

## 🎯 Mục tiêu:

1. Thống nhất GAP module quản lý đồng phục
    

---

## 📝 Các ý chính

1. **Danh sách mã hàng chi tiết**
    
    - Thêm 3 field mới:
        
        - Số tồn kho tối thiểu
            
        - Số lượng cấp tiêu chuẩn
            
        - Checkbox cảnh báo
            
2. **Danh sách cấp phát**
    
    - Điều chỉnh nút "Cấp phát":
        
        - Phụ thuộc vào số lượng nhân viên chọn
            
        - Khi bấm "Cấp phát", hệ thống tự động đọc dữ liệu từ "DS kích cỡ đồng phục" và load lên lưới
            
    - Lưới cho phép chỉnh sửa mã hàng chi tiết và số lượng
        
    - Chặn nhập vượt quá tồn kho (logic: tồn kho kỳ mới nhất + nhập - cấp)
        
3. **Bổ sung màn hình “Danh sách cảnh báo thiếu hàng tồn kho”**
    
    - Hiển thị cảnh báo trên trang chủ
        
    - Logic:
        
        - Số lượng nhân viên
            
        - Màu sắc cảnh báo
            
        - Hiển thị số lượng các cột
            
        - Bổ sung điều kiện tìm kiếm
            
4. **Tồn kho**
    
    - Bổ sung trường “Mã hàng chi tiết”
        
    - Sửa control chọn “Phân loại” để hiển thị đầy đủ danh mục
        
5. **Task dự phòng**
    
    - Kiểm tra lại logic tồn kho:
        
        - Tồn cũ + Nhập - Cấp + Thu hồi = Tồn mới
            
    - Nếu sai lệch so với logic trên thì **Raise task**
        

---

## ✅ Action tiếp theo:

1. PE **Raise task AMIS**
    
2. Anh Tùng **đánh giá độ khó và phân bổ nguồn lực** thực hiện
    

---

## 📄 Tóm tắt nội dung họp:

Dưới đây là 5 ý chính của cuộc họp:

1. Thêm các field quản lý tồn kho và cảnh báo trong danh mục mã hàng chi tiết
    
2. Tự động hóa xử lý cấp phát đồng phục và cải tiến giao diện nhập liệu
    
3. Bổ sung màn hình cảnh báo thiếu hàng với logic trực quan và tìm kiếm
    
4. Cải tiến giao diện và dữ liệu của màn hình tồn kho
    
5. Kiểm tra và xác nhận lại toàn bộ logic tính tồn kho
    



[^1]: [[DỰ ÁN QUICKPACK] HỌP GAP ĐỒNG PHỤC NGÀY 01/08/2025 - tung.ly@vnresource.vn - VnResource Mail](https://mail.google.com/mail/u/0/#search/gap/FMfcgzQbgcNBshqjpKlKchvWFkLwVNvV)
	
