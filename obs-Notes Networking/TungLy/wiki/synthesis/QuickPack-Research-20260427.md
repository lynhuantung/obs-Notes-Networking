---
type: synthesis
tags:
  - quickpack
  - qpvn
  - hrm
  - golive
  - net8
  - research
date-updated: 2026-04-27
research-topic: Dự án QuickPack Việt Nam (QPVN)
sources-wiki:
  - "[[wiki/projects/QuickPack-Project]]"
  - "[[wiki/entities/QuickPack]]"
  - "[[wiki/sources/QuickPack-Project-Overview]]"
  - "[[wiki/flows/Flow-QuickPack-Phases]]"
sources-raw:
  - "1. Projects/Dự án 2026/QuickPack-Project/1. Goals-7425.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/2. Scope-7425.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/3. Timeline-7425.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/5. Resources-7425.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/6. Risks-7425.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/note-gap-phan-he.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-nguon-luc-se-qpvn.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-server-infrastructure-qpvn.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/task-tracking-phan-he-qpvn.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/Phases/Các giai đoạn.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-UAT.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-cài đặt.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/Meeting_Notes/H-QuickPack-REC-09082025.md"
  - "1. Projects/Dự án 2026/QuickPack-Project/Meeting_Notes/H-QuickPack-FAC-01082025.md"
related:
  - "[[wiki/projects/QuickPack-Project]]"
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/concepts/Nguon-Luc]]"
  - "[[wiki/concepts/Project-Phases]]"
---

# Nghiên cứu: Dự án QuickPack Việt Nam (QPVN)

## Tóm tắt điều hành

Dự án QPVN triển khai HRM 8 phân hệ cho QuickPack Việt Nam — doanh nghiệp sản xuất bao bì FMCG — với mốc Golive cứng **01/12/2025** và đã hoàn thành đúng hạn. Thách thức lớn nhất của dự án là **khủng hoảng nguồn lực SE tháng 8/2025**: yêu cầu 3 MM nhưng chỉ được cấp < 0.5 MM, dẫn đến leo thang kéo dài nhiều tuần. Về mặt kỹ thuật, **4 trong 8 phân hệ có GAP phức tạp** (UNI, SAL, TRA, REC), đặc biệt lương sản phẩm lệch chu kỳ và đào tạo theo đợt là hai điểm yêu cầu customization sâu nhất. Dự án đang ở giai đoạn Project Acceptance (01–02/2026) với build `QPVN_v8.12.48.01.43` ngày 19/01/2026.

---

## 1. Bối cảnh & Phạm vi

### 1.1 Thông tin dự án

| Thuộc tính | Giá trị |
|-----------|---------|
| Mã dự án | 25010206-01 |
| Khách hàng | QuickPack Việt Nam (QPVN) — sản xuất bao bì FMCG |
| Vendor | VnResource |
| PM VnResource | Lý Nhuận Tùng (Tùng.Ly) |
| PM Khách hàng | Trần Phước Hạc |
| Bắt đầu | 04/2025 |
| Golive | **01/12/2025** (mốc cứng, đã đạt) |
| Trạng thái hiện tại | Project Acceptance (01–02/2026) |

### 1.2 Phạm vi — 8 phân hệ

Dự án chia 2 đợt build song song:

| Đợt | Phân hệ | Thời gian build | UAT |
|-----|---------|-----------------|-----|
| **Đợt 1** | HRE, ATT, REC, UNI (Đồng phục) | 15/07–30/08/2025 | T9/2025 |
| **Đợt 2** | INS, SAL, TRA, EVA | 15/08–30/09/2025 | T10/2025 |

### 1.3 Đặc thù nghiệp vụ QPVN

QuickPack là doanh nghiệp sản xuất với các đặc điểm khác biệt so với khách hàng HRM thông thường:
- **Lương sản phẩm**: tính theo sản lượng, chu kỳ lệch so với lương chính
- **Đào tạo theo đợt**: nhân viên mới được đào tạo theo đợt, không liên tục
- **Quản lý đồng phục & thiết bị**: cần theo dõi tồn kho, cảnh báo thiếu hàng
- **Tuyển dụng 8 cấp**: chuỗi phê duyệt dài, chặn vượt định biên

---

## 2. Findings — Những gì tìm thấy

### 2.1 GAP Phân hệ — Phân loại theo mức độ phức tạp

#### 🔴 GAP Rất phức tạp (cần customization sâu)

