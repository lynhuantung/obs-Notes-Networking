---
type: flow
tags:
  - bitex
  - akw
  - phases
  - timeline
  - project-management
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/sources/Bitex-Project-Overview]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/flows/Flow-UAT-Process]]"
---

# Flow: Các Giai Đoạn Dự Án Bitex-AKW

> Dự án triển khai HRM cho Bitex + AKW (2 hợp đồng, 1 hệ thống)  
> Timeline: 02/06/2025 → nay (hỗ trợ vận hành hậu go-live)

---

## Sơ đồ tổng quan

```mermaid
flowchart TD
    G0[Chuẩn bị kỹ thuật\nChuyển .NET Framework → .NET Core\nDeadline: 20/03/2025] --> G1

    G1[Giai đoạn 1: Khảo sát & SRS\n02/06 – 30/06/2025]
    G1 --> A1[Khảo sát nghiệp vụ KH\nChốt tài liệu SRS]
    G1 --> A2[Trao đổi tích hợp API\nHRM gọi API KH real-time]
    A1 --> G2
    A2 --> G2

    G2[Giai đoạn 2: Cài đặt hệ thống\n01/07 – 30/09/2025]
    G2 --> B1[Cài đặt & cấu hình HRM\nTask list AKW series]
    G2 --> B2{⚠️ BA bị rút\n06/09/2025}
    B2 -- Escalate + bổ sung 2 SE --> B3[Tiếp tục 7 task BUG+Modify\nChuẩn bị Training]
    B1 --> G3
    B3 --> G3

    G3[Giai đoạn 3: Đào tạo\n29/09 – 18/12/2025]
    G3 --> C1[Training TRA + UNI\n15/09/2025]
    G3 --> C2[Sprint AKW31/32/90\nOT 04/11]
    G3 --> C3{⚠️ HRE deadline trễ\n10/10 → 18/10}
    C3 --> C4[Re-target + yêu cầu\nGoogle Sheet tracking]
    C1 --> G4
    C2 --> G4
    C4 --> G4

    G4[Giai đoạn 4: UAT 2 round\n14/10 – 23/11/2025]
    G4 --> D1[UAT Round 1\nGAP + phân hệ đã training]
    G4 --> D2[UAT Round 2\nFix bug + GAP từ R1]
    D1 --> D3{Lệch file offline vs online\n18/12/2025}
    D3 -- Chốt Google Sheet online --> D2
    D2 --> G5

    G5[Giai đoạn 5: Golive\n01/12/2025]
    G5 --> E1{🔴 Lỗi gửi mail\n27/01/2026}
    G5 --> E2[Lỗi cache cấu hình\nHttpContext → Redis\n12/02/2026]
    G5 --> E3[Performance: cache list → dict\n08/04/2026]
    E1 --> G6
    E2 --> G6
    E3 --> G6

    G6[Hỗ trợ vận hành\nTuyết Anh – nay\nHRE + ATT + Portal + APP]
```

---

## Chi tiết từng giai đoạn

### Giai đoạn 0: Chuẩn bị kỹ thuật
- **Nhiệm vụ**: Chuyển .NET Framework → .NET Core
- **Deadline ban đầu**: 20/03/2025
- **QC/SE fix**: đến 19/04/2025

### Giai đoạn 1: Khảo sát & SRS (02/06 – 30/06/2025)
- Khảo sát nghiệp vụ, chốt tài liệu SRS
- Trao đổi tích hợp API: HRM gọi API KH lấy dữ liệu real-time
- **Rủi ro**: Chưa có môi trường Linux; tài liệu API từ KH có thể trễ

### Giai đoạn 2: Cài đặt hệ thống (01/07 – 30/09/2025)
- Cài đặt & cấu hình HRM, thực hiện task AKW series
- Branch: `HRM9-BRANCH/v8.12.48.01/BITEX_v8.12.48.01.09` (tách 23/08/2025)
- **Sự cố**: BA bị rút 06/09 → Thức escalate → yêu cầu bổ sung 2 SE

### Giai đoạn 3: Đào tạo (29/09 – 18/12/2025, kéo dài)
- Training TRA + UNI: 15/09 (sớm hơn kế hoạch)
- Sprint 04/11: OT cho AKW31/32/90 (dependency: AKW90 → AKW32)
- **Sự cố**: HRE trễ 10/10 → re-target 18/10 → yêu cầu Google Sheet tracking chuẩn

### Giai đoạn 4: UAT 2 round (14/10 – 23/11/2025)
- Round 1: GAP analysis + test phân hệ
- Round 2: Fix bug + GAP từ Round 1
- **Bài học**: SE xong ≠ xong → cần buffer 2–3 ngày PE test
- **Quy tắc tracking**: Google Sheet online là nguồn duy nhất

### Giai đoạn 5: Golive & Hậu kỳ (01/12/2025 → nay)
- Golive 01/12/2025
- Lỗi gửi mail tồn đọng (27/01/2026) 🔴
- Fix cache cấu hình HttpContext → Redis (12/02/2026) ✅
- Tối ưu performance cache (08/04/2026) ✅
- PE Tuyết Anh hỗ trợ vận hành: HRE + ATT + Portal + APP (81/99 tasks done)

---

## Nguyên tắc vàng rút ra

| Nguyên tắc | Xuất phát từ |
|------------|-------------|
| Thông báo rút nhân sự ≥ 3 ngày trước | Issue nguồn lực 06/09 |
| Deadline SE = Deadline UAT - 2~3 ngày | Issue HRE trễ 15/10 |
| 1 nguồn task duy nhất = Google Sheet online | Lệch data 18/12 |
| Breakdown sub-task trước estimate | AKW32 phức tạp 01/11 |
| SE báo sớm khi sắp trễ | Issue HRE trễ 15/10 |

---

## Liên kết

- [[wiki/projects/Bitex-Project]] — Trang dự án chính
- [[wiki/sources/Bitex-Project-Overview]] — Nguồn chi tiết goals/scope/risks
- [[wiki/flows/Flow-UAT-Process]] — Quy trình UAT chuẩn HRM
- [[wiki/concepts/Project-Phases]] — Khái niệm giai đoạn triển khai
