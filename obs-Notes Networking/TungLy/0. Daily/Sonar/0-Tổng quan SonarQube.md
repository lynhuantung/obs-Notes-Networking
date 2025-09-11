---
Mã: "25093710-01"
aliases: 
date: "2025-09-10"
time: "14:26"
Week: "37"
tags:
  - daily
---
# 🧭 Tổng quan SonarQube

SonarQube là nền tảng giúp **phân tích chất lượng mã nguồn**, phát hiện:

- 🐞 **Bugs** (lỗi tiềm ẩn)
    
- 🔒 **Vulnerabilities** (lỗ hổng bảo mật)
    
- 🧹 **Code Smells** (mùi code, ảnh hưởng maintainability)
    
- 📊 **Coverage & Duplication** (độ phủ test, code trùng lặp)
    

---

## 📂 Quy trình setup & sử dụng

1. [[1-cai-docker-desktop]] → Cài Docker Desktop & chuẩn bị môi trường
    
2. [[2-sonarqube-tren-docker]] → Triển khai SonarQube bằng Docker Compose
    
3. [[3-cai-sonarscanner-net]] → Cài đặt SonarScanner cho .NET
    
4. [[4-quy-trinh-quet-net]] → Thực hiện quét mã nguồn .NET (Begin → Build → End)
    
5. [[5-kiem-tra-ket-qua]] → Kiểm tra kết quả phân tích trên giao diện web SonarQube
    
6. [[6-luu-y-developer]] → Các lưu ý khi sử dụng SonarQube trong phát triển
    

---

## 🎯 Mục tiêu sử dụng

- Đảm bảo **chất lượng & bảo mật** mã nguồn.
    
- Tích hợp vào CI/CD để kiểm soát code trước khi merge.
    
- Hỗ trợ developer phát hiện và fix lỗi sớm.
    

## 🚀 Quy trình triển khai & quét code
flow từ:  Docker → Sonar → Scanner → Build và phân tích code  → Kết quả

![[Pasted image 20250910143936.png]]

---

## 🔗 Liên kết nhanh

- Trang chủ SonarQube: [https://www.sonarsource.com/products/sonarqube/](https://www.sonarsource.com/products/sonarqube/)
    
- Tài liệu SonarScanner: [https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/scanners/sonarscanner-for-msbuild/](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/scanners/sonarscanner-for-msbuild/)
    
