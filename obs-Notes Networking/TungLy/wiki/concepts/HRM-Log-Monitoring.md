---
type: concept
tags:
  - hrm
  - monitoring
  - logging
  - iis
  - event-viewer
date-updated: 2026-04-26
related:
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-Deploy-Checklist]]"
- "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
---

# HRM — Log & Monitoring Toolkit

> Ghi chú nguyên tử: các công cụ chẩn đoán lỗi FIT-HRM theo thứ tự từ dễ đến sâu.

## Thứ Tự Chẩn Đoán Khi Có Lỗi

```
Bước 1: Log Review (superadmin) → lỗi hệ thống đã ghi sẵn
Bước 2: Log Request (superadmin) → API nào bị lỗi, chạy bao lâu
Bước 3: IIS Worker Processes → API đang chạy / treo
Bước 4: Event Viewer (chạy trên server) → lỗi deep (assembly, CLR, crash)
Bước 5: Remote Server → kiểm tra file lang_vn_spec.xml, field_info_spec.xml
```

> Log Review và Log Request cần đăng nhập **superadmin** mới thấy

## Event Viewer — Export Log

Dùng khi: không xác định được lỗi qua Log Review, hệ thống crash không vào được

1. Trên server chứa IIS → tìm `Event Viewer`
2. Vào `Windows Logs\Application`
3. Tìm log lỗi (icon tam giác vàng) → **Save As** → gửi cho team kỹ thuật
4. Team kỹ thuật mở lại bằng `Open Saved Log` (Windows Logs\Application → chuột phải)

> ⚠️ Phải **chạy link lỗi trên chính server** mới thấy lỗi trong Event Viewer

## IIS Log — Tắt Khi Hết Dung Lượng

Nếu log IIS chiếm quá nhiều disk sau nhiều năm:
- IIS Manager → chọn site → **Logging** → **Disable**

## Log Request — Lỗi SQLite

Nếu không vào được trang Log Request, lỗi `Unable to load DLL 'SQLite.Interop.dll'`:
- Nguyên nhân: chưa cài Visual C++ Redistributable
- Fix: cài theo thứ tự **2010 → 2012 → 2013 → 2015-2022**, cả **x86 và x64**
- Link: https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist

## Log Request Không Ghi Sau Upbuild

Nguyên nhân: upbuild trong khi pool đang chạy → file log bị lock

Fix:
1. **Stop** tất cả pool và site
2. Vào source → `HRM.Prosentation.Main\Log`
3. Backup (cut) 4 folder `RequestInformation` ra ngoài
4. Start lại pool → hệ thống ghi log mới

## Tự Động Xóa Log Sau 30 Ngày

Dùng Windows **Task Scheduler** + **ForFiles**:
- Import file task XML có sẵn
- Tham số: `/p "D:\HRM.Presentation.Main\Log" /s /d -30 /c "cmd /c del @file"`
- `-30`: xóa file cũ hơn 30 ngày (tùy chỉnh được)

## Liên kết kích hoạt

- Lỗi Event Viewer báo trùng key XML → [[wiki/concepts/HRM-IIS-Troubleshooting]] (Sys013: lang_vn_spec.xml)
- Log Request không hoạt động → có thể liên quan upbuild sai quy trình → [[wiki/concepts/HRM-Deploy-Checklist]]
- Lỗi CLR/Assembly trong Event Viewer → [[wiki/concepts/HRM-SQL-Troubleshooting]]
