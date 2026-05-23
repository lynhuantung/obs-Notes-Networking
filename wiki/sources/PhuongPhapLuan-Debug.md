---
description: "6 phương pháp debug tư duy bậc cao: Sherlock Holmes, Einstein, Da Vinci, Toyota 5 Whys, Contact Tracing, Feynman áp dụng cho phần mềm HRM."
type: source
code: p9ml
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "methodology"
  - "mental-model"
  - "sherlock-holmes"
  - "einstein"
  - "toyota"
  - "feynman"
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/concepts/PKM-Methods]]"
  - "[[wiki/concepts/Kaizen-Methodology]]"
  - "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
  - "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
---

# Source: Hệ phương pháp luận Debug tư duy bậc cao

## Tóm tắt

Tập hợp 2 tài liệu nghiên cứu (Core + Advanced) tổng hợp 6 phương pháp tư duy kinh điển áp dụng cho debug phần mềm — không đi sâu kỹ thuật ngôn ngữ mà tập trung phương pháp luận. Được lưu thành 8 files riêng biệt trong `raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/`. Mục tiêu: LLM Wiki đóng vai trò "bộ não phương pháp luận" — khi gặp bug khó, query wiki nhận phương hướng tư duy phù hợp.

## Key Takeaways

- **6 phương pháp**: Sherlock Holmes (loại trừ), Einstein (thí nghiệm tư duy), Da Vinci (mô hình hóa hệ thống), Toyota (5 Whys + PDCA + Genchi), Contact Tracing (causal chain), Feynman (dạy lại)
- **Tâm lý học**: Growth Mindset = coi lỗi là dữ liệu; Fixed Mindset = cargo culting nguy hiểm
- **SIR Model**: R₀ = β/γ — nếu R₀ > 1, lỗi lan truyền thành cascading failure; giảm coupling (β) + tăng observability (γ)
- **LLM Wiki modes**: 5 chế độ (Holmes/Einstein/DaVinci/Toyota/Feynman) — mỗi loại bug có prompt template riêng
- **Super-spreader**: API Gateway / Auth Service / Shared DB = cần bảo vệ bằng Circuit Breaker
- **Genchi Genbutsu**: Dashboard đôi khi tạo bức tranh giả — phải xem log thô, SSH trực tiếp
- **Feynman**: Nếu không giải thích được đơn giản → chưa hiểu đủ → đó là nơi bug ẩn náu

## Trích dẫn quan trọng

> "Khi bạn đã loại bỏ những điều không thể, bất cứ điều gì còn lại, dù khó tin đến đâu, cũng phải là sự thật." — Sherlock Holmes

> "Nếu bạn không thể giải thích nó một cách đơn giản, nghĩa là bạn chưa hiểu nó đủ." — Richard Feynman

> "Để hiểu vấn đề, hãy xác nhận thực tế và phân tích nguyên nhân gốc tại chỗ." — Toyota (Genchi Genbutsu)

> "Mọi thứ kết nối với mọi thứ khác." — Leonardo da Vinci

> Gỡ lỗi là quá trình cập nhật mental models — khi mô hình tâm trí của lập trình viên không còn khớp với hiện thực của hệ thống.

## Files trong archive

| File | Nội dung |
|------|---------|
| `00-TongQuan-PhuongPhapLuan-Debug.md` | Index tổng quan + sơ đồ quyết định + checklist |
| `01-Sherlock-Holmes.md` | Quan sát – Loại trừ – Lập giả thuyết |
| `02-Einstein-ThuNghiemTuDuy.md` | Thí nghiệm tư duy – Đơn giản hóa |
| `03-DaVinci-QuanSatHeThong.md` | Quan sát đa lĩnh vực – Mô hình hóa |
| `04-Toyota-5Whys-PDCA.md` | 5 Whys + PDCA + Genchi Genbutsu |
| `05-ContactTracing-ChuoiNhanQua.md` | Causal chain + SIR Model |
| `06-Feynman-GiaiThich.md` | Dạy lại – Đơn giản hóa đến nguyên lý |
| `07-TamLy-SIR-Advanced.md` | Tâm lý học + SIR nâng cao + LLM Wiki architecture |

## Liên kết

- [[wiki/concepts/PhuongPhapLuan-Debug]] — Trang concept tổng hợp
- [[wiki/concepts/Kaizen-Methodology]] — Nền tảng Toyota thinking
- [[wiki/concepts/PKM-Methods]] — Second Brain, Zettelkasten
- [[wiki/sources/INS-FishBone-Analysis]] — FishBone 4M + 5 Whys thực tế HRM
- [[wiki/sources/INS-TruyNguyenNhan]] — RCA 4M Kaizen thực tế HRM
- [[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]] — RCA thực tế áp dụng Contact Tracing
