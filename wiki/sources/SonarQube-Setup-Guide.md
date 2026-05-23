---
description: "Hướng dẫn cài SonarQube trên Docker+PostgreSQL và quét mã nguồn .NET, xuất báo cáo JSON/CSV — thực tế phát hiện 92 lỗ hổng dự án AVN."
type: source
code: s9qr
tags:
  - "sonarqube"
  - "code-quality"
  - "security"
  - "devtools"
  - "system"
domain: system
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/concepts/HRM-Code-Quality]]"
  - "[[wiki/concepts/AI-DevTools]]"
  - "[[wiki/sources/AVN-Security-Vulnerability-2025]]"
---

# Source: SonarQube Setup Guide (HRM Dev)

## Tóm tắt

Tài liệu hướng dẫn cài đặt và sử dụng SonarQube để phân tích chất lượng mã nguồn HRM — được tạo tháng 09/2025 (Week 37). Gồm 9 file: tổng quan, cài Docker Desktop, triển khai SonarQube trên Docker Compose (với PostgreSQL), cài SonarScanner .NET, quy trình quét 3 bước (begin→build→end), kiểm tra kết quả, lưu ý developer, xuất báo cáo JSON→CSV, và plugin xuất báo cáo. Tài liệu này được dùng thực tế để quét dự án AVN và phát hiện 92 vulnerabilities.

## Key Takeaways

- **Stack**: SonarQube Community + PostgreSQL 15 + Docker Compose trên Windows (WSL2)
- **Port mặc định**: `9100:9000` (tránh xung đột với các service khác)
- **3 bước quét .NET**: `begin` (khai báo project+token) → `msbuild build` (thu thập) → `end` (đẩy lên Sonar)
- **Bộ nhớ quan trọng**: `sonar.ce.javaOpts = -Xms3g -Xmx8g` — Compute Engine cần RAM lớn; thiếu RAM gây OOM khi quét project .NET lớn
- **`sonar.ce.task.maxWorkers=1`**: chỉ chạy 1 job tại một thời điểm — ổn định trên máy cấu hình thấp
- **Xuất báo cáo**: gọi API `/api/issues/search` → JSON → PowerShell CSV → Markdown report
- **Thực tế**: quét AVN cho thấy 92 lỗ hổng, nhiều BLOCKER là hardcoded DB password trong code C#

## Trích dẫn quan trọng

> `sonar.ce.javaOpts = -Xms3g -Xmx8g` — nếu còn OOM => `-Xms4g -Xmx12g`. Nếu RAM quá nhỏ → dễ bị lỗi **OutOfMemoryError** khi build project lớn.

> Không hard-code token trong code → lưu trong **secret** (Azure Key Vault, GitHub Secret).

> Luôn chạy **3 lệnh SonarScanner (begin → build → end)** trong cùng thư mục `.sln`.

## Quy trình quét nhanh

```powershell
# 1. Begin
dotnet-sonarscanner begin /k:"PROJECT_KEY" /d:sonar.host.url="http://localhost:9100" /d:sonar.login="TOKEN"

# 2. Build
msbuild HRM.sln /t:Build

# 3. End
dotnet-sonarscanner end /d:sonar.login="TOKEN"
```

## Liên kết

- [[wiki/concepts/HRM-Code-Quality]] — Quy tắc store, merge, enum, giao tiếp SE-BA-QC
- [[wiki/concepts/AI-DevTools]] — Cursor AI, stack kỹ thuật developer
- [[wiki/sources/AVN-Security-Vulnerability-2025]] — Case study: 92 lỗ hổng AVN từ SonarQube
