---
aliases: 
date: 2024-10-24
tags:
  - daily
  - "#ETL_Tool"
  - "#ETL"
  - "#datawarehouse"
---
# CÃ¡c cÃ´ng cá»¥ ETL ([[raw/archive/Area/Data-WareHouse/ITL DataWareHouse/ETL]])
 
## CÃ´ng cá»¥ Talend ETL


| CÃ´ng cá»¥                                         | Giao diá»‡n NgÆ°á»i dÃ¹ng   | NgÃ´n ngá»¯ Láº­p trÃ¬nh  | TÃ­nh nÄƒng Ná»•i báº­t                                  | Kháº£ nÄƒng TÃ­ch há»£p | PhÃ¹ há»£p cho Dá»± Ã¡n Nhá» | PhÃ¹ há»£p cho Dá»± Ã¡n Lá»›n |
| ----------------------------------------------- | ---------------------- | ------------------- | -------------------------------------------------- | ----------------- | --------------------- | --------------------- |
| **Apache Nifi**                                 | Giao diá»‡n kÃ©o-tháº£      | Java, Python        | Luá»“ng dá»¯ liá»‡u theo thá»i gian thá»±c, dá»… dÃ ng quáº£n lÃ½ | Ráº¥t máº¡nh máº½       | CÃ³                    | CÃ³                    |
| <font color="#4bacc6">Talend Open Studio</font> | Giao diá»‡n kÃ©o-tháº£      | Java                | Dá»… sá»­ dá»¥ng, tÃ­ch há»£p vá»›i nhiá»u nguá»“n dá»¯ liá»‡u       | Tá»‘t               | CÃ³                    | CÃ³                    |
| **Apache Airflow**                              | Giao diá»‡n web Ä‘Æ¡n giáº£n | Python              | Láº­p lá»‹ch cÃ´ng viá»‡c, linh hoáº¡t                      | Ráº¥t máº¡nh máº½       | CÃ³                    | CÃ³                    |
| **Pentaho Data Integration**                    | Giao diá»‡n kÃ©o-tháº£      | Java                | Há»— trá»£ nhiá»u loáº¡i nguá»“n dá»¯ liá»‡u                    | Tá»‘t               | CÃ³                    | CÃ³                    |
| **Apache Spark**                                | KhÃ´ng cÃ³ giao diá»‡n     | Scala, Java, Python | Xá»­ lÃ½ dá»¯ liá»‡u lá»›n nhanh chÃ³ng                      | Ráº¥t máº¡nh máº½       | KhÃ³                   | Ráº¥t tá»‘t               |
| **Luigi**                                       | Giao diá»‡n web Ä‘Æ¡n giáº£n | Python              | Quáº£n lÃ½ phá»¥ thuá»™c giá»¯a cÃ¡c tÃ¡c vá»¥                  | Tá»‘t               | CÃ³                    | CÃ³                    |
| **Apache Beam**                                 | KhÃ´ng cÃ³ giao diá»‡n     | Java, Python, Go    | Xá»­ lÃ½ dá»¯ liá»‡u theo lÃ´ vÃ  theo luá»“ng                | Ráº¥t máº¡nh máº½       | CÃ³                    | Ráº¥t tá»‘t               |
| **CloverETL**                                   | Giao diá»‡n kÃ©o-tháº£      | Java                | TÃ­ch há»£p tá»‘t vá»›i nhiá»u há»‡ thá»‘ng khÃ¡c               | Tá»‘t               | CÃ³                    | CÃ³                    |
| **Kettle**                                      | Giao diá»‡n kÃ©o-tháº£      | Java                | Há»— trá»£ quy trÃ¬nh ETL phá»©c táº¡p                      | Tá»‘t               | CÃ³                    | CÃ³                    |
| **Apache Camel**                                | KhÃ´ng cÃ³ giao diá»‡n     | Java                | Äá»‹nh nghÄ©a quy trÃ¬nh tÃ­ch há»£p qua cÃ¡c quy táº¯c      | Ráº¥t máº¡nh máº½       | CÃ³                    | CÃ³                    |

