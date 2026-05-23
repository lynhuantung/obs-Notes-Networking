---
type: source
domain: ins
tags:
  - bao-hiem
  - kaizen
  - ux-improvement
  - troubleshoot
  - validate
  - phan-quyen
  - performance
  - se-tooling
created: 2026-04-27
updated: 2026-04-27
source-file: raw/Nghiệp vụ HRM/INS/Ins_Kaizen_08/
related:
  - "[[wiki/sources/INS-Kaizen-08]]"
  - "[[wiki/concepts/Kaizen-Methodology]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
  - "[[wiki/flows/Flow-KhaiBaoiBHXH]]"
description: "11 thẻ Kaizen thực thi phân hệ bảo hiểm HRM 2017–2018, ghi lại cải tiến trước/sau về công thức BH, cấu hình và hiệu năng."
---

# INS — 11 Thẻ Kaizen Thực Thi (2017–2018)

## Tóm tắt

Bộ **11 thẻ Kaizen** cụ thể được tạo bởi **Tung.Ly** và nhóm SE (VnResource, 2017–2018) cho phân hệ Bảo hiểm và hệ thống. Mỗi thẻ theo mẫu chuẩn: Trước → Sau → Kết quả. Bộ thẻ này là **kết quả triển khai thực tế** của phương pháp Kaizen được mô tả trong [[wiki/sources/INS-Kaizen-08]], tập trung giải quyết các điểm đau người dùng tái phát: sai công thức BH, không hiểu cấu hình, server treo khi RAM đầy, khó tìm quyền.

## Key Takeaways

### Nhóm BH — Giảm lỗi người dùng (Ins0001–Ins0006)

| ID | Ngày | Vấn đề | Giải pháp | Kết quả |
|----|------|--------|-----------|---------|
| **Ins0001** | 21/03/2017 | Nhập công thức BH bằng textbox → sai sót | Chuyển sang **combobox** chọn phần tử | Không còn lỗi nhập tay |
| **Ins0002** | 23/03/2017 | Không biết cách cấu hình BH | Thêm **nút "Cấu hình mặc định"** + khôi phục | Ai cũng cấu hình được dù chưa hiểu nghiệp vụ |
| **Ins0003** | 27/03/2017 | Không hiểu quy trình phân tích BH | Thêm **nút Help** → link màn hình hướng dẫn | Đào tạo người dùng trực tiếp trong phần mềm |
| **Ins0004** | 29/03/2017 | Người dùng không hiểu thông báo lỗi | Tạo trang **InsuranceErrorCodes** với mô tả + giải pháp | Xử lý ngoại lệ tức thì |
| **Ins0005** | 03/04/2017 | Chưa validate dữ liệu đầu vào BH | Validate trước khi phân tích: chức danh, chức vụ, nơi đóng BH, tổng hợp công → **link thẳng đến lỗi cụ thể** | Người dùng thấy vấn đề trực quan |
| **Ins0006** | 10/04/2017 | RAM > 80% → phân tích BH treo server toàn bộ | **Cảnh báo RAM** trước khi xử lý + hiển thị % RAM realtime | Người dùng chủ động dừng hoặc tiếp tục |

### Nhóm BH — Trực quan hóa (Ins0008, Ins0011)

| ID | Ngày | Vấn đề | Giải pháp |
|----|------|--------|-----------|
| **Ins0008** | 05/09/2017 | Quá nhiều cấu hình BH, không biết dùng để làm gì | Thêm **popup trợ giúp** mô tả từng cấu hình |
| **Ins0011** | 23/01/2018 | Không hiển thị % tiến độ khi phân tích BH | Hiển thị **progress bar %** — người dùng làm việc tab khác vẫn theo dõi được |

### Nhóm SYS — Cải tiến công cụ SE (Sys0007, Sys0009, Sys0010)

| ID | Ngày | Vấn đề | Giải pháp |
|----|------|--------|-----------|
| **Sys0007** | 05/09/2017 | Màn hình phân quyền dài → kéo cuộn tốn thao tác | **Button "Về đầu trang"** hiện ra khi cuộn xuống |
| **Sys0009** | 12/09/2017 | Mỗi lần get source phải sửa tay 3 Web.config → dễ nhầm | **Tool tự động thay Web.config** theo task | 
| **Sys0010** | 22/09/2017 | Màn hình nhóm quyền khó tìm tên quyền | **Textbox tìm kiếm** theo tên tiếng Việt hoặc key quyền |

### Đề xuất nhỏ (ngoài dải số)

- **Kết thúc họp đúng giờ** (21/07/2018): Đặt chuông báo 10 phút trước khi kết thúc → tăng tốc độ họp.

## Trích dẫn quan trọng

> **Ins0006**: "Full bộ nhớ dẫn đến cả hệ thống sụp đổ (là điều không thể chấp nhận được). Khách hàng là người điều khiển máy, cần biết năng suất máy đáp ứng cho xử lý hiện tại không."

> **Ins0005**: "Validate kiểm tra dữ liệu đầu vào trước, sau khi xuất thông báo dữ liệu đầu vào chưa đúng hoặc phát hiện ngoại lệ, sẽ xuất hiện link giải thích ngoại lệ và dẫn đến trang mô tả trục trặc."

> **Sys0009**: "Anh em SE phải vào lần lượt vào 3 Web.config của 3 project để bỏ readonly + thay đổi chuỗi kết nối. Điều này rất tốn thao tác và rất dễ bị nhầm lẫn."

> **Ins0002**: "Tạo nút cấu hình mặc định [...] Thuận tiện cho những người chưa hiểu rõ về nghiệp vụ vẫn có thể cấu hình được."

## Pattern nổi bật — Kaizen UX cho module BH

Nhìn chuỗi Ins0001→Ins0011, thấy rõ một pattern **"Bậc thang tiếp cận người dùng"**:

```
Lớp 1 — Ngăn lỗi nhập:   Ins0001 (combobox), Ins0002 (default config)
Lớp 2 — Hướng dẫn sớm:   Ins0003 (Help button), Ins0004 (error catalog)
Lớp 3 — Validate trước:   Ins0005 (pre-flight check)
Lớp 4 — Monitor tài nguyên: Ins0006 (RAM warning), Ins0011 (progress %)
Lớp 5 — Mô tả rõ:        Ins0008 (config description popup)
```

Mỗi lớp giải quyết một điểm đau người dùng gặp **theo thứ tự** trong luồng phân tích BH.

## Liên kết

- [[wiki/sources/INS-Kaizen-08]] — Nhật ký gốc Kaizen #08 (5 Whys, kế hoạch Pareto)
- [[wiki/concepts/Kaizen-Methodology]] — Lý thuyết Kaizen: 5S, 4 phương pháp, mẫu thẻ
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
- [[wiki/sources/INS-InsuranceMonthJoin]] — Logic tháng tham gia BH (liên quan Ins0002)
- [[wiki/flows/Flow-TinhLuong-Monthly]] — Luồng tính lương (liên quan Ins0001)
- [[wiki/flows/Flow-KhaiBaoiBHXH]] — Luồng khai báo iBHXH (liên quan Ins0003)
