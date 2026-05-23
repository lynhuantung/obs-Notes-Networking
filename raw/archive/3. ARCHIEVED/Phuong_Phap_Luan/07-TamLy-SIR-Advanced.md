---
type: source
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "advanced"
  - "psychology"
  - "SIR-model"
  - "mental-model"
  - "llm-wiki"
  - "architecture"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/07-TamLy-SIR-Advanced.md
related:
  - "[[wiki/concepts/PKM-Methods]]"
  - "[[wiki/concepts/AI-DevTools]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
---

# Nâng cao: Tâm lý học Debug · Mô hình SIR · Kiến trúc LLM Wiki

> **Nhóm**: Phương pháp luận Debug — Nâng cao  
> **Phù hợp**: Hiểu sâu về hành vi debug, thiết kế hệ thống chống lỗi, xây dựng LLM Wiki

---

## Phần 1: Tâm lý học trong gỡ lỗi

### Fixed vs Growth Mindset

| Đặc tính tư duy | Tiếp cận gỡ lỗi | Hệ quả đối với hệ thống |
|----------------|----------------|------------------------|
| **Tư duy Cố định (Fixed)** | Lỗi = giới hạn khả năng → thay đổi ngẫu nhiên (cargo culting) | Code xáo trộn, nợ kỹ thuật tăng, gốc rễ không được giải quyết |
| **Tư duy Tăng trưởng (Growth)** | Lỗi = dữ liệu → cập nhật kiến thức, áp dụng phương pháp khoa học | Hệ thống đơn giản hóa, mental model hoàn thiện, ngăn lỗi tương tự |

> Gỡ lỗi là quá trình cập nhật **mental models** — khi mô hình tâm trí của lập trình viên không còn khớp với hiện thực của hệ thống.

### Cargo Culting — Dấu hiệu tư duy cố định khi debug
- Thêm `try-catch` mà không hiểu tại sao
- Copy-paste từ Stack Overflow mà không hiểu code làm gì
- Restart service thay vì tìm nguyên nhân
- Thêm delay/sleep ngẫu nhiên để "fix" race condition

### Kỹ sư language-agnostic
Kỹ sư thực thụ = phi ngôn ngữ (language-agnostic): tập trung cấu trúc dữ liệu, thuật toán, tương tác thành phần — không phải cú pháp của một ngôn ngữ cụ thể.

---

## Phần 2: Mô hình SIR — Dịch tễ học lỗi phần mềm (chi tiết)

### Công thức R₀

```
R₀ = β / γ

β = số lượng module bị ảnh hưởng khi 1 module lỗi (coupling)
γ = tốc độ phát hiện + vá lỗi (observability + deployment speed)
```

| R₀ | Tình trạng |
|----|-----------|
| R₀ < 1 | Lỗi tự suy giảm, hệ thống có khả năng tự phục hồi |
| R₀ = 1 | Lỗi duy trì ổn định, không lan rộng thêm |
| R₀ > 1 | Lỗi lan truyền → cascading failure → system down |

### Giảm R₀: Thiết kế hệ thống chống lỗi

**Giảm β (giảm coupling):**
- Loose coupling giữa services
- Interface-based programming
- Event-driven architecture thay vì direct call
- API versioning để tránh breaking changes

**Tăng γ (tăng khả năng phục hồi):**
- Circuit Breaker pattern
- Bulkhead pattern
- Health check + auto-restart
- Blue-green deployment
- Feature flags

### Chiến lược "tiêm vaccine" cho super-spreader

Super-spreader = module có β cao (nhiều module phụ thuộc vào):
- API Gateway
- Auth Service
- Shared Database
- Message Broker

Vaccine:
- Circuit Breaker wrapping calls đến super-spreader
- Fallback response khi super-spreader down
- Cache kết quả từ super-spreader
- Replica / HA setup

---

## Phần 3: Kiến trúc LLM Wiki — Bộ não giải quyết vấn đề

### 5 Chế độ (Modes)

| Chế độ | Trigger | Hành vi LLM Wiki |
|--------|---------|-----------------|
| **Holmes Mode** | Có logs/stack trace | Yêu cầu bằng chứng → hướng dẫn loại trừ nghi phạm |
| **Einstein Mode** | Lỗi concurrency/hiệu năng | Tạo kịch bản counterfactual "what if..." |
| **Da Vinci Mode** | Cần nhìn toàn cảnh | Cung cấp dependency graph, nhận diện cascade effect |
| **Toyota Mode** | Lỗi lặp lại | Tự động thực hiện chuỗi "Tại sao?" dựa trên history |
| **Feynman Mode** | Cần hiểu kỹ / handover | Yêu cầu giải thích lại → chỉ ra lỗ hổng logic |

### Template prompt tổng hợp

```
[Holmes Mode]
"Dùng Sherlock Holmes: liên tục loại trừ các nguyên nhân không thể.
Dữ liệu có sẵn: [logs / stack trace / env].
Hãy liệt kê nghi phạm và loại trừ từng cái một bằng bằng chứng."

[Einstein Mode]
"Dùng Einstein thought experiment: đơn giản hóa hệ thống [mô tả]
về 2 node, 1 user, 1 request. Trong kịch bản tối giản, lỗi có xảy ra không?"

[Da Vinci Mode]
"Nhìn hệ thống [mô tả] như Da Vinci nhìn cơ thể người.
Vẽ sơ đồ luồng. Tìm 'cổ họng' hoặc super-spreader node."

[Toyota Mode]
"5 Whys từ triệu chứng: [mô tả].
Hỏi Tại sao? ≥5 lần đến nguyên nhân có thể hành động được."

[Contact Tracing Mode]
"Causal chain từ [triệu chứng cuối] ngược về gốc.
Xây dựng graph. Tìm 'bệnh nhân 0'."

[Feynman Mode]
"Tôi giải thích lỗi này như sau: [giải thích đơn giản].
Chỗ nào giải thích sai hoặc thiếu? Giả định ngầm nào tôi đang bỏ qua?"
```

### Cấu trúc trang debug trong LLM Wiki

```markdown
## Debug: [Tên vấn đề]

- **Triệu chứng**: [Mô tả ngắn]
- **Môi trường**: [Service / DB / Server]
- **Phương pháp áp dụng**: [Holmes / 5 Whys / ...]
- **Timeline điều tra**:
  - [2026-05-02 10:00] Phát hiện: ...
  - [2026-05-02 10:30] Kiểm tra: ...
  - [2026-05-02 11:00] Kết luận: ...
- **Root cause**: [Nguyên nhân gốc rễ]
- **Fix**: [Giải pháp đã áp dụng]
- **Test case**: [Cách kiểm chứng]
- **Tags**: #debug #root-cause #method:sherlock
```

---

## Tương lai: AI-assisted debugging

Trong kỷ nguyên AI tạo ra mã, gỡ lỗi sẽ là sự **hợp tác giữa con người và AI** để hiểu các solution-spaces phức tạp:

- AI cung cấp các giả thuyết
- Con người kiểm chứng bằng phương pháp luận
- LLM Wiki lưu trữ knowledge và patterns
- Mỗi bug được fix = một mảnh ghép hoàn thiện mental model

> Gỡ lỗi, khi đó, trở thành **hành trình khám phá tri thức** — không chỉ là sửa bug.

---

## Liên kết
- `00-TongQuan-PhuongPhapLuan-Debug.md` — Index tổng quan
- [[wiki/concepts/PKM-Methods]] — Second Brain methodology
- [[wiki/concepts/AI-DevTools]] — Cursor AI, LLM workflow
- [[wiki/concepts/Kaizen-Methodology]] — Nền tảng Toyota thinking