### **So sÃ¡nh chi tiáº¿t:**

1. **Giao diá»‡n NgÆ°á»i dÃ¹ng:**
    
    - **Giao diá»‡n kÃ©o-tháº£**: Apache Nifi, Talend, Pentaho, CloverETL, vÃ  Kettle cung cáº¥p giao diá»‡n trá»±c quan giÃºp ngÆ°á»i dÃ¹ng dá»… dÃ ng thiáº¿t láº­p quy trÃ¬nh ETL mÃ  khÃ´ng cáº§n mÃ£ hÃ³a nhiá»u.
    - **Giao diá»‡n web Ä‘Æ¡n giáº£n**: Apache Airflow vÃ  Luigi cÃ³ giao diá»‡n web, nhÆ°ng khÃ´ng kÃ©o-tháº£, cáº§n má»™t sá»‘ kiáº¿n thá»©c láº­p trÃ¬nh.
    - **KhÃ´ng cÃ³ giao diá»‡n**: Apache Spark vÃ  Apache Beam chá»§ yáº¿u Ä‘Æ°á»£c sá»­ dá»¥ng qua dÃ²ng lá»‡nh hoáº·c mÃ£ nguá»“n, yÃªu cáº§u ngÆ°á»i dÃ¹ng cÃ³ kiáº¿n thá»©c láº­p trÃ¬nh tá»‘t hÆ¡n.
2. **NgÃ´n ngá»¯ Láº­p trÃ¬nh:**
    
    - **Java**: ÄÆ°á»£c sá»­ dá»¥ng rá»™ng rÃ£i trong nhiá»u cÃ´ng cá»¥ nhÆ° Talend, Pentaho, CloverETL vÃ  Kettle.
    - **Python**: ÄÆ°á»£c Æ°u tiÃªn trong Apache Airflow, Luigi vÃ  Apache Beam, thÃ­ch há»£p cho nhá»¯ng ngÆ°á»i quen vá»›i Python.
    - **Scala, Go**: Apache Spark vÃ  Beam há»— trá»£ nhá»¯ng ngÃ´n ngá»¯ nÃ y, thÃ­ch há»£p cho cÃ¡c dá»± Ã¡n lá»›n.
3. **TÃ­nh nÄƒng Ná»•i báº­t:**
    
    - **Luá»“ng Dá»¯ liá»‡u Thá»i gian Thá»±c**: Apache Nifi ná»•i báº­t trong viá»‡c xá»­ lÃ½ luá»“ng dá»¯ liá»‡u.
    - **Láº­p Lá»‹ch CÃ´ng viá»‡c**: Apache Airflow ráº¥t máº¡nh trong viá»‡c láº­p lá»‹ch vÃ  quáº£n lÃ½ phá»¥ thuá»™c giá»¯a cÃ¡c tÃ¡c vá»¥.
    - **Xá»­ lÃ½ Dá»¯ liá»‡u Lá»›n**: Apache Spark ná»•i báº­t vá»›i kháº£ nÄƒng xá»­ lÃ½ nhanh chÃ³ng dá»¯ liá»‡u lá»›n.
4. **Kháº£ nÄƒng TÃ­ch há»£p:**
    
    - Táº¥t cáº£ cÃ¡c cÃ´ng cá»¥ Ä‘á»u há»— trá»£ tÃ­ch há»£p vá»›i nhiá»u há»‡ thá»‘ng vÃ  nguá»“n dá»¯ liá»‡u, nhÆ°ng Apache Nifi, Apache Beam, vÃ  Apache Camel ná»•i báº­t hÆ¡n vá»›i kháº£ nÄƒng tÃ­ch há»£p linh hoáº¡t.
