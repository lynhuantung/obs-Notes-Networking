---
type: concept
tags:
  - D02
  - VNPT
  - Viettel
  - iBHXH
  - TS24
  - INS
  - HRM
  - pháº§n-má»m-BHXH
  - kÃª-khai-Ä‘iá»‡n-tá»­
  - so-sÃ¡nh
  - venn-diagram
date-updated: 2026-04-26
related:
  - "[[wiki/projects/INS]]"
  - "[[wiki/concepts/HRM-modules]]"
  - "[[HRM-Knowledge-Base/raw/archive/1. Projects/Nghiá»‡p vá»¥ HRM/INS/TruyNguyenNhan]]"
  - "[[HRM-Knowledge-Base/raw/archive/1. Projects/Nghiá»‡p vá»¥ HRM/INS/Venn_D02_SuKhacNhau]]"
aliases:
  - So SÃ¡nh D02 VNPT Viettel iBHXH
  - Pháº§n Má»m KÃª Khai BHXH Äiá»‡n Tá»­
  - Venn D02 Sá»± KhÃ¡c Nhau
---

# Sá»± KhÃ¡c Nhau Giá»¯a D02-VNPT â€” D02-Viettel â€” iBHXH (TS24)

> **Nguá»“n**: Biá»ƒu Ä‘á»“ Venn `Venn_D02_SuKhacNhau.png` â€” phÃ¢n tÃ­ch sá»± khÃ¡c biá»‡t vÃ  Ä‘iá»ƒm giao thoa giá»¯a 3 pháº§n má»m/cá»•ng kÃª khai BHXH Ä‘iá»‡n tá»­ phá»• biáº¿n táº¡i Viá»‡t Nam trong bá»‘i cáº£nh triá»ƒn khai HRM.

![[Pasted image 20260426184322.png]]

---

## 1. Tá»•ng Quan 3 Pháº§n Má»m / Cá»•ng Dá»‹ch Vá»¥

| Pháº§n má»m | ÄÆ¡n vá»‹ cung cáº¥p | Loáº¡i hÃ¬nh | Chi phÃ­ |
|----------|----------------|-----------|---------|
| **D02-VNPT** | Táº­p Ä‘oÃ n VNPT | Pháº§n má»m trung gian I-VAN | CÃ³ phÃ­ |
| **D02-Viettel** | Táº­p Ä‘oÃ n Viettel | Pháº§n má»m trung gian I-VAN | CÃ³ phÃ­ |
| **iBHXH (TS24)** | CÃ´ng ty CP CÃ´ng nghá»‡ TS24 | Pháº§n má»m trung gian I-VAN | CÃ³ phÃ­ / gÃ³i cÆ¡ báº£n |

> **Ghi chÃº**: Cáº£ 3 Ä‘á»u lÃ  pháº§n má»m **trung gian (I-VAN)** â€” nghÄ©a lÃ  há»“ sÆ¡ Ä‘Æ°á»£c gá»­i qua cá»•ng I-VAN cá»§a tá»«ng nhÃ  cung cáº¥p trÆ°á»›c khi Ä‘áº¿n há»‡ thá»‘ng BHXH Viá»‡t Nam. KhÃ¡c vá»›i **iBHXH chÃ­nh thá»©c** cá»§a BHXH Viá»‡t Nam (ibhxh.vss.gov.vn â€” miá»…n phÃ­, káº¿t ná»‘i trá»±c tiáº¿p).

---

## 2. Biá»ƒu Äá»“ Venn â€” Äiá»ƒm Chung & KhÃ¡c Biá»‡t

