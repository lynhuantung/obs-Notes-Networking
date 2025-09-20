---
Mã: 25093710-01
aliases:
date: 2025-09-10
time: 14:26
Week: "37"
tags:
  - daily
Liên kết:
  - "[[7-bao-cao-ket-qua]]"
---
# Cài CNES Report vào SonarQube (Docker Desktop)

## Yêu cầu

- Biết **tên container** SonarQube (ví dụ: `sonarqube`).
    
- File `sonar-cnes-report-5.0.2.jar` nằm ở **thư mục hiện tại**.
    

## Bước 1) Tạo thư mục `plugins` trong container

| Command line                                                                            |
| --------------------------------------------------------------------------------------- |
| `docker` `exec` `-it <container_name>` `mkdir` `-p` `/opt/sonarqube/extensions/plugins` |
![[Pasted image 20250920104750.png]]
  
  

## Bước 2) Copy file plugin `.jar` vào container

vào CMD với thư mục chứa file : `sonar-cnes-report-5.0.2.jar (nơi để file \\172.21.100.69\Vnr-public\Vu.Le\Sonar )`

| **Command Prompt**                                                                                |
| ------------------------------------------------------------------------------------------------- |
| `docker` `cp` `sonar-cnes-report-5.0.2.jar <container_name>:``/opt/sonarqube/extensions/plugins/` |

  

Sau khi copy lên thư mục plugin trong Docker Desktop:
![[Pasted image 20250920104837.png]]



Bước 3) Khởi động lại SonarQube  

| **Command Prompt**                |
| --------------------------------- |
| `docker restart <container_name>` |
 

Bước 4) Kiểm tra đã nạp plugin

- UI: **Administration → Marketplace → Installed** → thấy **“CNES Report”**.
    

> ✅ Khi plugin load thành công, trong mỗi **Project** sẽ có menu **CNES Report** để xuất **PDF/HTML/CSV**.
> 

![[Pasted image 20250920104926.png]]