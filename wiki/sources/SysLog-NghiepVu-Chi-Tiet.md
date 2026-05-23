---
type: source
tags:
  - nghiep-vu
  - se
  - deploy
  - merge
  - script
  - nhat-ky-van-de
date-ingested: 2026-04-26
category: syslog
project: general
date-updated: 2026-04-26
source-file: 0. Daily/2026-Apr-17/Sys00001–Sys00029 (29 file)
related:
- "[[wiki/concepts/HRM-Code-Quality]]"
- "[[wiki/concepts/HRM-Deploy-Checklist]]"
- "[[wiki/sources/SysLog-HeThong-Chi-Tiet]]"
---

# SysLog Nghiệp Vụ SE — Chi Tiết Từng Lỗi (Sys00001–Sys00029)

> 29 file lỗi nghiệp vụ SE từ thư mục `0. Daily/2026-Apr-17/`.  
> Ghi lại các sự cố trong quy trình phát triển: deploy, merge, script, test, giao tiếp.  
> Cấu trúc: Vấn đề → Lý do (5 Whys) → Nguyên nhân gốc → Cách phòng tránh.

---

## Tóm tắt

Bộ 29 issue log nghiệp vụ ghi lại các lỗi phát sinh trong quy trình làm việc nội bộ của đội SE (Software Engineer) — từ 2021 đến 2024. Chia 3 nhóm chính: **Deploy/Build** (script thiếu, giải nén lỗi, webconfig sai), **Code/Merge** (conflict, duplicate, cherry pick), và **Quy trình** (BA đổi tài liệu, QC test sót, đánh giá sai point). Phương pháp truy nguyên nhân dùng **5 Whys**. Nhiều issue còn "chưa ghi" nguyên nhân gốc — phản ánh đây là nhật ký sống, cập nhật dần.

---

## Key Takeaways

### Nhóm Deploy/Build/Script
- **Sys00001** — Không chạy superadmin QC: DB SE ≠ DB QC → tạo DB riêng cho chạy superadmin
- **Sys00002** — Thiếu script store: người viết script và người build entity chưa truyền thông, chưa có tiêu chuẩn → cần tạo tiêu chuẩn bàn giao
- **Sys00003** — Không lấy version login: webconfig sai + port System Service bị chặn → đề xuất tool chỉnh webconfig tự động
- **Sys00004** — Giải nén file lỗi: nén trong khi web đang chạy → phải stop IIS trước khi nén
- **Sys00007** — Webconfig thiếu key: PE dùng webconfig của team PE → chưa biết key nào cần; đề xuất document đầy đủ key
- **Sys00013** — Script sai thiếu script: script `20210420_02.sql` (Att) bị sai
- **Sys00014** — Script thiếu field bảng: store `hrm_att_sp_get_OvertimePlanById` báo lỗi không có field
- **Sys00015** — Store thiếu tham số: store `hrm_att_sp_get_PersonalSubmitTamRegister_App` thiếu tham số
- **Sys00022** — Store dư dấu phẩy: thêm code bằng tay từ SQL sang source mà không execute test → nguyên tắc: luôn copy toàn bộ store từ SQL sang source
- **Sys00024** — Login 500 GetEnum: chưa phân quyền IIS_IUSRS + chưa enable CLR → **phải chạy script CLR khi cài server mới**
- **Sys00029** — Lấy sai nguồn mail: cache cấu hình chỉ 10,000 dòng nhưng DB có 12,000 → một số key không load được

### Nhóm Code/Merge
- **Sys00005** — Không login: webconfig sai, port bị chặn, Redis cấu hình sai → tool webconfig
- **Sys00006** — Mất code merge conflict: push code chưa get mới → xử lý conflict trong VS lấy "take target" rồi thêm code mới vào
- **Sys00008** — Merge code bị duplicate: (chưa ghi đầy đủ nguyên nhân)
- **Sys00010** — Không hiện version build: (chưa ghi đầy đủ)
- **Sys00011** — Conflict code khi merge: (chưa ghi đầy đủ)
- **Sys00012** — Cherry pick bị lỗi: (chưa ghi đầy đủ)
- **Sys00023a** — Lỗi bất cẩn khi code: thứ tự công việc sai, chỉ thị leader chưa rõ, phân tâm, sức khỏe, task dồn nhiều → cần trực quan hóa lỗi bất cẩn
- **Sys00023b** — Lỗi khi merge code: Visual không thông báo lỗi, máy lag → phải build test lại sau merge
- **Sys00023c** — Thêm field đổi kiểu dữ liệu: BA phân tích chưa tới, PIC module chưa review → cần PIC join review khi có task thêm field
- **Sys00028** — Bug load sai dữ liệu: sửa store dưới DB nhưng không cập nhật trong source → **khi sửa store phải sửa ngay trong source**