**UNI — Đồng phục/Thiết bị**
- Họp GAP: 04/08/2025, sau đó 01/08/2025 (biên bản chính thức)
- Logic tồn kho: `Tồn cũ + Nhập - Cấp + Thu hồi = Tồn mới`
- Thêm màn hình cảnh báo thiếu hàng tồn kho trên trang chủ
- 3 field mới trong mã hàng chi tiết: Số tồn kho tối thiểu, Số lượng cấp tiêu chuẩn, Checkbox cảnh báo
- Chặn cấp phát vượt quá tồn kho
- Tự động load kích cỡ đồng phục từ DS khi bấm "Cấp phát"

**SAL — Lương sản phẩm**
- Chu kỳ lương sản phẩm lệch so với chu kỳ lương chính
- Cần logic tính toán riêng cho 2 chu kỳ song song
- Task chưa raise xong tính đến 07/10/2025 → rủi ro còn tồn đọng

**TRA — Đào tạo nhân viên mới theo đợt**
- Quy trình đào tạo theo đợt (batch training), không theo cá nhân
- Phức tạp về luồng phê duyệt và theo dõi tiến độ đào tạo

#### ⚠️ GAP Phức tạp (cần logic bổ sung)

**REC — Tuyển dụng (họp GAP 09/08/2025)**
- 8 cấp phê duyệt trong quy trình tuyển dụng
- Cảnh báo + **chặn** khi SL Tuyển > (SL Định biên - SL Hiện tại)
- Tự động đếm số ứng viên đã trở thành nhân viên theo thời gian thực
- Chặn tạo trùng lịch phỏng vấn (cùng ứng viên, cùng ngày/giờ)
- Store động để PE tự chỉnh sửa enum khi xuất Word
- Chức năng "Từ chối nhận việc" với cập nhật DS đen

**HRE — Hồ sơ nhân sự**
- HRE02.02.02: Quy trình đăng ký người thân/NPT
- HRE02.02.04: Đăng ký trình độ chuyên môn
- HRE02.02.05: Đăng ký thông tin tài khoản
- Nâng cấp luồng duyệt: nghỉ phép 4→5 cấp, nghỉ việc 4→6 cấp

**ATT — Chấm công**
- Có GAP riêng theo quy tắc chấm công QPVN
- Tài liệu giải pháp do Thông viết, Tùng.Ly điều phối

#### ✅ Không có GAP
- **INS** (Bảo hiểm): Test standard, không cần customization
- **EVA** (Đánh giá): Test standard, không cần customization

---

### 2.2 Khủng hoảng Nguồn lực SE (T8–T9/2025)

Đây là rủi ro nghiêm trọng nhất và thực sự xảy ra:

**Timeline leo thang:**

| Ngày | Sự kiện | Trạng thái |
|------|---------|-----------|
| 29/07/2025 | Hạc yêu cầu phân bổ nguồn lực | Chờ |
| 12/08/2025 | Giữa T8, chưa có SE nào làm task | 🔴 Nguy hiểm |
| 13/08/2025 | Hạc yêu cầu chính thức: **3 MM SE** | Escalate |
| 15/08/2025 | Anh Bảo nhắc Tùng xem xét | Nhắc nhở |
| 21/08/2025 | Xác nhận: Như+Quan+Tú — tổng < 1 MM | Thiếu so với yêu cầu |
| 04/09/2025 | Hạc yêu cầu 3 người full T9 (UAT) | Cấp bách |
| 09/09/2025 | SE chuyển sang dự án khác | ⚠️ Block UAT |
| 28/11/2025 | Sprint cuối, xin thêm SE từ anh Bảo | Giai đoạn cuối |

**Hậu quả trực tiếp:**
- 35 tasks tồn đọng (29 SE + 6 bug) tại 04/09/2025
- 3 bugs block toàn bộ luồng UAT: QPVN2128, QPVN2158, QPVN2146
- Delay training KH (dự kiến 08/09 bắt đầu, phải hoãn)

---

### 2.3 Hạ tầng & Kỹ thuật

**Stack:** .NET Core + IIS + SQL Server + Redis (Windows Server)

| Service | Port |
|---------|------|
| Main Web | 6501 |
| Employee Portal | 6502 |
| HR Service | 6503 |
| SYS Service | 6504 |
| API Center | 6505 |
| API Integration | 6506 |

**URL:** `https://site1.hrquickpack.vn:8002`

**Sự cố kỹ thuật đã xảy ra:**

| Sự cố | Nguyên nhân | Fix |
|-------|-------------|-----|
| API Mobile lỗi xoay xoay (10–11/09) | Thiếu 6 file config trong `/Apps/mobile/` | Copy đủ file config + BE check |
| IIS không chạy (09/10/2025) | Thiếu quyền `IIS_IUSRS` | Phân lại quyền full |
| Cache stale (09/10/2025) | Redis cache cũ | Clear Redis + Restart app pool |

