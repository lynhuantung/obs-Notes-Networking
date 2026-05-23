---
aliases: 
date: 
permalink: "[[raw/archive/Area/Index/Meeting/DuAn/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_00]]"
tags:
  - "#saasMeeting"
Before: "[[raw/archive/Area/Index/Meeting/DuAn/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_0909]]"
---
- BiÃªn Báº£n Há»p 18/09/2023
    
    - Má»¥c tiÃªu
        
        - Review tuáº§n trÆ°á»›c
            
            - Cung cáº¥p ngÆ°á»i há»— trá»£ K8S
                
                - ÄÃ£ cÃ³ ngÆ°á»i há»— trá»£ K8s, PhÃºc-TÃº lÃ m viá»‡c vá»›i báº¡n má»›i
                    
            - Cáº¥u hÃ¬nh App mobile lÃªn storage
                
                - Hieu.Tran confirm cuá»‘i thÃ¡ng 09/2023
                    
            - TÃ¬m giáº£i phÃ¡p biáº¿n static
                
                - Rediscache : Ä‘Ã£ xá»­ lÃ½ lÆ°u rediscache khi lÆ°u memory cache theo tenantCode
                    
            - LiÃªn há»‡ Save Money dá»±ng server thÃ nh, sau Ä‘Ã³ PhÃºc xÃ³a vÃ  dá»±ng láº¡i vÃ  lÃ m tÃ i liá»‡u
                
            - CÃ´ng viá»‡c 11->16/09
                
                - TÃ­nh nÄƒng Ä‘Äƒng nháº­p tÃ i khoáº£n quáº£n lÃ½ tenant cá»§a HRM => HoÃ ng xá»­ lÃ½ trÃªn identity server (Táº¡m thá»i láº¥y tá»« WebSettings.json) (done)
                    
                - Web quáº£n lÃ½ á»©ng dá»¥ng cá»§a User: Login, Dashboard => User Ä‘Ã£ táº¡o cÃ´ng ty thÃ nh cÃ´ng (Linh, Minh, Báº£o) (done)
                    
                - Gá»­i láº¡i email kÃ­ch hoáº¡t (ChÆ°a cÃ³) (Linh, Minh, Báº£o) (done)
                    
                - MÃ n hÃ¬nh thÃ´ng tin tÃ i khoáº£n (ChÆ°a cÃ³ API) (Linh, Minh, Báº£o) (done)
                    
                - Chi tiáº¿t thÃ´ng tin cÃ´ng ty (ChÆ°a cÃ³ API) (Linh, Minh, Báº£o) (done)
                    
            - Ä‘Ã£ dá»±ng link SaaS Ä‘á»ƒ kiá»ƒm tra
                
                - MinIO PhÃºc chÆ°a dá»±ng Ä‘Æ°á»£c SSL
                    
            - MinIO
                
                - Downlaod file gáº·p váº¥n Ä‘á» nháº­p máº­t kháº©u máº·c Ä‘á»‹nh
                    
    - CÃ¡c Ã ChÃ­nh
        
        - Dá»±ng web cháº¡y Ä‘á»™c láº­p Ä‘á»ƒ build container docker (SÃ¡ng - Minh)
            
        - + Äiá»u chá»‰nh láº¡i mÃ n hÃ¬nh xÃ¡c nháº­n kÃ­ch hoáº¡t - step by step (ChÆ°a cÃ³ Design vÃ  FE + BE chÆ°a xá»­ lÃ½) (All)
            
        - + XÃ¢y dá»±ng tÃ­nh nÄƒng Ä‘á»•i máº­t kháº©u tenant Ä‘Äƒng kÃ½ láº§n Ä‘áº§u => cÃ³ thá»ƒ lÃ m API trÆ°á»›c (FE + BE) (All)
            
        - Giáº£i phÃ¡p statis, httpContext( Náº¿u cÃ³ giáº£i phÃ¡p sáº½ lÃªn tÃ i liá»‡u hÆ°á»›ng dáº«n a/e Code)
            
        - Window service cháº¡y vá»›i tenantCode (chÆ°a xÃ¡c Ä‘á»‹nh tenantCode) - Cáº§n VÅ© há»— trá»£
            
        - Váº¥n Ä‘á» log
            
        - Váº¥n Ä‘á» window service => Ä‘á» xuáº¥t thÃªm tenantCode
            
        - Váº¥n Ä‘á» chÆ°a giáº£i quyáº¿t Ä‘Æ°á»£c ngay
            
            - Sau khi LuÃ¢n táº¡o template máº«u => SÃ¡ng.Mai sáº½ tiáº¿n hÃ nh Ä‘á»“ng bá»™ file template lÃªn MinIO
                
            - Biáº¿n Static: trao Ä‘á»•i vá»›i VÅ©
                
    - Chá»‘t
        
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
                
        - SÃ¡ng - TÃ¹ng (23/09)
            
            - Window service: xá»­ lÃ½ sub process theo tá»«ng tenantCode => xá»­ lÃ½ api