```mermaid
graph TD
    subgraph VNPT_ONLY ["ðŸ”µ CHá»ˆ D02-VNPT"]
        V1["TÃ­ch há»£p há»‡ sinh thÃ¡i VNPT\n(hÃ³a Ä‘Æ¡n Ä‘iá»‡n tá»­, chá»¯ kÃ½ sá»‘ VNPT)"]
        V2["CÃ³ Ä‘áº¡i lÃ½ há»— trá»£ rá»™ng kháº¯p\ncáº£ nÆ°á»›c (máº¡ng lÆ°á»›i VNPT)"]
        V3["TÃ­ch há»£p káº¿ toÃ¡n qua\nhá»‡ sinh thÃ¡i VNPT"]
        V4["PhÃ¹ há»£p DN Ä‘ang dÃ¹ng\ndá»‹ch vá»¥ VNPT"]
    end

    subgraph VIETTEL_ONLY ["ðŸ”´ CHá»ˆ D02-Viettel"]
        T1["TÃ­ch há»£p há»‡ sinh thÃ¡i Viettel\n(Viettel-CA, VssID)"]
        T2["á»¨ng dá»¥ng mobile\n(VssID tra cá»©u BHXH)"]
        T3["Há»— trá»£ ká»¹ thuáº­t 24/7\nqua máº¡ng lÆ°á»›i Viettel"]
        T4["PhÃ¹ há»£p DN Ä‘ang dÃ¹ng\nchá»¯ kÃ½ sá»‘ Viettel-CA"]
    end

    subgraph TS24_ONLY ["ðŸŸ¢ CHá»ˆ iBHXH (TS24)"]
        S1["ChuyÃªn sÃ¢u nháº¥t vá»\nnghiá»‡p vá»¥ BHXH"]
        S2["Cáº­p nháº­t biá»ƒu máº«u\nráº¥t nhanh"]
        S3["Há»— trá»£ toÃ n bá»™ quy trÃ¬nh\nBHXH tá»« A-Z"]
        S4["Xuáº¥t file XML\nchuáº©n cá»•ng BHXH"]
        S5["Phá»• biáº¿n vá»›i DN lá»›n\n> 100 lao Ä‘á»™ng"]
    end

    subgraph CHUNG ["âšª ÄIá»‚M CHUNG (Cáº¢ 3)"]
        C1["Äá»u lÃ  pháº§n má»m\ntrung gian I-VAN"]
        C2["Há»— trá»£ máº«u D02-LT\n(Danh sÃ¡ch lao Ä‘á»™ng BH)"]
        C3["YÃªu cáº§u chá»¯ kÃ½ sá»‘\n(USB Token / HSM)"]
        C4["Gá»­i há»“ sÆ¡ Ä‘iá»‡n tá»­\nlÃªn há»‡ thá»‘ng BHXH"]
        C5["CÃ³ phÃ­ dá»‹ch vá»¥\nhÃ ng nÄƒm"]
        C6["Há»— trá»£ kÃª khai\nBHXH + BHYT + BHTN"]
    end

    style VNPT_ONLY fill:#ddeeff,stroke:#3388cc
    style VIETTEL_ONLY fill:#ffdddd,stroke:#cc3333
    style TS24_ONLY fill:#ddffdd,stroke:#33aa44
    style CHUNG fill:#f5f5f5,stroke:#888888
```

---

## 3. Báº£ng So SÃ¡nh Chi Tiáº¿t

| TiÃªu chÃ­ | ðŸ”µ D02-VNPT | ðŸ”´ D02-Viettel | ðŸŸ¢ iBHXH (TS24) |
|---------|-----------|--------------|----------------|
| **Loáº¡i hÃ¬nh** | Trung gian (I-VAN) | Trung gian (I-VAN) | Trung gian (I-VAN) |
| **Chi phÃ­/nÄƒm** | ~1â€“3 triá»‡u | ~1â€“3 triá»‡u | ~3â€“10 triá»‡u (tÃ¹y gÃ³i) |
| **Chá»¯ kÃ½ sá»‘** | Báº¯t buá»™c | Báº¯t buá»™c | Báº¯t buá»™c |
| **Há»— trá»£ ká»¹ thuáº­t** | Tá»‘t (máº¡ng VNPT) | Tá»‘t (24/7 Viettel) | KhÃ¡ tá»‘t |
| **TÃ­ch há»£p káº¿ toÃ¡n** | âœ… CÃ³ (há»‡ sinh thÃ¡i VNPT) | âœ… CÃ³ | âœ… CÃ³ |
| **Mobile app** | âŒ Háº¡n cháº¿ | âœ… CÃ³ (VssID) | âŒ Háº¡n cháº¿ |
| **Äá»™ chuyÃªn sÃ¢u nghiá»‡p vá»¥ BHXH** | Trung bÃ¬nh | Trung bÃ¬nh | â­ Cao nháº¥t |
| **Tá»‘c Ä‘á»™ cáº­p nháº­t biá»ƒu máº«u** | Trung bÃ¬nh | Trung bÃ¬nh | â­ Nhanh nháº¥t |
| **PhÃ¹ há»£p quy mÃ´** | DN vá»«a-lá»›n | DN vá»«a-lá»›n | DN lá»›n (>100 LÄ) |
| **Há»‡ sinh thÃ¡i tÃ­ch há»£p** | VNPT (hÃ³a Ä‘Æ¡n, CKS) | Viettel (Viettel-CA) | TS24 riÃªng |
| **Dá»… sá»­ dá»¥ng** | Trung bÃ¬nh | KhÃ¡ dá»… | Cáº§n Ä‘Ã o táº¡o |

