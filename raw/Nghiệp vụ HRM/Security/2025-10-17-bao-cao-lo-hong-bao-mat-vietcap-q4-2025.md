---
title: "Báo cáo lỗ hổng bảo mật dự án VietCap — Q4/2025"
date: 2025-10-17
domain: security
module: "VietCap Main, VietCap Portal, Redis Server"
tags: [security, vulnerability, cve, csp, cors, csrf, redis, lodash, highcharts, vietcap]
verified: yes
---

# Báo cáo lỗ hổng bảo mật dự án VietCap — Q4/2025

## Tóm tắt

Trong tháng 10/2025, hệ thống VietCap trải qua 2 đợt phát hiện lỗ hổng bảo mật:
đợt 1 (14/10/2025) do công cụ quét tự động OWASP ZAP phát hiện trên môi trường Main
và Portal; đợt 2 (17/10/2025) do khách hàng báo cáo lỗ hổng nghiêm trọng trên máy
chủ Redis. Tổng cộng 11 lỗ hổng được ghi nhận — tất cả đều đã được đóng hoặc chấp
nhận bỏ qua có chủ đích.

---

## ĐỢT 1 — 14/10/2025 | Phát hiện bởi: OWASP ZAP (Zap)

---

### 1. Vulnerable JS Library (Lodash 4.17.15)

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CVE-2021-23337, CVE-2020-28500, CVE-2020-8203 |
| **Mức độ** | 🔴 High |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Thư viện lodash (4.17.15) có chứa lỗ hổng

**Cách khắc phục (nguyên văn):**
> Update thư viện lên version 4.17.21

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến các màng hình có dùng thư viện Lodash

**Notes:** _(trống)_

---

### 2. Absence of Anti-CSRF Tokens

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CWE-352 |
| **Mức độ** | 🟡 Medium |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Một lỗ hổng bảo mật trong ứng dụng web khi các biểu mẫu hoặc yêu cầu HTTP không
> được bảo vệ bằng CSRF token.
> Kẻ tấn công lợi dụng token hoặc thông tin xác thực có sẵng trong trình duyệt (do
> đã có login) để thực hiện hành vi trái phép thông qua 1 domain khác.
> Tham khảo: https://cwe.mitre.org/data/definitions/352.html

**Cách khắc phục (nguyên văn):**
> Đã ngăn chặn ở nhưng form submit quan trọng

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến các form submit có gắn kèm CSRF token

**Notes:** Đây là cảnh báo cấu hình

---

### 3. CSP: Failure to Define Directive with No Fallback

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CWE-693 |
| **Mức độ** | 🟡 Medium |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Chính sách bảo mật nội dung (Content Security Policy - CSP) của ứng dụng web thiếu
> định nghĩa cho một số directive như form-action, frame-ancestors, hoặc object-src
> không được khai báo rõ ràng.
> Tham khảo: https://cwe.mitre.org/data/definitions/693.html

**Cách khắc phục (nguyên văn):**
> Bổ sung thêm vào chính sách CSP đã có sẵn trên hệ thống

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến các link thư viện css, js

**Notes:** Đây là cảnh báo cấu hình

---

### 4. CSP: Wildcard Directive

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CWE-693 |
| **Mức độ** | 🟡 Medium |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> chính sách CSP cho phép sử dụng ký tự đại diện (*) trong các directive như
> object-src, manifest-src, hoặc worker-src. Việc này khiến trang web mất kiểm soát
> nguồn tài nguyên được tải

**Cách khắc phục (nguyên văn):**
> Không sử dụng ký tự đại diện * trong bất kỳ directive nào

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến các link thư viện css, js

**Notes:** Đây là cảnh báo cấu hình

---

