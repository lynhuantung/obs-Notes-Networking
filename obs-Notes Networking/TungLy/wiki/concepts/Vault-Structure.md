---
type: concept
tags:
  - vault-structure
  - obsidian
  - workflow
  - note-taking
date-updated: 2026-04-25
related:
- "[[wiki/overview.md]]"
---

# Cấu trúc Vault TungLy

## Thư mục chính

```
TungLy/
├── 0. MAP.md              ← Navigation hub (não, kế hoạch, chức năng, họp, tài liệu, báo cáo)
├── 1. Projects/           ← Dự án đang hoạt động
│   ├── 0.Dự án.md
│   ├── Dự án 2026/
│   │   ├── VnPay-Project/ ← Dự án lớn nhất, nhiều tài liệu nhất
│   │   └── Bitex-Project/
│   └── Nguồn lực/         ← Quản lý nhân sự (trạng thái, phân công)
├── 2. RESOURCE/           ← Tài nguyên dùng lại
│   ├── BookMark/
│   └── template/          ← Daily Notes, Q&A, Todo list
├── 3. ARCHIEVED/          ← Tài liệu lưu trữ
│   ├── Daily-2025/        ← Daily notes theo tuần/tháng
│   ├── Dự án 2024/        ← 10+ dự án archived
│   ├── Dự án 2025/        ← TrungDong, HongNgoc, Terumo...
│   ├── Chỉ huy dự án/     ← Dự án TungLy làm PM (Marico, PEWVN)
│   ├── Danh sách dự án/   ← Index tất cả dự án từng làm
│   ├── 07-2024 tổng hợp/  ← Monthly report dạng Epic/Story
│   └── SaaS - VnR/        ← Tài liệu sản phẩm SaaS VnResource
└── wiki/                  ← LLM Wiki (được tạo trong session này)
```

## Quy ước đặt tên

| Pattern | Ý nghĩa |
|---------|---------|
| `H-<Project>-<Module>-DDMMYYYY` | Biên bản họp |
| `0.H-<Project>` | Index họp của dự án |
| `<YYMM><Week>-<Seq>-01` | Mã daily note |
| `0.Index-7425` | Index dự án (7425 = mã VnPay) |
| `Epic/Story` | Phân cấp công việc tháng |

## Danh sách dự án đã từng làm (từ `Danh sách dự án/`)

AMIS · AnPhuoc · FGL · FIT · INOAC · KARCHER · LTG · Midea · NLG · PEWVN · TAISUN · TBCBall · TBV · Toyota · TrungDong · TVC

Dự án 2024: AMIS · FGL · HVN · LTG · OPA · TBV · Taisun · Toyota · UNIS · VCBs  
Dự án 2025: TrungDong · HongNgoc · Terumo · Marico · PEWVN  
Dự án 2026: VnPay · Bitex

## Đặc điểm vault

- TungLy đóng nhiều vai: **PM, tư vấn, kỹ thuật, giảng viên**
- SaaS VnR = sản phẩm nội bộ VnResource, TungLy tham gia hoạch định
- Daily notes → tracking ngắn hạn; Archive → lưu trữ dài hạn
- Templates chuẩn: Daily Notes, Q&A, Todo list
