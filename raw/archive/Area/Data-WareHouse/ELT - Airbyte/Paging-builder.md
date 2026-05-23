---
aliases: 
date: 2024-11-06
tags:
  - daily
---
# **TÃ i Liá»‡u Cáº¥u HÃ¬nh PhÃ¢n Trang trong Airbyte**
## **1.  API Postman tráº£ vá»**
- Url: https://ba.vnresource.net:1018/api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_EmployeeList&condition&page=1&pageSize=300&userName=admin
```json
{
Â  Â  "data": [
Â  Â  Â  Â  { Â  Â  Â  Â  
			// Dá»¯ liá»‡u nhÃ¢n viÃªn á»Ÿ Ä‘Ã¢y Â 
Â  Â  Â  Â  }
Â  Â  ],
Â  Â  "Has_More": true,
Â  Â  "CurrentPage": 1
}
```
- DÆ°á»›i Ä‘Ã¢y lÃ  giáº£i thÃ­ch ngáº¯n gá»n vá» hai trÆ°á»ng `"Has_More"` vÃ  `"CurrentPage"`:
- **`Has_More`**:    
    - ÄÃ¢y lÃ  má»™t giÃ¡ trá»‹ **Boolean** (`true` hoáº·c `false`) dÃ¹ng Ä‘á»ƒ chá»‰ Ä‘á»‹nh liá»‡u cÃ³ **trang dá»¯ liá»‡u tiáº¿p theo** hay khÃ´ng.
    - `"Has_More": true` nghÄ©a lÃ  **váº«n cÃ²n dá»¯ liá»‡u Ä‘á»ƒ láº¥y**, cÃ²n `"Has_More": false` nghÄ©a lÃ  **khÃ´ng cÃ²n dá»¯ liá»‡u**, vÃ  quÃ¡ trÃ¬nh phÃ¢n trang cÃ³ thá»ƒ dá»«ng láº¡i.
- **`CurrentPage`**:    
    - ÄÃ¢y lÃ  giÃ¡ trá»‹ chá»‰ Ä‘á»‹nh **sá»‘ thá»© tá»± cá»§a trang hiá»‡n táº¡i** (báº¯t Ä‘áº§u tá»« `1`).
    - `"CurrentPage": 1` nghÄ©a lÃ  dá»¯ liá»‡u báº¡n Ä‘ang nháº­n thuá»™c **trang sá»‘ 1**. Sau má»—i láº§n gá»i API, giÃ¡ trá»‹ nÃ y tÄƒng lÃªn (`2`, `3`,...) Ä‘á»ƒ tiáº¿p tá»¥c láº¥y cÃ¡c trang káº¿ tiáº¿p.

 **Vai TrÃ² cá»§a `Has_More` vÃ  `CurrentPage` Trong Airbyte**
- **`Has_More`** giÃºp **dá»«ng quÃ¡ trÃ¬nh phÃ¢n trang** khi khÃ´ng cÃ²n dá»¯ liá»‡u.
- **`CurrentPage`** giÃºp Airbyte biáº¿t **Ä‘ang á»Ÿ trang nÃ o** vÃ  tiáº¿p tá»¥c **tÄƒng lÃªn** Ä‘á»ƒ gá»i trang káº¿ tiáº¿p.
## **2. TÃ i liá»‡u cáº¥u hÃ¬nh phÃ¢n trang trong airbyte dÃ¹ng cursor**

#### **Má»¥c TiÃªu**
Má»¥c tiÃªu cá»§a tÃ i liá»‡u nÃ y lÃ  hÆ°á»›ng dáº«n cÃ¡ch cáº¥u hÃ¬nh phÃ¢n trang cho má»™t káº¿t ná»‘i trong Airbyte, Ä‘á»ƒ giÃºp viá»‡c truy xuáº¥t dá»¯ liá»‡u tá»« API trá»Ÿ nÃªn thuáº­n tiá»‡n vÃ  tá»± Ä‘á»™ng hÆ¡n. Viá»‡c phÃ¢n trang sáº½ giÃºp báº¡n láº¥y Ä‘Æ°á»£c toÃ n bá»™ dá»¯ liá»‡u tá»« API mÃ  khÃ´ng cáº§n can thiá»‡p thá»§ cÃ´ng khi cÃ³ nhiá»u trang dá»¯ liá»‡u.
![[Pasted image 20241111145914.png]]