### Nhóm Quy trình/Giao tiếp
- **Sys00009** — Không xóa file spec: (chưa ghi đầy đủ)
- **Sys00016** — Lộ quyền dữ liệu HVN: Symantec chặn Chrome header user → func phân quyền chưa xử lý user không hợp lệ + cài Chrome bằng quyền Administrator
- **Sys00017** — Đổi giải pháp lúc QC: (chưa ghi đầy đủ)
- **Sys00018** — Sinh case test sót: (chưa ghi đầy đủ)
- **Sys00019** — Key dịch không đồng nhất: team dịch mỗi người dịch khác → chưa có chuẩn
- **Sys00020** — BA đổi tài liệu không thông báo: QC chưa hiểu tài liệu, phát hiện muộn, không report sớm lên BA → cần QC tham gia confirm task từ sớm
- **Sys00021** — Link HRM chat bị lỗi: thiếu key `AllowOrigin` (trùng nguyên nhân Sys004)
- **Sys00025** — Màn hình main bị lỗi: webconfig sai phiên bản + lang bị trùng key → khi upbuild phải lấy đúng webconfig; khi dịch phải dùng tool check
- **Sys00026** — Lặp lại tạo TK phân quyền: đánh giá sai point, task dí, không cảnh báo leader sớm → cảnh báo sớm, kiểm soát phát sinh PE
- **Sys00027** — Enum không đồng bộ lưới/dropdown: dùng key enum cũ, không kiểm tra `cat_enumTranslate` → phải check trước khi insert enum

---

## Pattern lỗi lặp lại nhiều nhất

| Pattern | Các Sys liên quan |
|---------|------------------|
| Thiếu/sai script/store | Sys00002, 00013, 00014, 00015, 00022 |
| Merge code conflict/mất code | Sys00006, 00008, 00011, 00012, 00023b |
| Webconfig/config sai | Sys00003, 00005, 00007, 00024, 00025 |
| Giao tiếp BA-SE-QC chậm | Sys00017, 00018, 00019, 00020, 00023c |
| Sửa dưới DB không sync source | Sys00022, 00028 |

---

## Trích dẫn quan trọng

> **Sys00022 — Store dư dấu phẩy:**  
> "Do thêm code bằng tay từ bên SQL sang source. Cách phòng tránh: Copy hết store trong SQL sang source."

> **Sys00016 — Lộ quyền HVN:**  
> "Func phân quyền chưa đúng khi userlogin chưa truyền được hoặc truyền user không tồn tại trong hệ thống. Cài đặt chrome với quyền administrator sẽ giải quyết được."

> **Sys00023a — Lỗi bất cẩn:**  
> "Thống kê những lỗi bất cẩn gì. Để giảm lỗi bất cẩn phải trực quan lỗi ra."

> **Sys00026 — Lặp lại tạo TK:**  
> "Khi gặp vấn đề phải cảnh báo sớm với leader. Kiểm soát và review code kỹ trước khi release."

> **Sys00029 — Cache config giới hạn 10,000:**  
> "Cache chỉ lưu trữ tối đa 10,000 dòng cấu hình, trong khi có tổng cộng 12,000 dòng trong database. Đề xuất sửa đổi quy trình lưu trữ để lấy toàn bộ danh sách key."

---

## Liên kết

- [[wiki/concepts/HRM-Code-Quality]] — Quy tắc store, merge, enum, giao tiếp SE-BA-QC
- [[wiki/concepts/HRM-Deploy-Checklist]] — Checklist deploy server mới + upbuild an toàn
- [[wiki/sources/SysLog-HeThong-Chi-Tiet]] — 23 lỗi hệ thống IIS/SQL/Log/Network song hành
