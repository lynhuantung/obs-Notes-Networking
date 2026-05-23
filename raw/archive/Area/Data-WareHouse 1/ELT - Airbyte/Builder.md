---
aliases: 
date: 2024-10-26
tags:
  - daily
---
**Builder** trong Airbyte lÃ  má»™t tÃ­nh nÄƒng máº¡nh máº½ cho phÃ©p báº¡n táº¡o cÃ¡c **connector** tÃ¹y chá»‰nh náº¿u nguá»“n hoáº·c Ä‘Ã­ch dá»¯ liá»‡u báº¡n cáº§n khÃ´ng cÃ³ sáºµn trong danh sÃ¡ch máº·c Ä‘á»‹nh cá»§a Airbyte. ÄÃ¢y lÃ  má»™t cÃ´ng cá»¥ quan trá»ng khi báº¡n cáº§n káº¿t ná»‘i vá»›i má»™t há»‡ thá»‘ng hoáº·c dá»‹ch vá»¥ dá»¯ liá»‡u Ä‘áº·c thÃ¹ mÃ  Airbyte chÆ°a há»— trá»£ sáºµn.

### CÃ¡c bÆ°á»›c sá»­ dá»¥ng Builder Ä‘á»ƒ táº¡o Connector tÃ¹y chá»‰nh:

1. **XÃ¡c Ä‘á»‹nh YÃªu cáº§u Káº¿t ná»‘i**:
    
    - Builder yÃªu cáº§u báº¡n Ä‘á»‹nh nghÄ©a cÃ¡c thuá»™c tÃ­nh cáº§n thiáº¿t cho káº¿t ná»‘i, cháº³ng háº¡n nhÆ° thÃ´ng tin xÃ¡c thá»±c, API endpoint, hoáº·c cÃ¡c thÃ´ng tin Ä‘áº·c biá»‡t cho viá»‡c truy xuáº¥t dá»¯ liá»‡u.
2. **Táº¡o vÃ  Cáº¥u hÃ¬nh Connector**:
    
    - Tá»« Builder, báº¡n cÃ³ thá»ƒ thiáº¿t láº­p luá»“ng dá»¯ liá»‡u cÆ¡ báº£n, bao gá»“m cÃ¡ch dá»¯ liá»‡u sáº½ Ä‘Æ°á»£c trÃ­ch xuáº¥t vÃ  náº¡p vÃ o há»‡ thá»‘ng.
    - TÃ¹y chá»‰nh cÃ¡c chi tiáº¿t nhÆ° **[[raw/archive/Area/Data-WareHouse 1/ELT - Airbyte/API calls]]**, **query parameters**, hoáº·c **authentication headers** náº¿u báº¡n káº¿t ná»‘i vá»›i cÃ¡c API.
3. **Kiá»ƒm thá»­ vÃ  Tinh chá»‰nh**:
    
    - Sau khi cáº¥u hÃ¬nh, Builder cho phÃ©p báº¡n kiá»ƒm tra connector Ä‘á»ƒ Ä‘áº£m báº£o káº¿t ná»‘i hoáº¡t Ä‘á»™ng chÃ­nh xÃ¡c vÃ  dá»¯ liá»‡u Ä‘Æ°á»£c truyá»n Ä‘Ãºng cÃ¡ch.
    - Náº¿u cÃ³ lá»—i hoáº·c yÃªu cáº§u Ä‘iá»u chá»‰nh, báº¡n cÃ³ thá»ƒ quay láº¡i chá»‰nh sá»­a vÃ  thá»­ láº¡i cho Ä‘áº¿n khi connector hoáº¡t Ä‘á»™ng hoÃ n háº£o.

### Khi nÃ o nÃªn sá»­ dá»¥ng Builder?

- Khi báº¡n cáº§n káº¿t ná»‘i Ä‘áº¿n má»™t nguá»“n hoáº·c Ä‘Ã­ch mÃ  Airbyte khÃ´ng há»— trá»£ sáºµn.
- Khi cÃ¡c yÃªu cáº§u Ä‘áº·c thÃ¹ cá»§a doanh nghiá»‡p cáº§n Ä‘áº¿n má»™t quy trÃ¬nh ETL riÃªng, khÃ´ng thá»ƒ Ä‘Ã¡p á»©ng báº±ng cÃ¡c connector chuáº©n.

Builder giÃºp Airbyte má»Ÿ rá»™ng linh hoáº¡t hÆ¡n, phÃ¹ há»£p vá»›i cÃ¡c nhu cáº§u cá»¥ thá»ƒ vÃ  tÃ¹y chá»‰nh cao trong cÃ¡c quy trÃ¬nh tÃ­ch há»£p dá»¯ liá»‡u.



Xá»­ lÃ½ [[raw/archive/Area/Data-WareHouse 1/ELT - Airbyte/transform]]
[[raw/archive/Area/Data-WareHouse 1/ELT - Airbyte/Paging-builder]]


