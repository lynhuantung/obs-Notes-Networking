---
Mã: 25093710-01
aliases:
date: 2025-09-10
time: 14:26
Week: "37"
tags:
  - daily
Liên kết:
  - "[[2-sonarqube-tren-docker]]"
  - "[[4-quy-trinh-quet-net]]"
---
## 🔹 1. SonarScanner for .NET là gì?

- Đây là công cụ chính thức của SonarQube để phân tích code **.NET Framework / .NET Core**.
- Tải tại: [SonarScanner for .NET](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/scanners/sonarscanner-for-msbuild/)
    
- Nó hoạt động như một **wrapper** quanh quá trình build (`msbuild`) để:
    
    1. Ghi lại **thông tin phân tích** (code, cấu trúc, dependency, rule check).
        
    2. Gửi thông tin đó lên **SonarQube Server**.
        

---

## 🔹 2. Vì sao phải cài đặt SonarScanner?

- Khi bạn cài, sẽ có file thực thi:
    
    `SonarScanner.MSBuild.exe`
    
- Đặt nó trong **PATH** để có thể gọi trực tiếp từ PowerShell/Command Prompt/Developer Command Prompt.
    

---

## 🔹 3. Quy trình 3 bước khi chạy lệnh

Bạn phải chạy **3 lệnh theo đúng thứ tự**:

### (1) Bắt đầu phân tích (Begin)

`SonarScanner.MSBuild.exe begin /k:"AVN" /d:sonar.token="sqp_xxxxxx"`

👉 Lệnh này:

- Khai báo với SonarQube: "Tôi chuẩn bị phân tích Project Key = AVN".
    
- Sinh ra file cấu hình `.sonarqube/SonarQubeAnalysisConfig.xml` để lưu metadata.
    

---

### (2) Build Solution

`msbuild ".\VnResourceHRM 8.sln" /t:Rebuild /p:Configuration=Release`

👉 Lệnh này:

- Build đúng như khi bạn **Build trong Visual Studio**.
    
- Nhưng do có bước (1), quá trình build đã được "gắn hook", nên tất cả thông tin code sẽ được ghi lại cho Sonar.
    

---

### (3) Kết thúc phân tích (End)

`SonarScanner.MSBuild.exe end /d:sonar.token="sqp_xxxxxx"`

👉 Lệnh này:

- Đọc dữ liệu đã thu thập ở bước (2).
    
- Gửi kết quả phân tích về server SonarQube qua API.
    
- Bạn sẽ thấy kết quả hiển thị trong giao diện web SonarQube.
    

---

## 🔹 4. Khi “mở Visual Studio và chạy lệnh”

- Bạn **không chạy trực tiếp trong Visual Studio GUI** (nút Build/Run) vì build đó không được hook vào Sonar.
    
- Thay vào đó:
    
    - Mở **Developer Command Prompt for VS** (hoặc PowerShell).
        
    - `cd` đến thư mục chứa `.sln`.
        
    - Chạy lần lượt **3 lệnh** trên.
        

👉 Khi chạy xong bước (3), kết quả sẽ **tự động gửi lên SonarQube**, bạn chỉ cần mở web `http://localhost:9100` để xem.

---

## 🔹 5. Tóm tắt dễ nhớ
- Vào visual studio chạy 3 lệnh:
Chạy trong **Developer Command Prompt for VS**  ngay tại thư mục chứa `.sln`:

```powershell
SonarScanner.MSBuild.exe begin /k:"AVN" /d:sonar.token="sqp_xxxxxx" /d:sonar.exclusions="**/*.js,**/*.ts,**/node_modules/**,**/dist/**,**/build/**" /d:sonar.scm.disabled=true

msbuild ".\VnResourceHRM 8.sln" /t:Rebuild /p:Configuration=Release /nr:false

SonarScanner.MSBuild.exe end /d:sonar.token="sqp_xxxxxx"
```

VD: truyền token
```powershell
SonarScanner.MSBuild.exe begin /k:"AVN" /d:sonar.host.url="http://localhost:9100" /d:sonar.token="sqp_acba460be55b00656e810531f7a401f001c1ffb8"    /d:sonar.exclusions="**/*.js,**/*.ts,**/node_modules/**,**/dist/**,**/build/**,**/coverage/**,**/*.min.js,**/*.map,**/wwwroot/lib/**,**/bin/**,**/obj/**,**/*.g.cs,**/*.designer.cs,**/*.generated.cs,**/Migrations/**"    /d:sonar.scm.disabled=true

msbuild ".\VnResourceHRM 8.sln" /t:Rebuild /p:Configuration=Release /nr:false

SonarScanner.MSBuild.exe end /d:sonar.token="sqp_acba460be55b00656e810531f7a401f001c1ffb8"

```



- **begin** → khai báo project + chuẩn bị phân tích
    
- **msbuild** → biên dịch code + thu thập dữ liệu
    
- **end** → đẩy dữ liệu lên SonarQube
    