5. **PhÃ¹ há»£p cho Dá»± Ã¡n Nhá» vÃ  Lá»›n:**
    
    - CÃ¡c cÃ´ng cá»¥ nhÆ° Talend, Pentaho, vÃ  Apache Nifi thÃ­ch há»£p cho cáº£ dá»± Ã¡n nhá» vÃ  lá»›n, trong khi Apache Spark vÃ  Beam thÆ°á»ng Ä‘Æ°á»£c khuyáº¿n nghá»‹ cho cÃ¡c dá»± Ã¡n lá»›n vá»›i khá»‘i lÆ°á»£ng dá»¯ liá»‡u lá»›n.

### **Káº¿t luáº­n:**

Lá»±a chá»n cÃ´ng cá»¥ ETL phÃ¹ há»£p sáº½ phá»¥ thuá»™c vÃ o yÃªu cáº§u cá»¥ thá»ƒ cá»§a dá»± Ã¡n cá»§a báº¡n, bao gá»“m khá»‘i lÆ°á»£ng dá»¯ liá»‡u, ngÃ´n ngá»¯ láº­p trÃ¬nh Æ°a thÃ­ch, vÃ  kháº£ nÄƒng tÃ­ch há»£p vá»›i cÃ¡c há»‡ thá»‘ng khÃ¡c. Hy vá»ng báº£ng so sÃ¡nh trÃªn sáº½ giÃºp báº¡n dá»… dÃ ng hÆ¡n trong viá»‡c lá»±a chá»n!

---
Äá»ƒ thÃªm pháº§n lá»±a chá»n cÃ´ng cá»¥ ETL trÆ°á»›c khi báº¯t Ä‘áº§u **Pháº§n 1 (Talend Open Studio)**, báº¡n cÃ³ thá»ƒ liá»‡t kÃª 3 cÃ´ng cá»¥ mÃ£ nguá»“n má»Ÿ phá»• biáº¿n. Sau khi lá»±a chá»n, quy trÃ¬nh sáº½ Ä‘i vÃ o chi tiáº¿t cá»§a cÃ´ng cá»¥ Ä‘Ã£ chá»n (vÃ­ dá»¥: **Talend Open Studio**). DÆ°á»›i Ä‘Ã¢y lÃ  mÃ´ táº£ chi tiáº¿t tá»«ng bÆ°á»›c Ä‘Æ°á»£c cáº­p nháº­t Ä‘á»ƒ báº¡n cÃ³ thá»ƒ dá»… dÃ ng Ä‘Æ°a vÃ o flowchart.

---

### **Pháº§n lá»±a chá»n cÃ´ng cá»¥ ETL (BÆ°á»›c trÆ°á»›c khi vÃ o pháº§n xá»­ lÃ½ dá»¯ liá»‡u vá»›i Talend Open Studio)**

#### **BÆ°á»›c: Lá»±a chá»n cÃ´ng cá»¥ ETL**
   - **Má»¥c tiÃªu**: Cho phÃ©p nhÃ¢n viÃªn ká»¹ thuáº­t chá»n má»™t trong cÃ¡c cÃ´ng cá»¥ ETL mÃ£ nguá»“n má»Ÿ Ä‘á»ƒ thá»±c hiá»‡n quy trÃ¬nh trÃ­ch xuáº¥t, chuyá»ƒn Ä‘á»•i vÃ  náº¡p dá»¯ liá»‡u (ETL).
   - **Thao tÃ¡c**:
     - Danh sÃ¡ch 3 cÃ´ng cá»¥ ETL mÃ£ nguá»“n má»Ÿ phá»• biáº¿n:
       1. **Talend Open Studio**: Phá»• biáº¿n vá»›i giao diá»‡n kÃ©o-tháº£, dá»… sá»­ dá»¥ng vÃ  há»— trá»£ nhiá»u loáº¡i nguá»“n dá»¯ liá»‡u.
       2. **Apache Nifi**: TÃ­ch há»£p tá»‘t cho cÃ¡c há»‡ thá»‘ng xá»­ lÃ½ dá»¯ liá»‡u theo dÃ²ng thá»i gian thá»±c, phÃ¹ há»£p cho mÃ´i trÆ°á»ng yÃªu cáº§u Ä‘á»™ pháº£n há»“i nhanh.
       3. **Pentaho Data Integration** (PDI): Táº­p trung vÃ o xá»­ lÃ½ dá»¯ liá»‡u ETL vá»›i giao diá»‡n thÃ¢n thiá»‡n vÃ  dá»… cáº¥u hÃ¬nh.
     - Sau khi lá»±a chá»n cÃ´ng cá»¥, ngÆ°á»i dÃ¹ng sáº½ Ä‘i vÃ o quy trÃ¬nh chi tiáº¿t cá»§a cÃ´ng cá»¥ Ä‘Ã£ chá»n (vÃ­ dá»¥: Talend Open Studio).

