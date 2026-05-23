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
## 1. Giới thiệu Redis Sentinel

Trong hệ thống Redis cơ bản, thường sẽ có **1 Redis Master** để xử lý đọc/ghi dữ liệu. Tuy nhiên nếu **Redis Master bị lỗi hoặc server bị dừng**, ứng dụng sẽ không thể truy cập Redis nữa.

**Redis Sentinel** được thiết kế để giải quyết vấn đề này bằng cách:

- **Giám sát Redis Master**
    
- **Tự động chuyển đổi (failover) khi Master bị lỗi**
    
- **Cung cấp địa chỉ Redis Master hiện tại cho ứng dụng**
    

Nhờ đó hệ thống Redis có thể đạt được **High Availability (HA)** – tức là luôn hoạt động ngay cả khi một node Redis gặp sự cố.

Trong mô hình này:

- Ứng dụng `.NET` kết nối đến **Redis Sentinel**
    
- Sentinel sẽ trả về **Redis Master hiện tại**
    
- Redis Master xử lý đọc/ghi
    
- Redis Replica sao chép dữ liệu để dự phòng
    

---

# 2. Flow hoạt động

Luồng hoạt động của hệ thống như sơ đồ sau:

```
                 +---------------------------+
                 |      .NET APPLICATION     |
                 |     (API / Web / Job)     |
                 +------------+--------------+
                              |
                              | connect
                              | ServiceName = mymaster
                              v
        +-----------------------------------------------+
        |                REDIS SENTINEL                 |
        |                                               |
        |  Sentinel1      Sentinel2      Sentinel3      |
        |  10.0.0.10      10.0.0.11      10.0.0.12      |
        +------------------------+----------------------+
                                 |
                                 | monitor
                                 v
                     +--------------------------+
                     |       REDIS MASTER       |
                     |       10.0.0.10:6379     |
                     |       Read / Write       |
                     +------------+-------------+
                                  |
                                  | replication
                                  |
             +--------------------+--------------------+
             |                                         |
             v                                         v
      +---------------+                         +---------------+
      | REDIS REPLICA |                         | REDIS REPLICA |
      | 10.0.0.11     |                         | 10.0.0.12     |
      | Read          |                         | Read          |
      +---------------+                         +---------------+
```

---

# 3. Giải thích flow hoạt động

### 1. Ứng dụng kết nối Redis Sentinel

Ứng dụng `.NET` không kết nối trực tiếp tới Redis Master.  
Thay vào đó, ứng dụng kết nối tới **Redis Sentinel** thông qua `ServiceName`.

Ví dụ:

```
ServiceName = mymaster
Sentinel = 10.0.0.10:26379
Sentinel = 10.0.0.11:26379
Sentinel = 10.0.0.12:26379
```

Sentinel sẽ trả về **địa chỉ Redis Master hiện tại**.

---

### 2. Redis Master xử lý Read / Write

Sau khi nhận được địa chỉ Master, ứng dụng sẽ kết nối tới Redis Master để:

- Ghi dữ liệu (Write)
    
- Đọc dữ liệu (Read)
    

Ví dụ:

```
SET user:1 "Tung"
GET user:1
```

Redis Master là node **chính** của hệ thống.

---

### 3. Replication sang Redis Replica

Redis Master sẽ **sao chép dữ liệu sang các Redis Replica**.

Replica có nhiệm vụ:

- Dự phòng dữ liệu
    
- Sẵn sàng thay thế Master khi cần
    

Ví dụ:

```
Master   → 10.0.0.10
Replica  → 10.0.0.11
Replica  → 10.0.0.12
```

---

### 4. Sentinel giám sát Redis Master

Các Sentinel sẽ liên tục kiểm tra trạng thái Redis Master.

Nếu Redis Master không phản hồi trong một khoảng thời gian, Sentinel sẽ đánh dấu Redis Master là **down**.

Để tránh lỗi sai, Sentinel sẽ sử dụng **quorum vote** (bỏ phiếu giữa các Sentinel).

---

### 5. Failover khi Master gặp sự cố

Nếu đa số Sentinel xác nhận Redis Master đã lỗi:

1. Chọn **Redis Replica phù hợp**
    
2. **Promote Replica thành Master mới**
    
3. Cập nhật thông tin `mymaster`
    

Ví dụ:

```
10.0.0.11:6379 → trở thành Master mới
```

---

### 6. Ứng dụng tiếp tục hoạt động

Khi ứng dụng reconnect tới Sentinel, Sentinel sẽ trả về **Master mới**.

Ứng dụng tiếp tục hoạt động bình thường mà **không cần thay đổi cấu hình**.

---

# 4. Tóm tắt

Redis Sentinel giúp hệ thống Redis:

|Chức năng|Mô tả|
|---|---|
|Monitoring|Giám sát Redis Master|
|Failover|Tự động chuyển Master khi lỗi|
|Discovery|Cung cấp địa chỉ Master cho ứng dụng|
|High Availability|Đảm bảo Redis luôn hoạt động|

Nhờ Redis Sentinel, hệ thống Redis có thể **tự phục hồi khi có sự cố**, giúp ứng dụng hoạt động ổn định hơn.