---
Mã:
aliases:
date: 2025-06-19
tags:
  - document
Project: "[[Dự án VnPay]]"
Liên kết:
---
# Chuyển Đổi Nhánh Netcore 8 và nhánh Net FrameWork

Hướng dẫn ngắn gọn giúp lập trình viên chuyển đổi giữa nhánh .NET8 và .NET Framework, đảm bảo môi trường sạch, tránh lỗi build, dễ thực hiện và kiểm soát.

# 📌 Hướng dẫn chuyển nhánh tránh lỗi build

## A. Từ **.NET 8** → **.NET Framework 4.6.2**

1.      Lưu thay đổi tạm:

```
2.  
```

```
3.  
```

4.      **Tắt Visual Studio**

5.      Xóa thư mục:

o    `../Main/Source/.vs`  
👉 Mục đích: Xóa cache IntelliSense và config tạm trong `.vs`, tránh xung đột khi đổi framework.

o    tất cả `bin`, `obj` trong project  
👉 Mục đích: Đây là file build tạm, nếu giữ lại sẽ gây lỗi khi đổi framework.

6.      Reset source:

```
7.  
```

👉 Mục đích: Xóa mọi thay đổi local, đưa code về trạng thái commit sạch, tránh lỗi do file cấu hình hoặc csproj bị chỉnh sửa.  
_(nếu vẫn lỗi → restart máy rồi chạy lại lệnh trên)_

_![](data:image/png;base64,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)_

1.      Mở Visual Studio → **Clean Solution → Rebuild**

---

## B. Từ **.NET Framework 4.6.2** → **.NET 8 (VNPAY)**

1.      Lưu thay đổi tạm:

```
2.  
```

```
3.  
```

4.      **Tắt Visual Studio**

5.      Xóa thư mục:

o    `../Main/Source/.vs`  
👉 Mục đích: Xóa cache IntelliSense và config tạm trong `.vs`, tránh xung đột khi đổi framework.

6.      Reset source:

```
7.  
```

👉 Mục đích: Xóa mọi thay đổi local, đưa code về trạng thái commit sạch, tránh lỗi do file cấu hình hoặc csproj bị chỉnh sửa.  
_(nếu vẫn lỗi → restart máy rồi chạy lại lệnh trên)_

8.      Mở Visual Studio → **Clean Solution → Rebuild**

---

## 💡 Tóm tắt lý do

·         **Xóa** **.vs**: loại bỏ cache IntelliSense (gợi ý code, symbol database) và config tạm của Visual Studio (cấu hình debug, path build...). Nếu không xóa, các cache này dễ bị lệch khi đổi framework, dẫn đến lỗi build hoặc IntelliSense sai.

·         **Xóa** `**bin/obj**`: tránh dùng lại file build tạm, ngăn lỗi khi đổi framework.

·         `**git reset --hard HEAD**`: đảm bảo source sạch, không còn thay đổi local.

·         **Restart máy**: giải phóng file lock từ Visual Studio/MSBuild.

