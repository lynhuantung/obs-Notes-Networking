---
Mã: 25093710-01
aliases:
date: 2025-09-10
time: 14:26
Week: "37"
tags:
  - daily
Liên kết:
  - "[[5-kiem-tra-ket-qua]]"
---
# 6- Lưu ý cho Developer

## A. Khi job FAILED

- **Kiểm tra log**:
    
    ```powershell
    docker logs -f sonarqube
    ```
    
- Sau lệnh `begin`, phải có file  
    `.sonarqube/conf/SonarQubeAnalysisConfig.xml`
    
    - Nếu không thấy → thường do **sai token / cú pháp / thư mục**.
        
    - Cách fix: thêm tham số debug
        
        ```powershell
        /d:sonar.verbose=true
        ```
        

## B. Quy tắc chạy lệnh

- Luôn chạy **3 lệnh SonarScanner (begin → build → end)** trong cùng thư mục `.sln`.
    
- Nếu thư mục `.sonarqube` bị xóa → dùng:
    
    ```powershell
    msbuild /t:Build
    ```
    
    thay vì `Rebuild`.
    
- Có thể chỉ định thư mục working riêng:
    
    ```powershell
    /d:sonar.working.directory="f:\\Sonar"
    ```
    

## C. Port & Token

- Đổi port khi bị trùng:
    
    ```yaml
    ports:
      - "9200:9000"
    ```
    
- ⚠️ Không hard-code token trong code → lưu trong **secret** (Azure Key Vault, GitHub Secret, …).
    

---

## D. File `sonar.properties` (F:\sonar\conf\sonar.properties)

```properties
# Global SonarQube settings

# Có thể exclude mặc định (tối ưu phân tích):
# sonar.exclusions=**/node_modules/**,**/*.min.js,**/Scripts/kendo/**,**/dist/**,**/build/**

# Java heap settings
sonar.web.javaOpts   = -Xms512m -Xmx1g -XX:+HeapDumpOnOutOfMemoryError
sonar.ce.javaOpts    = -Xms2g   -Xmx4g -XX:+HeapDumpOnOutOfMemoryError
sonar.search.javaOpts= -Xms1g   -Xmx1g -XX:+HeapDumpOnOutOfMemoryError

# Giới hạn số worker xử lý song song
sonar.ce.task.maxWorkers=1
```

### 🔍 Ý nghĩa & lợi ích

- `sonar.web.javaOpts`: cấu hình RAM cho web UI.
    
- `sonar.ce.javaOpts`: quan trọng nhất, dành cho **Compute Engine** (xử lý phân tích code).
    
    - Nếu RAM quá nhỏ → dễ bị lỗi **OutOfMemoryError** khi build project lớn.
        
    - Cấu hình này tăng lên 2–4GB để đảm bảo job không bị crash.
        
- `sonar.search.javaOpts`: cho Elasticsearch (chỉ cần vừa đủ 1GB).
    
- `sonar.ce.task.maxWorkers=1`: ép chỉ chạy **1 job phân tích tại một thời điểm** → tránh tình trạng “ngốn” RAM/CPU quá mức trên máy có cấu hình thấp.
    

👉 Chính nhờ tinh chỉnh `sonar.properties` mà quá trình build và phân tích code **ổn định, không bị tràn RAM**.

