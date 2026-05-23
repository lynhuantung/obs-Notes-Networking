---
aliases: 
date: 
permalink: "[[raw/archive/3. ARCHIEVED/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_00]]"
tags:
  - "#saasMeeting"
Before: "[[raw/archive/3. ARCHIEVED/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_0918]]"
---
- BiÃªn Báº£n Há»p 23/09/2023
    
    - Má»¥c tiÃªu
        
        - Review tuáº§n trÆ°á»›c
            
            - Linh - Minh - Báº£o (23/09)
                
                - Xá»­ lÃ½ filter Ä‘Æ°á»£c táº¥t cáº£ mÃ n hÃ¬nh quáº£n lÃ½ tenant
                    
            - SÃ¡ng (23/09)
                
                - MinIO chÆ°a cháº¡y Ä‘Æ°á»£c do chá»¯ hoa thÆ°á»ng
                    
            - TÃ¹ng - SÃ¡ng (23/09)
                
                - Superadmin chÆ°a cháº¡y Ä‘Æ°á»£c sau khi táº¡o database má»›i
                    
            - HoÃ ng - TÃ¹ng (23/09)
                
                - Login user sai
                    
            - VÅ© - SÃ¡ng - TÃ¹ng (23/09)
                
                - Log : Chia thÆ° má»¥c theo tenantCode
                    
                    - ChÆ°a biáº¿t xá»­ lÃ½
                        
            - SÃ¡ng - TÃ¹ng (23/09)
                
                - Window service: xá»­ lÃ½ sub process theo tá»«ng tenantCode => xá»­ lÃ½ api
                    
                    - Xá»­ biáº¿t xá»­ lÃ½
                        
        - Má»¥c tiÃªu
            
            - Xá»­ lÃ½ windowservice theo tenant
                
    - CÃ¡c Ã ChÃ­nh
        
        - K8s
            
            - Thá»i gian lÃ m viá»‡c vá»›i Hiáº¿u
                
            - PhÃºc + Hiáº¿u: lead k8s
                
            - PhÃºc Ä‘iá»u phá»‘i task vá»›i cÃ¡c báº¡n
                
            - PhÃºc Hiáº¿u Ä‘Æ°a mÃ´ hÃ¬nh Ä‘á» xuáº¥t => a HIá»ƒn quyáº¿t Ä‘á»‹nh
                
        - Window service :
            
            - Sá»­a thÃ´ng tin multi tenant
                
        - Claim tenant: => Náº¿u null thÃ¬ dÃ¹ng cookie
            
        - Log:
            
            - sá»­a file global => xá»­ lÃ½ set theo tenant
                
                - Sau nÃ y dÃ¹ng log loki
                    
        - tenáº¡ntcode
            
            - Äá»‘i vá»›i nhá»¯ng cÃ¡i khÃ´ng láº¥y Ä‘Æ°á»£c => xá»­ lÃ½ lÃºc authen
                
        - Há»— trá»£ code tá»« VÅ©
            
            - Tá»‘i thá»© 4 hoáº·c thá»© 6
                
    - Chá»‘t
        
        - SÃ¡ng - TÃ¹ng.LÃ½ (30/09)
            
            - Äá»‘i vá»›i nhá»¯ng cÃ¡i khÃ´ng láº¥y Ä‘Æ°á»£c => xá»­ lÃ½ lÃºc authen (nhá» SÃ¡ng há»— trá»£)
                
        - PhÃºc - Hiáº¿u.Le (há»— trá»£ k8s) (30/09)
            
            - Cáº§n chá»‘t thá»i gian lÃ m viá»‡c vá»›i Hiáº¿u
                
            - PhÃºc + Hiáº¿u.Le: lead k8s
                
            - PhÃºc Ä‘iá»u phá»‘i task vá»›i cÃ¡c báº¡n (PhÃºc lÃ m trá»±c tiáº¿p vá»›i Hiáº¿u.LÃª, cáº§n gÃ¬ thÃ¬ PhÃºc trao Ä‘á»•i vá»›i Minh vÃ  TÃº
                
            - PhÃºc Hiáº¿u Ä‘Æ°a mÃ´ hÃ¬nh Ä‘á» xuáº¥t k8s => a HIá»ƒn quyáº¿t Ä‘á»‹nh
                
        - TÃ¹ng-SÃ¡ng-VÅ©.LÃª Window service (30/09)
            
            - Sá»­a thÃ´ng tin multi tenant Ä‘á»ƒ cháº¡y multi tenant
                
        - SÃ¡ng-TÃ¹ng-VÅ©.LÃª: xá»­ lÃ½ Log (30/09)
            
            - sá»­a file global => xá»­ lÃ½ set theo tenant code (táº¡o thÆ° má»¥c tenantCode trong thÆ° má»¥c log)