---

### **Pháº§n 1: Talend Open Studio (NhÃ¢n viÃªn ká»¹ thuáº­t tiáº¿n hÃ nh xá»­ lÃ½)**

#### **BÆ°á»›c 1: TrÃ­ch xuáº¥t dá»¯ liá»‡u tá»« cÃ¡c nguá»“n**
   - **Má»¥c tiÃªu**: Thu tháº­p dá»¯ liá»‡u tá»« cÃ¡c nguá»“n khÃ¡c nhau nhÆ° cÆ¡ sá»Ÿ dá»¯ liá»‡u (SQL, NoSQL), file (CSV, Excel), API hoáº·c cÃ¡c há»‡ thá»‘ng khÃ¡c.
   - **Thao tÃ¡c**:
     - Sá»­ dá»¥ng component nhÆ° `tMySQLInput`, `tFileInputDelimited`, `tRESTClient`, v.v.
     - Thiáº¿t láº­p káº¿t ná»‘i vá»›i cÃ¡c nguá»“n dá»¯ liá»‡u.
     - TrÃ­ch xuáº¥t dá»¯ liá»‡u cáº§n thiáº¿t Ä‘á»ƒ chuáº©n bá»‹ xá»­ lÃ½.

#### **BÆ°á»›c 2: Xá»­ lÃ½ vÃ  chuyá»ƒn Ä‘á»•i dá»¯ liá»‡u**
   - **Má»¥c tiÃªu**: LÃ m sáº¡ch vÃ  chuyá»ƒn Ä‘á»•i dá»¯ liá»‡u Ä‘á»ƒ Ä‘áº£m báº£o nÃ³ Ä‘Ãºng chuáº©n vÃ  sáºµn sÃ ng Ä‘á»ƒ náº¡p lÃªn Data Warehouse.
   - **Thao tÃ¡c**:
     - DÃ¹ng cÃ¡c component nhÆ° `tMap`, `tFilterRow`, `tNormalize`, `tAggregateRow` Ä‘á»ƒ:
       - LÃ m sáº¡ch dá»¯ liá»‡u (xÃ³a bá» giÃ¡ trá»‹ trÃ¹ng láº·p, thiáº¿u, hoáº·c khÃ´ng há»£p lá»‡).
       - Chuyá»ƒn Ä‘á»•i Ä‘á»‹nh dáº¡ng ngÃ y thÃ¡ng, sá»‘ liá»‡u, hoáº·c tÃ­nh toÃ¡n cÃ¡c chá»‰ sá»‘ cáº§n thiáº¿t cho bÃ¡o cÃ¡o.
     - Chuyá»ƒn Ä‘á»•i dá»¯ liá»‡u theo yÃªu cáº§u bÃ¡o cÃ¡o (tá»•ng há»£p, tÃ­nh toÃ¡n cÃ¡c trÆ°á»ng cáº§n thiáº¿t).

#### **BÆ°á»›c 3: Xuáº¥t dá»¯ liá»‡u thÃ nh Ä‘á»‹nh dáº¡ng phÃ¹ há»£p**

