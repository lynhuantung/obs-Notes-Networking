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


# 📌 Hướng dẫn ký số file `.exe` bằng SignTool

## 1. Chuẩn bị

- File chứng chỉ định dạng **.pfx** (có private key).
    
- Mật khẩu cho file `.pfx`.
    
- Đường dẫn đến **signtool.exe** (tuỳ theo Windows SDK cài đặt).
    
- File `.exe` cần ký số.
    

Ví dụ:

- `signtool.exe`: `C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64\signtool.exe`
    
- File PFX: `D:\Cert\star_vnresource_net_cert.pfx`
    
- File exe: `C:\Code\HRM9GIT02\Main\Source\Presentation\HRM.Presentation.WindowsService\bin\Debug\HRM.Presentation.WindowsService.exe`
    

---

## 2. Khai báo biến (PowerShell)

```powershell
# Cấu hình
$SignTool = "C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64\signtool.exe"
$Pfx      = "D:\Cert\star_vnresource_net_cert.pfx"   # chứng chỉ PFX
$Pwd      = (Get-Content "D:\Cert\pass.txt" -Raw).Trim()  # đọc mật khẩu từ file
$Target   = "C:\Code\HRM9GIT02\Main\Source\Presentation\HRM.Presentation.WindowsService\bin\Debug\HRM.Presentation.WindowsService.exe"
```

---

## 3. Cài đặt chứng chỉ CA (nếu cần)

```powershell
$dir = "D:\Cert"

# Root CA -> Trusted Root
Import-Certificate -FilePath "$dir\RootCA.crt" -CertStoreLocation "Cert:\LocalMachine\Root"

# Intermediate CA -> Intermediate store
Import-Certificate -FilePath "$dir\ChainCA.crt" -CertStoreLocation "Cert:\LocalMachine\CA"
```

---

## 4. Ký số file exe

```powershell
& $SignTool sign `
  /f $Pfx `
  /p $Pwd `
  /fd sha256 `
  /tr http://timestamp.sectigo.com `
  /td sha256 `
  /d "VnResource Windows Service" `
  /du "https://vnresource.net" `
  $Target
```

**Giải thích tham số**:

- `/f`: đường dẫn file `.pfx`.
    
- `/p`: mật khẩu của PFX.
    
- `/fd sha256`: thuật toán băm.
    
- `/tr`: URL Timestamp Server (DigiCert hoặc Sectigo).
    
- `/td sha256`: thuật toán băm cho timestamp.
    
- `/d`: mô tả ứng dụng.
    
- `/du`: URL của ứng dụng.
    

---

## 5. Kiểm tra chữ ký

```powershell
& $SignTool verify /pa /v $Target
# Hoặc:
Get-AuthenticodeSignature $Target | Format-List Status,SignerCertificate,TimeStamperCertificate
```

---

## 6. Ví dụ chạy trực tiếp (không cần script)

```cmd
"C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64\signtool.exe" sign ^
  /f "D:\Cert\star_vnresource_net_cert.pfx" ^
  /p 123456 ^
  /fd sha256 ^
  /tr http://timestamp.sectigo.com ^
  /td sha256 ^
  /d "VnResource Windows Service" ^
  /du "https://vnresource.net" ^
  "C:\Code\HRM9GIT02\Main\Source\Presentation\HRM.Presentation.WindowsService\bin\Debug\HRM.Presentation.WindowsService.exe"
```

---

👉 Vậy là quy trình chỉ gồm:

1. Cài đặt Root CA + Intermediate CA (1 lần duy nhất).
    
2. Ký số file `.exe`.
    
3. Kiểm tra chữ ký.
    

