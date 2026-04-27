---
type: source
tags:
  - bao-hiem
  - kaizen
  - issue-log
  - troubleshooting
  - root-cause-analysis
  - d02
  - c70
  - phan-tich-bao-hiem
  - ux-improvement
  - vnresource-2017
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: Projects/Nghiệp vụ HRM/INS/IssuesLog/INS_Kaizen_08.md
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/concepts/Kaizen-Methodology]]"
  - "[[wiki/sources/INS-Kaizen-08-Cards]]"
  - "[[wiki/sources/INS-FishBone-Analysis]]"
  - "[[wiki/sources/INS-TruyNguyenNhan]]"
  - "[[wiki/sources/INS-D02-ChungTu]]"
  - "[[wiki/sources/INS-C70-TinhLuong]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
---

# INS — Nhật Ký Vấn Đề Phân Hệ Bảo Hiểm (Kaizen #08 — 2017)

## Tóm tắt

Tài liệu nhật ký vấn đề nội bộ của VnResource, tạo ngày **21/08/2017** bởi **Tung.Ly**, dùng cho VnResource HRM Pro 2017. Mục tiêu: ghi lại các vấn đề có logic dài và phức tạp trong phân hệ Bảo hiểm để hạn chế bug tái phát khi thay đổi yêu cầu. Tài liệu gồm các issue được phân tích theo phương pháp **5 Whys / Kaizen**, FAQ chẩn đoán sự cố, và **kế hoạch giảm bug tháng 09–10/2017** theo Pareto chart.

Đây là tài liệu **lịch sử nguồn gốc** của bộ RCA/troubleshooting BH hiện tại — trực tiếp sinh ra [[wiki/sources/INS-FishBone-Analysis]] và [[wiki/sources/INS-TruyNguyenNhan]].

## Key Takeaways

### 1. Các vấn đề đã ghi nhận & phân tích

#### Issue 2.1 — D02: Không hiển thị điều chỉnh lương khi nghỉ thai sản / ≥14 ngày
- **Mantis**: #57589
- **Hành vi**: Khi NLĐ nghỉ thai sản hoặc nghỉ ≥14 ngày, phần **điều chỉnh lương không được hiển thị lên D02**
- **Ảnh hưởng**: Toàn bộ khách hàng sử dụng báo cáo D02

#### Issue 2.2 — Nguyên tắc ON-OFF Thai Sản
- **Mantis**: #57594
- **Quy tắc**:
  - Nếu **ngày bắt đầu** thai sản rơi vào 15/N-1 → 14/N → **ĐƯỢC đóng BH tháng N**
  - Nếu **ngày kết thúc** thai sản rơi vào 15/N-1 → 14/N → **KHÔNG được đóng BH tháng N**
- **Ảnh hưởng**: D02, tính lương BH, các khách hàng có thai sản

#### Issue 2.3 — Phân tích BH tháng N ra kết quả tháng N-1
- **Mantis**: #87680
- **Nguyên nhân**: **Múi giờ (timezone) không đồng bộ** giữa máy server và máy client
- **Xử lý**: Chỉnh đồng bộ timezone server–client, restart server
- **Bài học**: Timezone là nguồn lỗi âm thầm, cần kiểm tra khi deploy môi trường mới

### 2. FAQ Phân Tích Bảo Hiểm — Góc nhìn 4M

**Triết lý xử lý sự cố**: *"Lôi kéo khách hàng vào cùng suy nghĩ về hệ thống"* — đào tạo người dùng hiểu hệ thống để họ tự xác định nguyên nhân tại hiện trường.

> "Hiện trường và dữ liệu tại hiện trường là không giống nhau" — khách hàng là người có khả năng tìm nguyên nhân gốc cao nhất.

**4 nhóm nguyên nhân** khi phân tích BH không ra dữ liệu:

| Nhóm | Câu hỏi kiểm tra |
|------|-----------------|
| **Con người** | Thao tác đúng chưa? Đã cấu hình BH chưa? |
| **Máy chủ** | Server đáp ứng xử lý BH không? (cảnh báo khi RAM > 90%) |
| **Dữ liệu đầu vào** | Dữ liệu đầy đủ chưa? Công thức cấu hình đúng? NV có nghỉ tạm hoãn không? |
| **Phương pháp** | Đã thực hiện đúng quy trình? Đã có lương BHXH chưa? |

### 3. 5 Whys: Không lấy được "Tên Công Việc"

```
Vấn đề: Phân tích BH không lấy được Tên Công Việc
  → Chưa có chức danh / chức vụ
    → Đã có nhưng thiết lập công thức sai
      → Công thức đúng nhưng chưa có chức danh theo luật
        → Nhân sự quên nhập chức danh theo luật
          → ROOT CAUSE: Chưa validate bắt buộc nhập "Tên chức danh theo luật"
```
**Giải pháp**: Thêm validation bắt buộc trường "Tên chức danh theo luật" và "Tên chức vụ theo luật".

