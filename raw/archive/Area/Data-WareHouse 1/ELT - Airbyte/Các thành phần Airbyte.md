---
aliases: 
date: 2024-10-26
tags:
  - "#airbyte"
---

## CÃ¡c thÃ nh pháº§n trong airbyte  vÃ  káº¿t ná»‘i vá»›i nhau
---
Trong Airbyte, cÃ¡c má»¥c **Connection**, **Sources**, **Destination**, **Builder**, vÃ  **Settings** cÃ¹ng vá»›i quy trÃ¬nh **Define Source**, **Define Destination**, **Select Streams**, vÃ  **Configure Connection** hoáº¡t Ä‘á»™ng phá»‘i há»£p Ä‘á»ƒ thiáº¿t láº­p vÃ  quáº£n lÃ½ quy trÃ¬nh ETL:

1. **[[raw/archive/Area/Data-WareHouse 1/ELT - Airbyte/Sources]]**: ÄÃ¢y lÃ  nÆ¡i thiáº¿t láº­p cÃ¡c nguá»“n dá»¯ liá»‡u (vÃ­ dá»¥: SQL Server, MySQL, API) mÃ  báº¡n muá»‘n trÃ­ch xuáº¥t.

2. **[[raw/archive/Area/Data-WareHouse 1/ELT - Airbyte/Destinations]]**: NÆ¡i thiáº¿t láº­p Ä‘Ã­ch Ä‘áº¿n cá»§a dá»¯ liá»‡u (data warehouse, cÆ¡ sá»Ÿ dá»¯ liá»‡u hoáº·c dá»‹ch vá»¥ lÆ°u trá»¯ nhÆ° Snowflake, BigQuery) Ä‘á»ƒ náº¡p dá»¯ liá»‡u sau khi xá»­ lÃ½.

3. **[[raw/archive/Area/Data-WareHouse 1/ELT - Airbyte/Connection]]**: ÄÃ¢y lÃ  nÆ¡i quáº£n lÃ½ cÃ¡c káº¿t ná»‘i giá»¯a nguá»“n vÃ  Ä‘Ã­ch. Báº¡n cÃ³ thá»ƒ theo dÃµi tráº¡ng thÃ¡i cá»§a tá»«ng káº¿t ná»‘i, thá»i gian Ä‘á»“ng bá»™, vÃ  cÃ¡c cÃ i Ä‘áº·t liÃªn quan.

4. **[[raw/archive/Area/Data-WareHouse 1/ELT - Airbyte/Builder]]**: TÃ­nh nÄƒng nÃ y cho phÃ©p táº¡o connector tÃ¹y chá»‰nh náº¿u Airbyte khÃ´ng cÃ³ sáºµn loáº¡i nguá»“n hoáº·c Ä‘Ã­ch báº¡n cáº§n. 

5. **Settings**: CÃ i Ä‘áº·t há»‡ thá»‘ng chung cá»§a Airbyte, bao gá»“m quáº£n lÃ½ quyá»n, lá»‹ch sá»­ Ä‘á»“ng bá»™, vÃ  tÃ¹y chá»‰nh cáº¥u hÃ¬nh.

#### Quy trÃ¬nh táº¡o káº¿t ná»‘i ETL:

1. **Define Source**: Chá»n hoáº·c thiáº¿t láº­p má»™t nguá»“n má»›i, Ä‘iá»n thÃ´ng tin káº¿t ná»‘i Ä‘áº¿n cÆ¡ sá»Ÿ dá»¯ liá»‡u hoáº·c dá»‹ch vá»¥.
2. **Define Destination**: Chá»n Ä‘Ã­ch Ä‘áº¿n nÆ¡i dá»¯ liá»‡u sáº½ Ä‘Æ°á»£c náº¡p vÃ o sau khi trÃ­ch xuáº¥t vÃ  xá»­ lÃ½.
3. **Select Streams**: Chá»n cÃ¡c báº£ng hoáº·c luá»“ng dá»¯ liá»‡u cá»¥ thá»ƒ tá»« nguá»“n báº¡n muá»‘n Ä‘á»“ng bá»™ vá»›i Ä‘Ã­ch.
4. **Configure Connection**: Cáº¥u hÃ¬nh chi tiáº¿t káº¿t ná»‘i nhÆ° táº§n suáº¥t Ä‘á»“ng bá»™ (lá»‹ch trÃ¬nh), loáº¡i Ä‘á»“ng bá»™ (full hoáº·c incremental), vÃ  cÃ¡c cÃ i Ä‘áº·t khÃ¡c.

### Má»‘i liÃªn káº¿t giá»¯a cÃ¡c má»¥c
Má»—i má»¥c trong Airbyte Ä‘á»u lÃ  má»™t pháº§n cá»§a quy trÃ¬nh ETL tá»•ng thá»ƒ. **Sources** vÃ  **Destinations** cung cáº¥p nÆ¡i lÆ°u trá»¯ thÃ´ng tin vá» nguá»“n vÃ  Ä‘Ã­ch, **Connection** thiáº¿t láº­p quy trÃ¬nh Ä‘á»“ng bá»™ giá»¯a hai thÃ nh pháº§n nÃ y, vÃ  **Builder** há»— trá»£ tÃ¹y chá»‰nh náº¿u cáº§n thÃªm cÃ¡c káº¿t ná»‘i Ä‘áº·c biá»‡t. Trong khi Ä‘Ã³, cÃ¡c bÆ°á»›c cá»§a quy trÃ¬nh (Define Source, Define Destination, Select Streams, Configure Connection) táº¡o ra quy trÃ¬nh tuáº§n tá»± Ä‘á»ƒ thiáº¿t láº­p vÃ  cháº¡y cÃ¡c káº¿t ná»‘i ETL.
