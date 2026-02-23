---
Mã: 20250725-01
aliases: 
date: 2025-07-25
time: 15:39
Week: "02"
tags:
  - "#document"
Project: "[[Dự án QuickPack]]"
Liên kết:
---
# Tài Liệu Windows service - Hangfire

**Flowchart** mô tả **luồng chạy Windows Service dùng Hangfire** kèm **phân biệt rõ phần framework và phần host (Hangfire)**:

---

## 🧭 **Flowchart tổng thể**

```
+--------------------------+
|   Windows Service        |
| (Program.cs - Host App)  |
| - AddHangfire            |
| - AddHostedService       |
|  - AddRedisStorage       |  ────▶ Redis (DB2) (hangfire)
+-----------+--------------+
            |
            v
+----------------------------+
|   HostedService chạy:      |
| HrmTaskScheduleWorker      |  ◀── [Hangfire - Host]
+----------------------------+
            |
            v
  Gọi RunTaskSchedule()  ──────────────────────────────┐
            |                                          |
            v                                          |
+----------------------------+                         |
|   TaskScheduleManager      |  ◀────── [Framework]    |
+----------------------------+                         |
| - Load cấu hình            |                         |
| - Khởi tạo AppDomain       |                         |
| - Set Timer                |                         |
|   • 30s chạy RunSchedule   |                         |
|   • 10 phút CheckAssemblies|                         |
+----------------------------+                         |
            |                                          |
            v                                          |
      RunSchedule()                                    |
            |                                          |
            v                                          |
 Gọi API lấy danh sách Job                             |
            |                                          |
            v                                          |
 Lặp từng job: Nếu đủ điều kiện thì → Gọi              |
     AppDomainContainer.DoCallBack(...)                |
            |                                          |
            v                                          |
+----------------------------+                         |
|     AppDomainContainer     |  ◀────── [Framework]    |
+----------------------------+                         |
| - Load DLL Task động       |                         |
| - Deserialize JobItem      |                         |
| - Gọi job.ExecuteTask()    |                         |
+----------------------------+                         |
                                                       |
<──────────────────────────────────────────────────────┘
```

---
![[Pasted image 20250725092433.png]]
## 🧭 **TỔNG QUAN LUỒNG CHẠY WINDOWS SERVICE + HANGFIRE + TASK FRAMEWORK**

### 🔷 1. `Program.cs (Main)`

**Nằm ở Host App – phần ứng dụng chạy service**

- Cấu hình các thành phần:
    
    - `AddHangfire()` → dùng Redis làm job storage.
        
    - `AddHostedService<HrmTaskScheduleWorker>()` để khởi động worker chạy nền.
        

---

### 🔷 2. `HrmTaskScheduleWorker`

**HostedService chạy nền – phần thuộc Hangfire**

- Gọi `RunTaskSchedule()` ngay khi worker được khởi động.
    
- Đồng thời, giữ kết nối hoạt động để worker không dừng.
    
- Tương tác với **Redis (DB2)** để quản lý hàng đợi job.
    

---

### 🔷 3. `TaskScheduleManager`

**THUỘC DỰ ÁN FRAMEWORK – quản lý lập lịch theo timer**

- Load cấu hình từ `WebSettings.json`.
    
- Tạo timer:
    
    - ⏱ 30s/lần chạy `RunSchedule()` để lấy danh sách job từ API.
        
    - ⏱ 10 phút/lần kiểm tra thay đổi DLL (CheckAssemblies).
        
- Nếu job hợp lệ → gọi `AppDomainContainer.DoCallBack(...)`.
    

---

### 🔷 4. `AppDomainContainer`

**THUỘC FRAMEWORK – xử lý logic công việc thực tế**

- Nạp các file `.dll` từ thư mục cấu hình.
    
- Deserialize `JobItem` từ JSON (do API trả về).
    
- Gọi hàm `ExecuteTask()` bên trong DLL tương ứng.
    

---

### 🔷 5. `Redis (DB2)`

**Lưu job queue, trạng thái job thành công/thất bại**

- Được sử dụng bởi Hangfire làm job storage.
    
- Các job đã enqueue, succeed, failed... đều lưu ở đây.
    

---

### 🔷 6. `Hangfire Dashboard UI (/hangfire)`

**Phần giao diện quản trị job – dùng trong Host**

- Truy cập tại `/hangfire`.
    
- Các chức năng:
    
    - ✅ Xem lịch sử job (success / failed).
        
    - ✅ Trigger job thủ công.
        
    - ✅ Theo dõi real-time các job đang thực thi.
        

---

## ✅ **Tóm gọn phân tách vai trò**

|Thành phần|Thuộc nhóm|Vai trò chính|
|---|---|---|
|`Program.cs`, `Worker`|Host App|Gọi vào `TaskScheduleManager`|
|`TaskScheduleManager`|Framework|Quản lý lịch chạy & check DLL|
|`AppDomainContainer`|Framework|Load DLL & thực thi job|
|`Redis`|Hangfire Storage|Lưu trạng thái job|
|`Hangfire Dashboard`|Host UI|Giao diện theo dõi job|

---
## 🔍 **Giải thích luồng chạy**

|Thành phần|Vai trò|Nằm ở|
|---|---|---|
|`Program.cs`|Khởi tạo Windows Service, cấu hình Hangfire, Redis|Host (Hangfire)|
|`HrmTaskScheduleWorker`|BackgroundService chạy `RunTaskSchedule()` và giữ alive|Host (Hangfire)|
|`TaskScheduleManager`|Framework chính quản lý lập lịch định kỳ bằng Timer|Framework|
|`AppDomainContainer`|Nạp DLL chứa task, chạy task thông qua `DoCallBack`|Framework|
|`JobItem` trong DLL|Logic thực thi cụ thể, gọi `ExecuteTask()`|DLL ngoài|

---

## 💡 **Tóm tắt**

- Ứng dụng được host như một **Windows Service**.
    
- Khi chạy, service khởi tạo `Hangfire` để lập lịch và nạp `HostedService`.
    
- `HostedService` khởi tạo `TaskScheduleManager`, cấu hình 2 timer:
    
    - 30s/lần gọi `RunSchedule()` để gọi API lấy danh sách job và thực thi job.
        
    - 10 phút/lần kiểm tra DLL có bị thay đổi để reload lại container.
        
- Khi có job hợp lệ, `AppDomainContainer` sẽ:
    
    - Tự nạp DLL.
        
    - Deserialize JSON thành object `JobItem`.
        
    - Gọi `ExecuteTask()` xử lý thực tế.
        