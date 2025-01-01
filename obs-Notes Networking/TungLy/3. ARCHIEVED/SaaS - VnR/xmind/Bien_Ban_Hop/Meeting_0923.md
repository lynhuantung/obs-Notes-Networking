---
aliases: 
date: 
permalink: "[[TungLy/3. ARCHIEVED/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_00]]"
tags:
  - "#saasMeeting"
Before: "[[TungLy/3. ARCHIEVED/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_0918]]"
---
- Biên Bản Họp 23/09/2023
    
    - Mục tiêu
        
        - Review tuần trước
            
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
                    
                    - Chưa biết xử lý
                        
            - Sáng - Tùng (23/09)
                
                - Window service: xử lý sub process theo từng tenantCode => xử lý api
                    
                    - Xử biết xử lý
                        
        - Mục tiêu
            
            - Xử lý windowservice theo tenant
                
    - Các Ý Chính
        
        - K8s
            
            - Thời gian làm việc với Hiếu
                
            - Phúc + Hiếu: lead k8s
                
            - Phúc điều phối task với các bạn
                
            - Phúc Hiếu đưa mô hình đề xuất => a HIển quyết định
                
        - Window service :
            
            - Sửa thông tin multi tenant
                
        - Claim tenant: => Nếu null thì dùng cookie
            
        - Log:
            
            - sửa file global => xử lý set theo tenant
                
                - Sau này dùng log loki
                    
        - tenạntcode
            
            - Đối với những cái không lấy được => xử lý lúc authen
                
        - Hỗ trợ code từ Vũ
            
            - Tối thứ 4 hoặc thứ 6
                
    - Chốt
        
        - Sáng - Tùng.Lý (30/09)
            
            - Đối với những cái không lấy được => xử lý lúc authen (nhờ Sáng hỗ trợ)
                
        - Phúc - Hiếu.Le (hỗ trợ k8s) (30/09)
            
            - Cần chốt thời gian làm việc với Hiếu
                
            - Phúc + Hiếu.Le: lead k8s
                
            - Phúc điều phối task với các bạn (Phúc làm trực tiếp với Hiếu.Lê, cần gì thì Phúc trao đổi với Minh và Tú
                
            - Phúc Hiếu đưa mô hình đề xuất k8s => a HIển quyết định
                
        - Tùng-Sáng-Vũ.Lê Window service (30/09)
            
            - Sửa thông tin multi tenant để chạy multi tenant
                
        - Sáng-Tùng-Vũ.Lê: xử lý Log (30/09)
            
            - sửa file global => xử lý set theo tenant code (tạo thư mục tenantCode trong thư mục log)