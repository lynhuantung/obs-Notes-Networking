---
type: source
code: k4vn
tags:
  - "ky-so"
  - "windows-service"
  - "security"
  - "antivirus"
  - "system"
domain: system
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/concepts/HRM-Deploy-Checklist]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
description: "Hướng dẫn ký số file WindowsService HRM bằng self-signed certificate để tránh bị antivirus xóa tự động."
---

# Source: Ký Số Windows Service (HRM)

## Tóm tắt

Hướng dẫn ký số file `HRM.Presentation.WindowsService.exe` bằng self-signed certificate để tránh bị phần mềm diệt virus của IT tự động xóa — tình huống thực tế gặp phải tháng 09/2025. Giải pháp dùng PowerShell để tạo Code Signing cert nội bộ, ký file exe bằng SignTool, và phân phối `.cer` cho các máy client/server cài vào Trusted Root. Không cần mua chứng chỉ công khai — hiệu lực trong phạm vi nội bộ công ty.

## Key Takeaways

- **Tình huống**: IT cài antivirus tự động xóa `HRM.Presentation.WindowsService.exe` vì chưa được ký số
- **Giải pháp**: Self-signed Code Signing cert dùng `New-SelfSignedCertificate` PowerShell
- **Hai file cần tạo**: `.pfx` (private key — chỉ dùng để ký, giữ bí mật) và `.cer` (public key — phát cho client cài)
- **Ký bằng SignTool**: cần Windows SDK, dùng timestamp server `http://timestamp.digicert.com` để chữ ký hợp lệ dù cert hết hạn
- **Cài cert trên client**: `Install-Cert.ps1` script cài `.cer` vào `Trusted Root Certification Authorities (LocalMachine)`
- **Kiểm tra**: `Get-AuthenticodeSignature` → `Status = Valid` là thành công
- **Phạm vi**: chỉ nội bộ — nếu phát hành public cần EV Code Signing có phí

## Trích dẫn quan trọng

> `HRM.Presentation.WindowsService.exe` bị phần mềm diệt virus do phía IT cài đặt tự động xóa. Cần nghiên cứu cấp chứng chỉ cho file.

> Timestamp server (`/tr`) giúp chữ ký hợp lệ kể cả khi chứng chỉ hết hạn.

> File `.pfx` chỉ dùng trong CI/CD hoặc máy build — không phát tán.

## Script tóm tắt

```powershell
# Tạo cert + ký exe (Sign-Exe.ps1)
$cert = New-SelfSignedCertificate -Type CodeSigningCert -Subject "CN=HRM Windows Service Code Signing" ...
Export-PfxCertificate ...   # → HRMCodeSign.pfx
Export-Certificate ...      # → HRMCodeSign.cer
signtool.exe sign /f HRMCodeSign.pfx /tr http://timestamp.digicert.com /td sha256 /fd sha256 HRM.exe

# Cài cert trên client (Install-Cert.ps1)
$store = New-Object X509Store("Root","LocalMachine")
$store.Add($cert)
```

## Liên kết

- [[wiki/concepts/HRM-Deploy-Checklist]] — Checklist deploy server mới
- [[wiki/concepts/HRM-Security-Config]] — Bảo mật HRM: VnrDecrypt, AllowOrigin, permission
- [[wiki/architecture/HRM-Deployment-Architecture]] — Kiến trúc deploy IIS + K8s