- **Má»¥c tiÃªu**: Äá»‹nh dáº¡ng dá»¯ liá»‡u cho viá»‡c náº¡p vÃ o Data Warehouse hoáº·c xuáº¥t ra cÃ¡c Ä‘á»‹nh dáº¡ng khÃ¡c phÃ¹ há»£p vá»›i há»‡ thá»‘ng Ä‘Ã­ch.
- **Thao tÃ¡c**:
    - Náº¿u náº¡p vÃ o Data Warehouse, dá»¯ liá»‡u pháº£i Ä‘Æ°á»£c Ä‘á»‹nh dáº¡ng phÃ¹ há»£p vá»›i yÃªu cáº§u cá»§a há»‡ thá»‘ng.
    - CÃ¡c Ä‘á»‹nh dáº¡ng phá»• biáº¿n bao gá»“m:
        - **Data Warehouse**: LÃ  Ä‘áº§u ra phá»• biáº¿n cho má»¥c Ä‘Ã­ch bÃ¡o cÃ¡o vÃ  phÃ¢n tÃ­ch dá»¯ liá»‡u. Talend cÃ³ thá»ƒ náº¡p dá»¯ liá»‡u vÃ o cÃ¡c kho dá»¯ liá»‡u lá»›n nhÆ° Amazon Redshift, Google BigQuery, hoáº·c Snowflake.
        - **JSON File**: Phá»• biáº¿n khi lÃ m viá»‡c vá»›i API hoáº·c lÆ°u trá»¯ dá»¯ liá»‡u NoSQL. Báº¡n cÃ³ thá»ƒ sá»­ dá»¥ng JSON Ä‘á»ƒ gá»­i dá»¯ liá»‡u Ä‘áº¿n cÃ¡c dá»‹ch vá»¥ web hoáº·c á»©ng dá»¥ng web khÃ¡c.
        - **CSV hoáº·c Excel**: DÃ nh cho viá»‡c chia sáº» dá»¯ liá»‡u vá»›i ngÆ°á»i dÃ¹ng cuá»‘i hoáº·c phÃ¢n tÃ­ch ngoáº¡i tuyáº¿n. CSV hoáº·c Excel lÃ  Ä‘á»‹nh dáº¡ng phá»• biáº¿n cho cÃ¡c bÃ¡o cÃ¡o Ä‘Æ°á»£c lÆ°u trá»¯ trÃªn há»‡ thá»‘ng hoáº·c gá»­i qua email.
        - **CÆ¡ sá»Ÿ dá»¯ liá»‡u SQL**: DÃ nh cho cÃ¡c á»©ng dá»¥ng cáº§n truy xuáº¥t trá»±c tiáº¿p tá»« cÆ¡ sá»Ÿ dá»¯ liá»‡u. Báº¡n cÃ³ thá»ƒ náº¡p dá»¯ liá»‡u Ä‘Ã£ xá»­ lÃ½ vÃ o cÆ¡ sá»Ÿ dá»¯ liá»‡u SQL nhÆ° MySQL, PostgreSQL, hoáº·c SQL Server Ä‘á»ƒ tÃ­ch há»£p vá»›i cÃ¡c há»‡ thá»‘ng khÃ¡c.
        - **XML File**: Khi tÆ°Æ¡ng tÃ¡c vá»›i cÃ¡c há»‡ thá»‘ng yÃªu cáº§u dá»¯ liá»‡u á»Ÿ Ä‘á»‹nh dáº¡ng XML. ÄÃ¢y lÃ  Ä‘á»‹nh dáº¡ng phá»• biáº¿n trong cÃ¡c há»‡ thá»‘ng cÅ© hoáº·c khi báº¡n cáº§n tÃ­ch há»£p vá»›i cÃ¡c dá»‹ch vá»¥ web yÃªu cáº§u XML.
