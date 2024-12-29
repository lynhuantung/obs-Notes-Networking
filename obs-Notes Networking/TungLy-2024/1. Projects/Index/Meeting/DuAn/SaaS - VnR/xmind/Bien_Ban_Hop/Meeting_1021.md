---
aliases: 
date: 
permalink: "[[Meeting_00]]"
tags:
  - "#saasMeeting"
Before: "[[Meeting_1014]]"
---
- Biên Bản Họp 21/10/2023
    
    - Mục tiêu
        
        - Mục tiêu
            
            - Monitor & Log (Hiếu-Phúc đang trao đổi xử lý log sqlLite)
                
    - Các Ý Chính
        
        - Review tuần trước
            
            - Hiếu.Lê 16/10 :
                
                - họp kiến trúc với CMC
                    
                - Đưa ra kế hoạch cụ thể gồm (start, end, PIC, status)
                    
            - Hoàng.Nguyễn 21/10 :
                
                - Giao diện kích hoạt tài khoản - đã có step-by-step (90%) => do chỗ a Linh đang ưu tiên task dự án chưa kịp xử lý các case để hoàn thiện 100%. => Tuần sau sẽ hoàn thiện chỗ step-by-step này.
                    
                - Đã move xử lý từ tenant cũ sang iden => done
                    
                - Đã xử lý chạy iden mới cho main/portal/apiv3 => done
                    
                - Link demo: + Main: https://hn-site.dev.local:2000 + Portal: https://hn-site.dev.local:2001 + Iden mới: https://hn-site.dev.local:1801 + User login: ++ tung.ly@vnresource.vn/Asd@1234 (TK login main, portal) ++ admin/Pa$$word123 (TK login iden mới)
                    
            - Sáng-Hoàng-Tung.Ly 21/10
                
                - Tìm và chốt giải pháp licence multi tenant
                    
            - Minh.NguyễnĐạt 21/10
                
                - Xử lý docker file bằng dòng lệnh
                    
        - Hoàng.Nguyen : identitity mới
            
            - - Tiếp tục xử lý identity mới (xử lý ngôn ngữ, xử lý lấy thông tin user, login quản lý tenant, refactor/fix phần auth của tenant ui chạy với iden mới…)
                
        - Monitor & Log
            
            - Đã đọc được log json
                
            - Chưa đọc log request (SQLLite)
                
        - Docker file
            
            - tạm thời chạy được source HRM
                
            - Đang tiếp tục làm
                
    - Chốt
        
        - Hoàng.Nguyễn (28/10) : Iden mới
            
            - - Tiếp tục xử lý identity mới (xử lý ngôn ngữ, xử lý lấy thông tin user, login quản lý tenant, refactor/fix phần auth của tenant ui chạy với iden mới…)
                
        - Minh.NguyễnĐạt (28/10):
            
            - Xử lý docker file bằng dòng lệnh
                
        - Hiếu.Lê- Phúc.Dương (28/10): Monitor và Log
            
            - đọc log request (SQLLite)
                
            - Phúc.Dương xử lý chuyển log SQLite sang log json