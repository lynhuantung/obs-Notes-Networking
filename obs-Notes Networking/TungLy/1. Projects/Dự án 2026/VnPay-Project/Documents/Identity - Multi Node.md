---
Mã: 20250725-01
aliases:
date: 2025-12-13
tags:
  - "#document"
Project: "[[Dự án VnPay]]"
Liên kết:
---
                       ┌─────────────────────────┐
                       │      CLIENT (Portal)     │
                       │  Browser / Angular / App │
                       └─────────────┬───────────┘
                                     │
                             HTTPS /LOGIN
                                     │
                          ┌──────────▼──────────┐
                          │   LOAD BALANCER      │
                          │  (Ingress / Nginx)   │
                          └───┬────────┬────────┘
                              │        │
                    ┌─────────▼───┐ ┌──▼──────────┐
                    │  IDS4 POD A │ │ IDS4 POD B   │
                    │  (Identity) │ │ (Identity)   │
                    └───────┬─────┘ └────┬────────┘
                            │            │
                            │            │
                   ┌────────▼────────────▼─────────┐
                   │    SHARED COMPONENTS (BẮT BUỘC)│
                   │--------------------------------│
                   │ 1. Signing Key (PFX)           │
                   │ 2. DataProtection Keys (Redis) │
                   │ 3. Session Ticket Store (Redis)│
                   │ 4. Distributed Cache (Redis)   │
                   │ 5. Persisted Grants (SQL)      │
                   └────────────────────────────────┘

# 🟥 **2) DÒNG CHẢY LOGIN TRONG MÔI TRƯỜNG MULTI-NODE**

## **Bước 1 – Client gửi request /login**

→ Load Balancer chọn 1 node, ví dụ **POD A**

`Client → LB → POD A`

POD A:

- tạo **authentication cookie**
    
- mã hóa bằng **DataProtectionKey**
    
- ký token bằng **SigningCredential (PFX)**
    
- lưu session vào **RedisTicketStore**
    

🎯 Tất cả **POD đều phải đọc / giải mã giống nhau**.

---

## **Bước 2 – Request tiếp theo KHÔNG đảm bảo về lại pod A**

Trong multi-node:

`Client → LB → POD B`

POD B sẽ:

1. **Giải mã cookie → cần DataProtectionKey chung**
    
2. **Validate token → cần SigningKey chung**
    
3. **Đọc session từ Redis → cần SessionStore chung**
    

Nếu **1 trong 3 cái khác nhau**, POD B sẽ thấy:

❌ “session không hợp lệ → redirect /logout → quay lại /login”

→ **ĐÂY LÀ LÝ DO BỊ ĐÁ LOGIN**.

---

# 🟩 **3) FLOW KHI ĐẦY ĐỦ SHARED COMPONENTS**

`Client → LB → POD A (login OK)          │          ▼ Client → LB → POD B (verify OK)          │          ▼ Client tiếp tục hoạt động bình thường`

Mọi thứ OK vì:

| Thành phần       | POD A   | POD B   | Ghi chú                 |
| ---------------- | ------- | ------- | ----------------------- |
| Signing Key      | ✔ chung | ✔ chung | Token không invalid     |
| DataProtection   | ✔ chung | ✔ chung | Cookie decode được      |
| SessionStore     | ✔ Redis | ✔ Redis | Lấy session đúng        |
| DistributedCache | ✔ Redis | ✔ Redis | PersistedGrants đồng bộ |
| ForwardedHeaders | ✔ đúng  | ✔ đúng  | Callback URL hợp lệ     |