#### **BÆ°á»›c 4: Náº¡p dá»¯ liá»‡u lÃªn Data Warehouse**
   - **Má»¥c tiÃªu**: Náº¡p dá»¯ liá»‡u Ä‘Ã£ qua xá»­ lÃ½ lÃªn Data Warehouse Ä‘á»ƒ sáºµn sÃ ng cho cÃ¡c truy xuáº¥t vÃ  bÃ¡o cÃ¡o.
   - **Thao tÃ¡c**:
     - Sá»­ dá»¥ng cÃ¡c component nhÆ° `tRedshiftOutput`, `tBigQueryOutput`, `tSnowflakeOutput` Ä‘á»ƒ káº¿t ná»‘i vÃ  náº¡p dá»¯ liá»‡u vÃ o Data Warehouse.
     - Äáº£m báº£o ráº±ng dá»¯ liá»‡u Ä‘Æ°á»£c náº¡p vÃ o Ä‘Ãºng báº£ng, Ä‘Ãºng Ä‘á»‹nh dáº¡ng, vÃ  sáºµn sÃ ng Ä‘á»ƒ há»‡ thá»‘ng web truy xuáº¥t.

#### **BÆ°á»›c 5: Láº­p lá»‹ch tá»± Ä‘á»™ng hÃ³a**
   - **Má»¥c tiÃªu**: Tá»± Ä‘á»™ng hÃ³a quy trÃ¬nh ETL Ä‘á»ƒ dá»¯ liá»‡u trong Data Warehouse luÃ´n Ä‘Æ°á»£c cáº­p nháº­t.
   - **Thao tÃ¡c**:
     - Sá»­ dá»¥ng tÃ­nh nÄƒng láº­p lá»‹ch cá»§a Talend Ä‘á»ƒ tá»± Ä‘á»™ng cháº¡y cÃ¡c job ETL hÃ ng ngÃ y, hÃ ng tuáº§n, hoáº·c theo yÃªu cáº§u cá»¥ thá»ƒ.
     - Äiá»u nÃ y giÃºp Ä‘áº£m báº£o dá»¯ liá»‡u bÃ¡o cÃ¡o luÃ´n chÃ­nh xÃ¡c vÃ  má»›i nháº¥t.

---

### **Pháº§n 2: Thá»±c hiá»‡n bÃ¡o cÃ¡o trÃªn web (Táº¡o bÃ¡o cÃ¡o tá»± Ä‘á»™ng báº±ng kÃ©o tháº£)**

#### **BÆ°á»›c 1: Truy xuáº¥t dá»¯ liá»‡u tá»« Data Warehouse**
   - **Má»¥c tiÃªu**: Láº¥y dá»¯ liá»‡u Ä‘Ã£ Ä‘Æ°á»£c náº¡p vÃ o Data Warehouse bá»Ÿi Talend Ä‘á»ƒ sá»­ dá»¥ng cho viá»‡c táº¡o bÃ¡o cÃ¡o.
   - **Thao tÃ¡c**:
     - Sá»­ dá»¥ng Web API hoáº·c káº¿t ná»‘i trá»±c tiáº¿p Ä‘áº¿n Data Warehouse Ä‘á»ƒ truy xuáº¥t dá»¯ liá»‡u Ä‘Ã£ Ä‘Æ°á»£c xá»­ lÃ½.
     - API truy xuáº¥t dá»¯ liá»‡u theo cÃ¡c tiÃªu chÃ­ bÃ¡o cÃ¡o cáº§n thiáº¿t, nhÆ° doanh sá»‘, sá»‘ lÆ°á»£ng nhÃ¢n viÃªn, hoáº·c cÃ¡c chá»‰ sá»‘ khÃ¡c.

