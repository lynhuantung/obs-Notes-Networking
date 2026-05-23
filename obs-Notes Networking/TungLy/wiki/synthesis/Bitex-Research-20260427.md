---
type: synthesis
tags:
  - bitex
  - akw
  - hrm
  - project-management
  - lessons-learned
  - 2025-2026
research-topic: Dự án Bitex-AKW — Triển khai HRM mới
sources-wiki:
  - wiki/projects/Bitex-Project
  - wiki/flows/Flow-Bitex-Phases
  - wiki/sources/Bitex-Project-Overview
  - wiki/sources/Bitex-Chat-ChiHuyThiCong
  - wiki/sources/Bitex-TaskList-PostGoLive
sources-raw: []
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/flows/Flow-Bitex-Phases]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/synthesis/VnPay-Research-20260427]]"
---

# Nghiên cứu: Dự án Bitex-AKW

> **Chủ đề**: Toàn cảnh triển khai HRM mới cho Bitex + AKW (2 hợp đồng, 1 hệ thống)
> **Nguồn tổng hợp**: 5 trang wiki — project, flow, 3 sources

---

## Tóm tắt điều hành

Dự án Bitex-AKW (mã 25010206-01) là dự án triển khai HRM mới cho hai đơn vị Bitex và AKW — một mô hình đặc biệt với **2 hợp đồng riêng biệt nhưng dùng chung 1 hệ thống**. Dự án kéo dài từ 02/06/2025 đến golive 01/12/2025 (6 tháng), hiện đang trong giai đoạn hỗ trợ vận hành với tiến độ 82% (81/99 tasks). Điểm kỹ thuật nổi bật là chuyển đổi từ .NET Framework sang .NET Core song song với triển khai. Dự án gặp nhiều rủi ro thực tế về nguồn lực và deadline nhưng đều được xử lý — trở thành nguồn bài học PM giá trị cho tổ chức.

---

## 1. Bối cảnh & Phạm vi

### 1.1 Khách hàng và cấu trúc hợp đồng

| Thông tin | Chi tiết |
|-----------|---------|
| Khách hàng | **Bitex** (văn phòng) + **AKW** (chuỗi cửa hàng) |
| Mô hình | 2 hợp đồng riêng — 1 hệ thống HRM chung |
| Quyết định PM | 1 project AMIS duy nhất + hạch toán tài chính chia đôi |
| Tiền lệ tham chiếu | ITL ký 13 hợp đồng, không tách dự án |
| Ngành | Retail (bán lẻ) |

**Lý do quyết định gộp**: "2 hợp đồng nhưng 1 source code, 1 hệ thống. Nếu tách: 1 công việc phải thực hiện 2 lần → vô lý." *(Trịnh Công Thức / Trần Quốc Bảo)*

### 1.2 Phân hệ triển khai

```
HRE (Hợp đồng lao động)
ATT (Chấm công / Ca làm việc)
TRA (Tuyển dụng)
UNI (Đồng phục)
Portal (Cổng nhân viên)
APP (Ứng dụng mobile)
```

### 1.3 Team (8 người)

| Tên | Vai trò |
|-----|---------|
| Lý Nhuận Tùng | Trưởng dự án / SE Lead |
| Trịnh Công Thức (Thức) | PE Lead |
| Trần Duy Tùng | Quản lý thi công TCDA |
| Trần Quốc Bảo | Quản lý TCDA |
| Phạm Văn Hiển | Quản lý điều phối TCDA |
| Nguyễn Thị Kim Hồng | SE Lead (từ 11/2025) |
| Trần Văn Hoài Thương | SE thi công (từ 23/08/2025) |
| Phan Thị Ngọc Tuyền (Tuyết Anh) | PE hỗ trợ hậu go-live |

---

## 2. Findings — Những gì tìm thấy

### 2.1 Timeline 5 giai đoạn

```
G0: Chuẩn bị kỹ thuật (.NET Core)  ──── deadline 20/03/2025
G1: Khảo sát & SRS                  ──── 02/06 → 30/06/2025  ✅
G2: Cài đặt hệ thống                ──── 01/07 → 30/09/2025  ✅
G3: Đào tạo                         ──── 29/09 → 18/12/2025  ✅ (kéo dài)
G4: UAT 2 round                     ──── 14/10 → 23/11/2025  ✅
G5: Golive + Hỗ trợ vận hành        ──── 01/12/2025 → nay    🔄
```

**Lưu ý**: Giai đoạn 3 (Đào tạo) bị kéo dài hơn kế hoạch — training TRA+UNI bắt đầu sớm 15/09 nhưng tổng thời gian kéo đến 18/12.