---

## 4. Quy TrÃ¬nh Ná»™p Há»“ SÆ¡ â€” Cáº£ 3 Äá»u Giá»‘ng Nhau

```mermaid
flowchart LR
    DN([ðŸ¢ Doanh nghiá»‡p\nHRM System]) --> PM{Pháº§n má»m\nkÃª khai}
    
    PM --> V["ðŸ”µ D02-VNPT\nCá»•ng I-VAN VNPT"]
    PM --> T["ðŸ”´ D02-Viettel\nCá»•ng I-VAN Viettel"]
    PM --> S["ðŸŸ¢ iBHXH TS24\nCá»•ng I-VAN TS24"]
    
    V --> IVAN[Cá»•ng I-VAN\nTrung gian]
    T --> IVAN
    S --> IVAN
    
    IVAN --> BHXH([ðŸ›ï¸ Há»‡ thá»‘ng BHXH\nViá»‡t Nam])
    BHXH --> KQ([âœ… Tiáº¿p nháº­n\nhá»“ sÆ¡])

    style DN fill:#ffffcc
    style BHXH fill:#ccffcc
    style KQ fill:#44bb44,color:#fff
    style IVAN fill:#fff3cd
```

---

## 5. á»¨ng Dá»¥ng Trong Há»‡ Thá»‘ng HRM

### 5.1 Lá»±a chá»n pháº§n má»m theo Ä‘áº·c Ä‘iá»ƒm khÃ¡ch hÃ ng

```mermaid
flowchart TD
    KH([KhÃ¡ch hÃ ng cáº§n\ntÆ° váº¥n chá»n pháº§n má»m]) --> Q1{Quy mÃ´\nlao Ä‘á»™ng?}

    Q1 -->|"< 50 ngÆ°á»i"| Q2{ÄÃ£ cÃ³ dá»‹ch vá»¥\nVNPT hoáº·c Viettel?}
    Q1 -->|"50â€“200 ngÆ°á»i"| Q3{Æ¯u tiÃªn yáº¿u tá»‘\ngÃ¬?}
    Q1 -->|"> 200 ngÆ°á»i"| TS24_REC["ðŸŸ¢ iBHXH (TS24)\nChuyÃªn sÃ¢u nháº¥t\nphÃ¹ há»£p DN lá»›n"]

    Q2 -->|DÃ¹ng VNPT| VNPT_REC["ðŸ”µ D02-VNPT\nTÃ­ch há»£p sáºµn\nhá»‡ sinh thÃ¡i VNPT"]
    Q2 -->|DÃ¹ng Viettel| VT_REC["ðŸ”´ D02-Viettel\nTÃ­ch há»£p Viettel-CA\ná»©ng dá»¥ng mobile"]
    Q2 -->|KhÃ´ng/KhÃ¡c| IBHXH["âšª iBHXH chÃ­nh thá»©c\n(BHXH Viá»‡t Nam)\nMiá»…n phÃ­, Ä‘Æ¡n giáº£n"]

    Q3 -->|Há»— trá»£ ká»¹ thuáº­t tá»‘t| Q4{Äang dÃ¹ng\ndá»‹ch vá»¥ cá»§a ai?}
    Q3 -->|Nghiá»‡p vá»¥ sÃ¢u| TS24_REC
    Q3 -->|Chi phÃ­ tháº¥p| IBHXH

    Q4 -->|VNPT| VNPT_REC
    Q4 -->|Viettel| VT_REC
    Q4 -->|KhÃ¡c| VNPT_REC

    style VNPT_REC fill:#ddeeff
    style VT_REC fill:#ffdddd
    style TS24_REC fill:#ddffdd
    style IBHXH fill:#fffff0
```

