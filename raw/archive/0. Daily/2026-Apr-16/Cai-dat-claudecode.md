# Hướng dẫn cài đặt và chạy LiteLLM Proxy trên Windows

## Yêu cầu hệ thống

- **OS**: Windows 10/11
- **Python**: >= 3.10 (khuyến nghị **3.12**)
- **Node.js**: >= 18 (để cài Claude Code)
- **Công cụ**: `winget` (có sẵn trên Windows 10 1709+ và Windows 11)
- **Tài khoản**: GitHub Enterprise có GitHub Copilot license (MISA: https://github.com/enterprises/misajsc-github)

> **Lưu ý**: Python 3.9 trở xuống **không tương thích** với LiteLLM phiên bản mới do `aiohttp 3.13.x` yêu cầu Python >= 3.10.

---

## Kiến trúc tổng quan

```
Claude Code  →  LiteLLM Proxy (localhost:4000)  →  GitHub Copilot API
                                                      ↑
                                            Xác thực qua GitHub Enterprise
                                            (tài khoản Azure AD đồng bộ)
```

- **Claude Code**: CLI tool gọi API thông qua LiteLLM proxy
- **LiteLLM Proxy**: Chuyển đổi request từ Claude Code sang GitHub Copilot API
- **GitHub Copilot**: Được cấp qua GitHub Enterprise của công ty, tài khoản GitHub đồng bộ với Azure AD (Microsoft)

---

## Các bước thực hiện

### Bước 1: Cài đặt Python 3.12

Mở **PowerShell** (Run as Administrator nếu cần) và chạy:

```powershell
winget install Python.Python.3.12 --accept-source-agreements --accept-package-agreements
```

Kiểm tra cài đặt thành công:

```powershell
py -3.12 --version
# Output mong đợi: Python 3.12.x
```

### Bước 2: Đưa Python 3.12 lên ưu tiên trong PATH

Nếu máy đã có phiên bản Python cũ, lệnh `python` có thể vẫn trỏ về bản cũ. Chạy script sau để đưa Python 3.12 lên đầu PATH:

```powershell
# Lấy đường dẫn Python 3.12 (tự động theo user hiện tại)
$py312 = "$env:LOCALAPPDATA\Programs\Python\Python312"
$py312Scripts = "$env:LOCALAPPDATA\Programs\Python\Python312\Scripts"

# Lấy PATH hiện tại, loại bỏ các đường dẫn Python cũ nếu có
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
$paths = $userPath -split ";"
$cleanPaths = $paths | Where-Object {
    $_ -ne "" -and $_ -notmatch "Python3[0-9]{1,2}\\?$" -and $_ -notmatch "Python3[0-9]{1,2}\\Scripts\\?$"
}

# Đặt Python 3.12 lên đầu PATH
$newPath = @($py312, $py312Scripts) + $cleanPaths
[Environment]::SetEnvironmentVariable("Path", ($newPath -join ";"), "User")

# Refresh PATH trong terminal hiện tại
$env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [Environment]::GetEnvironmentVariable("Path", "User")
```

Xác nhận:

```powershell
python --version
# Output mong đợi: Python 3.12.x
```

> **Nếu máy chưa có Python cũ**: Bỏ qua bước này, Python 3.12 sẽ tự động là mặc định sau khi cài.

### Bước 3: Cài đặt LiteLLM Proxy

```powershell
pip install "litellm[proxy]"
```

Lệnh này sẽ cài `litellm` cùng tất cả dependency cần thiết: `fastapi`, `uvicorn`, `websockets`, `boto3`, `azure-identity`, `mcp`, v.v.

> Nếu `pip` vẫn trỏ về Python cũ, dùng: `py -3.12 -m pip install "litellm[proxy]"`

### Bước 4: Fix lỗi Unicode trên Windows

Terminal Windows mặc định dùng encoding `cp1252`, gây lỗi khi LiteLLM hiển thị banner Unicode. Thiết lập biến môi trường vĩnh viễn:

```powershell
[Environment]::SetEnvironmentVariable("PYTHONIOENCODING", "utf-8", "User")
```

> Sau bước này cần **mở terminal mới** để biến môi trường có hiệu lực.

### Bước 5: Tạo file config.yaml

Tạo thư mục project và file `config.yaml`:

```powershell
# Tạo thư mục (tuỳ chọn đường dẫn)
mkdir C:\LiteLLM -Force
cd C:\LiteLLM
```

Tạo file `config.yaml` với nội dung sau:

```yaml
litellm_settings:
  drop_params: true

model_list:
  - model_name: anthropic/*
    litellm_params:
      model: github_copilot/gpt-5-mini
      extra_headers:
        {
          "editor-version": "vscode/1.85.1",
          "Copilot-Integration-Id": "vscode-chat",
        }
  - model_name: anthropic/*
    litellm_params:
      model: github_copilot/claude-sonnet-4.5
      extra_headers:
        {
          "editor-version": "vscode/1.85.1",
          "Copilot-Integration-Id": "vscode-chat",
        }
```

> **Quan trọng**: `drop_params: true` là bắt buộc. Claude Code gửi các tham số `thinking`, `context_management` mà GitHub Copilot API không hỗ trợ. Thiếu dòng này sẽ gây lỗi `UnsupportedParamsError`.

### Bước 6: Đăng nhập Azure CLI (BẮT BUỘC trước khi chạy LiteLLM)

Tài khoản GitHub Enterprise của công ty (https://github.com/enterprises/misajsc-github) được **đồng bộ với Azure AD (Microsoft)**. LiteLLM cần xác thực qua GitHub, mà GitHub Enterprise dùng SSO liên kết với tài khoản Microsoft của công ty.

**Đăng nhập tài khoản Microsoft công ty trước:**

```powershell
# Cài Azure CLI (nếu chưa có)
winget install Microsoft.AzureCLI --accept-source-agreements --accept-package-agreements

# Đăng nhập bằng tài khoản công ty (ví dụ: ten.nguoidung@misasdc.onmicrosoft.com)
az login
```

Trình duyệt sẽ mở ra, đăng nhập bằng tài khoản Microsoft công ty (VD: `ten.nguoidung@misasdc.onmicrosoft.com`).

> **Tại sao cần bước này?** GitHub Enterprise của MISA dùng Azure AD SSO → khi LiteLLM yêu cầu xác thực GitHub device code, trình duyệt sẽ tự nhận diện phiên đăng nhập Microsoft → xác thực thành công.

### Bước 7: Chạy LiteLLM Proxy

```powershell
cd C:\LiteLLM
litellm --config config.yaml
```

Lần đầu chạy sẽ yêu cầu xác thực GitHub Copilot:

```
Please visit https://github.com/login/device and enter code XXXX-XXXX to authenticate.
```

**Thực hiện nhanh (mã chỉ có hiệu lực ~1 phút):**

1. Mở trình duyệt đã đăng nhập tài khoản Microsoft công ty
2. Truy cập https://github.com/login/device
3. GitHub sẽ tự nhận diện qua SSO Azure AD → đăng nhập tự động hoặc yêu cầu xác nhận
4. Nhập **mã code** hiển thị trong terminal
5. Click **"Authorize"**
6. Chờ vài giây, server sẽ khởi động hoàn tất

Khi thấy dòng sau nghĩa là thành công:

```
INFO:     Uvicorn running on http://0.0.0.0:4000
```

### Bước 8: Cài đặt Claude Code

```powershell
npm install -g @anthropic-ai/claude-code
```

### Bước 9: Cấu hình Claude Code trỏ về LiteLLM Proxy

Sửa file `%USERPROFILE%\.claude\settings.json`:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "http://localhost:4000",
    "ANTHROPIC_AUTH_TOKEN": "sk-litellm-static-key",
    "ANTHROPIC_MODEL": "github_copilot/claude-sonnet-4.5",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "github_copilot/gpt-5-mini",
    "DISABLE_NON_ESSENTIAL_MODEL_CALLS": "1",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  }
}
```

> **Lưu ý**: File nằm tại `C:\Users\<username>\.claude\settings.json`

### Bước 10: Sử dụng Claude Code

Mở terminal mới (đảm bảo LiteLLM Proxy đang chạy ở terminal khác), rồi:

```powershell
claude
```

Claude Code sẽ kết nối qua LiteLLM Proxy → GitHub Copilot API.

---

## Tóm tắt nhanh (copy & paste)

Mở **PowerShell**, chạy lần lượt:

```powershell
# 1. Cài Python 3.12
winget install Python.Python.3.12 --accept-source-agreements --accept-package-agreements

