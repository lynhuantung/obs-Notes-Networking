---
aliases: 
date: 
permalink: "[[raw/archive/Area/Index/Meeting/DuAn/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_00]]"
tags:
  - "#saasMeeting"
Before: "[[raw/archive/Area/Index/Meeting/DuAn/SaaS - VnR/xmind/Bien_Ban_Hop/Meeting_0923]]"
---
- BiÃªn Báº£n Há»p 30/09/2023
    
    - Má»¥c tiÃªu
        
        - Review tuáº§n trÆ°á»›c
            
            - TÃ¹ng-SÃ¡ng-VÅ©.LÃª Window service (30/09)
                
                - Sá»­a thÃ´ng tin multi tenant Ä‘á»ƒ cháº¡y multi tenant
                    
            - SÃ¡ng-TÃ¹ng-VÅ©.LÃª: xá»­ lÃ½ Log (30/09)
                
                - sá»­a file global => xá»­ lÃ½ set theo tenant code (táº¡o thÆ° má»¥c tenantCode trong thÆ° má»¥c log)
                    
                - Tung.Ly sá»­a trong baseservice Ä‘á»ƒ xá»­ lÃ½ theo tenant => ChÆ°a xá»­ lÃ m giao diá»‡n view log
                    
            - SÃ¡ng - TÃ¹ng.LÃ½ (30/09)
                
                - Äá»‘i vá»›i nhá»¯ng cÃ¡i khÃ´ng láº¥y Ä‘Æ°á»£c => xá»­ lÃ½ lÃºc authen (nhá» SÃ¡ng há»— trá»£) => chÆ°a xá»­ lÃ½ Ä‘Æ°á»£c
                    
            - HoÃ ng.Nguyá»…n (30/09)
                
                - CÃ³ identity má»›i => Identity Server cÃ³ UI quáº£n lÃ½
                    
                - Link Ä‘ang cháº¡y lÃ  dÃ¹ng Docker => CÃ³ cháº¡y Ä‘Æ°á»£c báº±ng docker
                    
            - Minh.Nguyá»…nÄáº¡tÂ (30/09)
                
                - do Minh nghá»‰ phÃ©p nÃªn chÆ°a bÃ¡o cÃ¡o Ä‘Æ°á»£c pháº§n docker tiáº¿n Ä‘á»™ tháº¿ nÃ o
                    
        - Má»¥c tiÃªu
            
            - Kiáº¿n trÃºc K8s tá»« Hiáº¿u.LÃª vÃ  Hiáº¿u.LÃª láº­p káº¿ hoáº¡ch
                
    - CÃ¡c Ã ChÃ­nh
        
        - Log
            
            - Sau nÃ y dÃ¹ng loki (log theo consolse vÃ  cÃ³ 1 web dashboard Ä‘á»ƒ view)
                
        - Docker
            
            - DÃ¹ng helm chart (vÃ¬ AWS khÃ´ng dÃ¹ng docker compose)
                
        - S3 - AWS
            
            - SÃ¡ng.Mai lÃ m vá»›i Hiáº¿u.LÃª Ä‘á»ƒ tÃ¬m hiá»ƒu S3 vá» lÆ°u file vÃ o storage
                
            - SÃ¡ng.Mai cáº§n mÃ´i trÆ°á»ng test S3
                
        - Hiáº¿u.LÃª cáº§n tÃ i khoáº£n Git Ä‘á»ƒ vÃ o há»‡ thá»‘ng xem cáº¥u trÃºc code
            
        - Váº¥n Ä‘á» khÃ³ khÄƒn
            
            - Window service chÆ°a táº¡o Ä‘Æ°á»£c sub process theo multi tenant
                
            - Biáº¿n static, httpContext.cache chÆ°a xá»­ lÃ½ theo multi tenant Ä‘Æ°á»£c
                
        - Váº¥n Ä‘á» SQL scale database cá»§a AWS
            
            - AWS cÃ³ cÆ¡ cháº¿ tá»± táº¡o 1 database Ä‘á»c, 1 database ghi => tÃ­nh phÃ­
                
            - Scale database => náº¿u dung lÆ°á»£ng lá»›n thÃ¬ tá»± scale Ä‘á»ƒ tÄƒng performance => tÃ­nh phÃ­
                
        - Identity - HoÃ ng.Nguyá»…n
            
            - Giao diá»‡n chÆ°a Ä‘Æ°á»£c Ä‘iá»u chá»‰nh (a há»i giÃºp e cÃ³ cáº§n design láº¡i hay gÃ¬ ko nhÃ©) => ChÆ°a confirm
                
    - Chá»‘t
        
        - Hiáº¿u.LÃª (02/10) : K8s
            
            - Define tiÃªu chuáº©n
                
            - A.Hiá»ƒn review káº¿ hoáº¡ch vá»›i Hiáº¿u
                
        - Hiáº¿u.LÃª (07/10)
            
            - LÃ m viá»‡c vá»›i CMC vá» K8s AWS
                
        - Hiáº¿u.LÃª (02/10)
            
            - SÃ¡ng.Mai cáº§n mÃ´i trÆ°á»ng test S3
                
        - Tung.Ly (02/10)
            
            - Äá»‘i vá»›i nhá»¯ng cÃ¡i khÃ´ng láº¥y Ä‘Æ°á»£c => xá»­ lÃ½ lÃºc authen (nhá» SÃ¡ng há»— trá»£) => chÆ°a xá»­ lÃ½ Ä‘Æ°á»£c
                
        - HoÃ ng.Nguyá»…n (07/10)
            
            - ChÆ°a apply vÃ o tenant => Thá»±c hiá»‡n trong tuáº§n (náº¿u cÃ²n Ä‘á»§ thá»i gian)
                
            - Source chÆ°a refactor vá» VnR
                
            - Giao diá»‡n step-by-step khi kÃ­ch hoáº¡t => thá»±c hiá»‡n trong tuáº§n náº¿u cÃ³ Design
                
            - Link dashboard cá»§a user
