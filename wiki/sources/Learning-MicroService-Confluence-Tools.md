---
type: source
tags: [microservice, sso, confluence, wikijs, documentation, architecture-decision]
created: 2026-04-27
updated: 2026-04-27
domain: system
related: [[wiki/concepts/AI-DevTools]], [[wiki/architecture/HRM-System-Architecture]], [[wiki/concepts/PKM-Methods]]
description: "So sánh 3 tình huống tích hợp SSO microservice và Confluence vs WikiJS cho tài liệu hóa phần mềm."
---

# Learning — Microservice SSO + Confluence vs WikiJS

## Tóm tắt

Hai tài liệu học hỏi từ tháng 05/2024:
1. **Phát Triển Micro Service**: So sánh 3 tình huống tích hợp SSO vào microservice — phân tích chi phí/bảo trì 1 tháng đến 3 năm
2. **Confluence vs Wiki.JS**: So sánh 2 công cụ lập tài liệu cho phát triển phần mềm, trong bối cảnh VnResource đang dùng cả hai

## Key Takeaways

### Microservice SSO — 3 tình huống

| Tiêu chí | TH1: Mua source | TH2: Thuê bên viết | TH3: Outsource theo framework |
|----------|----------------|-------------------|------------------------------|
| Chi phí ban đầu | Thấp | Trung bình | Cao |
| Chi phí bảo trì | Cao | Trung bình | **Thấp** |
| Tùy biến sau này | Thấp | Trung bình | **Cao** |
| Chất lượng code | Không kiểm soát | Trung bình | **Kiểm soát tốt** |
| **Bảo trì dễ** | Khó | Trung bình | **Dễ dàng** |

- **Kết luận**: Tình huống 3 tối ưu lâu dài — chi phí 3 năm Tình huống 1 = 46K$, TH3 = 68K$ nhưng TH3 kiểm soát tốt hơn
- **Áp dụng vào VnR SaaS**: Outsource theo framework HRM (FE + BE) là đúng hướng → đảm bảo UI/UX đồng nhất, dễ bảo trì

### Confluence vs Wiki.JS

| Tiêu chí | Confluence | Wiki.JS |
|----------|-----------|--------|
| Chi phí | Cao (license) | Miễn phí (open source) |
| Tích hợp JIRA | ✅ Sâu | ❌ Hạn chế |
| Cộng tác real-time | ✅ | ❌ Hạn chế |
| Tùy chỉnh | Hạn chế | ✅ Cao |
| Tìm kiếm | ✅ Toàn văn mạnh | Phụ thuộc plugin |
| Biểu đồ UML | ✅ (macro, plugin) | ✅ (Mermaid plugin) |

- **VnResource dùng cả hai**: Confluence (https://confluence.vnresource.net:18001/) + Wiki.JS (https://docs.vnresource.net/)
- **Khuyến nghị**: Confluence cho tài liệu kỹ thuật + quản lý dự án; Wiki.JS cho tài liệu hướng dẫn công khai

## Trích dẫn quan trọng

> Tình huống 3 (Outsource phát triển dựa trên framework của bạn) là lựa chọn tối ưu nhất — đảm bảo tính đồng nhất UI/UX, chất lượng cao, khả năng tùy chỉnh dễ dàng sau này.

> Confluence là lựa chọn chuyên dụng hơn cho lập tài liệu phát triển phần mềm, đặc biệt khi tích hợp với các công cụ Atlassian.

## Liên kết

- [[wiki/concepts/AI-DevTools]] — Cursor AI + Memory Bank (tương đương LLM Wiki)
- [[wiki/architecture/HRM-System-Architecture]] — Kiến trúc microservice HRM
- [[wiki/concepts/PKM-Methods]] — PARA, Zettelkasten, Second Brain
- [[wiki/sources/SaaS-VnR-Meetings-2023-2024]] — Thực tế chuyển sang K8s multi-tenant
