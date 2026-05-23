---
type: source
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "aristotle"
  - "syllogism"
  - "logic"
  - "critical-thinking"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/10-Aristotle-TamDoanLuan.md
related:
  - "[[wiki/concepts/PKM-Methods]]"
---

# Aristotle — Tam đoạn luận · Bóc tách tiền đề · Kiểm tra logic

> **Nhóm**: Phương pháp luận Debug  
> **Phù hợp**: Khi cần kiểm tra tính hợp lệ của một kết luận, bóc tách câu nói tự tin của AI/đồng nghiệp/docs

---

## Nguyên tắc cốt lõi

Tam đoạn luận (Syllogism) là cấu trúc lập luận cơ bản nhất:

```
Tiền đề lớn (Major premise): Quy tắc tổng quát
Tiền đề nhỏ (Minor premise): Trường hợp cụ thể
Kết luận (Conclusion):       Hệ quả tất yếu
```

> **Quan trọng**: Kết luận chỉ đúng khi **CẢ HAI tiền đề đều đúng** và **cấu trúc lập luận hợp lệ**.  
> Một tiền đề sai → kết luận sai dù logic có vẻ chặt chẽ.

---

## 4 Ví dụ điển hình + phân tích

### Ví dụ 1 — Hợp lệ hoàn toàn ✅

```
Tiền đề lớn: Tất cả con người đều chết.
Tiền đề nhỏ: Socrates là con người.
Kết luận:    Socrates sẽ chết.
```

**Socrates chất vấn**: "Bạn có chắc *tất cả* không?"  
→ Tiền đề lớn đúng → Lập luận hợp lệ.

---

### Ví dụ 2 — Tiền đề lớn không tuyệt đối ⚠️

```
Tiền đề lớn: Trời mưa thì đường ướt.
Tiền đề nhỏ: Đang mưa.
Kết luận:    Đường ướt.
```

**Socrates chất vấn**: "Nếu đoạn đường có mái che thì sao?"  
→ Tiền đề lớn không tuyệt đối → kết luận không đảm bảo.

**Sửa lại**: "Khi trời mưa, *đa số* đoạn đường không che sẽ ướt."

---

### Ví dụ 3 — Thiên nga đen (Black Swan) 🦢

```
Tiền đề lớn: Tất cả thiên nga đều trắng.
Tiền đề nhỏ: Đây là thiên nga.
Kết luận:    Nó trắng.
```

**Socrates chất vấn**: "Bạn đã quan sát *tất cả* thiên nga trên thế giới chưa?"  
→ Một con thiên nga đen ở Úc phá vỡ toàn bộ tiền đề lớn.

**Sửa lại**: "Đa số thiên nga châu Âu thời đó là trắng."

> **Bài học**: Mọi quy tắc tổng quát đều có nguy cơ Black Swan — đặc biệt trong production.

---

### Ví dụ 4 — Quan hệ xác suất, không phải tất định ⚠️

```
Tiền đề lớn: Người tập thể dục khỏe mạnh.
Tiền đề nhỏ: Nam tập thể dục.
Kết luận:    Nam khỏe mạnh.
```

**Socrates chất vấn**: "Nam có bệnh nền không?"  
→ Đây là quan hệ xác suất, không phải nhân quả tuyệt đối.

**Sửa lại**: "Nam có *khả năng* khỏe mạnh hơn người không tập."

---

## Quy trình kiểm tra tam đoạn luận (3 bước)

```
Bước 1 — TÁCH: Bóc câu nói/kết luận thành:
         [Tiền đề lớn] + [Tiền đề nhỏ] → [Kết luận]

Bước 2 — HỎI Socrates nhanh:
         "Tiền đề lớn có tuyệt đối không?"
         "Có ngoại lệ nào không?"
         "Bạn biết hết chưa?"
         "Đây là nhân quả hay tương quan?"

Bước 3 — SỬA: Nếu tiền đề không tuyệt đối →
         Đổi sang ngôn ngữ xác suất:
         "đa số", "thường", "có khả năng", "trong điều kiện X"
```

---

## Ứng dụng với AI / LLM

AI thường kết luận rất tự tin. Nguy hiểm khi:
- Training data có bias → tiền đề lớn sai
- Ví dụ không đủ đại diện → kết luận không áp dụng được cho case của bạn
- Dữ liệu production khác data mẫu

**Template kiểm tra nhanh khi AI đưa ra giải pháp:**

```
"Tiền đề lớn ẩn trong câu trả lời này là gì?
 Tiền đề đó có đúng với ngữ cảnh của tôi không?
 Có ngoại lệ nào trong hệ thống HRM cụ thể này?"
```

---

## Các lỗi lập luận phổ biến liên quan

| Lỗi | Mô tả | Ví dụ |
|-----|-------|-------|
| **Affirming the consequent** | Từ kết quả suy ngược về nguyên nhân | "Đường ướt → trời đang mưa" (có thể do xe tưới nước) |
| **Hasty generalization** | Tổng quát hóa từ mẫu nhỏ | "2 lần deploy sáng thứ 2 bị lỗi → đừng deploy thứ 2" |
| **False dichotomy** | Chỉ đưa ra 2 lựa chọn dù có nhiều hơn | "Hoặc là bug code, hoặc là bug DB" |
| **Correlation ≠ Causation** | Nhầm tương quan với nhân quả | "Mỗi khi A deploy thì B bị lỗi → A gây ra lỗi B" |

---

## Câu hỏi suy ngẫm

> Trong công việc và đời sống, có bao nhiêu phát biểu nghe thật chắc chắn... nhưng nếu bóc tách tiền đề bên dưới, liệu chúng còn đứng vững?

> Dù môi trường không cho phép tôi hỏi thẳng, tôi vẫn có thể tự chất vấn âm thầm trong nội tâm — để mài bén tư duy của chính mình, thay vì để niềm tin của người khác bào mòn khả năng suy nghĩ độc lập.

---

## Ưu / Nhược điểm

| Ưu điểm | Nhược điểm |
|---------|-----------|
| Cấu trúc rõ ràng, dễ kiểm tra | Cần thời gian bóc tách |
| Phát hiện lỗi logic ngay từ tiền đề | Không áp dụng được với vấn đề không có cấu trúc rõ |
| Kết hợp tốt với Socrates questioning | Đôi khi tiền đề lớn khó xác định |

---

## Liên kết
- `08-Socrates-TruyVan.md` — Câu hỏi Socrates để kiểm tra tiền đề
- `09-FirstPrinciples-TuDuyNguyenBan.md` — Phá vỡ tiền đề, xây từ nền tảng
- `01-Sherlock-Holmes.md` — Loại trừ giả thuyết có hệ thống
- `04-Toyota-5Whys-PDCA.md` — Truy nguyên nhân gốc rễ
