---
Mã: 25093710-01
aliases:
date: 2025-09-10
time: 14:26
Week: "37"
tags:
  - daily
Liên kết:
  - "[[2-sonarqube-tren-docker]]"
---
## 1. Cài Docker Desktop

### 1.1 Cài Docker

- Tải tại: [Docker Desktop cho Windows](https://www.docker.com/products/docker-desktop/)
    
- Cài đặt bình thường, bật **WSL 2**.
    

### 1.2 Chuyển dữ liệu Docker sang ổ khác (ví dụ: `F:`)

Mở **PowerShell (Admin)** và chạy:

```powershell
wsl --update
Restart-Computer
wsl --shutdown

mkdir F:\DockerData

wsl --export docker-desktop-data F:\DockerData\docker-desktop-data.tar
wsl --unregister docker-desktop-data
wsl --import docker-desktop-data F:\DockerData F:\DockerData\docker-desktop-data.tar --version 2
```

Kiểm tra:

```powershell
wsl -l -v
```

➡️ Phải thấy `docker-desktop-data` chạy ở đường dẫn mới.

---