### **1. Tá»•ng Quan Vá» PhÃ¢n Trang**
PhÃ¢n trang trong API lÃ  quÃ¡ trÃ¬nh chia nhá» dá»¯ liá»‡u thÃ nh nhiá»u pháº§n Ä‘á»ƒ dá»… dÃ ng quáº£n lÃ½ vÃ  xá»­ lÃ½. Äáº·c biá»‡t khi lÃ m viá»‡c vá»›i dá»¯ liá»‡u lá»›n, viá»‡c phÃ¢n trang giÃºp báº¡n háº¡n cháº¿ sá»‘ lÆ°á»£ng báº£n ghi má»—i láº§n truy xuáº¥t, giáº£m táº£i há»‡ thá»‘ng vÃ  Ä‘áº£m báº£o hiá»‡u nÄƒng tá»‘t hÆ¡n.

Trong Airbyte, phÃ¢n trang Ä‘Æ°á»£c thiáº¿t láº­p Ä‘á»ƒ tá»± Ä‘á»™ng truy cáº­p qua tá»«ng trang cá»§a dá»¯ liá»‡u tá»« API nguá»“n, cho Ä‘áº¿n khi khÃ´ng cÃ²n trang nÃ o Ä‘á»ƒ truy cáº­p ná»¯a.

### **2. Thiáº¿t Láº­p PhÃ¢n Trang Trong Airbyte**

#### **2.1. Cursor Value (`Next Page Cursor`)**
- **Má»¥c Ä‘Ã­ch**: `Cursor Value` xÃ¡c Ä‘á»‹nh sá»‘ trang hiá»‡n táº¡i vÃ  giÃºp tá»± Ä‘á»™ng tÄƒng sá»‘ trang sau má»—i láº§n truy xuáº¥t dá»¯ liá»‡u.
- **Thiáº¿t láº­p**: 
  ```jinja
  {{ (response.CurrentPage or 1) + 1 }}
  ```
  - **Giáº£i thÃ­ch**:
    - `response.CurrentPage` lÃ  trÆ°á»ng tá»« response cá»§a API, Ä‘áº¡i diá»‡n cho sá»‘ trang hiá»‡n táº¡i.
    - `response.CurrentPage or 1` nghÄ©a lÃ  náº¿u `CurrentPage` khÃ´ng tá»“n táº¡i (trong láº§n gá»i Ä‘áº§u tiÃªn), giÃ¡ trá»‹ máº·c Ä‘á»‹nh sáº½ lÃ  `1`.
    - `(response.CurrentPage or 1) + 1` tÄƒng giÃ¡ trá»‹ cá»§a `page` lÃªn 1 cho láº§n gá»i tiáº¿p theo.
  
#### **2.2. Stop Condition (`Äiá»u kiá»‡n dá»«ng`)**
- **Má»¥c Ä‘Ã­ch**: `Stop Condition` chá»‰ Ä‘á»‹nh Ä‘iá»u kiá»‡n Ä‘á»ƒ dá»«ng quÃ¡ trÃ¬nh phÃ¢n trang, thÆ°á»ng dá»±a trÃªn viá»‡c xÃ¡c Ä‘á»‹nh xem cÃ²n dá»¯ liá»‡u hay khÃ´ng.
- **Thiáº¿t láº­p**:
  ```jinja
  {{ response.Has_More == false }}
  ```
  - **Giáº£i thÃ­ch**:
    - `response.Has_More` lÃ  trÆ°á»ng boolean trong response, cho biáº¿t cÃ³ cÃ²n trang tiáº¿p theo hay khÃ´ng.
    - Khi `Has_More` lÃ  `false`, nghÄ©a lÃ  khÃ´ng cÃ²n trang nÃ o Ä‘á»ƒ truy cáº­p, vÃ  quÃ¡ trÃ¬nh phÃ¢n trang sáº½ dá»«ng.

#### **2.3. Inject Cursor Value VÃ o URL Request**
- **Má»¥c Ä‘Ã­ch**: Äá»ƒ gá»­i giÃ¡ trá»‹ `page` vÃ o API request nhÆ° má»™t tham sá»‘ truy váº¥n (query parameter).
- **Thiáº¿t láº­p**:
  - **Inject Cursor Value into outgoing HTTP Request**: Chá»n `Query Parameter`.
  - **Parameter Name**: `page`.
  - **Giáº£i thÃ­ch**: GiÃ¡ trá»‹ cá»§a `Cursor Value` (sá»‘ trang) sáº½ Ä‘Æ°á»£c tá»± Ä‘á»™ng thÃªm vÃ o URL request má»—i khi gá»­i yÃªu cáº§u má»›i Ä‘áº¿n API.

