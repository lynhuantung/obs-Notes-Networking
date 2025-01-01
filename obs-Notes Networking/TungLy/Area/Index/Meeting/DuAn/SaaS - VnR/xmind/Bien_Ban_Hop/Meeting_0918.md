---
aliases: 
date: 
permalink: "[[TungLy/Area/Index/Meeting/DuAn/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_00]]"
tags:
  - "#saasMeeting"
Before: "[[TungLy/Area/Index/Meeting/DuAn/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_0909]]"
---
- Biên Bản Họp 18/09/2023
    
    - Mục tiêu
        
        - Review tuần trước
            
            - Cung cấp người hỗ trợ K8S
                
                - Đã có người hỗ trợ K8s, Phúc-Tú làm việc với bạn mới
                    
            - Cấu hình App mobile lên storage
                
                - Hieu.Tran confirm cuối tháng 09/2023
                    
            - Tìm giải pháp biến static
                
                - Rediscache : đã xử lý lưu rediscache khi lưu memory cache theo tenantCode
                    
            - Liên hệ Save Money dựng server thành, sau đó Phúc xóa và dựng lại và làm tài liệu
                
            - Công việc 11->16/09
                
                - Tính năng đăng nhập tài khoản quản lý tenant của HRM => Hoàng xử lý trên identity server (Tạm thời lấy từ WebSettings.json) (done)
                    
                - Web quản lý ứng dụng của User: Login, Dashboard => User đã tạo công ty thành công (Linh, Minh, Bảo) (done)
                    
                - Gửi lại email kích hoạt (Chưa có) (Linh, Minh, Bảo) (done)
                    
                - Màn hình thông tin tài khoản (Chưa có API) (Linh, Minh, Bảo) (done)
                    
                - Chi tiết thông tin công ty (Chưa có API) (Linh, Minh, Bảo) (done)
                    
            - đã dựng link SaaS để kiểm tra
                
                - MinIO Phúc chưa dựng được SSL
                    
            - MinIO
                
                - Downlaod file gặp vấn đề nhập mật khẩu mặc định
                    
    - Các Ý Chính
        
        - Dựng web chạy độc lập để build container docker (Sáng - Minh)
            
        - + Điều chỉnh lại màn hình xác nhận kích hoạt - step by step (Chưa có Design và FE + BE chưa xử lý) (All)
            
        - + Xây dựng tính năng đổi mật khẩu tenant đăng ký lần đầu => có thể làm API trước (FE + BE) (All)
            
        - Giải pháp statis, httpContext( Nếu có giải pháp sẽ lên tài liệu hướng dẫn a/e Code)
            
        - Window service chạy với tenantCode (chưa xác định tenantCode) - Cần Vũ hỗ trợ
            
        - Vấn đề log
            
        - Vấn đề window service => đề xuất thêm tenantCode
            
        - Vấn đề chưa giải quyết được ngay
            
            - Sau khi Luân tạo template mẫu => Sáng.Mai sẽ tiến hành đồng bộ file template lên MinIO
                
            - Biến Static: trao đổi với Vũ
                
    - Chốt
        
        - Linh - Minh - Bảo (23/09)
            
            - Xử lý filter được tất cả màn hình quản lý tenant
                
        - Sáng (23/09)
            
            - MinIO chưa chạy được do chữ hoa thường
                
        - Tùng - Sáng (23/09)
            
            - Superadmin chưa chạy được sau khi tạo database mới
                
        - Hoàng - Tùng (23/09)
            
            - Login user sai
                
        - Vũ - Sáng - Tùng (23/09)
            
            - Log : Chia thư mục theo tenantCode
                
        - Sáng - Tùng (23/09)
            
            - Window service: xử lý sub process theo từng tenantCode => xử lý api