**Đặc điểm:** Lỗi mobile app chỉ xuất hiện tại KH, không reproduce được tại VnR → cần SE đến kiểm tra tại chỗ.

**Migration .NET Framework → .NET 8:**
- Phát sinh vấn đề định dạng ngày tháng (13/06/2025)
- Giải pháp: dùng `System.Text.Json` thay `.NET Framework` serializer

---

### 2.4 Quy trình Build Management

```
SE raise yêu cầu build
    → Nguyễn Ngọc Hải build Main (~1 tiếng)
    → SE upload my-app (portal)
    → QC (Lê Thị Kim Tuyền) test trên link test
    → Feedback bug → SE fix → lặp lại
```

**Builds hậu Golive (T01/2026):**
| Ngày | Version | Trigger |
|------|---------|---------|
| 19/01/2026 | `QPVN_v8.12.48.01.43` | Build Main + Portal |
| 20/01/2026 | Build Main | Yêu cầu Nhựt |
| 23/01/2026 | Build Main | Task AMIS #3701466 |
| 26/01/2026 | Build full | Phương Thảo yêu cầu |

---

### 2.5 Timeline thực tế vs Kế hoạch

```
04/2025    ✅ Chuẩn bị, dựng môi trường .NET Core
06–07/2025 ✅ Khảo sát & chốt SRS (GAP xác định xong)
15/07/2025 ✅ Bắt đầu Build Đợt 1
30/08/2025 ⚠️ Build Đợt 1 — chậm do thiếu SE (35 tasks còn tồn)
09/09/2025 🔴 SE bị rút khỏi dự án
T9/2025    ⚠️ UAT Đợt 1 — bị block bởi 3 bugs
T10/2025   UAT Đợt 2
01–20/11   UAT Tổng hợp
T11/2025   Training End-user, Sprint tăng tốc
01/12/2025 ✅ GO-LIVE (đúng mốc cứng)
01–02/2026 Project Acceptance (đang tiến hành)
```

---

### 2.6 Nhân sự tham gia

| Vai trò | Tên | Ghi chú |
|---------|-----|---------|
| PM VnResource / EM | Lý Nhuận Tùng | Điều phối toàn dự án |
| PM / Lead | Trần Duy Tùng | Assign SE, leo thang |
| PM Khách hàng | Trần Phước Hạc | Quản lý phía KH, raise task |
| BA/PE | Trịnh Trần Thế Thông | T8/2025+ |
| BA/PE | Phan Thị Phương Thảo | Feedback test case |
| BA/PE | Nguyễn Thị Kim Hồng | T10/2025+ — chốt task HRE/ATT/REC/TRA |
| BA Khách hàng | Nguyễn Quốc Nhựt | Raise task ATT, trigger builds |
| QC | Lê Thị Kim Tuyền | Test case, build feedback |
| SE chính T8 | Trần Thị Quỳnh Như | 15–30/08 |
| SE bổ sung | Quan, Tú | 19–27/08 |
| SE Mobile | Nhân | T9/2025, kiểm tra tại chỗ |
| Build Manager | Nguyễn Ngọc Hải | Build Main |
| Director (giám sát) | Quốc Bảo, Phạm Văn Hiển | Escalation cấp cao |

---

## 3. Phân tích & Nhận định

### 3.1 Điểm mạnh của dự án

1. **Đạt Golive đúng mốc cứng 01/12/2025** — dù gặp nhiều sự cố nguồn lực
2. **GAP được phân tích rõ ràng từ đầu** — phân loại 3 mức: không GAP / phức tạp / rất phức tạp
3. **Quy trình Build Management rõ ràng** — SE raise → Build Manager → SE upload → QC test
4. **Leo thang kịp thời** — PM Hạc kiên trì leo thang nhiều tầng (Tùng → Bảo → Hiển) khi bị block

### 3.2 Điểm yếu / Rủi ro đã xảy ra

1. **Resource allocation gap nghiêm trọng**: yêu cầu 3 MM, cấp 0.5 MM — khoảng cách 6x là bất thường, cho thấy vấn đề trong quy trình lập kế hoạch nguồn lực
2. **SE bị rút giữa UAT**: tạo ra "cliff effect" — bỗng dưng mất toàn bộ đà tiến
3. **UAT phase thiếu SE backup**: không có người vừa fix bug vừa develop phase tiếp theo song song
4. **SAL task chưa raise xong tại T10**: module phức tạp nhất lại bắt đầu UAT khi tài liệu chưa đầy đủ
5. **Server UAT/PRD dùng chung**: rủi ro data contamination và performance
6. **Lỗi mobile chỉ reproduce tại KH**: cho thấy môi trường VnR khác KH — cần môi trường staging tương đồng

