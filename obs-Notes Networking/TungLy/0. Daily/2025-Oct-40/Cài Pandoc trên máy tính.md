---
Mã: 25104005-01
aliases:
date: 2025-10-05
time: 16:37
Week: "40"
tags:
  - daily
  - export-word
---

## ⚙️ Bước 1. Cài Pandoc trên máy tính

### 🔹 Nếu Tùng dùng **Windows**:

1. Vào trang chính thức:
   👉 [https://pandoc.org/installing.html](https://pandoc.org/installing.html)
2. Chọn mục **Windows** → tải file `.msi` (ví dụ: `pandoc-3.2-windows-x86_64.msi`).
3. Cài đặt như phần mềm bình thường.
4. Sau khi cài xong, mở **Command Prompt (CMD)** và gõ:

   ```bash
   pandoc -v
   ```

   → Nếu thấy hiện version như `pandoc 3.2`, nghĩa là thành công 🎉

---

## ⚙️ Bước 2. Cập nhật đường dẫn (PATH)

Nếu cài xong nhưng Obsidian vẫn báo lỗi đỏ, hãy:

1. Nhấn `Win + R` → gõ:

   ```
   sysdm.cpl
   ```
2. Tab **Advanced → Environment Variables...**
3. Trong phần **System variables**, chọn dòng `Path` → **Edit**
4. Thêm dòng:

   ```
   C:\Program Files\Pandoc\
   ```

   (đường dẫn này là mặc định sau khi cài Pandoc; nếu khác thì bấm chuột phải vào shortcut Pandoc → “Open file location” để kiểm tra chính xác).
5. Nhấn OK toàn bộ để lưu.
6. Mở lại Obsidian (đóng mở lại hẳn app).

---

## ⚙️ Bước 3. Cấu hình lại Pandoc Plugin trong Obsidian

Vào `Settings → Community Plugins → Pandoc Plugin`:

| Mục                                     | Gợi ý cấu hình                                                                       |
| --------------------------------------- | ------------------------------------------------------------------------------------ |
| **Export files from HTML or markdown?** | `Markdown`                                                                           |
| **Export folder**                       | Chọn một thư mục rõ ràng, ví dụ: `C:\Users\Tung\Documents\Exports`                   |
| **Pandoc path**                         | Gõ chính xác đường dẫn: `C:\Program Files\Pandoc\pandoc.exe`                         |
| **Output format**                       | Mặc định là `docx`                                                                   |
| **Extra Pandoc arguments**              | (để trống hoặc thêm `--reference-doc=template.docx` nếu có mẫu định dạng Word riêng) |

---

## ⚙️ Bước 4. Thực hiện xuất file `.docx`

1. Mở note cần xuất trong Obsidian.
2. Nhấn `Ctrl + P` → tìm lệnh:

   ```
   Pandoc: Export as docx
   ```
3. Chờ vài giây → file `.docx` sẽ nằm trong thư mục bạn đã chọn.

---

## 🧩 Nếu vẫn chưa nhận được file:

Kiểm tra nhanh:

* Trong CMD gõ:

  ```bash
  "C:\Program Files\Pandoc\pandoc.exe" -v
  ```

  Nếu dòng này hoạt động → OK.
* Nếu vẫn báo lỗi, thử nhập chính xác **đường dẫn pandoc** vào mục **Pandoc path** trong Obsidian:

  ```
  C:\Program Files\Pandoc\pandoc.exe
  ```
* Sau đó **tắt hoàn toàn Obsidian** rồi mở lại.