#### **2.4. Page Size**
- **Má»¥c Ä‘Ã­ch**: Thiáº¿t láº­p sá»‘ lÆ°á»£ng báº£n ghi muá»‘n láº¥y má»—i láº§n gá»i API.
- **Thiáº¿t láº­p**:
  - **Page Size**: `300`.
  - **Inject Page Size into outgoing HTTP Request**:
    - **Inject Into**: `Query Parameter`.
    - **Parameter Name**: `pagesize`.
  - **Giáº£i thÃ­ch**: Sá»‘ lÆ°á»£ng báº£n ghi má»—i láº§n gá»i API lÃ  `300`, vÃ  giÃ¡ trá»‹ `pagesize` sáº½ Ä‘Æ°á»£c truyá»n vÃ o URL request nhÆ° má»™t tham sá»‘ truy váº¥n.

### **3. VÃ­ Dá»¥ Cáº¥u HÃ¬nh**
#### **3.1. VÃ­ Dá»¥ URL API**
- **URL Gá»‘c**: 
  ```
  https://ba.vnresource.net:1018/api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_EmployeeList&Authorization=Bearer+****&pagesize=300&page=1
  ```
- **Giáº£i thÃ­ch**:
  - `page=1`: ÄÃ¢y lÃ  sá»‘ trang hiá»‡n táº¡i. Airbyte sáº½ tá»± Ä‘á»™ng thay Ä‘á»•i giÃ¡ trá»‹ `page` thÃ nh `2`, `3`,... sau má»—i láº§n truy cáº­p.
  - `pagesize=300`: Sá»‘ lÆ°á»£ng báº£n ghi má»—i trang lÃ  `300`.

#### **3.2. Response API Máº«u**
```json
{
  "data": [
    // Dá»¯ liá»‡u nhÃ¢n viÃªn á»Ÿ Ä‘Ã¢y
  ],
  "Has_More": true,
  "CurrentPage": 1  
}
```
- **Has_More**: Cho biáº¿t cÃ³ trang tiáº¿p theo hay khÃ´ng (`true` nghÄ©a lÃ  cÃ²n trang, `false` lÃ  khÃ´ng cÃ²n).
- **CurrentPage**: TrÆ°á»ng cho biáº¿t sá»‘ trang hiá»‡n táº¡i.

### **4. CÃ¡ch Thiáº¿t Láº­p Trong Airbyte**
1. **BÆ°á»›c 1**: Táº¡o **New Source** trong Airbyte vÃ  cung cáº¥p URL API gá»‘c.
2. **BÆ°á»›c 2**: Thiáº¿t láº­p **Pagination**:
   - **Cursor Value**: `{{ (response.CurrentPage or 1) + 1 }}`
   - **Stop Condition**: `{{ response.Has_More == false }}`
   - **Inject Cursor Value**:
     - **Inject Into**: `Query Parameter`
     - **Parameter Name**: `page`
   - **Page Size**:
     - Thiáº¿t láº­p `300`
     - **Inject Page Size**:
       - **Inject Into**: `Query Parameter`
       - **Parameter Name**: `pagesize`
3. **BÆ°á»›c 3**: Kiá»ƒm tra vá»›i nÃºt **Test** Ä‘á»ƒ Ä‘áº£m báº£o viá»‡c cáº¥u hÃ¬nh thÃ nh cÃ´ng.
4. **BÆ°á»›c 4**: **Release new version** Ä‘á»ƒ lÆ°u láº¡i cáº¥u hÃ¬nh.

### **5. Káº¿t Quáº£**
- Sau khi cáº¥u hÃ¬nh thÃ nh cÃ´ng, Airbyte sáº½ tá»± Ä‘á»™ng gá»i API vÃ  tÄƒng `page` sau má»—i láº§n láº¥y dá»¯ liá»‡u, cho Ä‘áº¿n khi trÆ°á»ng `Has_More` trá»Ÿ thÃ nh `false`.
- Viá»‡c cáº¥u hÃ¬nh nÃ y Ä‘áº£m báº£o táº¥t cáº£ dá»¯ liá»‡u tá»« API Ä‘Æ°á»£c thu tháº­p mÃ  khÃ´ng cáº§n pháº£i can thiá»‡p thá»§ cÃ´ng vÃ o quÃ¡ trÃ¬nh phÃ¢n trang.

### **6. LÆ°u Ã**
- Äáº£m báº£o ráº±ng response cá»§a API luÃ´n tráº£ vá» Ä‘Ãºng Ä‘á»‹nh dáº¡ng vá»›i cÃ¡c trÆ°á»ng nhÆ° `Has_More` vÃ  `CurrentPage` Ä‘á»ƒ viá»‡c phÃ¢n trang hoáº¡t Ä‘á»™ng Ä‘Ãºng.
- Náº¿u gáº·p lá»—i, hÃ£y kiá»ƒm tra logs cá»§a Airbyte vÃ  Ä‘áº£m báº£o ráº±ng token `Authorization` lÃ  há»£p lá»‡ vÃ  khÃ´ng bá»‹ háº¿t háº¡n.

