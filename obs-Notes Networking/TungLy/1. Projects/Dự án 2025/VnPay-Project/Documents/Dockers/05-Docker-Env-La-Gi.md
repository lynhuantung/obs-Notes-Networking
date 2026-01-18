---
Mã:
aliases: [".env Docker"]
date: 2026-01-18
tags:
  - "#docker"
Project: "[[Dự án VnPay]]"
Liên kết:
  - "[[04-Docker-Compose-La-Gi]]"
---
### File `.env` là gì?

`.env` chứa:

- Port
    
- Version image
    
- Key S3
    
- User / Password DB
    

📌 **80% lỗi Docker nằm ở đây**:

- Sai port
    
- Sai key
    
- Sai DB
    

👉 Đây là **file được phép sửa**, nhưng **không commit secret**.