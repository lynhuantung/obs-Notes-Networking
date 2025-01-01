---
aliases: 
date: 
permalink: "[[TungLy/Area/Index/Meeting/DuAn/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_00]]"
tags:
  - "#saasMeeting"
Before: "[[TungLy/Area/Index/Meeting/DuAn/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_0923]]"
---
- Biên Bản Họp 30/09/2023
    
    - Mục tiêu
        
        - Review tuần trước
            
            - Tùng-Sáng-Vũ.Lê Window service (30/09)
                
                - Sửa thông tin multi tenant để chạy multi tenant
                    
            - Sáng-Tùng-Vũ.Lê: xử lý Log (30/09)
                
                - sửa file global => xử lý set theo tenant code (tạo thư mục tenantCode trong thư mục log)
                    
                - Tung.Ly sửa trong baseservice để xử lý theo tenant => Chưa xử làm giao diện view log
                    
            - Sáng - Tùng.Lý (30/09)
                
                - Đối với những cái không lấy được => xử lý lúc authen (nhờ Sáng hỗ trợ) => chưa xử lý được
                    
            - Hoàng.Nguyễn (30/09)
                
                - Có identity mới => Identity Server có UI quản lý
                    
                - Link đang chạy là dùng Docker => Có chạy được bằng docker
                    
            - Minh.NguyễnĐạt (30/09)
                
                - do Minh nghỉ phép nên chưa báo cáo được phần docker tiến độ thế nào
                    
        - Mục tiêu
            
            - Kiến trúc K8s từ Hiếu.Lê và Hiếu.Lê lập kế hoạch
                
    - Các Ý Chính
        
        - Log
            
            - Sau này dùng loki (log theo consolse và có 1 web dashboard để view)
                
        - Docker
            
            - Dùng helm chart (vì AWS không dùng docker compose)
                
        - S3 - AWS
            
            - Sáng.Mai làm với Hiếu.Lê để tìm hiểu S3 về lưu file vào storage
                
            - Sáng.Mai cần môi trường test S3
                
        - Hiếu.Lê cần tài khoản Git để vào hệ thống xem cấu trúc code
            
        - Vấn đề khó khăn
            
            - Window service chưa tạo được sub process theo multi tenant
                
            - Biến static, httpContext.cache chưa xử lý theo multi tenant được
                
        - Vấn đề SQL scale database của AWS
            
            - AWS có cơ chế tự tạo 1 database đọc, 1 database ghi => tính phí
                
            - Scale database => nếu dung lượng lớn thì tự scale để tăng performance => tính phí
                
        - Identity - Hoàng.Nguyễn
            
            - Giao diện chưa được điều chỉnh (a hỏi giúp e có cần design lại hay gì ko nhé) => Chưa confirm
                
    - Chốt
        
        - Hiếu.Lê (02/10) : K8s
            
            - Define tiêu chuẩn
                
            - A.Hiển review kế hoạch với Hiếu
                
        - Hiếu.Lê (07/10)
            
            - Làm việc với CMC về K8s AWS
                
        - Hiếu.Lê (02/10)
            
            - Sáng.Mai cần môi trường test S3
                
        - Tung.Ly (02/10)
            
            - Đối với những cái không lấy được => xử lý lúc authen (nhờ Sáng hỗ trợ) => chưa xử lý được
                
        - Hoàng.Nguyễn (07/10)
            
            - Chưa apply vào tenant => Thực hiện trong tuần (nếu còn đủ thời gian)
                
            - Source chưa refactor về VnR
                
            - Giao diện step-by-step khi kích hoạt => thực hiện trong tuần nếu có Design
                
            - Link dashboard của user