### 2.2 Rủi ro thực tế phát sinh (7 issues)

| # | Vấn đề | Thời điểm | KQ |
|---|--------|-----------|-----|
| R1 | BA bị rút không thông báo PE | 06/09/2025 | ✅ Escalate → bổ sung 2 SE |
| R2 | HRE deadline trễ (10/10 → 18/10) | 15/10/2025 | ✅ Re-target 18/10 |
| R3 | AKW32 ẩn nhiều sub-task — estimate sai | 01/11/2025 | ✅ OT 04/11 xử lý |
| R4 | Lệch dữ liệu file offline vs online | 18/12/2025 | ✅ Chốt Google Sheet |
| R5 | Lỗi gửi mail hệ thống | 27/01/2026 | 🔴 Còn tồn đọng |
| R6 | Cache cấu hình HttpContext → Redis | 12/02/2026 | ✅ Fixed |
| R7 | Performance: cache list → dictionary | 08/04/2026 | ✅ Fixed |

### 2.3 Đặc điểm kỹ thuật đặc biệt

**Chuyển đổi .NET Core**: Hoàn thành song song giai đoạn chuẩn bị (deadline 20/03/2025, thực tế QC/SE fix đến 19/04).

**Tích hợp API real-time**: HRM gọi API phía KH để lấy dữ liệu — không import file tĩnh. GAP được theo dõi trên Google Spreadsheet riêng.

**Branch source**: `HRM9-BRANCH/v8.12.48.01/BITEX_v8.12.48.01.09` — tách từ 23/08/2025.

**Build convention**:
- Main: `/HRM8_SQL/Pass/BITEX_v8.12.48.01.09.XX.zip`
- MyApp: `/HRM8_SQL/PASS/BUILD_PortalNew/BITEX_8.12.48.01/my-app-BITEX_...zip`
- Quy trình: SE build cuối giờ → PE/QC up môi trường test → fix bug trước, move code sau

### 2.4 Nghiệp vụ chấm công phức tạp (AKW cửa hàng)

Quy tắc trễ/sớm AKW có độ phức tạp cao:
- Tính từ **phút thứ 6** (không tính 5 phút đầu)
- Chặn tối đa **4 lần** trong tháng
- Trừ theo thứ tự: **phép năm → phép bù → lương**
- T2–T6 max 3.5h, T7 max 2h
- GPS/Wifi check-in per từng cửa hàng

Luồng duyệt nhiều cấp:
- Bổ nhiệm BH: L2 > L3 > Dung > Yến Anh
- Điều chuyển: TBP nơi đến > Dung > Yến Anh

### 2.5 Trạng thái hậu go-live (27/04/2026)

PE Tuyết Anh phụ trách vận hành từ 03/2026:

| Hạng mục | Tổng | Done | Open |
|----------|------|------|------|
| Raise Task / Test / Import / Issues / Hỗ trợ KH | 75 | 74 | 1 |
| Viết store / Xuất Word | 12 | 5 | 7 |
| Cấu hình Báo cáo | 8 | 0 | 8 |
| **Tổng** | **99** | **81 (82%)** | **18** |

**Bottleneck hiện tại**: Cấu hình 8 báo cáo bảng công + 7 mẫu xuất Word (HDLD, Cam kết bảo mật, Thư tuyển dụng)

---

## 3. Phân tích & Nhận định

### 3.1 Mô hình "2 hợp đồng 1 hệ thống" — tiền lệ quan trọng

Đây là mô hình hợp đồng đặc biệt ít gặp trong ngành HRM. Quyết định gộp hoàn toàn đúng về mặt kỹ thuật:
- Tránh duplicate công việc SE (1 feature = 2 lần implement nếu tách)
- Quản lý source code đơn giản hơn (1 branch, 1 build)
- **Rủi ro**: Hạch toán tài chính phức tạp hơn — cần quy ước chia chi phí từ đầu

### 3.2 Chain of delivery: SE xong ≠ Xong

Insight quan trọng nhất từ Thức (PE Lead):

```
SE xong → PE test + config → Chuyển KH → KH kiểm tra → Nghiệm thu
```

SE chỉ là bước đầu. Dự án cần **buffer 2–3 ngày** giữa deadline SE và deadline UAT để PE có thể test và config. Điều này bị vi phạm ở R2 (HRE trễ) — từ đó thành nguyên tắc cứng.

### 3.3 Nguồn lực là điểm yếu cốt lõi