### **7. Káº¿t Luáº­n**
Viá»‡c thiáº¿t láº­p phÃ¢n trang trong Airbyte giÃºp báº¡n tá»± Ä‘á»™ng hÃ³a quÃ¡ trÃ¬nh láº¥y dá»¯ liá»‡u tá»« API cÃ³ nhiá»u trang, Ä‘áº·c biá»‡t há»¯u Ã­ch vá»›i nhá»¯ng API cÃ³ giá»›i háº¡n sá»‘ lÆ°á»£ng báº£n ghi má»—i láº§n truy xuáº¥t. Vá»›i cáº¥u hÃ¬nh phÃ¹ há»£p, quÃ¡ trÃ¬nh nÃ y sáº½ giÃºp báº¡n tiáº¿t kiá»‡m thá»i gian vÃ  giáº£m thiá»ƒu lá»—i trong viá»‡c láº¥y dá»¯ liá»‡u thá»§ cÃ´ng.

### **8. Káº¿t Quáº£**
- Káº¿t quáº£ sau khi airbyte Ä‘á»“ng bá»™. Káº¿t quáº£ ra 5 dÃ²ng, má»—i dÃ²ng thá»ƒ hiá»‡n má»—i láº§n gá»i api
![[Pasted image 20241111162656.png]]


### **Incremental Sync** [[raw/archive/Area/Data-WareHouse/ELT - Airbyte/Incremental Sync]]

# TÃ³m táº¯t
---
- Äá»ƒ phÃ¢n trang api khi táº¡o builder thÃ¬ cáº§n thÃªm 2 field trong response tráº£ vá» cá»§a API ( Has_More, currentPage), bÃªn dÆ°á»›i lÃ  giáº£i thÃ­ch Ã½ nghÄ©a:
```json
{
Â  Â  "data": [
Â  Â  Â  Â  { Â  Â  Â  Â  
			// Dá»¯ liá»‡u nhÃ¢n viÃªn á»Ÿ Ä‘Ã¢y Â 
Â  Â  Â  Â  }
Â  Â  ],
Â  Â  "Has_More": true,
Â  Â  "CurrentPage": 1
}
```

- **`Has_More`**: 
  - ÄÃ¢y lÃ  má»™t giÃ¡ trá»‹ **Boolean** (`true` hoáº·c `false`) dÃ¹ng Ä‘á»ƒ chá»‰ Ä‘á»‹nh liá»‡u cÃ³ **trang dá»¯ liá»‡u tiáº¿p theo** hay khÃ´ng.
  - `"Has_More": true` nghÄ©a lÃ  **váº«n cÃ²n dá»¯ liá»‡u Ä‘á»ƒ láº¥y**, cÃ²n `"Has_More": false` nghÄ©a lÃ  **khÃ´ng cÃ²n dá»¯ liá»‡u**, vÃ  quÃ¡ trÃ¬nh phÃ¢n trang cÃ³ thá»ƒ dá»«ng láº¡i.

- **`CurrentPage`**:
  - ÄÃ¢y lÃ  giÃ¡ trá»‹ chá»‰ Ä‘á»‹nh **sá»‘ thá»© tá»± cá»§a trang hiá»‡n táº¡i** (báº¯t Ä‘áº§u tá»« `1`).
  - `"CurrentPage": 1` nghÄ©a lÃ  dá»¯ liá»‡u báº¡n Ä‘ang nháº­n thuá»™c **trang sá»‘ 1**. Sau má»—i láº§n gá»i API, giÃ¡ trá»‹ nÃ y tÄƒng lÃªn (`2`, `3`,...) Ä‘á»ƒ tiáº¿p tá»¥c láº¥y cÃ¡c trang káº¿ tiáº¿p.

### **Vai TrÃ² cá»§a `Has_More` vÃ  `CurrentPage` Trong Airbyte**
- **`Has_More`** giÃºp **dá»«ng quÃ¡ trÃ¬nh phÃ¢n trang** khi khÃ´ng cÃ²n dá»¯ liá»‡u.
- **`CurrentPage`** giÃºp Airbyte biáº¿t **Ä‘ang á»Ÿ trang nÃ o** vÃ  tiáº¿p tá»¥c **tÄƒng lÃªn** Ä‘á»ƒ gá»i trang káº¿ tiáº¿p.

TÃ³m láº¡i, `"Has_More"` vÃ  `"CurrentPage"` phá»‘i há»£p vá»›i nhau Ä‘á»ƒ giÃºp Airbyte tá»± Ä‘á»™ng hÃ³a quÃ¡ trÃ¬nh láº¥y dá»¯ liá»‡u tá»« nhiá»u trang cho Ä‘áº¿n khi háº¿t dá»¯ liá»‡u. 




