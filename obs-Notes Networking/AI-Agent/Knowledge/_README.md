---
Mã: knowledge-readme
aliases: [Hướng dẫn Knowledge Base]
date: 2026-04-19
tags: [knowledge, readme, ai-agent]
type: readme
Related:
  - "[[AI-Agent-MOC]]"
  - "[[4-3 Cursor AI Memory Bank]]"
---

# 📚 Knowledge Base — Hướng dẫn nạp & tổ chức

> Đây là **bộ nhớ sống** của AI. Càng nạp nhiều case thực tế, AI càng giải quyết vấn đề tốt hơn.

---

## Triết lý

```
Giải xong 1 vấn đề
      ↓
Lưu vào case-studies/    ← AI nhớ chuyện đã xảy ra
      ↓
Phát hiện pattern lặp lại
      ↓
Lưu vào patterns/        ← AI nhận ra vấn đề tương tự
      ↓
Pattern thành quy tắc
      ↓
Lưu vào rules/           ← AI tránh sai lầm từ đầu
```

---

## Cấu trúc thư mục

```
Knowledge/
├── case-studies/        ← Cases đã giải quyết (sự kiện cụ thể)
│   ├── hrm/             ← theo domain
│   ├── vnpay/
│   └── common/
│
├── patterns/            ← Vấn đề lặp lại (tái sử dụng)
│   ├── sql/             ← Pattern liên quan DB/SQL
│   ├── api/             ← Pattern liên quan API/Backend
│   ├── infra/           ← Pattern liên quan hạ tầng (Redis, IIS...)
│   ├── config/          ← Pattern liên quan cấu hình
│   └── common/          ← Pattern xuyên suốt
│
└── rules/               ← Quy tắc học được (ngắn gọn, hành động)
    ├── hrm-rules.md
    ├── vnpay-rules.md
    └── common-rules.md
```

---

## Khi nào nạp gì?

| Tình huống | Nạp vào | File name |
|---|---|---|
| Vừa giải xong 1 bug/vấn đề | `case-studies/{domain}/` | `case-{domain}-{YYYYMMDD}-{ten-ngan}.md` |
| Thấy vấn đề lặp lại ≥2 lần | `patterns/{loai}/` | `{ten-pattern}.md` |
| Pattern đã đủ rõ thành quy tắc | `rules/{domain}-rules.md` | thêm vào file có sẵn |

---

## Cách nạp nhanh

### Bước 1 — Tạo case study
Copy `[[Skills/_template/Template-Case-Study]]` → điền vào → lưu vào `case-studies/{domain}/`

### Bước 2 — Link vào Zettelkasten
Trong case study, thêm liên kết:
```
Related:
  - "[[2-4 Dich vu Redis]]"     ← note kỹ thuật liên quan
  - "[[1-3 Du an INOAC]]"       ← note dự án liên quan
```

### Bước 3 — Tách pattern (nếu tái sử dụng được)
Nếu vấn đề có thể xảy ra ở project khác → tạo file trong `patterns/`

### Bước 4 — Cập nhật rules (nếu có quy tắc mới)
Thêm vào `rules/{domain}-rules.md`

---

## Ví dụ thực tế từ vault này

### Case đã có thể nạp ngay:

| Vấn đề | Nạp vào |
|---|---|
| INOAC: lỗi Redis sau Windows Update | `case-studies/hrm/case-hrm-20260218-inoac-redis-crash.md` |
| VNPAY: lỗi Redis tương tự | `case-studies/hrm/case-hrm-vnpay-redis-crash.md` |
| → Pattern Redis lặp lại | `patterns/infra/redis-crash-after-windows-update.md` |
| Contract Evaluation API 5.6s | `case-studies/hrm/case-hrm-20260415-contract-eval-slow.md` |
| → Pattern N+1 loading | `patterns/sql/n-plus-one-data-loading.md` |
| → Pattern async email | `patterns/api/async-email-sending.md` |

---

## Quy tắc đặt tên file

```
Case study:  case-{domain}-{YYYYMMDD}-{mo-ta-ngan}.md
             case-hrm-20260415-redis-crash.md

Pattern:     {ten-pattern-ro-rang}.md
             n-plus-one-data-loading.md
             async-email-sending.md

Rules:       {domain}-rules.md
             hrm-rules.md
```

---

## Sức mạnh khi kết hợp Zettelkasten

```
Zettelkasten notes (Area/)     Knowledge Base (AI-Agent/Knowledge/)
─────────────────────────      ────────────────────────────────────
2-4 Dich vu Redis        ←──→  case-hrm-inoac-redis.md
2-2 Toi uu SQL           ←──→  pattern/sql/n-plus-one.md
1-1 Du an VnPay          ←──→  case-vnpay-contract-eval-slow.md
```

Khi tôi đọc vault của bạn, tôi thấy **cả 2 chiều**:
- Từ case → hiểu context kỹ thuật (qua Zettelkasten)
- Từ Zettelkasten → biết đã từng xảy ra vấn đề gì (qua Knowledge)