### 5. CSP: script-src unsafe-inline

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CWE-79 |
| **Mức độ** | 🟡 Medium |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> lỗ hổng trong chính sách bảo mật nội dung (Content Security Policy - CSP) xảy ra
> khi ứng dụng web cho phép thực thi mã JavaScript nội tuyến (inline scripts).
> Tham khảo: www.sysdig.com/blog/cve-2025-49844-redishell

**Cách khắc phục (nguyên văn):**
> Loại bỏ 'unsafe-inline' khỏi directive script-src

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng những nơi sử dụng sử dụng JavaScript được nhúng trực tiếp trong HTML
> (inline event handlers như onclick, onload, hoặc <script>...</script> không có
> nonce/hash)

**Notes:** Đây là cảnh báo cấu hình

---

### 6. CSP: style-src unsafe-inline

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CWE-116 |
| **Mức độ** | 🟡 Medium |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Directive style-src trong chính sách CSP cho phép từ khóa unsafe-inline, nghĩa là
> trình duyệt được phép thực thi các đoạn CSS inline (viết trực tiếp trong HTML).
> Tham khảo: https://cwe.mitre.org/data/definitions/116.html

**Cách khắc phục (nguyên văn):**
> Bổ sung unsafe-inline và chính sách CSP

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến tất cả các css inline

**Notes:** Đây là cảnh báo cấu hình

---

### 7. Content Security Policy (CSP) Header Not Set

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CWE-639 |
| **Mức độ** | 🟡 Medium |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Ứng dụng không gửi header Content-Security-Policy trong phản hồi HTTP -> chưa được
> cấu hình CSP.
> Tham khảo: https://cwe.mitre.org/data/definitions/693.html

**Cách khắc phục (nguyên văn):**
> Trong IIS bật HSTS

**Phạm vi ảnh hưởng (nguyên văn):**
> Không ảnh hưởng

**Notes:** Đây là cảnh báo cấu hình

---

### 8. Cross-Domain Misconfiguration (CORS)

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CWE-264 |
| **Mức độ** | 🟡 Medium |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Cross-Domain Misconfiguration, hay còn gọi là CORS (Cross-Origin Resource Sharing)
> Misconfiguration, là một lỗi cấu hình bảo mật khi máy chủ web cho phép truy cập
> tài nguyên từ bất kỳ domain nào (Access-Control-Allow-Origin: *).
> Tham khảo: https://cwe.mitre.org/data/definitions/264.html

**Cách khắc phục (nguyên văn):**
> Không sử dụng ký tự đại diện * trong Access-Control-Allow-Origin

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến các link thư viện css, js

**Notes:** Đây là cảnh báo cấu hình

---

### 9. Missing Anti-clickjacking Header

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Main |
| **Mã lỗ hổng** | CWE-1021 |
| **Mức độ** | 🟡 Medium |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Không cấu hình directive frame-ancestors trong Content Security Policy (CSP).
> Tham khảo: https://cwe.mitre.org/data/definitions/1021.html

**Cách khắc phục (nguyên văn):**
> Bổ sung vào CSP Content-Security-Policy: frame-ancestors 'self'

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến những nơi nhúng (embedding) của trang web trong iframe

**Notes:** Đây là cảnh báo cấu hình

---

### 10. Vulnerable JS Library (Highcharts v8.2.2)

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 14/10/2025 |
| **Phát hiện bởi** | Zap |
| **Tác động** | Portal |
| **Mã lỗ hổng** | CVE-2021-29489 |
| **Mức độ** | 🔴 High |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Sử dụng phiên bản thư viện JavaScript có lỗ hổng (Highcharts v8.2.2)

**Cách khắc phục (nguyên văn):**
> Nâng cấp thư viện Highcharts lên v12.4.0

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến các màng hình có dùng biểu đồ

**Notes:** _(trống)_

---

## ĐỢT 2 — 17/10/2025 | Phát hiện bởi: Khách hàng

---

