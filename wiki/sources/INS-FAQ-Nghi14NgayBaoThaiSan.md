---
type: source
code: w2hn
tags:
  - bao-hiem
  - thai-san
  - say-thai
  - wont-fix
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-Thai-San-On-Off]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-FAQ-ThaiSanBaoNghi14Ngay]]"
description: "Giải thích logic nghỉ ≥14 ngày nhưng hệ thống báo thai sản do loại ngày nghỉ sảy thai — logic đúng, wont fix."
---

# INS FAQ — Nghỉ ≥14 Ngày Nhưng Hệ Thống Báo Nghỉ Thai Sản

## Tóm tắt

Tài liệu giải thích trường hợp NV nghỉ ≥14 ngày nhưng hệ thống báo thai sản. Đây là **logic đúng — wont fix**. Nguyên nhân: loại ngày nghỉ gắn chứng từ BH là "sảy thai" → hệ thống ưu tiên thai sản bất kể số ngày.

## Key Takeaways

- Loại ngày nghỉ có trường "Loại chứng từ cần nộp" = **sảy thai** → `IsPregnant = true` → báo thai sản
- Override toàn bộ kết quả đếm ngày nghỉ — dù chỉ nghỉ 1 ngày vẫn báo thai sản
- PE chưa biết logic này → hay báo nhầm là bug
- **Wont fix** — giải thích cho PE: sảy thai = chế độ thai sản theo pháp luật

## Trích dẫn quan trọng

> Loại ngày nghỉ có loại chứng từ = sảy thai → hệ thống luôn báo thai sản dù chỉ nghỉ 1 ngày — đây là nghiệp vụ đúng.

## Liên kết

- [[wiki/sources/INS-NghiThaiSan]] — chế độ thai sản đầy đủ
- [[wiki/sources/INS-FAQ-ThaiSanBaoNghi14Ngay]] — chiều ngược lại: thai sản báo ≥14 ngày
