---
aliases: 
date: 2024-10-24
tags:
  - daily
  - "#ETL"
---
CÃ´ng cá»¥ ETL (Extract, Transform, Load) cÃ³ má»™t sá»‘ má»¥c Ä‘Ã­ch chÃ­nh trong viá»‡c quáº£n lÃ½ vÃ  xá»­ lÃ½ dá»¯ liá»‡u, bao gá»“m:

1. **TrÃ­ch xuáº¥t Dá»¯ liá»‡u (Extract)**:
    
    - **Má»¥c Ä‘Ã­ch**: Thu tháº­p dá»¯ liá»‡u tá»« nhiá»u nguá»“n khÃ¡c nhau, cháº³ng háº¡n nhÆ° cÆ¡ sá»Ÿ dá»¯ liá»‡u, file CSV, API, vÃ  cÃ¡c dá»‹ch vá»¥ web.
    - **Lá»£i Ã­ch**: GiÃºp tá»• chá»©c cÃ³ thá»ƒ táº­p há»£p dá»¯ liá»‡u tá»« nhiá»u nguá»“n khÃ¡c nhau Ä‘á»ƒ phÃ¢n tÃ­ch vÃ  bÃ¡o cÃ¡o.
2. **Chuyá»ƒn Ä‘á»•i Dá»¯ liá»‡u (Transform)**:
    
    - **Má»¥c Ä‘Ã­ch**: Chuyá»ƒn Ä‘á»•i dá»¯ liá»‡u Ä‘Ã£ trÃ­ch xuáº¥t thÃ nh Ä‘á»‹nh dáº¡ng hoáº·c cáº¥u trÃºc phÃ¹ há»£p Ä‘á»ƒ lÆ°u trá»¯ hoáº·c phÃ¢n tÃ­ch.
    - **Lá»£i Ã­ch**: Dá»¯ liá»‡u cÃ³ thá»ƒ Ä‘Æ°á»£c lÃ m sáº¡ch, xá»­ lÃ½, vÃ  chuyá»ƒn Ä‘á»•i Ä‘á»ƒ Ä‘áº£m báº£o tÃ­nh chÃ­nh xÃ¡c vÃ  nháº¥t quÃ¡n, giÃºp nÃ¢ng cao cháº¥t lÆ°á»£ng dá»¯ liá»‡u.
3. **Táº£i Dá»¯ liá»‡u (Load)**:
    
    - **Má»¥c Ä‘Ã­ch**: Táº£i dá»¯ liá»‡u Ä‘Ã£ Ä‘Æ°á»£c chuyá»ƒn Ä‘á»•i vÃ o há»‡ thá»‘ng Ä‘Ã­ch, thÆ°á»ng lÃ  kho dá»¯ liá»‡u (data warehouse) hoáº·c cÆ¡ sá»Ÿ dá»¯ liá»‡u.
    - **Lá»£i Ã­ch**: Cung cáº¥p cho cÃ¡c nhÃ  phÃ¢n tÃ­ch vÃ  quáº£n lÃ½ dá»¯ liá»‡u má»™t ná»n táº£ng dá»¯ liá»‡u duy nháº¥t Ä‘á»ƒ thá»±c hiá»‡n cÃ¡c phÃ¢n tÃ­ch, bÃ¡o cÃ¡o vÃ  ra quyáº¿t Ä‘á»‹nh.
4. **TÃ­ch há»£p Dá»¯ liá»‡u**:
    
    - **Má»¥c Ä‘Ã­ch**: Káº¿t há»£p dá»¯ liá»‡u tá»« nhiá»u nguá»“n khÃ¡c nhau thÃ nh má»™t báº£n ghi thá»‘ng nháº¥t.
    - **Lá»£i Ã­ch**: GiÃºp tá»• chá»©c cÃ³ cÃ¡i nhÃ¬n toÃ n diá»‡n hÆ¡n vá» dá»¯ liá»‡u cá»§a há» vÃ  cÃ³ kháº£ nÄƒng phÃ¢n tÃ­ch dá»¯ liá»‡u theo nhiá»u chiá»u.
5. **Cáº£i thiá»‡n Quy trÃ¬nh Ra Quyáº¿t Ä‘á»‹nh**:
    
    - **Má»¥c Ä‘Ã­ch**: Cung cáº¥p dá»¯ liá»‡u chÃ­nh xÃ¡c vÃ  ká»‹p thá»i cho cÃ¡c nhÃ  quáº£n lÃ½ vÃ  ngÆ°á»i ra quyáº¿t Ä‘á»‹nh.
    - **Lá»£i Ã­ch**: Dá»¯ liá»‡u Ä‘Æ°á»£c xá»­ lÃ½ vÃ  chuyá»ƒn Ä‘á»•i cÃ³ thá»ƒ giÃºp tá»• chá»©c cÃ³ nhá»¯ng quyáº¿t Ä‘á»‹nh thÃ´ng minh hÆ¡n dá»±a trÃªn thÃ´ng tin rÃµ rÃ ng.
