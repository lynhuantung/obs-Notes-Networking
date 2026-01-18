---
Mã:
aliases: ["Docker flow HRM"]
date: 2026-01-18
tags:
  - "#docker"
Project: "[[Dự án VnPay]]"
Liên kết:
  - "[[06-Docker-PowerShell-Scripts]]"
---
Luồng chạy Docker HRM
Dev
 → chạy .ps1
 → docker-compose đọc .yml
 → đọc .env
 → (nếu cần) build bằng Dockerfile
 → các service chạy


📌 Dev chỉ chạm:

.env

.ps1