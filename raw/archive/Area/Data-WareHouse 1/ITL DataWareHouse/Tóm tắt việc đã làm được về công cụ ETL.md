---
aliases: 
date: 2024-10-25
tags:
  - daily
Link: "[[raw/archive/Area/Data-WareHouse 1/ITL DataWareHouse/ETL]]"
---
## TÃ³m táº¯t nhá»¯ng viá»‡c Ä‘Ã£ lÃ m trong Talend Open Studio
---

### 1. Má»¥c Ä‘Ã­ch cá»§a Talend Open Studio vÃ  ETL
   - **Má»¥c Ä‘Ã­ch chÃ­nh**: Sá»­ dá»¥ng Talend Open Studio Ä‘á»ƒ láº¥y dá»¯ liá»‡u tá»« cÃ¡c nguá»“n khÃ¡c nhau, xá»­ lÃ½ hoáº·c biáº¿n Ä‘á»•i nÃ³, rá»“i lÆ°u trá»¯ vÃ o má»™t nÆ¡i gá»i lÃ  "data warehouse" (kho dá»¯ liá»‡u). 

### 2. CÃ¡c BÆ°á»›c CÃ´ng Viá»‡c ÄÃ£ LÃ m
   - **BÆ°á»›c 1: CÃ i Ä‘áº·t pháº§n má»m Talend** â€“ táº£i vÃ  cÃ i Ä‘áº·t Talend Open Studio, má»™t cÃ´ng cá»¥ dÃ¹ng Ä‘á»ƒ thu tháº­p, xá»­ lÃ½ vÃ  lÆ°u trá»¯ dá»¯ liá»‡u tá»« cÃ¡c nguá»“n khÃ¡c nhau.
   
   - **BÆ°á»›c 2: Táº¡o cÃ¡c quy trÃ¬nh xá»­ lÃ½ dá»¯ liá»‡u ETL (gá»i lÃ  "job")** â€“  Ä‘Ã£ táº¡o ba quy trÃ¬nh chÃ­nh:
     - **Quy trÃ¬nh 1**: Láº¥y dá»¯ liá»‡u tá»« má»™t báº£ng duy nháº¥t (gá»i lÃ  "input") vÃ  chuyá»ƒn vÃ o data warehouse (gá»i lÃ  "output").
     - **Quy trÃ¬nh 2**: Láº¥y dá»¯ liá»‡u tá»« hai báº£ng cÃ³ má»‘i quan há»‡ vá»›i nhau (vÃ­ dá»¥, má»™t báº£ng chá»©a thÃ´ng tin Tá»‰nh thÃ nh vÃ  má»™t báº£ng chá»©a thÃ´ng tin quáº­n huyá»‡n). Sau Ä‘Ã³, káº¿t há»£p dá»¯ liá»‡u cá»§a hai báº£ng nÃ y vÃ  lÆ°u vÃ o data warehouse.
     - **Quy trÃ¬nh 3**: Sá»­ dá»¥ng má»™t Ä‘oáº¡n mÃ£ trong cÆ¡ sá»Ÿ dá»¯ liá»‡u Ä‘á»ƒ táº¡o dá»¯ liá»‡u (gá»i lÃ  stored procedure), sau Ä‘Ã³ lÆ°u dá»¯ liá»‡u Ä‘Ã³ vÃ o data warehouse.
     ![[Pasted image 20241025170614.png]]
     ![[Pasted image 20241025170650.png]]

### 3. Tá»± Äá»™ng HÃ³a Quy TrÃ¬nh
   - **Táº¡o file `.bat` Ä‘á»ƒ cháº¡y tá»± Ä‘á»™ng** â€“ Thay vÃ¬ má»Ÿ Talend vÃ  cháº¡y tá»«ng quy trÃ¬nh (job) báº±ng tay,  Ä‘Ã£ táº¡o má»™t file tá»± Ä‘á»™ng (file `.bat`). File nÃ y cho phÃ©p  nháº¥n Ä‘Ãºp vÃ o lÃ  há»‡ thá»‘ng tá»± Ä‘á»™ng cháº¡y cÃ¡c quy trÃ¬nh ETL trÃªn mÃ  khÃ´ng cáº§n má»Ÿ pháº§n má»m.

---

### TÃ³m láº¡i:

Sá»­ dá»¥ng Talend Open Studio Ä‘á»ƒ:
1. Láº¥y vÃ  káº¿t há»£p dá»¯ liá»‡u tá»« nhiá»u nguá»“n khÃ¡c nhau.
2. Biáº¿n Ä‘á»•i vÃ  lÆ°u trá»¯ dá»¯ liá»‡u Ä‘Ã³ vÃ o má»™t báº£ng má»›i (data warehouse).
3. Táº¡o má»™t file tá»± Ä‘á»™ng Ä‘á»ƒ cháº¡y toÃ n bá»™ quÃ¡ trÃ¬nh chá»‰ vá»›i má»™t cÃº nháº¥p chuá»™t. 

Vá»›i quy trÃ¬nh nÃ y,  cÃ³ thá»ƒ dá»… dÃ ng quáº£n lÃ½ vÃ  lÆ°u trá»¯ dá»¯ liá»‡u má»™t cÃ¡ch nháº¥t quÃ¡n vÃ  tá»± Ä‘á»™ng hÃ³a Ä‘á»ƒ tiáº¿t kiá»‡m thá»i gian.





