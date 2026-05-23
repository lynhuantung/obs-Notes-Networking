---
Mã: 20260311173524
aliases:
date: 2026-03-11
tags:
  - daily
  - "#build"
  - "#docker"
Project:
---
Buoc 1: build từ visual studio (đưa lên host)
Bước 2: vào visual code ket nối ssh remote 
Bước 3: sửa version các service trong file .env (theo git)
buoc 4: chạy lệnh bên dưới để start service cho thay  đổi file .env
 set -a && source .env && set +a && docker stack deploy -c docker-compose.yml -c docker-compose.override.yml --resolve-image changed hrm
 
bước 5: vào redisinsight kiểm tra version đã cập nhật chưa (key redis: App-VnPay-Net8___Build:sysapi:Version)
http://vnpay-redisinsight.vnresource.net/

bước 6: chạy superadmin