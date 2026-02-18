---
Mã: 25093710-01
aliases:
date: 2025-09-10
time: 13:41
Week: "37"
tags:
  - daily
  - "#kyso"
  - "#widowservice"
---
**Tình huống**:  **HRM.Presentation.WindowsService.exe** bị phần mềm diệt virus do phía IT  cài đặt tự động xóa. Cần nghiên cứu cấp chứng chỉ cho file


---

# 📌 HƯỚNG DẪN KÝ SỐ WINDOWS SERVICE (.EXE) BẰNG CHỨNG CHỈ NỘI BỘ

## 1. Mục đích

- Tránh việc antivirus tự động xóa **HRM.Presentation.WindowsService.exe** vì chưa được ký số.
    
- Đảm bảo file chạy nội bộ được tin cậy.
    
- Không cần mua chứng chỉ công khai, chỉ dùng **self-signed certificate** trong hệ thống công ty.
    

---

## 2. Quy trình tổng quan

1. **Tạo chứng chỉ nội bộ (self-signed Code Signing).**
    
2. **Xuất chứng chỉ**:
    
    - `.pfx`: chứa private key → dùng để ký file exe.
        
    - `.cer`: chứa public key → cài trên client/server để tin cậy.
        
3. **Ký số file exe** bằng SignTool.
    
4. **Cài đặt chứng chỉ vào Trusted Root** trên các máy client/server.
    

---

## 3. Script PowerShell: Tạo chứng chỉ & Ký file `.exe`

Lưu thành file `Sign-Exe.ps1`.

```powershell
# =============================
# Config
# =============================
$subject    = "CN=HRM Windows Service Code Signing"
$pfxPath    = "D:\HRMCodeSign.pfx"
$cerPath    = "D:\HRMCodeSign.cer"
$exePath    = "D:\Build\HRM.Presentation.WindowsService.exe"
$pfxPass    = "P@ssw0rd!"   # đổi mật khẩu mạnh hơn

# =============================
# 1. Tạo chứng chỉ Code Signing
# =============================
$cert = New-SelfSignedCertificate `
    -Type CodeSigningCert `
    -Subject $subject `
    -CertStoreLocation "Cert:\CurrentUser\My" `
    -KeyExportPolicy Exportable `
    -KeySpec Signature `
    -HashAlgorithm sha256 `
    -NotAfter (Get-Date).AddYears(5)

Write-Host ">> Created certificate with Thumbprint: $($cert.Thumbprint)"

# =============================
# 2. Export PFX (private key)
# =============================
$securePass = ConvertTo-SecureString -String $pfxPass -Force -AsPlainText
Export-PfxCertificate `
    -Cert "Cert:\CurrentUser\My\$($cert.Thumbprint)" `
    -FilePath $pfxPath `
    -Password $securePass | Out-Null

Write-Host ">> Exported PFX to: $pfxPath"

# =============================
# 3. Export CER (public key)
# =============================
Export-Certificate `
    -Cert "Cert:\CurrentUser\My\$($cert.Thumbprint)" `
    -FilePath $cerPath | Out-Null

Write-Host ">> Exported CER to: $cerPath"

# =============================
# 4. Sign EXE with SignTool
# =============================
& "C:\Program Files (x86)\Windows Kits\10\bin\x64\signtool.exe" sign `
    /f $pfxPath `
    /p $pfxPass `
    /tr http://timestamp.digicert.com `
    /td sha256 `
    /fd sha256 `
    $exePath

Write-Host ">> Signed EXE: $exePath"
```

---

## 4. Script PowerShell: Cài chứng chỉ `.cer` vào Trusted Root

Lưu thành file `Install-Cert.ps1`.

```powershell
param(
    [string]$cerPath = "D:\HRMCodeSign.cer"
)

Write-Host ">> Importing certificate: $cerPath"

$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($cerPath)

# Cài vào Trusted Root Certification Authorities (Local Machine)
$store = New-Object System.Security.Cryptography.X509Certificates.X509Store("Root","LocalMachine")
$store.Open("ReadWrite")
$store.Add($cert)
$store.Close()

Write-Host ">> Installed certificate into Trusted Root successfully."
```

👉 Chạy script này trên mỗi client/server để cài chứng chỉ:

```powershell
.\Install-Cert.ps1 -cerPath "D:\HRMCodeSign.cer"
```

---

## 5. Thực hiện từng bước

### Bước 1. Ký số exe

1. Mở PowerShell **Run as Administrator**.
    
2. Chạy script `Sign-Exe.ps1`.
    
3. Kết quả:
    
    - `HRMCodeSign.pfx` → giữ an toàn, chỉ để build/ký file.
        
    - `HRMCodeSign.cer` → phát cho client/server để cài.
        
    - `HRM.Presentation.WindowsService.exe` → đã được ký số.
        

---

### Bước 2. Cài chứng chỉ trên máy Client/Server

**Cách 1: Dùng script Install-Cert.ps1 (khuyến nghị, nhanh gọn).**  
**Cách 2: Cài thủ công qua MMC → Certificates → Trusted Root.**

---

### Bước 3. Kiểm tra

Chạy:

```powershell
Get-AuthenticodeSignature "D:\Build\HRM.Presentation.WindowsService.exe"
```

- Nếu `Status = Valid` → chữ ký thành công, exe không còn bị antivirus xóa.
    

---

## 6. Lưu ý

- **An toàn**: file `.pfx` chỉ dùng trong CI/CD hoặc máy build, không phát tán.
    
- **Timestamp server** (`/tr`) giúp chữ ký hợp lệ kể cả khi chứng chỉ hết hạn.
    
- **Phạm vi nội bộ**: giải pháp này chỉ hiệu lực trong mạng công ty. Nếu phát hành public, cần mua **EV Code Signing**.
    

