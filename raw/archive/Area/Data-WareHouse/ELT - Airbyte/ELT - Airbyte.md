---
aliases: 
date: 2024-10-26
tags:
  - daily
  - "#airbyte"
  - "#ELT"
HÆ°á»›ng dáº«n káº¿t ná»‘i sql server: https://www.youtube.com/watch?v=2FvMa7vaxDY
Link demo airbyte: https://demo.airbyte.com/workspaces/831c25f5-5f54-42dc-ac2b-dc338eaba843/connections/new-connection?sourceType=new&sourceDefinitionId=b5ea17b1-f170-46dc-bc31-cc744ca984c1
---
## Tá»•ng quan cÃ¡ch sá»­ dá»¥ng Airbyte
---
DÆ°á»›i Ä‘Ã¢y lÃ  quy trÃ¬nh ETL tá»•ng thá»ƒ sá»­ dá»¥ng Airbyte, tá»« viá»‡c cÃ i Ä‘áº·t Ä‘áº¿n quáº£n lÃ½ dá»¯ liá»‡u:
Link demo : 
[Airbyte | New connection](https://demo.airbyte.com/workspaces/831c25f5-5f54-42dc-ac2b-dc338eaba843/connections/new-connection?sourceType=new&sourceDefinitionId=b5ea17b1-f170-46dc-bc31-cc744ca984c1)
![[Pasted image 20241026094512.png]]

- Airbyte lÃ  cÃ´ng cá»¥ ELT:
![[Pasted image 20241026113646.png]]

### 1. **CÃ i Ä‘áº·t Airbyte**

- **Tá»± cÃ i Ä‘áº·t**: CÃ³ thá»ƒ cÃ i Ä‘áº·t Airbyte trÃªn server hoáº·c mÃ´i trÆ°á»ng Ä‘Ã¡m mÃ¢y. Cung cáº¥p giao diá»‡n trá»±c quan qua trÃ¬nh duyá»‡t Ä‘á»ƒ dá»… dÃ ng thiáº¿t láº­p vÃ  theo dÃµi.
- [[raw/archive/Area/Data-WareHouse/ELT - Airbyte/CÃ¡c bÆ°á»›c thá»±c hiá»‡n Airbyte]]

> [!NOTE] ThÃ´ng tin Airbyte local  
>  Link: http://172.21.100.97:8000/
>  User/Pass: airbyte / password


### 2. **Thiáº¿t láº­p Source (Nguá»“n Dá»¯ Liá»‡u)**
#### Äá»ƒ thiáº¿t láº­p nguá»“n database cÃ³ 2 cÃ¡ch:
##### CÃ¡ch 1: DÃ¹ng báº£ng trong má»™t database
- Chá»n nguá»“n dá»¯ liá»‡u cáº§n tÃ­ch há»£p (vÃ­ dá»¥: SQL Server, MySQL, PostgreSQL, API cá»§a cÃ¡c dá»‹ch vá»¥ SaaS).
- Cung cáº¥p thÃ´ng tin káº¿t ná»‘i cho nguá»“n, bao gá»“m Ä‘á»‹a chá»‰ mÃ¡y chá»§, tÃªn cÆ¡ sá»Ÿ dá»¯ liá»‡u, tÃªn Ä‘Äƒng nháº­p vÃ  máº­t kháº©u.
![[Pasted image 20241028091206.png]]
##### CÃ¡ch 2: DÃ¹ng builder [[raw/archive/Area/Data-WareHouse/ELT - Airbyte/Builder-airbyte-guide]] Ä‘á»ƒ tiáº¿n hÃ nh gá»i API Ä‘á»ƒ sinh ra cÃ¡c cá»™t custom theo api
![[Pasted image 20241028101317.png]]


### 3. **Thiáº¿t láº­p Destination (ÄÃ­ch Äáº¿n)**
#### CÃ¡ch 1: káº¿t ná»‘i database Ä‘Ã­ch lÃ  báº£ng

- Chá»n kho lÆ°u trá»¯ Ä‘Ã­ch, vÃ­ dá»¥: Snowflake, BigQuery, hoáº·c má»™t data warehouse khÃ¡c.
- Cáº¥u hÃ¬nh chi tiáº¿t cho Ä‘Ã­ch Ä‘áº¿n (thÃ´ng tin xÃ¡c thá»±c, tÃªn cÆ¡ sá»Ÿ dá»¯ liá»‡u vÃ  schema).
![[Pasted image 20241028091248.png]]

### 4. **Táº¡o vÃ  Cáº¥u HÃ¬nh Connection**

- Trong **tab Connections**, táº¡o káº¿t ná»‘i giá»¯a nguá»“n vÃ  Ä‘Ã­ch Ä‘Ã£ chá»n.
- Lá»±a chá»n cÃ¡c báº£ng vÃ  dá»¯ liá»‡u cáº§n Ä‘á»“ng bá»™, thiáº¿t láº­p táº§n suáº¥t (nhÆ° háº±ng ngÃ y hoáº·c theo cron).
- Trong tab connection sáº½ thá»±c hiá»‡n Ä‘á»“ng bá»™ tá»« nguá»“n Ä‘áº¿n database Ä‘Ã­ch, bao gá»“m chá»n nhá»¯ng trÆ°á»ng thÃ´ng tin cáº§n thiáº¿t cho database Ä‘Ã­ch
![[Pasted image 20241028091501.png]]
Trong Ä‘Ã³ cÃ¡c tab **Status**, **Job History**, **Schema**, vÃ  **Settings** trong Airbyte:

1. **Status**:
    
    - Tab nÃ y hiá»ƒn thá»‹ tráº¡ng thÃ¡i hiá»‡n táº¡i cá»§a káº¿t ná»‘i. Báº¡n sáº½ tháº¥y cÃ¡c thÃ´ng tin nhÆ°:
        - **Tráº¡ng thÃ¡i Ä‘á»“ng bá»™**: Náº¿u Ä‘á»“ng bá»™ Ä‘Ã£ hoÃ n táº¥t thÃ¬ sáº½ cÃ³ tráº¡ng thÃ¡i **Synced** (Ä‘Ã£ Ä‘á»“ng bá»™), cÃ²n náº¿u cÃ³ lá»—i sáº½ hiá»ƒn thá»‹ **Failed** (tháº¥t báº¡i).
        - **Stream name**: TÃªn cá»§a cÃ¡c stream dá»¯ liá»‡u Ä‘ang Ä‘Æ°á»£c Ä‘á»“ng bá»™.
        - **Latest sync**: Sá»‘ lÆ°á»£ng báº£n ghi Ä‘Ã£ Ä‘Æ°á»£c táº£i trong láº§n Ä‘á»“ng bá»™ gáº§n nháº¥t.
        - **Data fresh as of**: Thá»i gian dá»¯ liá»‡u Ä‘Æ°á»£c lÃ m má»›i gáº§n nháº¥t.
    - Báº¡n cÅ©ng cÃ³ thá»ƒ nháº¥n **Sync now** Ä‘á»ƒ thá»±c hiá»‡n Ä‘á»“ng bá»™ ngay láº­p tá»©c náº¿u cáº§n.
2. **Job History**:
    
    - Tab nÃ y lÆ°u láº¡i lá»‹ch sá»­ cá»§a cÃ¡c láº§n Ä‘á»“ng bá»™ Ä‘Ã£ thá»±c hiá»‡n. ThÃ´ng tin bao gá»“m:
        - **Thá»i gian báº¯t Ä‘áº§u vÃ  káº¿t thÃºc**: GiÃºp báº¡n biáº¿t Ä‘Æ°á»£c láº§n Ä‘á»“ng bá»™ Ä‘Ã³ diá»…n ra khi nÃ o.
        - **Káº¿t quáº£ Ä‘á»“ng bá»™**: Hiá»ƒn thá»‹ sá»‘ lÆ°á»£ng báº£n ghi Ä‘Ã£ Ä‘á»“ng bá»™ thÃ nh cÃ´ng, hoáº·c chi tiáº¿t lá»—i náº¿u cÃ³ sá»± cá»‘.
        - Báº¡n cÃ³ thá»ƒ kiá»ƒm tra cÃ¡c lá»—i Ä‘Ã£ xáº£y ra trong quÃ¡ trÃ¬nh Ä‘á»“ng bá»™ vÃ  phÃ¢n tÃ­ch chÃºng Ä‘á»ƒ cáº£i thiá»‡n quy trÃ¬nh Ä‘á»“ng bá»™ trong tÆ°Æ¡ng lai.
3. **Schema**:
    
    - Tab nÃ y hiá»ƒn thá»‹ cáº¥u trÃºc dá»¯ liá»‡u (schema) cá»§a cÃ¡c stream. Táº¡i Ä‘Ã¢y báº¡n cÃ³ thá»ƒ:
        - **Xem vÃ  lá»±a chá»n cÃ¡c trÆ°á»ng (field)** báº¡n muá»‘n Ä‘á»“ng bá»™. VÃ­ dá»¥: chá»n hoáº·c bá» chá»n cÃ¡c trÆ°á»ng nhÆ° `BankCode`, `BankName`, v.v. Ä‘á»ƒ chá»‰ Ä‘á»“ng bá»™ cÃ¡c trÆ°á»ng cáº§n thiáº¿t.
        - **Xem kiá»ƒu dá»¯ liá»‡u cá»§a cÃ¡c trÆ°á»ng**: nhÆ° String, Datetime, Boolean, giÃºp báº¡n náº¯m rÃµ cáº¥u trÃºc dá»¯ liá»‡u Ä‘á»ƒ Ä‘áº£m báº£o tÃ­nh nháº¥t quÃ¡n khi Ä‘á»“ng bá»™.
    - **Primary Key** vÃ  **Cursor Field** cÅ©ng Ä‘Æ°á»£c hiá»ƒn thá»‹ táº¡i Ä‘Ã¢y náº¿u báº¡n muá»‘n thiáº¿t láº­p cÃ¡c giÃ¡ trá»‹ nÃ y Ä‘á»ƒ kiá»ƒm soÃ¡t quÃ¡ trÃ¬nh Ä‘á»“ng bá»™.
4. **Settings**:
    
    - Tab nÃ y chá»©a cÃ¡c thiáº¿t láº­p cÆ¡ báº£n vÃ  nÃ¢ng cao cho káº¿t ná»‘i. Má»™t sá»‘ tÃ¹y chá»n phá»• biáº¿n bao gá»“m:
        - **Táº§n suáº¥t Ä‘á»“ng bá»™**: Báº¡n cÃ³ thá»ƒ thiáº¿t láº­p táº§n suáº¥t tá»± Ä‘á»™ng Ä‘á»“ng bá»™ nhÆ° hÃ ng ngÃ y, hÃ ng giá», hoáº·c tÃ¹y chá»‰nh theo nhu cáº§u.
        - **Cáº¥u hÃ¬nh nguá»“n vÃ  Ä‘Ã­ch**: Cho phÃ©p chá»‰nh sá»­a cáº¥u hÃ¬nh nguá»“n dá»¯ liá»‡u vÃ  Ä‘Ã­ch náº¿u báº¡n muá»‘n thay Ä‘á»•i báº¥t ká»³ thÃ´ng tin káº¿t ná»‘i nÃ o.
        - **XÃ³a káº¿t ná»‘i**: Náº¿u báº¡n khÃ´ng cáº§n káº¿t ná»‘i nÃ y ná»¯a, báº¡n cÃ³ thá»ƒ xÃ³a Ä‘á»ƒ dá»n dáº¹p khÃ´ng gian lÃ m viá»‡c.

> [!Warning] LÆ°u Ã½
> - Database nguá»“n chá»‰ há»— trá»£ báº£ng hoáº·c view (khÃ´ng há»— trá»£ store procedure)

#### CÃ¡ch 2: káº¿t ná»‘i database nguá»“n lÃ  api (xem [[raw/archive/Area/Data-WareHouse/ELT - Airbyte/Builder-airbyte-guide]])
![[Pasted image 20241028101630.png]]

### 5. **Cháº¡y Quy TrÃ¬nh ETL (Sync)**

- Nháº¥n **Sync Now** Ä‘á»ƒ thá»±c hiá»‡n Ä‘á»“ng bá»™ dá»¯ liá»‡u ngay láº­p tá»©c hoáº·c Ä‘á»ƒ Airbyte tá»± Ä‘á»“ng bá»™ theo lá»‹ch trÃ¬nh.
- QuÃ¡ trÃ¬nh ETL sáº½ thá»±c hiá»‡n theo tuáº§n tá»±: trÃ­ch xuáº¥t (extract) dá»¯ liá»‡u tá»« nguá»“n, biáº¿n Ä‘á»•i (transform) náº¿u cáº§n, vÃ  náº¡p (load) vÃ o Ä‘Ã­ch.
- Sau khi sync data sáº½ ra káº¿t quáº£:
  ![[Pasted image 20241028091104.png]]

### 6. **Quáº£n lÃ½ vÃ  GiÃ¡m sÃ¡t**

- Kiá»ƒm tra tráº¡ng thÃ¡i cá»§a cÃ¡c káº¿t ná»‘i (Ä‘ang cháº¡y, thÃ nh cÃ´ng, hay lá»—i).
- Airbyte cÃ³ tÃ­nh nÄƒng cáº£nh bÃ¡o lá»—i, ghi láº¡i lá»‹ch sá»­ Ä‘á»“ng bá»™ giÃºp dá»… dÃ ng xá»­ lÃ½ sá»± cá»‘.

### 7. **Biáº¿n Ä‘á»•i Dá»¯ Liá»‡u (Transform)**

- Airbyte táº­p trung vÃ o pháº§n ELT (Extract vÃ  Load), pháº§n Transform sáº½ Ä‘Æ°á»£c thá»±c hiá»‡n trong kho dá»¯ liá»‡u (vÃ­ dá»¥, vá»›i cÃ´ng cá»¥ dbt Ä‘á»ƒ biáº¿n Ä‘á»•i dá»¯ liá»‡u).
	- Trong quy trÃ¬nh ELT cá»§a Airbyte, **Transform** (biáº¿n Ä‘á»•i) diá»…n ra trong kho dá»¯ liá»‡u sau khi dá»¯ liá»‡u Ä‘Ã£ Ä‘Æ°á»£c náº¡p. Sá»­ dá»¥ng cÃ´ng cá»¥ nhÆ° **dbt (Data Build Tool)** cho phÃ©p thá»±c hiá»‡n cÃ¡c biáº¿n Ä‘á»•i báº±ng SQL, nhÆ° lÃ m sáº¡ch, há»£p nháº¥t báº£ng, táº¡o cÃ¡c trÆ°á»ng tÃ­nh toÃ¡n, vÃ  chuáº©n hÃ³a dá»¯ liá»‡u. Äiá»u nÃ y giÃºp dá»¯ liá»‡u trá»Ÿ nÃªn sáºµn sÃ ng cho phÃ¢n tÃ­ch vÃ  bÃ¡o cÃ¡o, duy trÃ¬ Ä‘Æ°á»£c Ä‘á»™ chÃ­nh xÃ¡c vÃ  cáº­p nháº­t khi cÃ³ dá»¯ liá»‡u má»›i tá»« Airbyte.
- Äá»ƒ biáº¿n Ä‘á»•i dá»¯ liá»‡u (transform), vÃ o database Ä‘Ã­ch Ä‘á»ƒ xá»­ lÃ½
	- Táº¡o view hoáº·c viáº¿t store procedure Ä‘á»ƒ biáº¿n Ä‘á»•i dá»¯ liá»‡u
	- Vd:
	- TrÆ°á»›c khi biáº¿n Ä‘á»•i dá»¯ liá»‡u
	![[Pasted image 20241028100249.png]]
	- Sau khi biáº¿n Ä‘á»•i dá»¯ liá»‡u:
	- Táº¡o view trong sql Ä‘á»ƒ biáº¿n Ä‘á»•i dá»¯ liá»‡u:
```sql
Create view V_Cleaned_Cat_Bank
as
  SELECT 
    JSON_VALUE(_airbyte_data, '$.ID') AS ID,
    JSON_VALUE(_airbyte_data, '$.BankName') AS BankName,
    JSON_VALUE(_airbyte_data, '$.BankCode') AS BankCode,
    JSON_VALUE(_airbyte_data, '$.IsDelete') AS IsDelete,
    JSON_VALUE(_airbyte_data, '$.IsInactive') AS IsInactive,
    _airbyte_extracted_at
FROM [Test_DataWarehouse].[airbyte_internal].[dbo_raw__stream_Cat_Bank];
```
![[Pasted image 20241028100427.png]]

Táº¡o View
```sql

CREATE VIEW [dbo].[View_Profile_Birthday]
AS
 
   SELECT     
    JSON_VALUE(Hre_Profile.value, '$.ProfileID') AS ID,
    JSON_VALUE(Hre_Profile.value, '$.CodeEmp') AS CodeEmp,
    JSON_VALUE(Hre_Profile.value, '$.ProfileName') AS ProfileName,
	JSON_VALUE(Hre_Profile.value, '$.DateQuit') AS DateQuit,
	JSON_VALUE(Hre_Profile.value, '$.MonthOfBirth') AS MonthOfBirth,
    _airbyte_extracted_at
FROM 
     [Test_DataWareHouse].[dbo].[dbo_raw__stream_Profile_Birthday]
CROSS APPLY 
    OPENJSON(JSON_QUERY(_airbyte_data, '$.data')) AS Hre_Profile;

```
### 8. **Báº£o TrÃ¬ vÃ  Tá»‘i Æ¯u**

- Thá»±c hiá»‡n báº£o trÃ¬ Ä‘á»‹nh ká»³ cÃ¡c káº¿t ná»‘i, cáº­p nháº­t connector khi cáº§n thiáº¿t.
- Tá»‘i Æ°u lá»‹ch trÃ¬nh Ä‘á»“ng bá»™ Ä‘á»ƒ giáº£m táº£i cho há»‡ thá»‘ng vÃ  tÄƒng hiá»‡u suáº¥t.

### Tá»•ng káº¿t

Airbyte giÃºp tá»± Ä‘á»™ng hÃ³a quy trÃ¬nh ETL vá»›i giao diá»‡n Ä‘Æ¡n giáº£n, giÃºp tiáº¿t kiá»‡m thá»i gian vÃ  dá»… dÃ ng tÃ­ch há»£p dá»¯ liá»‡u tá»« nhiá»u nguá»“n khÃ¡c nhau vÃ o má»™t nÆ¡i lÆ°u trá»¯ táº­p trung Ä‘á»ƒ phá»¥c vá»¥ phÃ¢n tÃ­ch vÃ  bÃ¡o cÃ¡o.

[[raw/archive/Area/Data-WareHouse/ELT - Airbyte/CÃ¡c thÃ nh pháº§n Airbyte]]
