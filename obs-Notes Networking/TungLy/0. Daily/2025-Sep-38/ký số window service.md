---
Mã: 25093815-01
aliases:
date: 2025-09-15
time: 09:50
Week: "38"
tags:
  - daily
  - "#fgl"
---
# 📄 Hướng dẫn ký số file Windows Service (.exe)

## 🎯 Mục tiêu

Ký số file `HRM.Presentation.WindowsService.exe` để:

- Xác định nguồn gốc phần mềm là từ **VnResource**.
    
- Đảm bảo file không bị thay đổi sau khi ký.
    
- Giảm rủi ro bị phần mềm antivirus tự động xóa.
    

---

## 🪪 Bước 1: Tạo chứng chỉ (PFX và CER)

### 1.1. Tạo chứng chỉ self-signed (dùng test/nội bộ)

Mở **PowerShell (Run as Administrator)** và chạy (mật khẩu VnR@123!):

```powershell
# Tạo chứng chỉ Code Signing, subject là VnResource
$cert = New-SelfSignedCertificate `
  -Type CodeSigningCert `
  -Subject "CN=VnResource" `
  -KeyAlgorithm RSA -KeyLength 3072 `
  -HashAlgorithm SHA256 `
  -KeyExportPolicy Exportable `
  -NotAfter (Get-Date).AddYears(2) `
  -CertStoreLocation "Cert:\CurrentUser\My"

# Đặt mật khẩu PFX
$pwd = ConvertTo-SecureString "VnR@123!" -AsPlainText -Force

# Xuất ra PFX (dùng để ký số)
Export-PfxCertificate -Cert $cert `
  -FilePath "D:\VnResource-CodeSign.pfx" `
  -Password $pwd

# Xuất ra CER (dùng để cài Trusted Root trên máy cần chạy file)
Export-Certificate -Cert $cert `
  -FilePath "D:\VnResource-CodeSign.cer"
```

👉 Sau khi chạy xong sẽ có 2 file:

- **VnResource-CodeSign.pfx** (dùng để ký số EXE)
    
- **VnResource-CodeSign.cer** (dùng để cài vào Trusted Root trên máy chạy)
    

> ⚠️ Nếu triển khai cho khách hàng/production, bắt buộc phải dùng **chứng chỉ Code Signing từ CA uy tín** (Sectigo, DigiCert, …). Self-signed chỉ phù hợp cho test/nội bộ.

---

## 🔑 Bước 2: Ký số file EXE

Tạo file script PowerShell , ví dụ: `Sign-WindowsService.ps1` với mật khẩu ở bước 1 (mật khẩu: VnR@123!)

```powershell
# 1) Khai báo biến cho gọn (tuỳ bạn giữ hay bỏ)
$SignTool = "C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64\signtool.exe"
$Pfx      = "D:\VnResource-CodeSign.pfx"         # cần PFX có private key (không dùng .cer)
$Pwd      = "VnR@123!"                            # mật khẩu PFX
$Target   = "C:\Code\HRM9GIT02\Main\Source\Presentation\HRM.Presentation.WindowsService\bin\Debug\HRM.Presentation.WindowsService.exe"

# 2) Ký số
& $SignTool sign `
  /f $Pfx `
  /p $Pwd `
  /fd sha256 `
  /tr http://timestamp.digicert.com `
  /td sha256 `
  /d "VnResource Windows Service" `
  /du "https://vnresource.example" `
  $Target

# 3) Kiểm tra chữ ký
& $SignTool verify /pa /v $Target

```

Chạy script này bằng PowerShell (Run as Administrator).

---

## 🔍 Bước 3: Kiểm tra chữ ký trên file EXE

- Chuột phải file `HRM.Presentation.WindowsService.exe` → **Properties** → tab **Digital Signatures**.

    ![[Pasted image 20250915102549.png]]
- Xem chi tiết: “Name of signer: VnResource” + trạng thái **This digital signature is OK** (nếu cert tin cậy).
    
- Nếu vẫn báo “not trusted” → cài file `.cer` vào Trusted Root.
    

---

## 🛡️ Bước 4: Cài chứng chỉ CER vào Trusted Root (nếu dùng self-signed)

1. Double click `VnResource-CodeSign.cer`.
    
2. Chọn **Install Certificate**.
    
3. Chọn **Local Machine** → Next.
    
4. Chọn **Place all certificates in the following store** → chọn **Trusted Root Certification Authorities**.
    
5. Finish → OK.
    
6. Kiểm tra lại chữ ký, sẽ thấy “This digital signature is OK”.
    

---

## 📌 Kết luận

- Với self-signed cert → dùng cho test, cần cài CER vào Trusted Root của tất cả server/máy chạy Windows Service.
    
- Với production/khách hàng → cần mua chứng chỉ Code Signing thật để vượt qua antivirus/SmartScreen mà không cần cài thêm CER.
    