# 2. Cài LiteLLM proxy
py -3.12 -m pip install "litellm[proxy]"

# 3. Fix Unicode encoding cho Windows
[Environment]::SetEnvironmentVariable("PYTHONIOENCODING", "utf-8", "User")

# 4. Cài Azure CLI và đăng nhập tài khoản công ty
winget install Microsoft.AzureCLI --accept-source-agreements --accept-package-agreements
az login

# 5. Mở terminal MỚI, chạy LiteLLM server
cd C:\LiteLLM
litellm --config config.yaml
# → Mở https://github.com/login/device nhập mã code khi được yêu cầu

# 6. Cài Claude Code (terminal khác)
npm install -g @anthropic-ai/claude-code

# 7. Chạy Claude Code
claude
```

---

## Quy trình xác thực (lần đầu & khi token hết hạn)

```
1. Chạy litellm --config config.yaml
2. Terminal hiện: "Please visit https://github.com/login/device and enter code XXXX-XXXX"
3. Mở trình duyệt (đã login tài khoản Microsoft công ty)
4. Vào https://github.com/login/device
5. GitHub SSO tự nhận qua Azure AD → đăng nhập GitHub Enterprise
6. Nhập mã code → Authorize
7. LiteLLM nhận token → Server khởi động thành công
```

> **Quan trọng**: Phải nhập mã **nhanh trong ~1 phút**. Nếu timeout, LiteLLM sẽ hiện mã mới, nhập lại.

---

## Troubleshooting

| Lỗi                                   | Nguyên nhân                                   | Cách fix                                                                |
| ------------------------------------- | --------------------------------------------- | ----------------------------------------------------------------------- |
| `TypeError: unhashable type: 'list'`  | Python < 3.10 không tương thích `aiohttp` mới | Nâng cấp Python lên 3.10+                                               |
| `No module named 'websockets'`        | Thiếu dependency proxy                        | Chạy `pip install "litellm[proxy]"`                                     |
| `UnicodeEncodeError: 'charmap' codec` | Terminal Windows dùng `cp1252`                | Set `PYTHONIOENCODING=utf-8` (xem Bước 4)                               |
| `python` vẫn trỏ về bản cũ            | PATH chưa được cập nhật                       | Chạy script ở Bước 2, hoặc dùng `py -3.12` thay cho `python`            |
| `winget` không tìm thấy               | Windows quá cũ hoặc chưa cài                  | Tải Python thủ công từ https://www.python.org/downloads/                |
| Lỗi xác thực GitHub Copilot           | Token hết hạn hoặc chưa xác thực              | Xoá thư mục `%USERPROFILE%\.config\litellm\github_copilot` rồi chạy lại |
| `Failed to get access token`          | Chưa login Azure AD / GitHub SSO              | Chạy `az login` rồi thử lại (xem Bước 6)                                |
| `Timed out waiting for user`          | Nhập mã code quá chậm (>1 phút)               | Chờ mã mới hiện ra trong terminal, nhập lại nhanh hơn                   |
| Claude Code không kết nối được        | LiteLLM Proxy chưa chạy                       | Đảm bảo `litellm --config config.yaml` đang chạy ở terminal khác        |