R1 (BA bị rút) và R2 (HRE trễ) đều xuất phát từ nguồn lực:
- BA bị điều chuyển không thông báo → delay giai đoạn 2
- SE deadline trễ → không có buffer cho PE → cascade delay

**Root cause**: Thiếu quy trình thông báo thay đổi nhân sự chính thức giữa các team.

### 3.4 Vấn đề kỹ thuật hậu go-live: Cache

2 issues kỹ thuật lớn sau go-live đều liên quan đến **cache**:
- **R6**: `HttpContext.Cache` chỉ tồn tại per-request → race condition khi nhiều request đọc file config đồng thời → chuyển Redis
- **R7**: `List<T>` lookup O(n) → `Dictionary<K,V>` O(1) cho performance

Cả hai đều là vấn đề **thiết kế ban đầu** phát hiện muộn ở production.

### 3.5 So sánh với dự án QuickPack (cùng golive 01/12/2025)

| | Bitex-AKW | QuickPack QPVN |
|--|-----------|----------------|
| Phân hệ | 6 (HRE, ATT, TRA, UNI, Portal, APP) | 8 phân hệ |
| Kỹ thuật đặc biệt | .NET Core migration + API real-time | .NET Core migration |
| Hợp đồng | 2 KH — 1 hệ thống | 1 KH |
| Rủi ro lớn nhất | Nguồn lực SE + estimate | Thiếu SE chuyên sâu T8/2025 |
| Trạng thái 04/2026 | 82% done, vận hành ổn | (cần kiểm tra thêm) |

---

## 4. Gaps & Hạn chế

1. **Chưa có thông tin chi tiết về GAP Sheet API**: Link spreadsheet tích hợp API (https://docs.google.com/...) — không đọc được nội dung chi tiết GAP
2. **Phân hệ TRA và UNI thiếu tài liệu**: Không có nguồn nào mô tả nghiệp vụ cụ thể của TRA (Tuyển dụng) và UNI (Đồng phục) trong context Bitex
3. **Lỗi gửi mail (R5) chưa có RCA**: Vấn đề tồn đọng từ 27/01/2026 nhưng chưa có tài liệu root cause hoặc fix plan
4. **8 báo cáo bảng công chưa cấu hình**: Chưa có spec chi tiết cho các báo cáo này
5. **Dữ liệu số liệu AKW cửa hàng**: Chưa có thông tin về quy mô (bao nhiêu cửa hàng, bao nhiêu nhân viên AKW)

---

## 5. Gợi ý hành động

### Ngắn hạn (cho dự án Bitex hiện tại)
1. **Ưu tiên R5 (lỗi gửi mail)**: Assign Trung.Pham + Lý Nhuận Tùng — viết RCA + fix plan rõ ràng
2. **Đẩy 8 báo cáo bảng công**: Đây là 0% done — cần spec từ KH trước khi cấu hình
3. **Hoàn thành 7 mẫu Word còn lại**: HDLD + Cam kết bảo mật + Thư tuyển dụng

### Dài hạn (cho dự án tương lai)
1. **Chuẩn hóa quy trình thông báo nhân sự**: Tạo checklist thay đổi nguồn lực — bắt buộc thông báo PE/PM trước 3 ngày
2. **Template estimate task phức tạp**: Trước khi raise task có nhiều sub-task, bắt buộc breakdown trên AMIS
3. **Buffer cứng trong timeline**: Thêm 2–3 ngày buffer SE→UAT vào template project plan ngay từ khi lập kế hoạch
4. **Review cache design sớm**: Đưa cache strategy review vào checklist trước golive (tránh lặp lại R6, R7)
5. **Mô hình multi-contract**: Viết playbook "2 hợp đồng 1 hệ thống" — quy ước AMIS, tài chính, source code, build

---

## Nguồn tham khảo

| Nguồn | Loại | Nội dung |
|-------|------|---------|
| [[wiki/projects/Bitex-Project]] | Wiki Project | Trang chính, timeline, rủi ro, nhân sự |
| [[wiki/flows/Flow-Bitex-Phases]] | Wiki Flow | Sơ đồ Mermaid 5 giai đoạn chi tiết |
| [[wiki/sources/Bitex-Project-Overview]] | Wiki Source | Goals / Scope / Timeline / Risks gốc |
| [[wiki/sources/Bitex-Chat-ChiHuyThiCong]] | Wiki Source | Chat log thực tế nhóm "Chỉ Huy Thi Công" |
| [[wiki/sources/Bitex-TaskList-PostGoLive]] | Wiki Source | 99 tasks hậu go-live Tuyết Anh |
