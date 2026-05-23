---
Mã:
aliases:
date: 2025-06-19
tags:
  - document
Project: "[[Dự án VnPay]]"
Liên kết:
---
# **1. TỔNG QUAN TÀI LIỆU**

## **1.1 GIỚI THIỆU**

Tài liệu này mô tả **cách hoạt động của Windows Service sử dụng Hangfire** để chạy các công việc nền (background job) trong hệ thống HRM.  
Hangfire được dùng để **lập lịch, quản lý và giám sát job**, trong khi **framework nội bộ (TaskScheduleManager và AppDomainContainer)** đảm nhiệm việc **nạp và thực thi logic trong các DLL động**.

Dữ liệu trạng thái của các job (đang chạy, thành công, thất bại) được lưu trong **Redis**.  
Toàn bộ hệ thống được thiết kế nhằm **tự động hóa tác vụ định kỳ**, giảm tải cho người vận hành và đảm bảo tính ổn định, có thể mở rộng.

---

## **1.2 MỤC ĐÍCH TÀI LIỆU**

- Giải thích rõ **luồng chạy tổng thể** của Windows Service kết hợp Hangfire và Framework.
    
- Làm rõ **vai trò và mối quan hệ** giữa các thành phần.
    
- Hỗ trợ lập trình viên và đội vận hành **hiểu cấu trúc, dễ debug và cấu hình triển khai**.
    
- Giúp người đọc có thể **theo dõi, kiểm tra và mở rộng** hệ thống job dễ dàng.
    

---

# **2. HƯỚNG DẪN CHI TIẾT**

## **2.1 Luồng hoạt động tổng thể**

Khi Windows Service được khởi động, hệ thống thực hiện các bước sau:

1. **Program.cs (Host App)**
    
    - Khởi tạo dịch vụ Windows Service.
        
    - Gọi các hàm cấu hình:
        
        - `AddHangfire()` – cấu hình nền tảng Hangfire.
            
        - `AddRedisStorage()` – khai báo Redis làm nơi lưu trạng thái job.
            
        - `AddHostedService<HrmTaskScheduleWorker>()` – đăng ký worker chạy nền.
            
2. **HrmTaskScheduleWorker (Hosted Service)**
    
    - Là dịch vụ nền chính của Hangfire.
        
    - Khi khởi động, gọi hàm `RunTaskSchedule()` để bắt đầu chu kỳ chạy.
        
3. **TaskScheduleManager (Framework)**
    
    - Quản lý lịch chạy bằng Timer.
        
    - Mỗi 30 giây gọi `RunSchedule()` để:
        
        - Gọi API lấy danh sách job cần chạy.
            
        - Kiểm tra điều kiện thực thi.
            
    - Mỗi 10 phút kiểm tra DLL để reload nếu có thay đổi.
        
4. **AppDomainContainer (Framework)**
    
    - Khi có job hợp lệ, `TaskScheduleManager` gọi `AppDomainContainer.DoCallBack(...)`.
        
    - `AppDomainContainer` sẽ:
        
        - Nạp DLL chứa logic của job.
            
        - Deserialize dữ liệu job từ JSON sang object `JobItem`.
            
        - Gọi `ExecuteTask()` để thực thi tác vụ cụ thể.
            
5. **Redis (DB2)**
    
    - Lưu trữ danh sách job, trạng thái job (đang chạy, thành công, lỗi).
        
    - Giúp Hangfire theo dõi, khởi động lại hoặc trigger thủ công.
        
6. **Hangfire Dashboard (Giao diện quản trị)**
    
    - Truy cập qua địa chỉ `/hangfire`.
        
    - Cho phép:
        
        - Xem danh sách job đã chạy hoặc thất bại.
            
        - Theo dõi job đang xử lý theo thời gian thực.
            
        - Kích hoạt job thủ công khi cần.
            

---

## **2.2 Sơ đồ luồng xử lý**

===============================  
LUỒNG CHẠY WINDOWS SERVICE + HANGFIRE  
===============================