### 5.2 Káº¿t ná»‘i vá»›i module INS trong HRM

Khi há»‡ thá»‘ng HRM tÃ­nh toÃ¡n xong sá»‘ liá»‡u BHXH, bÆ°á»›c **xuáº¥t há»“ sÆ¡ D02** sáº½ tÆ°Æ¡ng tÃ¡c vá»›i 1 trong 3 pháº§n má»m:

| BÆ°á»›c | MÃ´ táº£ |
|------|-------|
| 1 | HRM tÃ­nh toÃ¡n BHXH/BHYT/BHTN â†’ Xuáº¥t danh sÃ¡ch D02-LT |
| 2 | Import/nháº­p liá»‡u vÃ o pháº§n má»m kÃª khai (VNPT/Viettel/TS24) |
| 3 | KÃ½ Ä‘iá»‡n tá»­ báº±ng chá»¯ kÃ½ sá»‘ (USB Token/HSM) |
| 4 | Ná»™p há»“ sÆ¡ qua cá»•ng I-VAN â†’ BHXH tiáº¿p nháº­n |
| 5 | Theo dÃµi tráº¡ng thÃ¡i há»“ sÆ¡, nháº­n káº¿t quáº£ |

---

## 6. Äiá»ƒm KhÃ¡c Biá»‡t Quan Trá»ng Khi Cáº¥u HÃ¬nh HRM

> **LÆ°u Ã½ cho BA/Dev khi tÃ­ch há»£p module INS vá»›i cÃ¡c pháº§n má»m nÃ y:**

### 6.1 Cáº¥u trÃºc file xuáº¥t D02-LT

Má»—i pháº§n má»m cÃ³ thá»ƒ yÃªu cáº§u **Ä‘á»‹nh dáº¡ng file XML khÃ¡c nhau** dÃ¹ cÃ¹ng chuáº©n cá»§a BHXH:

| Pháº§n má»m | Äá»‹nh dáº¡ng nháº­n | CÃ¡ch nháº­p liá»‡u |
|----------|---------------|----------------|
| D02-VNPT | XML chuáº©n BHXH + cÃ³ thá»ƒ import Excel | Import file / nháº­p tay |
| D02-Viettel | XML chuáº©n BHXH + Excel | Import file / nháº­p tay |
| iBHXH (TS24) | XML chuáº©n BHXH (nghiÃªm ngáº·t hÆ¡n) | Import file / API (náº¿u cÃ³) |

### 6.2 Nhá»¯ng lá»—i thÆ°á»ng gáº·p khi tÃ­ch há»£p

| TÃ¬nh huá»‘ng | Lá»—i phá»• biáº¿n | CÃ¡ch kháº¯c phá»¥c |
|-----------|-------------|----------------|
| Export tá»« HRM sang VNPT | MÃ£ BHXH nhÃ¢n viÃªn sai format | Chuáº©n hÃ³a mÃ£ BHXH trong HRM |
| Viettel khÃ´ng nháº­n file | Encoding XML bá»‹ sai (UTF-8 vs ANSI) | Kiá»ƒm tra encoding khi xuáº¥t |
| TS24 bÃ¡o lá»—i nghiá»‡p vá»¥ | Tá»· lá»‡ Ä‘Ã³ng BH sai do cáº¥u hÃ¬nh HRM | Äá»‘i chiáº¿u tá»· lá»‡ vá»›i quy Ä‘á»‹nh hiá»‡n hÃ nh |
| TrÃ¹ng há»“ sÆ¡ thÃ¡ng trÆ°á»›c | Ná»™p láº¡i mÃ  khÃ´ng há»§y há»“ sÆ¡ cÅ© | Há»§y/Ä‘iá»u chá»‰nh trÆ°á»›c khi ná»™p má»›i |
| Chá»¯ kÃ½ sá»‘ háº¿t háº¡n | Token háº¿t háº¡n giá»¯a chá»«ng | Theo dÃµi háº¡n token, gia háº¡n trÆ°á»›c |

