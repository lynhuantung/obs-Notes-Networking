---
aliases: 
date: 2024-10-25
tags:
  - daily
  - "#Talend-Open-Studio"
Link: "[[raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Talend Open Studio]]"
---
CÃ¡ch cÃ i Ä‘áº·t vÃ  sá»­ dá»¥ng Talend Open Studio (TOS) phiÃªn báº£n 8.0.1 cho cÃ¡c tÃ¡c vá»¥ ETL cÆ¡ báº£n, dÆ°á»›i Ä‘Ã¢y lÃ  hÆ°á»›ng dáº«n chi tiáº¿t tá»«ng bÆ°á»›c vÃ  má»™t sá»‘ vÃ­ dá»¥ minh há»a.

---

### 1. CÃ i Ä‘áº·t Talend Open Studio 8.0.1

#### BÆ°á»›c 1: Chuáº©n bá»‹ thÆ° má»¥c vÃ  file cÃ i Ä‘áº·t
- Äáº£m báº£o Ä‘Ã£ táº£i Talend Open Studio phiÃªn báº£n 8.0.1 vá» thÆ° má»¥c `F:\ETL\TOS_BD-20211109_1610-V8.0.1`. 
- TOS lÃ  pháº§n má»m Java-based, vÃ¬ váº­y hÃ£y Ä‘áº£m báº£o ráº±ng há»‡ thá»‘ng Ä‘Ã£ cÃ i Ä‘áº·t Java Development Kit (JDK), phiÃªn báº£n tá»« 8 trá»Ÿ lÃªn.

#### BÆ°á»›c 2: CÃ i Ä‘áº·t Java (náº¿u chÆ°a cÃ³)
- Táº£i JDK tá»« trang [Oracle](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) vÃ  tiáº¿n hÃ nh cÃ i Ä‘áº·t.
- Sau khi cÃ i, cáº¥u hÃ¬nh biáº¿n mÃ´i trÆ°á»ng Ä‘á»ƒ Talend cÃ³ thá»ƒ nháº­n diá»‡n JDK:
  - ThÃªm Ä‘Æ°á»ng dáº«n `JAVA_HOME` vÃ o biáº¿n mÃ´i trÆ°á»ng.
  - Cáº¥u hÃ¬nh Ä‘Æ°á»ng dáº«n `bin` cá»§a JDK vÃ o `Path`.

#### BÆ°á»›c 3: Khá»Ÿi Ä‘á»™ng Talend Open Studio
- Äiá»u hÆ°á»›ng Ä‘áº¿n thÆ° má»¥c `F:\ETL\TOS_BD-20211109_1610-V8.0.1`.
- Cháº¡y file `TOS_BD-win-x86_64.exe` Ä‘á»ƒ má»Ÿ Talend Open Studio.
- Khi khá»Ÿi Ä‘á»™ng láº§n Ä‘áº§u, chá»n workspace máº·c Ä‘á»‹nh hoáº·c thay Ä‘á»•i Ä‘áº¿n nÆ¡i báº¡n muá»‘n lÆ°u cÃ¡c project.
- Sau khi thiáº¿t láº­p xong, Talend Open Studio sáº½ má»Ÿ giao diá»‡n chÃ­nh, sáºµn sÃ ng cho viá»‡c táº¡o vÃ  thá»±c thi cÃ¡c job ETL.

---

### 2. Sá»­ dá»¥ng Talend Open Studio cho ETL

Sau khi hoÃ n táº¥t cÃ i Ä‘áº·t, chÃºng ta cÃ³ thá»ƒ tiáº¿n hÃ nh táº¡o vÃ  thá»±c thi cÃ¡c quy trÃ¬nh ETL vá»›i cÃ¡c component phá»• biáº¿n nhÆ° `tInput`, `tMap`, vÃ  `tDBOutput`.

#### Cáº¥u trÃºc vÃ  thÃ nh pháº§n chÃ­nh
- **tInput**: DÃ¹ng Ä‘á»ƒ nháº­p dá»¯ liá»‡u tá»« cÃ¡c nguá»“n khÃ¡c nhau nhÆ° cÆ¡ sá»Ÿ dá»¯ liá»‡u, file CSV, hoáº·c Excel.
- **tMap**: DÃ¹ng Ä‘á»ƒ Ã¡nh xáº¡ vÃ  xá»­ lÃ½ dá»¯ liá»‡u tá»« input, bao gá»“m cÃ¡c thao tÃ¡c nhÆ° ná»‘i, lá»c, vÃ  chuyá»ƒn Ä‘á»•i dá»¯ liá»‡u.
- **tDBOutput**: Component giÃºp lÆ°u dá»¯ liá»‡u Ä‘áº§u ra vÃ o cÆ¡ sá»Ÿ dá»¯ liá»‡u Ä‘Ã­ch.