[1] Windows Service (Program.cs)  
    ├── Cấu hình Hangfire  
    ├── Cấu hình Redis làm job storage  
    ├── Đăng ký HostedService (HrmTaskScheduleWorker)  
    └── Khởi động service nền

             │  
            ▼  
[2] HrmTaskScheduleWorker (HostedService)  
    ├── Hàm ExecuteAsync() được gọi khi service khởi động  
    └── Gọi RunTaskSchedule() để bắt đầu vòng lặp xử lý

            │  
            ▼  
[3] TaskScheduleManager (Framework)  
    ├── Load cấu hình từ WebSettings.json  
    ├── Tạo Timer định kỳ:  
    │      • 30 giây/lần: gọi RunSchedule()  
    │      • 10 phút/lần: CheckAssemblies()  
    └── Trong RunSchedule():  
            - Gọi API lấy danh sách job  
            - Kiểm tra điều kiện job  
            - Nếu hợp lệ → Gọi AppDomainContainer.DoCallBack(...)

            │  
            ▼  
[4] AppDomainContainer (Framework)  
    ├── Load DLL Task động  
    ├── Deserialize JSON → JobItem object  
    └── Gọi job.ExecuteTask() trong DLL tương ứng

            │  
            ▼  
[5] Redis (DB2)  
    ├── Lưu hàng đợi job (Queue)  
    ├── Lưu trạng thái job (Succeeded / Failed / Processing)  
    └── Làm job storage cho Hangfire

            │  
            ▼  
[6] Hangfire Dashboard (/hangfire)  
    ├── Hiển thị danh sách job  
    ├── Theo dõi trạng thái thực thi real-time  
    ├── Cho phép trigger job thủ công  
    └── Hỗ trợ debug và quản trị job

===============================  
TÓM TẮT LUỒNG CHÍNH  
===============================  
Program.cs  →  HrmTaskScheduleWorker  →  TaskScheduleManager     →  AppDomainContainer  →  Redis  →  Hangfire Dashboard  
===============================

  

![[Pasted image 20251122142410.png]]

---

## **2.3 Vai trò các thành phần**

  

|`Program.cs`|Host App|Khởi tạo Windows Service, cấu hình Hangfire và Redis|
|`HrmTaskScheduleWorker`|Host App (Hangfire)|Dịch vụ nền, gọi `RunTaskSchedule()` để duy trì vòng đời job|
|`TaskScheduleManager`|Framework|Quản lý lịch chạy, gọi API, kiểm tra DLL|
|`AppDomainContainer`|Framework|Nạp DLL, deserialize job, gọi `ExecuteTask()`|
|`Redis (DB2)`|Hangfire Storage|Lưu trữ trạng thái job, quản lý hàng đợi|
|`Hangfire Dashboard`|Host UI|Giao diện quản trị job qua trình duyệt|

---

## **2.4 Chu kỳ hoạt động của hệ thống**

1. Windows Service khởi chạy → cấu hình Hangfire và Redis.
    
2. Worker bắt đầu chạy nền và gọi `RunTaskSchedule()`.
    
3. Mỗi 30 giây, hệ thống kiểm tra danh sách job mới từ API.
    
4. Nếu job đủ điều kiện, `AppDomainContainer` được gọi để thực thi job trong DLL.
    
5. Kết quả job (thành công hoặc lỗi) được lưu tại Redis.
    
6. Quản trị viên có thể xem hoặc thao tác job tại `/hangfire`.
    

---

## **2.5 Tóm tắt**

  

|**Windows Service (Host)**|Khởi tạo và duy trì nền tảng Hangfire, quản lý vòng đời dịch vụ.|
|**Framework (Task Manager + AppDomain)**|Xử lý nghiệp vụ và job động thông qua DLL.|
|**Redis**|Lưu trữ dữ liệu job và trạng thái thực thi.|
|**Dashboard UI**|Giao diện quản trị, hỗ trợ theo dõi và thao tác job.|