6. **Há»— trá»£ PhÃ¢n tÃ­ch vÃ  BÃ¡o cÃ¡o**:
    
    - **Má»¥c Ä‘Ã­ch**: Cung cáº¥p dá»¯ liá»‡u cho cÃ¡c cÃ´ng cá»¥ phÃ¢n tÃ­ch vÃ  bÃ¡o cÃ¡o.
    - **Lá»£i Ã­ch**: Dá»¯ liá»‡u Ä‘Æ°á»£c táº£i vÃ o kho dá»¯ liá»‡u cÃ³ thá»ƒ Ä‘Æ°á»£c sá»­ dá»¥ng Ä‘á»ƒ táº¡o ra bÃ¡o cÃ¡o, dashboard, vÃ  phÃ¢n tÃ­ch xu hÆ°á»›ng.
7. **Quáº£n lÃ½ Dá»¯ liá»‡u**:
    
    - **Má»¥c Ä‘Ã­ch**: Äáº£m báº£o ráº±ng dá»¯ liá»‡u Ä‘Æ°á»£c quáº£n lÃ½ vÃ  duy trÃ¬ má»™t cÃ¡ch hiá»‡u quáº£.
    - **Lá»£i Ã­ch**: GiÃºp tá»• chá»©c duy trÃ¬ tÃ­nh chÃ­nh xÃ¡c, báº£o máº­t, vÃ  sáºµn cÃ³ cá»§a dá»¯ liá»‡u.
8. **Tá»± Ä‘á»™ng hÃ³a Quy trÃ¬nh**:
    
    - **Má»¥c Ä‘Ã­ch**: Tá»± Ä‘á»™ng hÃ³a quy trÃ¬nh thu tháº­p vÃ  xá»­ lÃ½ dá»¯ liá»‡u.
    - **Lá»£i Ã­ch**: Giáº£m thiá»ƒu sai sÃ³t do con ngÆ°á»i vÃ  tÄƒng cÆ°á»ng hiá»‡u quáº£ trong quy trÃ¬nh xá»­ lÃ½ dá»¯ liá»‡u.

### **Káº¿t luáº­n**

CÃ´ng cá»¥ ETL Ä‘Ã³ng má»™t vai trÃ² quan trá»ng trong viá»‡c quáº£n lÃ½ dá»¯ liá»‡u vÃ  há»— trá»£ quyáº¿t Ä‘á»‹nh trong tá»• chá»©c. Báº±ng cÃ¡ch tá»± Ä‘á»™ng hÃ³a quy trÃ¬nh trÃ­ch xuáº¥t, chuyá»ƒn Ä‘á»•i vÃ  táº£i dá»¯ liá»‡u, cÃ¡c cÃ´ng cá»¥ ETL giÃºp tá»• chá»©c cáº£i thiá»‡n cháº¥t lÆ°á»£ng dá»¯ liá»‡u, tÄƒng cÆ°á»ng kháº£ nÄƒng phÃ¢n tÃ­ch vÃ  ra quyáº¿t Ä‘á»‹nh, vÃ  tá»‘i Æ°u hÃ³a quy trÃ¬nh quáº£n lÃ½ dá»¯ liá»‡u.



[[raw/archive/Area/Data-WareHouse/ITL DataWareHouse/Data warehouse]]


