---
Mã: 25093710-01
aliases:
date: 2025-09-10
time: 14:26
Week: "37"
tags:
  - daily
Liên kết:
  - "[[0-Tổng quan SonarQube]]"
  - "[[3-cai-sonarscanner-net]]"
---
## 2. Triển khai SonarQube trên Docker

### 2.1 Chuẩn bị thư mục

```powershell
mkdir F:\sonar
mkdir F:\postgres\sonar
```

### 2.2 File `docker-compose.yml`

Tạo file `F:\sonar\docker-compose.yml` với nội dung:

```yaml
version: "3.8"

services:
  db:
    image: postgres:15
    container_name: sonar-postgres
    environment:
      POSTGRES_USER: sonar
      POSTGRES_PASSWORD: sonar
      POSTGRES_DB: sonar
    volumes:
      - F:\postgres\sonar:/var/lib/postgresql/data
    networks: [sonar-net]
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U sonar"]
      interval: 10s
      timeout: 5s
      retries: 5

  sonarqube:
    image: sonarqube:community
    container_name: sonarqube
    depends_on:
      db:
        condition: service_healthy
    ports:
      - "9100:9000"
    environment:
      SONAR_JDBC_URL: jdbc:postgresql://db:5432/sonar
      SONAR_JDBC_USERNAME: sonar
      SONAR_JDBC_PASSWORD: sonar

      # === Java heap ===
      # Web: 2GB là đủ cho quản trị/người dùng
      SONAR_WEB_JAVAOPTS: "-Xms1g -Xmx2g"
      # Compute Engine (xử lý analysis): tăng mạnh để tránh OOM
      SONAR_CE_JAVAOPTS: "-Xms3g -Xmx8g"   # nếu còn OOM => "-Xms4g -Xmx12g"

      # === Elasticsearch (Search) ===
      # Tắt mmap để tránh sự cố trên WSL2/Windows host
      SONAR_SEARCH_JAVAADDITIONALOPTS: "-Dnode.store.allow_mmap=false"

    volumes:
      - F:\sonar\conf:/opt/sonarqube/conf
      - F:\sonar\data:/opt/sonarqube/data
      - F:\sonar\extensions:/opt/sonarqube/extensions
      - F:\sonar\logs:/opt/sonarqube/logs
    networks: [sonar-net]
    shm_size: "1g"   # tăng shared memory cho
```

### 2.3 Khởi chạy

```powershell
cd F:\sonar
docker compose up -d
docker logs -f sonarqube
```

➡️ Chờ log hiển thị: **SonarQube is operational**

### 2.4 Truy cập

- URL: [http://localhost:9100](http://localhost:9100/)
    
- Tài khoản mặc định: **admin / admin**
    
- Đăng nhập lần đầu sẽ yêu cầu đổi mật khẩu.
