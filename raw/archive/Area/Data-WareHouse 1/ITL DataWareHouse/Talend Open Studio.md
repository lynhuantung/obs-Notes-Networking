---
aliases: 
date: 2024-10-25
tags:
  - daily
  - "#Talend-Open-Studio"
Link: "[[raw/archive/Area/Data-WareHouse 1/ITL DataWareHouse/ETL]]"
---
- Káº¿t ná»‘i sql 
[How to Connect SQL Server with Talend Open Studio 8](https://www.youtube.com/watch?v=lP5xA4oDNP4)
- Split 1 table sang nhiá»u
[(1) Split a Table with Talend Open Studio - YouTube](https://www.youtube.com/watch?v=Ki9vz6cDisc)
![[Pasted image 20241025153630.png]]
- ÄÆ°á»ng dáº«n cháº¡y file : F:\ETL\TOS_BD-20211109_1610-V8.0.1\TOS_BD-20211109_1610-V8.0.1

![[Pasted image 20241025153431.png]]
Trong **Talend Open Studio**, cÃ¡c thÃ nh pháº§n nhÆ° `TdbInput`, `tMap`, vÃ  `tLogRow` Ä‘Æ°á»£c sá»­ dá»¥ng Ä‘á»ƒ xá»­ lÃ½ vÃ  truyá»n táº£i dá»¯ liá»‡u giá»¯a cÃ¡c bÆ°á»›c cá»§a quy trÃ¬nh ETL (Extract, Transform, Load). ÄÃ¢y lÃ  giáº£i thÃ­ch ngáº¯n gá»n cho tá»«ng thÃ nh pháº§n:

1. **TdbInput_1**:
   - ÄÃ¢y lÃ  thÃ nh pháº§n Ä‘áº§u vÃ o káº¿t ná»‘i vá»›i cÆ¡ sá»Ÿ dá»¯ liá»‡u (DB) Ä‘á»ƒ truy xuáº¥t dá»¯ liá»‡u. `TdbInput` láº¥y dá»¯ liá»‡u tá»« má»™t báº£ng hoáº·c truy váº¥n SQL.
   - VÃ­ dá»¥: Láº¥y táº¥t cáº£ dá»¯ liá»‡u tá»« báº£ng khÃ¡ch hÃ ng Ä‘á»ƒ xá»­ lÃ½.

2. **tMap_1**:
   - ÄÃ¢y lÃ  thÃ nh pháº§n Ä‘Æ°á»£c sá»­ dá»¥ng Ä‘á»ƒ Ã¡nh xáº¡ (mapping) vÃ  biáº¿n Ä‘á»•i dá»¯ liá»‡u. Báº¡n cÃ³ thá»ƒ káº¿t há»£p, lá»c, vÃ  chuyá»ƒn Ä‘á»•i dá»¯ liá»‡u tá»« cÃ¡c nguá»“n khÃ¡c nhau.
   - VÃ­ dá»¥: Ãnh xáº¡ dá»¯ liá»‡u tá»« báº£ng khÃ¡ch hÃ ng vÃ  báº£ng Ä‘Æ¡n hÃ ng Ä‘á»ƒ káº¿t há»£p thÃ´ng tin khÃ¡ch hÃ ng vá»›i cÃ¡c giao dá»‹ch mua hÃ ng.

3. **tLogRow_1**:
   - ÄÃ¢y lÃ  thÃ nh pháº§n dÃ¹ng Ä‘á»ƒ in káº¿t quáº£ ra console hoáº·c log file dÆ°á»›i dáº¡ng báº£ng Ä‘á»ƒ kiá»ƒm tra káº¿t quáº£ cá»§a quÃ¡ trÃ¬nh xá»­ lÃ½ dá»¯ liá»‡u.
   - VÃ­ dá»¥: In ra dá»¯ liá»‡u sau khi Ä‘Ã£ Ä‘Æ°á»£c chuyá»ƒn Ä‘á»•i bá»Ÿi `tMap_1` Ä‘á»ƒ xem xÃ©t dá»¯ liá»‡u trÆ°á»›c khi táº£i lÃªn.
4. tdbOutput_1:
 - **`tDBOutput`** lÃ  thÃ nh pháº§n chá»‹u trÃ¡ch nhiá»‡m **ghi dá»¯ liá»‡u** vÃ o cÆ¡ sá»Ÿ dá»¯ liá»‡u. NÃ³ thÆ°á»ng Ä‘Æ°á»£c sá»­ dá»¥ng khi báº¡n muá»‘n nháº­p dá»¯ liá»‡u tá»« má»™t nguá»“n khÃ¡c vÃ o má»™t báº£ng trong cÆ¡ sá»Ÿ dá»¯ liá»‡u.

Ba thÃ nh pháº§n nÃ y thÆ°á»ng Ä‘Æ°á»£c káº¿t ná»‘i theo thá»© tá»± Ä‘á»ƒ láº¥y dá»¯ liá»‡u tá»« cÆ¡ sá»Ÿ dá»¯ liá»‡u (`TdbInput`), biáº¿n Ä‘á»•i vÃ  xá»­ lÃ½ nÃ³ (`tMap`), vÃ  cuá»‘i cÃ¹ng hiá»ƒn thá»‹ hoáº·c log dá»¯ liá»‡u (`tLogRow`).

# cáº¥u hÃ¬nh db
---
encrypt=true;trustServerCertificate=true;

## Cháº¡y scheduler task tren talend open studio
---
-  Sá»­ dá»¥ng Talend Job Scheduler (dÃ nh cho phiÃªn báº£n tráº£ phÃ­)
## Cháº¡y scheduler task tren talend open studio (báº£n miá»…n phÃ­)
---
Dá»±a vÃ o áº£nh báº¡n cung cáº¥p, mÃ¬nh sáº½ hÆ°á»›ng dáº«n tá»«ng bÆ°á»›c chi tiáº¿t Ä‘á»ƒ xuáº¥t job trong **Talend Open Studio** dÆ°á»›i dáº¡ng **file .bat** (dÃ nh cho Windows). DÆ°á»›i Ä‘Ã¢y lÃ  cÃ¡c bÆ°á»›c thá»±c hiá»‡n:
![[Pasted image 20241025161852.png]]

### BÆ°á»›c 1: Má»Ÿ job trong Talend Open Studio
- Má»Ÿ **Talend Open Studio** vÃ  chá»n job mÃ  báº¡n muá»‘n xuáº¥t (nhÆ° báº¡n Ä‘Ã£ lÃ m trong áº£nh).
- Tá»« má»¥c **Job Designs** trong **Repository** (gÃ³c trÃ¡i), nháº¥p chuá»™t pháº£i vÃ o job cáº§n xuáº¥t, nhÆ° trong áº£nh, báº¡n Ä‘Ã£ chá»n job **`demo_db_Procedure_0.1`**.

### BÆ°á»›c 2: Chá»n **Build Job**
- Sau khi nháº¥p chuá»™t pháº£i vÃ o job, chá»n **Build Job** (nhÆ° trong áº£nh á»Ÿ má»¥c **2**).
  - **LÆ°u Ã½**: TÃ¹y chá»n **Build Job** sáº½ táº¡o ra file **`.bat`** náº¿u báº¡n chá»n Ä‘Ãºng kiá»ƒu build cho Windows.

### BÆ°á»›c 3: Cáº¥u hÃ¬nh xuáº¥t file
- Trong cá»­a sá»• **Build Job** (hiá»‡n lÃªn sau khi chá»n Build Job), lÃ m theo cÃ¡c bÆ°á»›c sau:
  1. **Destination Folder**:
     - á»ž má»¥c **To archive file**, nháº¥n **Browse...** Ä‘á»ƒ chá»n thÆ° má»¥c lÆ°u file **`.bat`**. Báº¡n cÃ³ thá»ƒ chá»n báº¥t ká»³ thÆ° má»¥c nÃ o trÃªn mÃ¡y tÃ­nh (trong áº£nh báº¡n Ä‘ang chá»n thÆ° má»¥c trong á»• Ä‘Ä©a F:).
     - File sáº½ Ä‘Æ°á»£c xuáº¥t thÃ nh dáº¡ng `.zip` chá»©a file **`.bat`** cÃ¹ng cÃ¡c thÆ° viá»‡n cáº§n thiáº¿t.
  
  2. **Build Type**:
     - á»ž má»¥c **Select the build type**, chá»n **Standalone Job**. ÄÃ¢y lÃ  tÃ¹y chá»n Ä‘á»ƒ xuáº¥t job Ä‘á»™c láº­p, cho phÃ©p cháº¡y bÃªn ngoÃ i Talend.
  
  3. **Shell launcher**:
     - á»ž má»¥c **Shell launcher**, chá»n **Windows** (nhÆ° trong áº£nh á»Ÿ má»¥c **3**). Äiá»u nÃ y sáº½ xuáº¥t job dÆ°á»›i dáº¡ng file **`.bat`** dÃ nh cho Windows.

  4. **Java Sources** (tÃ¹y chá»n):
     - Náº¿u báº¡n khÃ´ng cáº§n mÃ£ nguá»“n Java cá»§a job, cÃ³ thá»ƒ bá» chá»n má»¥c **Java sources**.

### BÆ°á»›c 4: HoÃ n táº¥t xuáº¥t file `.bat`
- Sau khi báº¡n Ä‘Ã£ cáº¥u hÃ¬nh xong, nháº¥p vÃ o nÃºt **Finish** (nhÆ° trong áº£nh á»Ÿ dÆ°á»›i cÃ¹ng bÃªn pháº£i).
- Talend sáº½ táº¡o file **.bat** vÃ  cÃ¡c file cáº§n thiáº¿t trong thÆ° má»¥c báº¡n Ä‘Ã£ chá»n. File **`.bat`** sáº½ náº±m trong file nÃ©n **`.zip`**.

### BÆ°á»›c 5: Giáº£i nÃ©n file vÃ  cháº¡y thá»­ file `.bat`
1. **Giáº£i nÃ©n file**:
   - Sau khi Talend xuáº¥t file thÃ nh cÃ´ng, tÃ¬m file **.zip** trong thÆ° má»¥c mÃ  báº¡n Ä‘Ã£ chá»n vÃ  giáº£i nÃ©n nÃ³.
   - Báº¡n sáº½ tháº¥y file **`.bat`** cÃ¹ng vá»›i cÃ¡c thÆ° viá»‡n cáº§n thiáº¿t trong thÆ° má»¥c **lib**.
   ![[Pasted image 20241025161947.png]]

2. **Cháº¡y thá»­ file `.bat`**:
   - Nháº¥p Ä‘Ãºp vÃ o file **`.bat`** Ä‘á»ƒ cháº¡y job.
   - Má»™t cá»­a sá»• **Command Prompt** sáº½ hiá»‡n lÃªn vÃ  job cá»§a báº¡n sáº½ báº¯t Ä‘áº§u cháº¡y.

### TÃ³m táº¯t cÃ¡c bÆ°á»›c:
1. Nháº¥p chuá»™t pháº£i vÃ o job trong **Repository** > **Job Designs** vÃ  chá»n **Build Job**.
2. Chá»n thÆ° má»¥c lÆ°u trá»¯ file vÃ  chá»n **Standalone Job** vá»›i **Shell launcher** lÃ  **Windows**.
3. Nháº¥p **Finish** Ä‘á»ƒ Talend xuáº¥t file `.bat`.
4. Giáº£i nÃ©n file **.zip**, sau Ä‘Ã³ cháº¡y file **`.bat`** Ä‘á»ƒ cháº¡y job.

Sau khi hoÃ n táº¥t, báº¡n cÃ³ thá»ƒ sá»­ dá»¥ng **Task Scheduler** cá»§a Windows Ä‘á»ƒ lÃªn lá»‹ch cháº¡y tá»± Ä‘á»™ng file **`.bat`**. 