### 11. vulnerability Critical — CVE-2025-49844 (Redis Lua Scripting Use-After-Free)

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/10/2025 |
| **Phát hiện bởi** | Khách hàng |
| **Tác động** | Máy chủ |
| **Mã lỗ hổng** | CVE-2025-49844 |
| **Mức độ** | 🔴🔴 Critical |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Một use-after-free trong subsystem Lua scripting của Redis, cho phép attacker thoát
> khỏi sandbox Lua và thực thi mã tùy ý trên máy chủ.
> Tham khảo: https://www.sysdig.com/blog/cve-2025-49844-redishell

**Cách khắc phục (nguyên văn):**
> Update redis lên phiên bản tối thiểu là v8.2.2

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến những nơi có dùng redis

**Notes (nguyên văn):**
> Nếu khai thác thành công kẻ tấn công có thể mở shell / reverse shell → kiểm soát host.
> Đọc file nhạy cảm (/etc/passwd, SSH keys, token môi trường, file config).
> Ghi/cài đặt phần mềm (malware, miner)

---

## Tổng hợp

| # | Tiêu đề | Mã lỗ hổng | Mức độ | Tác động | Trạng thái |
|---|---|---|---|---|---|
| 1 | Vulnerable JS Library (Lodash 4.17.15) | CVE-2021-23337, CVE-2020-28500, CVE-2020-8203 | 🔴 High | Main | ✅ Đã đóng / Bỏ qua |
| 2 | Absence of Anti-CSRF Tokens | CWE-352 | 🟡 Medium | Main | ✅ Đã đóng / Bỏ qua |
| 3 | CSP: Failure to Define Directive with No Fallback | CWE-693 | 🟡 Medium | Main | ✅ Đã đóng / Bỏ qua |
| 4 | CSP: Wildcard Directive | CWE-693 | 🟡 Medium | Main | ✅ Đã đóng / Bỏ qua |
| 5 | CSP: script-src unsafe-inline | CWE-79 | 🟡 Medium | Main | ✅ Đã đóng / Bỏ qua |
| 6 | CSP: style-src unsafe-inline | CWE-116 | 🟡 Medium | Main | ✅ Đã đóng / Bỏ qua |
| 7 | Content Security Policy (CSP) Header Not Set | CWE-639 | 🟡 Medium | Main | ✅ Đã đóng / Bỏ qua |
| 8 | Cross-Domain Misconfiguration (CORS) | CWE-264 | 🟡 Medium | Main | ✅ Đã đóng / Bỏ qua |
| 9 | Missing Anti-clickjacking Header | CWE-1021 | 🟡 Medium | Main | ✅ Đã đóng / Bỏ qua |
| 10 | Vulnerable JS Library (Highcharts v8.2.2) | CVE-2021-29489 | 🔴 High | Portal | ✅ Đã đóng / Bỏ qua |
| 11 | vulnerability Critical CVE-2025-49844 | CVE-2025-49844 | 🔴🔴 Critical | Máy chủ | ✅ Đã đóng / Bỏ qua |

---

## Bài học / Lưu ý

- **Scan định kỳ**: Sử dụng OWASP ZAP hoặc tương đương để quét định kỳ, không chờ khách hàng phát hiện.
- **Dependency tracking**: Theo dõi CVE của các thư viện third-party (Lodash, Highcharts, Redis) — có thể dùng `npm audit`, Dependabot, hoặc Snyk.
- **CSP baseline**: Các lỗi CSP/CORS/Clickjacking là cảnh báo cấu hình cơ bản, cần có checklist bảo mật chuẩn cho mỗi lần deploy lên môi trường mới.
- **Redis critical**: CVE-2025-49844 là lỗ hổng Critical RCE — cần có quy trình patch server khẩn cấp khi phát sinh CVE critical liên quan đến infrastructure.
- **Phân loại "Bỏ qua"**: Cần ghi rõ lý do accept risk cho từng mục "Bỏ qua" để tránh nhầm lẫn với "chưa xử lý".
