---
description: "Danh sách 6 phân hệ chính của HRM VnResource: SYS, HR, PAY, INS, ATT, LEAVE và các dự án áp dụng."
type: concept
tags:
  - hrm
  - modules
  - phan-he
  - hrm
related:
  - "[[wiki/projects/VnPay-Project|VnPay-Project]]"
  - "[[wiki/projects/TrungDong-Project|TrungDong-Project]]"
  - "[[wiki/projects/HongNgoc-Project|HongNgoc-Project]]"
date-updated: 2026-04-26
---
# HRM Modules â€” CÃ¡c PhÃ¢n Há»‡ HRM
## Tá»•ng quan

HRM bao gá»“m 6 phÃ¢n há»‡ chÃ­nh. Má»—i dá»± Ã¡n triá»ƒn khai cÃ³ thá»ƒ chá»n subset tÃ¹y nhu cáº§u khÃ¡ch hÃ ng.

## Danh sÃ¡ch phÃ¢n há»‡

### 1. NhÃ¢n Sá»± (HR Core)
- Quáº£n lÃ½ há»“ sÆ¡ nhÃ¢n viÃªn
- Há»£p Ä‘á»“ng lao Ä‘á»™ng
- CÆ¡ cáº¥u tá»• chá»©c (org chart)
- Onboarding / Offboarding

### 2. LÆ°Æ¡ng (Payroll)
- TÃ­nh lÆ°Æ¡ng theo ca, báº­c, há»‡ sá»‘
- CÃ´ng thá»©c lÆ°Æ¡ng linh hoáº¡t
- Phá»¥ cáº¥p, kháº¥u trá»«
- Káº¿t xuáº¥t bÃ¡o cÃ¡o lÆ°Æ¡ng
- **Äang dÃ¹ng táº¡i**: [[wiki/projects/TrungDong-Project]]

### 3. Báº£o Hiá»ƒm (Insurance)
- Báº£o hiá»ƒm xÃ£ há»™i (BHXH), y táº¿ (BHYT), tháº¥t nghiá»‡p (BHTN)
- Khai bÃ¡o cÆ¡ quan báº£o hiá»ƒm qua **iBHXH** (cá»•ng Ä‘iá»‡n tá»­)
- Xuáº¥t chá»©ng tá»« **D02-TS** (tham gia/Ä‘iá»u chá»‰nh), D03a (á»‘m Ä‘au, thai sáº£n)
- Tá»•ng há»£p báº£ng lÆ°Æ¡ng **C70** (NLÄ + NSDLÄ Ä‘Ã³ng BH)
- TÃ­ch há»£p **MISA** xuáº¥t dá»¯ liá»‡u káº¿ toÃ¡n BH
- **Logic cá»‘t lÃµi**:
  - `InsuranceMonthJoin` â€” xÃ¡c Ä‘á»‹nh thÃ¡ng tham gia BH
  - `InsuranceRecordDayCount` â€” Ä‘áº¿m ngÃ y thá»±c táº¿ Ä‘Ã³ng BH trong thÃ¡ng
  - `InsurancePayback` â€” hoÃ n tráº£ khi Ä‘Ã³ng sai/thá»«a
- **Cháº¿ Ä‘á»™ hÆ°á»Ÿng**:
  - Nghá»‰ á»‘m: 75% lÆ°Æ¡ng Ä‘Ã³ng BH, tá»‘i Ä‘a 30â€“60 ngÃ y/nÄƒm â†’ [[wiki/sources/INS-Nghi14Ngay]]
  - Nghá»‰ thai sáº£n: 100% lÆ°Æ¡ng Ä‘Ã³ng BH, 6 thÃ¡ng â†’ [[wiki/sources/INS-NghiThaiSan]]
