---
Mã: 20260307091236
aliases:
date: 2026-03-07
tags:
  - daily
Project: "[[1-1 Du an VnPay|Dự án VnPay]]"
Liên kết:
  - "[[Chuyển Redis sang Sentinel (chỉnh hạ tầng và cấu hình)]]"
---
![[Pasted image 20260307095510.png]]


---

# 1. Sơ đồ kiến trúc Redis Sentinel (Production)
# 2. Thành phần trong kiến trúc

|Thành phần|Vai trò|
|---|---|
|Client|ứng dụng gọi Redis|
|Redis Master|node chính đọc/ghi dữ liệu|
|Redis Replica|node sao chép dữ liệu|
|Sentinel|giám sát và bầu master mới|

---

# 3. Luồng hoạt động bình thường

### Bước 1 — Client hỏi Sentinel

Client **không connect trực tiếp Redis**.

```
Client → Sentinel
```

Hỏi:

```
Master hiện tại là ai?
```

---

### Bước 2 — Sentinel trả về master

Ví dụ:

```
Master = 10.10.1.12
```

---

### Bước 3 — Client truy cập Redis

```
Client → Redis Master
```

Ví dụ:

```
SET user:1 "Tu"
GET user:1
```

---

### Bước 4 — Replication

Redis tự copy dữ liệu:

```
Master → Replica1
Master → Replica2
```

Replica dùng để:

- backup
    
- read scale
    
- failover
    

---

# 4. Khi Redis Master chết

Ví dụ server master crash.

Sentinel phát hiện:

```
Sentinel1 ping → fail
Sentinel2 ping → fail
Sentinel3 ping → fail
```

Sentinel tiến hành **bỏ phiếu**.

---

# 5. Quorum voting

Ví dụ cấu hình:

```
quorum = 2
```

Nghĩa là:

```
2 sentinel đồng ý → master down
```

---

# 6. Failover

Sentinel chọn replica tốt nhất.

Ví dụ:

```
Replica1 → promoted → MASTER
```

Topology mới:

```
Replica1 → MASTER
Replica2 → replica
```

---

# 7. Master cũ nếu chạy lại

Nếu server master cũ khởi động lại:

```
Master cũ → trở thành replica
```

Hệ thống cuối:

```
Replica1 → MASTER
Replica2 → replica
Master cũ → replica
```

---

# 8. Timeline failover

```
t0 master OK
t1 master crash
t2 sentinel detect (~5s)
t3 sentinel vote
t4 promote replica
t5 client reconnect
```

Downtime thường:

```
5–15 giây
```

---

# 9. Deployment production chuẩn

Thường deploy như sau:

|Server|Redis|Sentinel|
|---|---|---|
|Server A|Master|Sentinel1|
|Server B|Replica|Sentinel2|
|Server C|Replica|Sentinel3|

Lý do:

- tránh **single point of failure**
    
- sentinel phân tán
    
- quorum hoạt động ổn định
    

---

# 10. Tóm tắt kiến trúc

```
3 Redis nodes
1 Master
2 Replica

3 Sentinel nodes
monitor + vote + failover
```

Sentinel **không lưu dữ liệu**  
Sentinel chỉ **giám sát và bầu master mới**.

---

Nếu bạn muốn, tôi có thể vẽ thêm **1 sơ đồ Redis Sentinel failover (từ lúc master chết → bầu master mới)** trực quan hơn nhiều, rất phù hợp đưa vào **tài liệu kiến trúc hệ thống hoặc slide trình bày**.