### 3.3 So sánh với Bitex-AKW

| Tiêu chí | QuickPack | Bitex-AKW |
|---------|-----------|-----------|
| Quy mô | 8 phân hệ, 1 hệ thống | 2 hợp đồng, 1 hệ thống |
| Golive | 01/12/2025 ✅ | 01/12/2025 ✅ |
| Rủi ro chính | Thiếu SE nghiêm trọng | Ít thông tin hơn |
| GAP phức tạp | SAL (lương sản phẩm), TRA (đào tạo theo đợt) | Không có dữ liệu so sánh |
| Post-Golive | Acceptance T01–02/2026 | Hỗ trợ vận hành sau Golive |

---

## 4. Gaps & Hạn chế

### Thông tin còn thiếu / chưa rõ

1. **Chi tiết 3 bugs block UAT** (QPVN2128/2158/2146): ghi nhận mã task nhưng không có mô tả nội dung bug
2. **Kết quả UAT Đợt 2**: không có dữ liệu cụ thể về T10/2025 (SAL/TRA/EVA)
3. **SAL task list đầy đủ**: task raise chưa xong tại 07/10 — chưa rõ đã được hoàn thiện chưa
4. **Kết quả Project Acceptance**: đang trong giai đoạn 01–02/2026 — chưa có biên bản nghiệm thu
5. **Server PRD**: kế hoạch dựng server PRD riêng — chưa rõ đã thực hiện chưa trước Golive
6. **Quy định "tối thiểu 5 task"**: PM Hạc đã challenge — VnResource có thay đổi quy định không?

### Trang wiki chưa có

- Chưa có trang `wiki/sources/` cho các meeting notes (REC-09082025, FAC-01082025)
- Chưa có trang tổng hợp GAP chi tiết từng phân hệ (riêng cho SAL, TRA)

---

## 5. Gợi ý hành động

### Ngắn hạn (trong T01–02/2026)

1. **Hoàn thiện task SAL**: ưu tiên raise đầy đủ task lương sản phẩm — đây là module phức tạp nhất chưa hoàn thiện tài liệu
2. **Theo dõi Project Acceptance**: chuẩn bị biên bản nghiệm thu, danh sách task hậu Golive đã xử lý
3. **Ingest meeting notes còn lại**: H-QuickPack-REC và H-QuickPack-FAC chứa GAP chi tiết quan trọng cần vào wiki

### Trung hạn (bài học cho dự án tiếp theo)

4. **Chốt resource commitment từ tháng -1**: không để leo thang qua nhiều tuần — mỗi tuần delay là ~25% capacity T8 bị lãng phí
5. **SE backup mandatory trong UAT**: ít nhất 1 SE fix bug / 1 SE develop phase tiếp theo song song
6. **Staging environment tương đồng KH**: lỗi mobile chỉ reproduce tại KH là dấu hiệu environment gap nghiêm trọng
7. **Raise task SAL/TRA sớm hơn 1 tháng**: các module phức tạp nhất cần tài liệu SRS trước khi bắt đầu UAT, không phải trong lúc UAT

---

## Nguồn tham khảo

### Wiki
- [[wiki/projects/QuickPack-Project]] — Trang dự án chính
- [[wiki/entities/QuickPack]] — Entity khách hàng QPVN
- [[wiki/sources/QuickPack-Project-Overview]] — Tóm tắt tổng quan
- [[wiki/flows/Flow-QuickPack-Phases]] — Sơ đồ 6 giai đoạn & Build Management

### File thô (chưa ingest đầy đủ vào wiki)
- `1. Projects/Dự án 2026/QuickPack-Project/` — Toàn bộ thư mục dự án
- `Meeting_Notes/H-QuickPack-REC-09082025.md` — Biên bản họp GAP Tuyển dụng
- `Meeting_Notes/H-QuickPack-FAC-01082025.md` — Biên bản họp GAP Đồng phục
- `DailyNotes/issue-nguon-luc-se-qpvn.md` — Timeline leo thang nguồn lực

### So sánh
- [[wiki/projects/Bitex-Project]] — Dự án Golive cùng ngày 01/12/2025
- [[wiki/projects/VnPay-Project]] — Dự án .NET 8 quy mô lớn hơn để so sánh