### 4. 5 Whys: Không tính được "Số tiền đóng BH"

```
Vấn đề: Không tính được tiền đóng BH
  → Chưa có lương đóng BH
    → Đã có lương nhưng phần tử công thức không tồn tại
      → Phần tử BH không hiểu các phần tử bên lương
        → Nơi nhập công thức dùng textbox (không trực quan, dễ nhập sai)
          → ROOT CAUSE: UI nhập công thức không trực quan
```
**Giải pháp**: Thay textbox bằng **multiSelect** để chọn phần tử — loại bỏ hoàn toàn lỗi nhập sai tên công thức.

### 5. FAQ C70 — Nguyên nhân gốc

**C70 tháng N ra lương BHXH = 0, tháng tham gia = 01/01/0001:**
→ Phân tích BH tháng **N-1 chưa chạy** hoặc ra lương BH = 0.

**C70A lương BHXH sai / số tiền không đúng — 5 Whys:**
```
  → Ngày nhận chứng từ trước ngày bắt đầu chứng từ
    → Chưa có lương BHXH
      → Quá nhiều dữ liệu lương BHXH của 1 NV (dư thừa do nhập tay)
        → ROOT CAUSE 1: Người dùng tạo dư thừa dữ liệu bên màn hình lương BHXH
        → ROOT CAUSE 2: Conflict logic cũ vs mới:
           - Logic cũ: bắt đầu sau ngày 15/N → lấy lương tháng N; trước ngày 15 → tháng N-1
           - Logic mới: luôn lấy lương tháng trước ngày bắt đầu chứng từ
```
**Rủi ro**: Sửa theo logic mới có thể sai dữ liệu một số khách hàng cũ.

### 6. Kế hoạch Kaizen 09–10/2017

**Thống kê thực chiến tháng 09/2017:**

| Tháng | Task Bug | Task Won't Fix |
|-------|---------|---------------|
| 08/2017 | 59 | 27 |
| 09/2017 | **21** | **6** |

Giảm 64% bug, 78% won't fix nhờ áp dụng Kaizen.

**Cách thực hiện giảm bug tháng 09:**
- Phân tích RCA từng won't-fix tháng 8 → đưa ra khắc phục
- Thêm **Help screen** cho màn hình Cấu hình bảo hiểm
- Bổ sung FAQ + hướng dẫn xử lý sự cố khi phân tích BH
- Cải thiện UX: auto-select tháng/đợt, filter combobox nơi đóng BH, ẩn template excel not-found
- Rà soát hàng ngày từng màn hình, fix trước khi đến QC/khách hàng

**Mục tiêu tháng 10/2017:**
- Tập trung vào 2 nhóm bug lớn nhất: **Phân tích BH** + **Báo cáo D02** (chiếm 70% bug tháng 09 theo Pareto)
- Chuẩn hoá thành tài liệu riêng + bổ sung vào màn hình hướng dẫn
- Giảm thiểu thao tác người dùng, gộp màn hình gần nhau

## Trích dẫn quan trọng

> "Tài liệu này giúp anh em kỹ thuật ghi lại nhật ký những vấn đề có logic dài và khó để hạn chế tối đa bug xảy ra khi thay đổi yêu cầu."

> "Hiện trường và dữ liệu tại hiện trường là không giống nhau. Khách hàng là người trực tiếp gặp vấn đề [...] khách hàng chính là người có khả năng tìm ra nguyên nhân gốc cao nhất."

> "Mục đích là làm sao 'Lôi Kéo' khách hàng vào cùng suy nghĩ về hệ thống, bằng cách đào tạo người dùng hiểu về hệ thống."

> "Tập trung xử lý các nguyên nhân gốc của 'Phân tích bảo hiểm' và 'báo cáo D02' => sẽ giải quyết được 70% bug." (Pareto principle)

## Liên kết

- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
- [[wiki/concepts/Kaizen-Methodology]] — Lý thuyết Kaizen: 5S, 4 phương pháp, mẫu thẻ (trang concept mới)
- [[wiki/sources/INS-Kaizen-08-Cards]] — 11 thẻ Kaizen thực thi Ins0001–Ins0011 (trang mới từ bộ thẻ)
- [[wiki/sources/INS-FishBone-Analysis]] — FishBone 4M (kế thừa triết lý từ tài liệu này)
- [[wiki/sources/INS-TruyNguyenNhan]] — 5 Whys CAPA matrix (mở rộng từ Kaizen #08)
- [[wiki/sources/INS-D02-ChungTu]] — Chi tiết biểu mẫu D02-TS
- [[wiki/sources/INS-C70-TinhLuong]] — Chi tiết bảng lương C70
- [[wiki/sources/INS-NghiThaiSan]] — Chế độ thai sản (liên quan Issue 2.1 & 2.2)
- [[wiki/sources/INS-Nghi14Ngay]] — Quy tắc nghỉ ốm 14 ngày (liên quan Issue 2.1)