[Qlik Talend Experience](https://tep.us.cloud.talend.com/welcome)


---
# HÆ°á»›ng dáº«n cÃ i Ä‘áº·t Talend Open Studio
- [How to install Talend Open Studio 8.0.1 on Windows](https://www.youtube.com/watch?v=1pwqEbqiUtQ&t=164s)
# Demo
Sau khi báº¡n Ä‘Ã£ cÃ i Ä‘áº·t **Talend Open Studio** vÃ  thá»±c hiá»‡n Ä‘Æ°á»£c viá»‡c hiá»ƒn thá»‹ **message box**, tiáº¿p theo, mÃ¬nh sáº½ hÆ°á»›ng dáº«n báº¡n xá»­ lÃ½ má»™t file CSV Ä‘Æ¡n giáº£n. BÃ i nÃ y sáº½ gá»“m cÃ¡c bÆ°á»›c Ä‘á»ƒ Ä‘á»c dá»¯ liá»‡u tá»« má»™t file CSV, thá»±c hiá»‡n má»™t vÃ i phÃ©p biáº¿n Ä‘á»•i cÆ¡ báº£n vÃ  lÆ°u káº¿t quáº£ vÃ o má»™t file CSV má»›i.

### CÃ¡c bÆ°á»›c thá»±c hiá»‡n:

#### BÆ°á»›c 1: Táº¡o má»™t job má»›i

- Má»Ÿ **Talend Open Studio**.
- Trong **Repository** (khu vá»±c bÃªn trÃ¡i), nháº¥p chuá»™t pháº£i vÃ o **Job Designs**, chá»n **Create Job**.
- Äáº·t tÃªn cho job, vÃ­ dá»¥: `Process_CSV_File`.

#### BÆ°á»›c 2: KÃ©o tháº£ cÃ¡c thÃ nh pháº§n (components) cáº§n thiáº¿t

1. **tFileInputDelimited** (Äá»c file CSV):
    
    - Tá»« pháº§n **Palette**, tÃ¬m thÃ nh pháº§n **tFileInputDelimited** vÃ  kÃ©o tháº£ vÃ o **workspace**.
    - ÄÃ¢y lÃ  thÃ nh pháº§n dÃ¹ng Ä‘á»ƒ Ä‘á»c file CSV.
2. **tMap** (Biáº¿n Ä‘á»•i dá»¯ liá»‡u):
    
    - KÃ©o tháº£ **tMap** vÃ o workspace. ThÃ nh pháº§n nÃ y giÃºp biáº¿n Ä‘á»•i dá»¯ liá»‡u nhÆ° Ä‘á»•i tÃªn cá»™t, gá»™p cá»™t, hoáº·c tÃ­nh toÃ¡n dá»±a trÃªn giÃ¡ trá»‹.
3. **tFileOutputDelimited** (Ghi file CSV má»›i):
    
    - KÃ©o tháº£ **tFileOutputDelimited** vÃ o workspace. ThÃ nh pháº§n nÃ y sáº½ ghi dá»¯ liá»‡u vÃ o má»™t file CSV sau khi biáº¿n Ä‘á»•i.

#### BÆ°á»›c 3: Cáº¥u hÃ¬nh cÃ¡c thÃ nh pháº§n

1. **Cáº¥u hÃ¬nh tFileInputDelimited**:
    
    - Chá»n **tFileInputDelimited**, trong pháº§n **Basic settings** á»Ÿ dÆ°á»›i, báº¡n thá»±c hiá»‡n cÃ¡c cáº¥u hÃ¬nh sau:
        - **File name/Stream**: Chá»‰ Ä‘á»‹nh Ä‘Æ°á»ng dáº«n Ä‘áº¿n file CSV cáº§n xá»­ lÃ½ (VÃ­ dá»¥: `C:/data/input.csv`).
        - **Field Separator**: Náº¿u file CSV cá»§a báº¡n ngÄƒn cÃ¡ch cÃ¡c cá»™t báº±ng dáº¥u pháº©y, nháº­p dáº¥u pháº©y (`,`); náº¿u ngÄƒn cÃ¡ch báº±ng dáº¥u khÃ¡c, báº¡n nháº­p dáº¥u tÆ°Æ¡ng á»©ng.
        - **Header**: Náº¿u file cÃ³ tiÃªu Ä‘á» cá»™t, nháº­p sá»‘ dÃ²ng tiÃªu Ä‘á» (vÃ­ dá»¥: `1`).
        - **Schema**: Nháº¥p vÃ o **Edit schema** Ä‘á»ƒ Ä‘á»‹nh nghÄ©a cáº¥u trÃºc cá»§a file CSV, bao gá»“m tÃªn cá»™t vÃ  kiá»ƒu dá»¯ liá»‡u (vÃ­ dá»¥: tÃªn, tuá»•i, Ä‘á»‹a chá»‰).
2. **Cáº¥u hÃ¬nh tMap**:
    
    - Ná»‘i **tFileInputDelimited** vá»›i **tMap** báº±ng cÃ¡ch nháº¥p chuá»™t pháº£i vÃ o **tFileInputDelimited**, chá»n **Row > Main**, sau Ä‘Ã³ kÃ©o chuá»™t Ä‘á»ƒ ná»‘i Ä‘áº¿n **tMap**.
    - Nháº¥p Ä‘Ãºp chuá»™t vÃ o **tMap** Ä‘á»ƒ má»Ÿ báº£ng thiáº¿t láº­p.
        - Trong tMap, báº¡n sáº½ tháº¥y cá»™t Ä‘áº§u vÃ o á»Ÿ bÃªn trÃ¡i. Báº¡n cÃ³ thá»ƒ kÃ©o cÃ¡c cá»™t nÃ y sang báº£ng Ä‘áº§u ra á»Ÿ bÃªn pháº£i, hoáº·c thá»±c hiá»‡n cÃ¡c phÃ©p tÃ­nh, gá»™p cá»™t.
        - VÃ­ dá»¥: Báº¡n cÃ³ thá»ƒ táº¡o má»™t cá»™t má»›i gá»i lÃ  `FullName` báº±ng cÃ¡ch káº¿t há»£p hai cá»™t `FirstName` vÃ  `LastName` láº¡i vá»›i nhau. Äá»ƒ lÃ m Ä‘iá»u nÃ y, trong pháº§n Output, nháº¥p chuá»™t pháº£i vÃ  chá»n **Create new Output column**, sau Ä‘Ã³ trong **Expression** báº¡n cÃ³ thá»ƒ dÃ¹ng cÃº phÃ¡p:
            
            arduino
            
            Sao chÃ©p mÃ£
            
            `row1.FirstName + " " + row1.LastName`
            
3. **Cáº¥u hÃ¬nh tFileOutputDelimited**:
    
    - Ná»‘i **tMap** vá»›i **tFileOutputDelimited** báº±ng cÃ¡ch nháº¥p chuá»™t pháº£i vÃ o **tMap**, chá»n **Row > Main**, vÃ  kÃ©o Ä‘áº¿n **tFileOutputDelimited**.
    - Chá»n **tFileOutputDelimited** vÃ  cáº¥u hÃ¬nh:
        - **File Name**: Chá»‰ Ä‘á»‹nh Ä‘Æ°á»ng dáº«n Ä‘áº¿n file CSV Ä‘áº§u ra (VÃ­ dá»¥: `C:/data/output.csv`).
        - **Field Separator**: Äáº·t dáº¥u phÃ¢n cÃ¡ch cho cÃ¡c cá»™t trong file má»›i, thÆ°á»ng lÃ  dáº¥u pháº©y (`,`).
        - Báº¡n cÃ³ thá»ƒ chá»n **Include Header** náº¿u muá»‘n ghi láº¡i tiÃªu Ä‘á» cá»™t trong file Ä‘áº§u ra.

#### BÆ°á»›c 4: Cháº¡y job

- Sau khi hoÃ n thÃ nh viá»‡c cáº¥u hÃ¬nh, báº¡n nháº¥p vÃ o nÃºt **Run** á»Ÿ dÆ°á»›i cÃ¹ng Ä‘á»ƒ cháº¡y job.
- Khi job cháº¡y thÃ nh cÃ´ng, nÃ³ sáº½ Ä‘á»c dá»¯ liá»‡u tá»« file CSV ban Ä‘áº§u, biáº¿n Ä‘á»•i dá»¯ liá»‡u (náº¿u cÃ³), vÃ  lÆ°u káº¿t quáº£ vÃ o file CSV má»›i.

#### VÃ­ dá»¥ minh há»a:

Giáº£ sá»­ báº¡n cÃ³ má»™t file CSV **input.csv** vá»›i ná»™i dung nhÆ° sau:

Sao chÃ©p mÃ£

`FirstName,LastName,Age John,Doe,28 Jane,Smith,34`

Sau khi xá»­ lÃ½ vá»›i **tMap** (ná»‘i há» vÃ  tÃªn), káº¿t quáº£ file CSV Ä‘áº§u ra **output.csv** sáº½ trÃ´ng nhÆ° sau:

Sao chÃ©p mÃ£

`FullName,Age John Doe,28 Jane Smith,34`

### Má»™t sá»‘ máº¹o há»¯u Ã­ch:

- Báº¡n cÃ³ thá»ƒ sá»­ dá»¥ng **tMsgBox** Ä‘á»ƒ kiá»ƒm tra giÃ¡ trá»‹ cá»§a cÃ¡c biáº¿n hoáº·c sá»‘ dÃ²ng Ä‘Ã£ xá»­ lÃ½ sau má»—i bÆ°á»›c, Ä‘á»ƒ dá»… dÃ ng gá»¡ lá»—i vÃ  xÃ¡c nháº­n dá»¯ liá»‡u.
- Trong quÃ¡ trÃ¬nh biáº¿n Ä‘á»•i vá»›i **tMap**, báº¡n cÃ³ thá»ƒ thá»±c hiá»‡n nhiá»u phÃ©p tÃ­nh phá»©c táº¡p, bao gá»“m Ä‘iá»u kiá»‡n `if-else`, gá»™p dá»¯ liá»‡u, vÃ  nhiá»u hÆ¡n ná»¯a.

Sau khi náº¯m vá»¯ng cÃ¡c bÆ°á»›c cÆ¡ báº£n nÃ y, báº¡n cÃ³ thá»ƒ Ã¡p dá»¥ng Ä‘á»ƒ xá»­ lÃ½ nhiá»u dáº¡ng dá»¯ liá»‡u khÃ¡c nhau vÃ  káº¿t há»£p thÃªm nhiá»u thÃ nh pháº§n khÃ¡c Ä‘á»ƒ xÃ¢y dá»±ng quy trÃ¬nh ETL máº¡nh máº½ hÆ¡n.
