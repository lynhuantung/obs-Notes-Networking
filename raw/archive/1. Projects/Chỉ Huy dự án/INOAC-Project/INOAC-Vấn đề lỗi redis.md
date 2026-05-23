---
Tráº¡ng thÃ¡i:
  - HoÃ n thÃ nh
aliases:
title:
tags:
  - "#chi-huy-du-an"
  - "#truong-du-an"
  - "#report"
  - "#issuelog"
date: 2025-01-22
Related:
  - "[[raw/archive/1. Projects/Chá»‰ Huy dá»± Ã¡n/INOAC-Project/INOAC-Project]]"
Amis Link:
Link:
Project: "[[Dá»± Ã¡n INOAC]]"
---
### **BÃ¡o cÃ¡o Giáº£i TrÃ¬nh Lá»—i Redis Cache**

DÆ°á»›i Ä‘Ã¢y lÃ  pháº§n giáº£i trÃ¬nh cá»§a em vá» lá»—i Redis cache.

---

## **1. Váº¥n Ä‘á»**

- Khi Ä‘Äƒng kÃ½ **tÄƒng ca** trÃªn **portal V3**, ca lÃ m viá»‡c hiá»ƒn thá»‹ sai do **Redis cache nhÃ³m ca (Att_RosterGroup)** khÃ´ng Ä‘á»“ng bá»™ vá»›i **database**.

## **2. Giáº£i phÃ¡p**

- **XÃ³a Redis cache key Att_RosterGroup** Ä‘á»ƒ lÃ m má»›i dá»¯ liá»‡u vÃ  kháº¯c phá»¥c lá»—i hiá»ƒn thá»‹.

---

## **3. NguyÃªn nhÃ¢n gÃ¢y sai lá»‡ch Redis cache**

1. **Trigger trong database** tÃ¡c Ä‘á»™ng Ä‘áº¿n **Att_RosterGroup** vÃ  cÃ¡c báº£ng liÃªn quan.
2. **Job SQL & Scheduler task trong HRM** áº£nh hÆ°á»Ÿng Ä‘áº¿n dá»¯ liá»‡u trong cache.
3. **Cáº­p nháº­t trá»±c tiáº¿p trÃªn SQL & API tÃ­ch há»£p** khÃ´ng cáº­p nháº­t láº¡i cache.
4. **Import dá»¯ liá»‡u trong HRM** lÃ m thay Ä‘á»•i nhÃ³m ca nhÆ°ng khÃ´ng Ä‘á»“ng bá»™ cache.
5. **Cáº­p nháº­t giÃ¡n tiáº¿p giá»¯a cÃ¡c danh má»¥c cache**, khiáº¿n cache bá»‹ lá»‡ch so vá»›i database.

---

## **4. HÆ°á»›ng xá»­ lÃ½**

- Äiá»u chá»‰nh **trigger, job, scheduler** Ä‘á»ƒ trÃ¡nh áº£nh hÆ°á»Ÿng Ä‘áº¿n Redis cache.
- Bá»• sung chá»©c nÄƒng **xÃ³a toÃ n bá»™ cache Redis**.
- Khi nghi ngá» cache sai, kiá»ƒm tra vÃ  **clear cache trÃªn Redis Insight**.
- **@Tráº§n Hiá»‡p**: Tiáº¿n hÃ nh tÃ¡i hiá»‡n lá»—i trÃªn mÃ´i trÆ°á»ng khÃ¡ch hÃ ng báº±ng cÃ¡ch:
    - VÃ o chá»©c nÄƒng nhÃ³m ca, cáº­p nháº­t dá»¯ liá»‡u vÃ  import nhÃ³m ca.
    - Náº¿u phÃ¡t hiá»‡n lá»—i, Ä‘á»™i ká»¹ thuáº­t sáº½ xá»­ lÃ½ vÃ  cáº­p nháº­t fix.

---

## **5. Ghi chÃº**

- Viá»‡c sá»­ dá»¥ng **trigger trong database** cÃ³ thá»ƒ tÃ¡c Ä‘á»™ng Ä‘áº¿n **Redis cache** vÃ  áº£nh hÆ°á»Ÿng Ä‘áº¿n cÃ¡c chá»©c nÄƒng váº­n hÃ nh há»‡ thá»‘ng. Cáº§n cÃ¢n nháº¯c Ä‘iá»u chá»‰nh há»£p lÃ½ Ä‘á»ƒ trÃ¡nh lá»—i tÆ°Æ¡ng tá»± trong tÆ°Æ¡ng lai.