#### **BÆ°á»›c 2: Táº¡o bÃ¡o cÃ¡o trÃªn giao diá»‡n web**
   - **Má»¥c tiÃªu**: Cho phÃ©p ngÆ°á»i dÃ¹ng khÃ´ng cÃ³ ká»¹ thuáº­t táº¡o bÃ¡o cÃ¡o báº±ng cÃ¡ch kÃ©o tháº£ cÃ¡c thÃ nh pháº§n trÃªn giao diá»‡n.
   - **Thao tÃ¡c**:
     - NgÆ°á»i dÃ¹ng sá»­ dá»¥ng giao diá»‡n kÃ©o tháº£ (drag-and-drop) trÃªn há»‡ thá»‘ng web Ä‘á»ƒ chá»n cÃ¡c trÆ°á»ng dá»¯ liá»‡u, chá»‰ sá»‘ cáº§n bÃ¡o cÃ¡o.
     - Káº¿t há»£p cÃ¡c trÆ°á»ng dá»¯ liá»‡u Ä‘Ã£ truy xuáº¥t tá»« Data Warehouse Ä‘á»ƒ hiá»ƒn thá»‹ dÆ°á»›i dáº¡ng báº£ng, biá»ƒu Ä‘á»“, hoáº·c Ä‘á»“ thá»‹.
     - CÃ´ng cá»¥ bÃ¡o cÃ¡o tá»± Ä‘á»™ng cáº­p nháº­t dá»¯ liá»‡u tá»« Data Warehouse mÃ  khÃ´ng cáº§n can thiá»‡p ká»¹ thuáº­t.

#### **BÆ°á»›c 3: TÃ¹y chá»‰nh bÃ¡o cÃ¡o**
   - **Má»¥c tiÃªu**: Cho phÃ©p ngÆ°á»i dÃ¹ng tÃ¹y chá»‰nh cÃ¡ch hiá»ƒn thá»‹ bÃ¡o cÃ¡o theo nhu cáº§u cÃ¡ nhÃ¢n.
   - **Thao tÃ¡c**:
     - NgÆ°á»i dÃ¹ng cÃ³ thá»ƒ thay Ä‘á»•i loáº¡i biá»ƒu Ä‘á»“ (vÃ­ dá»¥: biá»ƒu Ä‘á»“ cá»™t, biá»ƒu Ä‘á»“ trÃ²n) hoáº·c cÃ¡ch sáº¯p xáº¿p dá»¯ liá»‡u.
     - ThÃªm cÃ¡c bá»™ lá»c Ä‘á»ƒ tÃ¹y chá»‰nh hiá»ƒn thá»‹ (vÃ­ dá»¥: lá»c theo thá»i gian, phÃ²ng ban, hoáº·c khu vá»±c Ä‘á»‹a lÃ½).

#### **BÆ°á»›c 4: LÆ°u vÃ  chia sáº» bÃ¡o cÃ¡o**
   - **Má»¥c tiÃªu**: Sau khi táº¡o bÃ¡o cÃ¡o, ngÆ°á»i dÃ¹ng cÃ³ thá»ƒ lÆ°u vÃ  chia sáº» bÃ¡o cÃ¡o vá»›i cÃ¡c Ä‘á»“ng nghiá»‡p.
   - **Thao tÃ¡c**:
     - NgÆ°á»i dÃ¹ng cÃ³ thá»ƒ lÆ°u bÃ¡o cÃ¡o dÆ°á»›i dáº¡ng file PDF, Excel, hoáº·c táº¡o liÃªn káº¿t trá»±c tiáº¿p Ä‘á»ƒ chia sáº».
     - Há»‡ thá»‘ng web cho phÃ©p xuáº¥t bÃ¡o cÃ¡o ra cÃ¡c Ä‘á»‹nh dáº¡ng phá»• biáº¿n hoáº·c gá»­i email bÃ¡o cÃ¡o Ä‘áº¿n nhá»¯ng ngÆ°á»i khÃ¡c.

