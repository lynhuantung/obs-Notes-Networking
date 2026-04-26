---
type: concept
tags:
  - hrm
  - iis
  - troubleshooting
  - deploy
date-updated: 2026-04-26

related:
- "[[wiki/concepts/HRM-Deploy-Checklist]]"
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
- "[[wiki/concepts/HRM-Log-Monitoring]]"
- "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
- "[[wiki/sources/Nhat-ky-van-de-nghiep-vu]]"
- "[[wiki/sources/SysLog-HeThong-Chi-Tiet]]"
- "[[wiki/sources/WarmupStatus-Performance-2026]]"
---

# HRM — IIS Troubleshooting

> Ghi chú nguyên tử: các lỗi IIS thường gặp khi triển khai FIT-HRM, nhóm theo pattern.

## Pattern chính

| Lỗi | Nguyên nhân | Fix nhanh |
|-----|-------------|-----------|
| 405 Network | webconfig Main sai | Xóa dòng sai trong web.config |
| IIS_IUSRS access denied | Anonymous Auth chưa dùng Application Pool Identity | Edit Auth → check App Pool Identity → phân quyền lại thư mục |
| OutOfMemory | `Enable 32-bit Application = true` | Đổi thành `false` → dùng tối đa RAM 64-bit |
| 403.14 sau upbuild | PrecompiledApp.config cũ còn tồn tại | Xóa `PrecompiledApp.config` + tất cả thư mục `bin` → giải nén build mới |
| Upload > 20MB | maxRequestLength mặc định | `maxRequestLength="20480"` trong httpRuntime |
| Portal login fail | ConnectString Portal ≠ ConnectString Main | Sửa webSettings.json của Portal |

## Quy trình Copy Source Đúng

> ⚠️ Không copy source đã dựng trên link nhà — có thể kế thừa phân quyền IIS sai

1. Copy **source pass** (chưa dựng trên IIS)
2. Dựng IIS mới → phân quyền IIS_IUSRS từ đầu
3. Không bao giờ copy source từ link đang chạy sang server khác

## Quy trình Upbuild An toàn

1. **Stop** tất cả pool và site
2. Backup folder `RequestInformation` ra ngoài source
3. Xóa `PrecompiledApp.config` + thư mục `bin`
4. Giải nén build mới
5. Start lại pool và site

## Liên kết kích hoạt

- Lỗi login sau khi dựng server mới → [[wiki/concepts/HRM-SQL-Troubleshooting]] (CLR + TRUSTWORTHY)
- Cần kiểm tra lỗi sâu hơn → [[wiki/concepts/HRM-Log-Monitoring]] (Event Viewer, Log Request)
- Lỗi phân quyền liên quan security → [[wiki/concepts/HRM-Security-Config]]
- Checklist deploy tổng thể → [[wiki/concepts/HRM-Deploy-Checklist]]
