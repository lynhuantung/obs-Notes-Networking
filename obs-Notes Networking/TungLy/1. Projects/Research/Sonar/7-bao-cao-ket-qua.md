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
# 7- Báo cáo kết quả (từ file JSON)

## A. Bước 1 – Lấy dữ liệu

- Gọi API SonarQube bằng Postman/cURL:
    
    ```bash
    curl 'http://localhost:9100/api/issues/search?componentKeys=AVN&types=VULNERABILITY&ps=500&p=1' \
      -u "YOUR_TOKEN:"
    ```
    
- Lưu response thành file `avn-vulnerabilities.json`.
    

---

## B. Bước 2 – Hiểu cấu trúc JSON

Ví dụ:

```json
{
  "total": 92,
  "issues": [
    {
      "key": "57d04bff-6eb1-4a1f-a531-c863384e7dc8",
      "rule": "secrets:S6703",
      "severity": "BLOCKER",
      "component": "AVN:Business/HRM.Business.Attendance.Domain/Att_TimeSheetServices.cs",
      "line": 2178,
      "status": "OPEN",
      "message": "Make sure this database password gets changed and removed from the code.",
      "effort": "30min",
      "type": "VULNERABILITY",
      "creationDate": "2025-09-09T07:48:00+0000"
    }
  ]
}
```

### Ý nghĩa chính:

- `total`: tổng số vulnerabilities (92).
    
- `issues[]`: danh sách từng lỗi.
    
    - `severity`: mức độ (BLOCKER/CRITICAL/MAJOR/...).
        
    - `component`: file chứa lỗi.
        
    - `line`: dòng code.
        
    - `message`: mô tả chi tiết.
        
    - `rule`: rule Sonar vi phạm.
        
    - `effort`: thời gian ước tính để fix (30min).
        
    - `status`: OPEN / RESOLVED.
        
    - `type`: loại issue (VULNERABILITY).
        
    - `creationDate`: ngày phát hiện.
        

---

## C. Bước 3 – Xuất dữ liệu báo cáo

### PowerShell: JSON → CSV
lưu thành avn-vulnerabilities.json

```powershell
$data = Get-Content .\avn-vulnerabilities.json | ConvertFrom-Json
$data.issues | Select key,severity,rule,component,line,message,effort,status,creationDate |
 Export-Csv avn-vulnerabilities.csv -NoTypeInformation -Encoding UTF8
```

### Ví dụ CSV:

|key|severity|rule|component|line|message|effort|status|creationDate|
|---|---|---|---|---|---|---|---|---|
|57d04bff-6eb1-4a1f-a531-c863384e7dc8|BLOCKER|secrets:S6703|AVN:Business/.../Att_TimeSheetServices.cs|2178|Make sure this database password gets changed and removed from code.|30min|OPEN|2025-09-09T07:48:00Z|

---

## D. Bước 4 – Viết báo cáo Markdown

```markdown
# Báo cáo SonarQube – AVN (09/09/2025)

## 1) Tổng quan
- Tổng vulnerabilities: 92
- Effort total: 1850 phút (~31h)

## 2) Mức độ nghiêm trọng
- BLOCKER: 1
- CRITICAL: xx
- MAJOR: xx
- MINOR: xx

## 3) Ví dụ lỗi điển hình
- [BLOCKER] Hard-coded password  
  File: Att_TimeSheetServices.cs (line 2178)  
  Rule: secrets:S6703  
  Message: *Make sure this database password gets changed and removed from the code.*  
  Effort: 30min  

## 4) Hành động
- [ ] Fix toàn bộ BLOCKER trong sprint tới  
- [ ] Review CRITICAL với team Security  
- [ ] Lưu lại CSV để theo dõi tiến độ
```

---

👉 Như vậy, quy trình: **API → JSON → CSV → Báo cáo Markdown**.