#### **BÆ°á»›c 5: Tá»± Ä‘á»™ng hÃ³a viá»‡c cáº­p nháº­t bÃ¡o cÃ¡o**
   - **Má»¥c tiÃªu**: Tá»± Ä‘á»™ng cáº­p nháº­t bÃ¡o cÃ¡o theo lá»‹ch Ä‘á»‹nh sáºµn.
   - **Thao tÃ¡c**:
     - NgÆ°á»i dÃ¹ng cÃ³ thá»ƒ thiáº¿t láº­p lá»‹ch Ä‘á»ƒ bÃ¡o cÃ¡o tá»± Ä‘á»™ng cáº­p nháº­t theo chu ká»³ (hÃ ng ngÃ y, hÃ ng tuáº§n, hÃ ng thÃ¡ng).
     - Há»‡ thá»‘ng sáº½ tá»± Ä‘á»™ng kÃ©o dá»¯ liá»‡u má»›i nháº¥t tá»« Data Warehouse vÃ  hiá»ƒn thá»‹ bÃ¡o cÃ¡o Ä‘Æ°á»£c cáº­p nháº­t mÃ  khÃ´ng cáº§n can thiá»‡p thá»§ cÃ´ng.

---

### Tá»•ng káº¿t cho flowchart:

- **Pháº§n lá»±a chá»n cÃ´ng cá»¥ ETL**: NgÆ°á»i dÃ¹ng lá»±a chá»n má»™t trong cÃ¡c cÃ´ng cá»¥ mÃ£ nguá»“n má»Ÿ Ä‘á»ƒ tiáº¿n hÃ nh xá»­ lÃ½ ETL.
- **Pháº§n 1 (Talend Open Studio)**: CÃ¡c bÆ°á»›c trong quy trÃ¬nh ETL tá»« trÃ­ch xuáº¥t, xá»­ lÃ½, chuyá»ƒn Ä‘á»•i vÃ  náº¡p dá»¯ liá»‡u lÃªn Data Warehouse.
- **Pháº§n 2 (Thá»±c hiá»‡n bÃ¡o cÃ¡o trÃªn web)**: Truy xuáº¥t dá»¯ liá»‡u tá»« Data Warehouse, sau Ä‘Ã³ sá»­ dá»¥ng giao diá»‡n kÃ©o tháº£ Ä‘á»ƒ táº¡o, tÃ¹y chá»‰nh, vÃ  tá»± Ä‘á»™ng cáº­p nháº­t bÃ¡o cÃ¡o.

Flowchart sáº½ phÃ¢n biá»‡t rÃµ rÃ ng ba pháº§n nÃ y, giÃºp dá»… dÃ ng hÃ¬nh dung quy trÃ¬nh tá»•ng thá»ƒ.

---

### Tá»•ng káº¿t cho flowchart:

- **Pháº§n 1 (Talend Open Studio)**: CÃ¡c bÆ°á»›c trong quy trÃ¬nh ETL tá»« trÃ­ch xuáº¥t, xá»­ lÃ½, chuyá»ƒn Ä‘á»•i vÃ  náº¡p dá»¯ liá»‡u lÃªn Data Warehouse.
- **Pháº§n 2 (Thá»±c hiá»‡n bÃ¡o cÃ¡o trÃªn web)**: Truy xuáº¥t dá»¯ liá»‡u tá»« Data Warehouse, sau Ä‘Ã³ sá»­ dá»¥ng giao diá»‡n kÃ©o tháº£ Ä‘á»ƒ táº¡o, tÃ¹y chá»‰nh, vÃ  tá»± Ä‘á»™ng cáº­p nháº­t bÃ¡o cÃ¡o.
- Link flowchart : https://whimsical.com/quy-trinh-talend-open-studio-va-tao-bao-cao-tren-web-HMvup6S8MuJ6fFuA6VsM2b

Flowchart sáº½ phÃ¢n biá»‡t rÃµ rÃ ng hai pháº§n nÃ y, vá»›i má»—i pháº§n Ä‘Æ°á»£c káº¿t ná»‘i thÃ´ng qua Data Warehouse, nÆ¡i dá»¯ liá»‡u sau khi xá»­ lÃ½ sáº½ Ä‘Æ°á»£c sá»­ dá»¥ng cho bÃ¡o cÃ¡o trÃªn web.

[[raw/archive/Area/Data-WareHouse/ITL DataWareHouse/So sÃ¡nh cÃ¡c cÃ´ng cá»¥ ETL]]
![[Pasted image 20241024162700.png]]