- **NguyÃªn táº¯c quan trá»ng**: nghá»‰ á»‘m / thai sáº£n **KHÃ”NG cáº¯t** báº£n ghi BH
- **PhÃ¢n tÃ­ch lá»—i**: [[wiki/sources/INS-FishBone-Analysis]] â€” FishBone 4M + 5 Whys
- **Truy nguyÃªn nhÃ¢n gá»‘c rá»…**: [[wiki/sources/INS-TruyNguyenNhan]] â€” 4M Kaizen, CAPA matrix, 5 Whys thá»±c chiáº¿n
- **So sÃ¡nh pháº§n má»m kÃª khai**: [[wiki/sources/INS-VennD02]] â€” D02-VNPT vs D02-Viettel vs iBHXH (TS24)
- **Nháº­t kÃ½ váº¥n Ä‘á» Kaizen #08 (2017)**: [[wiki/sources/INS-Kaizen-08]] â€” ON-OFF thai sáº£n, timezone bug, 5 Whys D02/C70, káº¿ hoáº¡ch giáº£m bug Pareto
- **Äang dÃ¹ng táº¡i**: [[wiki/projects/VnPay-Project]]

**Ghi chÃº nguá»“n INS (2026-04-26)**:
> ToÃ n bá»™ tÃ i liá»‡u phÃ¢n há»‡ BH Ä‘Ã£ Ä‘Æ°á»£c ingest tá»« thÆ° má»¥c `1. Projects/Nghiá»‡p vá»¥ HRM/INS/`.
> Xem: [[wiki/sources/INS-InsuranceMonthJoin]], [[wiki/sources/INS-InsurancePayback]],
> [[wiki/sources/INS-InsuranceRecordDayCount]], [[wiki/sources/INS-D02-ChungTu]],
> [[wiki/sources/INS-C70-TinhLuong]], [[wiki/sources/INS-iBHXH-Analyze]]

### 4. Cháº¥m CÃ´ng (Attendance / Timekeeping)
- Quáº£n lÃ½ ca lÃ m viá»‡c
- TÃ­ch há»£p mÃ¡y cháº¥m cÃ´ng
- Xá»­ lÃ½ ngoáº¡i lá»‡ (Ä‘i muá»™n, vá» sá»›m, OT)
- Tá»•ng há»£p cÃ´ng

### 5. ÄÃ¡nh GiÃ¡ (Performance Evaluation)
- Thiáº¿t láº­p KPI / tiÃªu chÃ­ Ä‘Ã¡nh giÃ¡
- Chu ká»³ Ä‘Ã¡nh giÃ¡ (360Â°, trá»±c tiáº¿p)
- Káº¿t quáº£ Ä‘Ã¡nh giÃ¡ â†’ link vá»›i lÆ°Æ¡ng, thÄƒng tiáº¿n
- **Äang dÃ¹ng táº¡i**: [[wiki/projects/TrungDong-Project]], [[wiki/projects/HongNgoc-Project]]

### 6. NhÃ¢n TÃ i (Talent Management)
- Láº­p káº¿ hoáº¡ch Ä‘Ã o táº¡o
- Quáº£n lÃ½ nÄƒng lá»±c (competency)
- Succession planning
- Career path

## Patterns theo loáº¡i doanh nghiá»‡p

| Loáº¡i doanh nghiá»‡p | PhÃ¢n há»‡ thÆ°á»ng triá»ƒn khai |
|------------------|--------------------------|
| Sáº£n xuáº¥t | NhÃ¢n sá»± + LÆ°Æ¡ng + Cháº¥m cÃ´ng + Báº£o hiá»ƒm |
| TÃ i chÃ­nh / Fintech | NhÃ¢n sá»± + LÆ°Æ¡ng + ÄÃ¡nh giÃ¡ |
| Y táº¿ | NhÃ¢n sá»± + ÄÃ¡nh giÃ¡ |
| Dá»‹ch vá»¥ | ToÃ n bá»™ 6 phÃ¢n há»‡ |

## Common Issues

- Báº£o hiá»ƒm: sai thÃ¡ng tham gia, sai Ä‘áº¿m ngÃ y, cáº¯t báº£n ghi khi nghá»‰ á»‘m â†’ xem [[wiki/sources/INS-FishBone-Analysis]]
- LÆ°Æ¡ng: cÃ´ng thá»©c khÃ´ng Ä‘á»“ng bá»™ khi thay Ä‘á»•i chÃ­nh sÃ¡ch lÆ°Æ¡ng giá»¯a ká»³
- Cháº¥m cÃ´ng: lá»‡ch timezone khi tÃ­ch há»£p mÃ¡y cháº¥m cÃ´ng â†’ xem [[wiki/sources/H-VnPay-Att-17042025]]