---

## 7. So SÃ¡nh Vá»›i iBHXH ChÃ­nh Thá»©c (BHXH Viá»‡t Nam)

> **PhÃ¢n biá»‡t quan trá»ng**: `iBHXH cá»§a TS24` â‰  `iBHXH chÃ­nh thá»©c cá»§a BHXH Viá»‡t Nam`

| TiÃªu chÃ­ | iBHXH chÃ­nh thá»©c (BHXH VN) | iBHXH (TS24) |
|----------|--------------------------|--------------|
| **ÄÆ¡n vá»‹** | BHXH Viá»‡t Nam | CÃ´ng ty TS24 |
| **Website** | ibhxh.vss.gov.vn | ts24.com.vn |
| **Chi phÃ­** | **Miá»…n phÃ­** | CÃ³ phÃ­ |
| **Loáº¡i hÃ¬nh** | Káº¿t ná»‘i trá»±c tiáº¿p | Trung gian I-VAN |
| **Nghiá»‡p vá»¥** | CÆ¡ báº£n | ChuyÃªn sÃ¢u hÆ¡n |
| **PhÃ¹ há»£p** | DN nhá», Ä‘Æ¡n giáº£n | DN vá»«a-lá»›n |

---

## 8. Checklist Khi Triá»ƒn Khai / Chuyá»ƒn Äá»•i Pháº§n Má»m

### Khi khÃ¡ch hÃ ng chuyá»ƒn tá»« pháº§n má»m nÃ y sang pháº§n má»m khÃ¡c:

- [ ] **Xuáº¥t toÃ n bá»™ lá»‹ch sá»­** Ä‘Ã³ng BH tá»« pháº§n má»m cÅ©
- [ ] **Äá»‘i chiáº¿u sá»‘ liá»‡u** thÃ¡ng cuá»‘i trÆ°á»›c khi chuyá»ƒn
- [ ] **Kiá»ƒm tra mÃ£ BHXH** cá»§a tá»«ng lao Ä‘á»™ng cÃ³ tÆ°Æ¡ng thÃ­ch khÃ´ng
- [ ] **Test file XML** trÆ°á»›c khi ná»™p há»“ sÆ¡ tháº­t
- [ ] **ÄÃ o táº¡o HR** sá»­ dá»¥ng pháº§n má»m má»›i
- [ ] **Backup dá»¯ liá»‡u** trÆ°á»›c khi chuyá»ƒn Ä‘á»•i
- [ ] **XÃ¡c nháº­n lá»‹ch** ná»™p há»“ sÆ¡ thÃ¡ng chuyá»ƒn Ä‘á»•i khÃ´ng bá»‹ giÃ¡n Ä‘oáº¡n

---

## 9. Tham Chiáº¿u

- **BHXH Viá»‡t Nam chÃ­nh thá»©c**: [baohiemxahoi.gov.vn](https://baohiemxahoi.gov.vn) | Hotline: **1900 9068**
- **iBHXH chÃ­nh thá»©c (miá»…n phÃ­)**: [ibhxh.vss.gov.vn](https://ibhxh.vss.gov.vn)
- **TS24**: [ts24.com.vn](https://ts24.com.vn)
- **LiÃªn quan**: [[HRM-Knowledge-Base/raw/archive/1. Projects/Nghiá»‡p vá»¥ HRM/INS/TruyNguyenNhan|PhÆ°Æ¡ng phÃ¡p Truy NguyÃªn NhÃ¢n 4M]]

---

*Ghi chÃº Ä‘Æ°á»£c táº¡o tá»« biá»ƒu Ä‘á»“ Venn `Venn_D02_SuKhacNhau.png` â€” 2026-04-26*

