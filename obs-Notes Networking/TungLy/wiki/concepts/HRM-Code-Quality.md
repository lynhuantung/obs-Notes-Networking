---
type: concept
tags:
  - hrm
  - code-quality
  - se-process
  - merge
  - store
  - enum
date-updated: 2026-04-26
related:
- "[[wiki/concepts/HRM-Deploy-Checklist]]"
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
- "[[wiki/sources/Nhat-ky-van-de-nghiep-vu]]"
---

# HRM — Code Quality

> Ghi chú nguyên tử: các quy tắc và bài học về chất lượng code trong dự án FIT-HRM, đúc kết từ lỗi lặp lại.

## Quy Tắc Store

| Quy tắc | Lý do | Nguồn |
|---------|-------|-------|
| **Luôn copy toàn bộ store từ SQL sang source** | Sửa từng dòng bằng tay → dễ dư dấu phẩy, thiếu syntax | Sys00022 |
| **Khi sửa store phải sửa đồng thời trong source** | Sửa dưới DB mà không sửa source → lần build sau lại mất fix | Sys00028 |
| **Execute để test sau khi thêm bất kỳ store mới** | Không execute → không biết lỗi syntax | Sys00022 |

## Quy Tắc Merge Code

**Khi có conflict:**
1. Từ Visual Studio: **take target** (lấy code server)
2. Sau đó cherry-pick code mới của mình vào
3. **Build test lại ngay** — Visual Studio không luôn báo lỗi merge

**Nguyên nhân gốc thường gặp:**
- Push code mà chưa get mới về → conflict
- Source main thường xuyên bị lỗi khi get về → kéo dài thời gian merge

## Quy Tắc Enum

- Trước khi insert enum mới vào `cat_enumTranslate` → **kiểm tra đã tồn tại chưa**
- Hiểu rõ: khi nào dịch ở file **lang_vn_spec.xml**, khi nào insert bảng **cat_EnumTranslate**
- Đồng bộ key dịch giữa lưới và dropdown popup (cùng nguồn)

## Quy Tắc Script / DB

- Người viết script và người build entity **phải truyền thông trước khi chạy**
- Không build entity trước khi có script → entity và script conflict
- Khi conflict code trong script: không xử lý đơn độc → báo với người viết script
- Cần tiêu chuẩn rõ ràng về thứ tự: script trước, entity sau

## Các Lỗi Bất Cẩn Thường Gặp (Sys00023)

Nguyên nhân môi trường:
- Task dồn nhiều → giảm chú ý
- Chỉ thị leader không rõ ràng → thực hiện sai
- Phân tâm do task song song
- Sức khỏe không tốt

**Biện pháp:** Trực quan hóa lỗi bất cẩn (log, thống kê) → nhìn thấy pattern → giảm dần

## Quy Trình Giao Tiếp SE-BA-QC

Pattern lỗi lặp lại nhiều nhất:

| Vấn đề | Nguyên nhân gốc | Phòng tránh |
|--------|----------------|-------------|
| BA thay đổi tài liệu không báo QC | QC không vào confirm task từ đầu | QC tham gia confirm task sớm |
| Đổi giải pháp lúc QC test | Chưa chốt giải pháp khi confirm task | Lock giải pháp tại confirm task |
| SE lặp lỗi khi làm task phức tạp | Đánh giá sai point, không cảnh báo sớm | Warning sớm khi có rủi ro |

## Liên kết kích hoạt

- Lỗi script ảnh hưởng đến DB → [[wiki/concepts/HRM-SQL-Troubleshooting]]
- Lỗi sau deploy → kiểm tra checklist → [[wiki/concepts/HRM-Deploy-Checklist]]
- Phân quyền sai (từ merge code phân quyền) → [[wiki/concepts/HRM-Security-Config]]
