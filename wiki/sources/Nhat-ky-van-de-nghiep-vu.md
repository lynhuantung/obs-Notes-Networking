---
description: "Nhật ký 29 vấn đề nghiệp vụ SE (deploy, merge code, store, quy trình) từ 2021–2024: phân tích 5 Whys, nguyên nhân gốc và cách phòng tránh."
type: source
tags:
  - hrm
  - deploy-process
  - code-quality
  - troubleshooting
  - se-team
date-ingested: 2026-04-26
category: syslog
project: general
date-updated: 2026-04-26
source-file: 0. Daily/2026-Apr-17/Nhat-ky-van-de-nghiep-vu.md
related:
- "[[wiki/concepts/HRM-Deploy-Checklist]]"
- "[[wiki/concepts/HRM-Code-Quality]]"
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
---

# Nhật Ký Vấn Đề Nghiệp Vụ — SE Team

> Nguồn: `0. Daily/2026-Apr-17/Nhat-ky-van-de-nghiep-vu.md` | 29 vấn đề nghiệp vụ + quy trình (Sys00001–Sys00029)

## Tóm tắt

Tài liệu ghi nhận các vấn đề nghiệp vụ và quy trình do đội SE đúc kết từ 2021–2024, theo phương pháp 5 Why (truy nguyên nhân gốc). Mỗi vấn đề có: Lý Do → Why1→Why5 → Nguyên nhân gốc → Cách phòng tránh. Tài liệu bao gồm cả vấn đề kỹ thuật lặp lại, lỗi merge code, lỗi nghiệp vụ (enum, store, phân quyền), và bài học quy trình giao tiếp SE-BA-QC.

## Key Takeaways

**Nhóm Deploy Process:**
- `Sys00001`: Không chạy superadmin khi build cho QC → DB SE và DB QC khác nhau → tạo DB riêng cho superadmin
- `Sys00003`: Không lấy được version → webconfig sai, port System Service bị chặn → cần tool chỉnh webconfig từ đầu
- `Sys00004`: Giải nén lỗi → trong khi nén vẫn chạy web → **stop IIS trước khi nén**
- `Sys00005`: Không login được → webconfig sai redis / System service bị chặn port
- `Sys00007`: Thiếu key webconfig → PE dùng webconfig của team PE → thiếu key → cần danh sách key chuẩn theo build
- `Sys00024`: Login 500 CLR → phân quyền IIS_IUSRS + enable CLR + TRUSTWORTHY ON (khi cài server mới)
- `Sys00025`: Vào main bị lỗi → webconfig sai phiên bản hoặc lang_vn_spec.xml trùng key

**Nhóm Code Quality:**
- `Sys00002`: Thiếu script → người build entity và người viết script chưa truyền thông + tiêu chuẩn chưa rõ → **lỗi căn bản nhất: thiếu quy trình giao tiếp**
- `Sys00006`: Mất code khi merge conflict → cherry-pick từ Visual Studio (take target → lấy code mới vào)
- `Sys00008`: Merge bị duplicate code → (chưa phân tích đủ)
- `Sys00022`: Store dư dấu phẩy → thêm bằng tay từ SQL sang source mà không execute → **copy toàn bộ store, không sửa từng dòng**
- `Sys00023` (Tung.Ly): Lỗi bất cẩn → nguyên nhân đa dạng: task dồn, phân tâm, chỉ thị không rõ → cần trực quan hóa lỗi để giảm
- `Sys00023` (Khai.Nguyen): Merge lỗi không thấy → Visual Studio không báo → **phải build test lại sau merge**
- `Sys00027`: Enum dịch không đồng bộ → không biết enum đã tồn tại trong `cat_enumTranslate` → kiểm tra trước khi insert

**Nhóm Business Logic Bugs:**
- `Sys00016`: Lộ quyền dữ liệu HVN → Chrome có Symantec không truyền header user → func phân quyền chưa xử lý case userLogin null/invalid → sửa func + cài Chrome với quyền administrator
- `Sys00021`: Link HRM từ Google Chat lỗi → thêm `AllowOrigin` key
- `Sys00026` (Minh.NguyenDat): Lặp lỗi task phân quyền nhanh → đánh giá sai point + confirm task chưa chốt giải pháp → cần warning sớm cho leader
- `Sys00028` (Tu.HuynhCam): Load sai dữ liệu → sửa store dưới DB mà không sửa trong source → **sửa store phải đồng bộ source ngay**
- `Sys00029` (Tung.Ly): Lấy sai server mail → cache cấu hình chỉ lưu 10,000 dòng (limit), tổng có 12,000 → cache không đủ → cần load toàn bộ key từ DB vào cache

**Nhóm Quy trình SE-BA-QC:**
- `Sys00020`: BA thay đổi tài liệu không báo QC → QC không tham gia confirm task từ đầu → cần QC vào review sớm
- `Sys00017`: Đổi giải pháp lúc QC test → (phòng tránh chưa ghi đủ)
- `Sys00019`: Key dịch không nhất quán → nhiều người dịch khác nhau → cần 1 nguồn chuẩn

## Trích dẫn quan trọng

> Nguyên nhân gốc: Do chưa tạo db giống db QC. Cách phòng tránh: Tạo db chỉ dành cho chạy superadmin. (Sys00001)

> Chưa có tiêu chuẩn rõ ràng về việc đưa code → Tìm cách tự động hóa để giảm thiểu thao tác sai của con người. (Sys00002 — Why4→Why5)

> Func phân quyền chưa đúng khi userlogin chưa truyền được hoặc truyền user không tồn tại trong hệ thống. (Sys00016 — nguyên nhân gốc)

> Vấn đề chính bắt nguồn từ việc cache cấu hình không thể lưu trữ đủ thông tin (giới hạn 10,000 dòng, thực tế 12,000). (Sys00029)

## Liên kết

- [[wiki/concepts/HRM-Deploy-Checklist]] — checklist deploy server mới, webconfig, CLR, port
- [[wiki/concepts/HRM-Code-Quality]] — quy tắc merge, store, enum, bất cẩn
- [[wiki/concepts/HRM-IIS-Troubleshooting]] — webconfig, IIS_IUSRS, login lỗi
- [[wiki/concepts/HRM-SQL-Troubleshooting]] — CLR, cache config limit
