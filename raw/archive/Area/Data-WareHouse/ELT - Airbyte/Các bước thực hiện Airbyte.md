---
aliases: 
date: 2024-10-26
tags:
  - airbyte
  - "#ELT"
---
### CÃ¡c bÆ°á»›c thá»±c hiá»‡n trong Airbyte

1. **CÃ i Ä‘áº·t vÃ  cáº¥u hÃ¬nh Airbyte**:
    
    - Airbyte cÃ³ thá»ƒ cÃ i Ä‘áº·t dÆ°á»›i dáº¡ng Docker, giÃºp viá»‡c triá»ƒn khai dá»… dÃ ng.
    - Thiáº¿t láº­p Airbyte báº±ng cÃ¡ch truy cáº­p vÃ o giao diá»‡n quáº£n trá»‹ qua trÃ¬nh duyá»‡t sau khi khá»Ÿi Ä‘á»™ng.
2. **Káº¿t ná»‘i nguá»“n dá»¯ liá»‡u ([[raw/archive/Area/Data-WareHouse/ELT - Airbyte/Sources]])**:
    
    - Chá»n nguá»“n dá»¯ liá»‡u tá»« danh sÃ¡ch cÃ³ sáºµn (SQL Server, MySQL, PostgreSQL, API, CSV, v.v.).
    - Cáº¥u hÃ¬nh thÃ´ng tin káº¿t ná»‘i cho tá»«ng nguá»“n (host, port, authentication...).
    - XÃ¡c nháº­n káº¿t ná»‘i Ä‘á»ƒ Ä‘áº£m báº£o cÃ³ thá»ƒ truy cáº­p vÃ o dá»¯ liá»‡u.
3. **Káº¿t ná»‘i Ä‘Ã­ch dá»¯ liá»‡u ([[raw/archive/Area/Data-WareHouse/ELT - Airbyte/Destinations]])**:
    
    - Chá»n Ä‘Ã­ch Ä‘áº¿n cho dá»¯ liá»‡u (Data Warehouse nhÆ° Snowflake, BigQuery, hoáº·c Data Lake).
    - Cáº¥u hÃ¬nh káº¿t ná»‘i tÆ°Æ¡ng tá»± nhÆ° khi chá»n nguá»“n.
4. **Cáº¥u hÃ¬nh Ä‘á»“ng bá»™ (Sync Settings)**:
    
    - Lá»±a chá»n báº£ng vÃ  cá»™t muá»‘n Ä‘á»“ng bá»™ tá»« nguá»“n sang Ä‘Ã­ch.
    - Thiáº¿t láº­p loáº¡i Ä‘á»“ng bá»™ (full refresh hay incremental).
    - Cáº¥u hÃ¬nh lá»‹ch trÃ¬nh tá»± Ä‘á»™ng (cron job) Ä‘á»ƒ Airbyte cÃ³ thá»ƒ cháº¡y Ä‘á»“ng bá»™ Ä‘á»‹nh ká»³.
5. **Cháº¡y Ä‘á»“ng bá»™ vÃ  giÃ¡m sÃ¡t**:
    
    - Báº¯t Ä‘áº§u quy trÃ¬nh Ä‘á»“ng bá»™ vÃ  giÃ¡m sÃ¡t qua giao diá»‡n Ä‘á»ƒ theo dÃµi tiáº¿n Ä‘á»™.
    - Airbyte sáº½ ghi láº¡i thÃ´ng tin Ä‘á»“ng bá»™, bÃ¡o cÃ¡o lá»—i, vÃ  cho phÃ©p sá»­a lá»—i hoáº·c cháº¡y láº¡i náº¿u cáº§n.
6. **Xá»­ lÃ½ vÃ  phÃ¢n tÃ­ch dá»¯ liá»‡u trong Data Warehouse**:
    
    - Sau khi dá»¯ liá»‡u Ä‘Ã£ Ä‘Æ°á»£c táº£i lÃªn, cÃ¡c thao tÃ¡c chuyá»ƒn Ä‘á»•i vÃ  phÃ¢n tÃ­ch sáº½ Ä‘Æ°á»£c thá»±c hiá»‡n trong Data Warehouse vá»›i cÃ¡c cÃ´ng cá»¥ khÃ¡c hoáº·c báº±ng SQL trá»±c tiáº¿p.