#### VÃ­ dá»¥ minh há»a

**VÃ­ dá»¥ 1**: Sá»­ dá»¥ng 1 báº£ng dá»¯ liá»‡u Ä‘Æ¡n giáº£n lÃ m input
1. **Táº¡o má»™t job má»›i** trong Talend Open Studio.
2. KÃ©o vÃ  tháº£ component `tInput` (chá»n loáº¡i tÆ°Æ¡ng á»©ng vá»›i nguá»“n dá»¯ liá»‡u, nhÆ° `tMySQLInput` hoáº·c `tFileInputDelimited`).
3. Káº¿t ná»‘i `tInput` vá»›i `tDBOutput` Ä‘á»ƒ lÆ°u dá»¯ liá»‡u vÃ o cÆ¡ sá»Ÿ dá»¯ liá»‡u Ä‘Ã­ch.
4. Trong `tInput`, cáº¥u hÃ¬nh káº¿t ná»‘i Ä‘áº¿n báº£ng dá»¯ liá»‡u. Chá»n báº£ng vÃ  cÃ¡c trÆ°á»ng muá»‘n láº¥y.
5. Cháº¡y job vÃ  kiá»ƒm tra káº¿t quáº£ trong báº£ng Ä‘Ã­ch.

**VÃ­ dá»¥ 2**: Nháº­p liá»‡u tá»« 2 báº£ng cÃ³ quan há»‡ tham chiáº¿u
1. Táº¡o má»™t job má»›i, kÃ©o tháº£ hai `tInput` (Ä‘áº¡i diá»‡n cho hai báº£ng) vÃ o giao diá»‡n.
2. Sá»­ dá»¥ng `tMap` Ä‘á»ƒ káº¿t há»£p dá»¯ liá»‡u tá»« hai báº£ng. Trong `tMap`, Ã¡nh xáº¡ cÃ¡c cá»™t tá»« `tInput1` vÃ  `tInput2` theo khÃ³a tham chiáº¿u chung.
3. Káº¿t ná»‘i `tMap` vá»›i `tDBOutput` Ä‘á»ƒ lÆ°u dá»¯ liá»‡u Ä‘Ã£ káº¿t há»£p vÃ o cÆ¡ sá»Ÿ dá»¯ liá»‡u Ä‘Ã­ch.
4. Cháº¡y job vÃ  kiá»ƒm tra dá»¯ liá»‡u trong báº£ng Ä‘Ã­ch Ä‘á»ƒ xÃ¡c nháº­n káº¿t há»£p thÃ nh cÃ´ng.

**VÃ­ dá»¥ 3**: Sá»­ dá»¥ng stored procedure Ä‘á»ƒ sinh dá»¯ liá»‡u
1. KÃ©o tháº£ `tStoredProcedure` tá»« palette vÃ o giao diá»‡n thiáº¿t káº¿ job.
2. Cáº¥u hÃ¬nh `tStoredProcedure` Ä‘á»ƒ gá»i stored procedure trong cÆ¡ sá»Ÿ dá»¯ liá»‡u.
3. Káº¿t ná»‘i `tStoredProcedure` vá»›i `tDBOutput` Ä‘á»ƒ lÆ°u dá»¯ liá»‡u sinh ra tá»« stored procedure.
4. Cháº¡y job vÃ  xÃ¡c nháº­n dá»¯ liá»‡u Ä‘Ã£ Ä‘Æ°á»£c lÆ°u vÃ o báº£ng Ä‘Ã­ch.

---

### Tá»•ng káº¿t

Talend Open Studio lÃ  cÃ´ng cá»¥ máº¡nh máº½ cho cÃ¡c thao tÃ¡c ETL vÃ  dá»… dÃ ng tÃ¹y chá»‰nh. CÃ¡c bÆ°á»›c trÃªn giÃºp báº¡n náº¯m Ä‘Æ°á»£c cÃ¡c thÃ nh pháº§n cÆ¡ báº£n Ä‘á»ƒ thiáº¿t láº­p vÃ  cháº¡y cÃ¡c job ETL.
