---
type: source
domain: ins
tags:
  - bao-hiem
  - HRM
  - INS
  - VnResource
created: 2015-02-21
updated: 2026-04-27
khach-hang: VnResource (nội bộ)
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
  - "[[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/00-INDEX]]"
source: "[[1. Projects/Nghiệp vụ HRM/INS/Ins_TaiLieuBaoHiem_01]]"
---
# INS — Chuỗi Giá Trị (Lean Production)

> **Domain**: Bảo hiểm (BHXH / BHYT / BHTN)
> **Khách hàng**: VnResource (nội bộ)
> **Ngày ghi**: 21/02/2015
> **Nội dung**: Quy trình Lean, chuỗi giá trị toàn phân hệ BH, tương quan Nhân sự / Chấm công / Lương

---

## Qui trình bảo hiểm

![](Ins_TaiLieuBaoHiem_01_image14.emf)

### Chi tiết các bước thực hiện

| **Bước thực hiện** | **Người thực hiện** | **Mô tả chi tiết** | **Tham chiếu** |
| --- | --- | --- | --- |
| **INS01.01** | Bộ phận nhân sự | Cán bộ Bảo hiểm cập nhật chứng từ BHXH vào hệ thống: Đường dẫn: *[Trang Chủ](http://113.161.103.125/HRM/Home/Views/Default.aspx) \> [Bảo Hiểm](http://113.161.103.125/HRM/Insurance/Default.aspx) \> DS Chứng Từ BHXH* |  |
| **INS01.02** | Bộ phận nhân sự | Cán bộ Bảo hiểm vào màn hình: Đường dẫn: *[Trang Chủ](http://113.161.103.125/HRM/Home/Views/Default.aspx) \> [Bảo Hiểm](http://113.161.103.125/HRM/Insurance/Default.aspx) \> Phân Tích Bảo Hiểm* =\> Tiến hành phân tích BHXH |  |
| **INS01.03** | Bộ phận nhân sự | Cán bộ Bảo hiểm xuất các báo cáo bảo hiểm trên phần mềm ra từ các màn hình: *Trang Chủ \> Bảo Hiểm \> Báo cáo* |  |
| **INS01.04** | Bộ phận nhân sự | Cán bộ Bảo hiểm nộp các báo cáo lên cơ quan bảo hiểm, thực hiện bên ngoài hệ thống |  |

### Danh sách chức năng

| **Mã** | **Tên chức năng** |

               

| **INS002** | Phân tích BHXH |
| **INS003** | DS D02 |
| **INS004** | DS D02TS |
| **INS005** | DS C70A |

## Qui trình chuổi giá trị toàn bộ phân hệ bảo hiểm

![](Ins_TaiLieuBaoHiem_01_image15.png)

## Qui trình chuổi giá trị phân tích bảo hiểm

![](Ins_TaiLieuBaoHiem_01_image16.png)

1.  Dữ liệu NV: không tạo giá trị khách hàng

2.  Tháng tham gia BH(BHXH,BHYT,BHTN): không tạo giá trị cho khách hàng

3.  Kiểm tra đóng BH: tạo giá trị cho khách hàng

4.  Kiểm tra nghỉ 14 ngày: tạo giá trị cho khách hàng

5.  Tính lương đóng BH: tạo giá trị cho khách hàng + thao tác trung gian
    để tính phần tử (tăng chi phí nên tìm cách loại bỏ chúng)

![](Ins_TaiLieuBaoHiem_01_image17.png)
## 🧠 **TỔNG QUAN**

👉 Đây là luồng từ **dữ liệu nhân sự → tính toán → ra kết quả BH**

---

## 🔹 **STEP 1 – Nguồn dữ liệu nhân sự**

- Profile & HR History
- Khóa đối tượng (lock)
- Xóa lịch sử BH

👉 Đây là **data đầu vào gốc** (master data)

---

## 🔹 **STEP 2 – Xử lý trạng thái lao động**

- Nhân viên:
    - Thai sản
    - Nghỉ việc
- Dữ liệu tính:
    - Tháng tham gia BH
    - Lương đóng BH
    - Nghỉ tạm hoãn

👉 Đây là bước **xác định tình trạng + dữ liệu tính BH**

---

## 🔹 **STEP 3 – (Trung gian)**

- Nối dữ liệu từ Step 2 → chuẩn bị cho tính toán

👉 Có thể là step **mapping / transform / validate**

---

## 🔹 **STEP 4 – Tính toán nghiệp vụ**

- Nghỉ > 14 ngày (ảnh hưởng đóng BH)
- Xác định chế độ BH
- Tổng hợp công
- Ngày nghỉ
- In/Out

👉 Đây là **engine xử lý chính (business logic)**

---

## 🔹 **STEP 5 – Cấu hình & kết quả**

- Phần tử BH
- Tỷ lệ BH
- Công thức tính BH theo lương
- BHTN theo vùng
- Công thức theo công việc

👉 Đây là **rule + config để ra kết quả cuối**

---

![](Ins_TaiLieuBaoHiem_01_image18.png)
🧠 TỔNG QUAN FLOW

👉 Gồm 5 bước chính:
Data → Kiểm tra tham gia → Kiểm tra đóng → Kiểm tra nghỉ → Tính tiền

🔹 BƯỚC 1 – Lấy dữ liệu nhân viên
Lấy thông tin nhân viên
Kiểm tra khóa đối tượng (có bị lock không)
Xóa dữ liệu BH cũ trước khi chạy lại
Lấy lịch sử nhân sự

👉 Đây là data input sạch để xử lý

🔹 BƯỚC 2 – Kiểm tra tháng bắt đầu tham gia BH
Xác định tháng bắt đầu đóng BH (dựa vào lương BHXH đầu tiên)
Nếu có tạm hoãn → lấy ngày quay lại làm

👉 Mục tiêu: biết chính xác bắt đầu đóng từ khi nào

🔹 BƯỚC 3 – Kiểm tra có đóng BH không
Xem tháng đó có thuộc diện đóng không:
Trước ngày vào làm?
Nghỉ thai sản?
Nghỉ việc trong kỳ?

👉 Đây là bước lọc eligibility (có đóng hay không)

🔹 BƯỚC 4 – Kiểm tra nghỉ 14 ngày
Dựa vào:
Tổng hợp công
Ngày nghỉ lễ
Loại nghỉ (có tính BH hay không)
In/Out
Chứng từ

👉 Rule quan trọng:

Nghỉ ≥ 14 ngày trong tháng → KHÔNG đóng BH

🔥 Đây là chỗ dễ sai nhất trong hệ thống

🔹 BƯỚC 5 – Tính lương bảo hiểm
Khởi tạo phần tử BH
Tính tiền dựa vào:
Lương BHXH
Tỷ lệ BH
BHTN theo vùng
Công thức theo chế độ lương

👉 Đây là bước output cuối (tiền phải đóng)

---


## Tương quan với các phân hệ khác

![](Ins_TaiLieuBaoHiem_01_image19.png)

🧠 1. NHÂN SỰ (HR – nguồn gốc dữ liệu)
Chứa:
Profile
Position
JobTitle
Contract

👉 Đây là master data, tất cả module khác đều phụ thuộc

⏱️ 2. CÔNG (Attendance – hành vi làm việc)
Tổng hợp:
Workday
Leave day
Tổng hợp công

👉 Đây là dữ liệu thực tế phát sinh mỗi ngày

🛡️ 3. BẢO HIỂM (BH – logic kiểm tra & chứng từ)
Nhận dữ liệu từ:
Nhân sự (hợp đồng, lương)
Công (nghỉ, công làm việc)
Xử lý:
Chứng từ BH
Kiểm tra điều kiện đóng/hưởng

👉 Đây là module trung gian quan trọng nhất

💰 4. LƯƠNG (Payroll – kết quả cuối)
Dựa vào:
Lương BHXH
Phần tử BH (PTBH)
Kết quả:
Tính lương
Khấu trừ BH

👉 Đây là output tiền cuối cùng

🔗 5. VÙNG GIAO NHAU (Insight quan trọng nhất)
🟡 NHÂN SỰ + CÔNG → BẢO HIỂM
Sinh ra: Chứng từ BH
Ví dụ:
Nghỉ >14 ngày → không đóng BH
Nghỉ thai sản → chuyển chế độ

👉 Đây là chỗ quyết định có đóng BH hay không

🟢 BẢO HIỂM + LƯƠNG
Sinh ra:
PTBH (phần tử bảo hiểm)
Lương BHXH
Tính lương

👉 Đây là chỗ quyết định đóng bao nhiêu tiền

🔥 Tóm lại 1 câu:

Nhân sự cung cấp dữ liệu → Công phản ánh thực tế → Bảo hiểm quyết định có đóng không → Lương tính ra tiền.

---

##  Các thành phần liên quan đến bảo hiểm

### Các thành phần liên quan đến bảo hiểm tổng quát

- Giúp xác định liệu có vấn đề phức tạp nào nằm ở gốc của vấn đề đang
  quan tâm không?

![](Ins_TaiLieuBaoHiem_01_image20.png)

## 🧠 **1. Ý nghĩa tổng thể**

👉 Đây là **graph các thành phần ảnh hưởng đến kết quả bảo hiểm**

- Mỗi node = 1 nguồn dữ liệu / rule
- Các đường nối = quan hệ phụ thuộc
- Trung tâm: **Thành phần bảo hiểm (Insurance Engine)**

👉 Mục tiêu:

> **Xác định lỗi không phải ở ngọn mà ở gốc**

---

## 🔗 **2. Nhóm thành phần chính (4 cụm lớn)**

### 🟢 **(1) NHÂN SỰ – gốc dữ liệu**

- Profile Info
- Hợp đồng (loại HĐ đóng BH)
- Chức danh, nơi đóng BH
- Tạm hoãn
- Profile History

👉 Sai ở đây → sai toàn bộ BH phía sau

---

### 🔵 **(2) CÔNG – dữ liệu thực tế**

- In/Out
- Ca làm
- Bảng công
- Tổng hợp công
- Ngày nghỉ BH

👉 Đây là nơi dễ phát sinh:

- Nghỉ > 14 ngày
- Sai ngày công → sai BH

---

### 🟣 **(3) CẤU HÌNH & RULE BH**

- Cấu hình BH
- Chế độ BH
- Lịch sử BH
- Chứng từ
- Lương BHXH

👉 Đây là “luật chơi”:

- Sai config = hệ thống tính sai hàng loạt

---

### 🟠 **(4) LƯƠNG – kết quả tính toán**

- Lương cơ bản
- Phụ cấp
- Chế độ lương

👉 Đây là nơi ra tiền → nhưng **không phải gốc lỗi**

---

## ⚙️ **3. TRUNG TÂM – “THÀNH PHẦN BẢO HIỂM”**

👉 Đây là **engine tổng hợp tất cả**

Nó nhận:

- Data HR
- Data Công
- Rule BH
- Salary

👉 Và trả ra:

- Có đóng BH không
- Đóng bao nhiêu

---

## 🔥 **4. Cách dùng sơ đồ này để debug (rất quan trọng)**

### 🧩 Khi có lỗi BH:

👉 Đừng fix ngay ở kết quả

### 👉 Đi theo flow ngược:

1. ❌ Sai tiền → check Lương
2. ❌ Sai điều kiện → check Rule BH
3. ❌ Sai trạng thái → check Công
4. ❌ Sai dữ liệu gốc → check Nhân sự

---

## 💡 **5. Insight xịn (góc senior dev 😏)**

### ⚡ 80% bug nằm ở:

- Sai ngày công
- Sai trạng thái nghỉ
- Sai lịch sử BH

👉 Không phải do code tính toán

---

### ⚡ Tư duy đúng:

> **BH = hệ quả của dữ liệu + rule → không phải phép tính đơn thuần**

---

### ⚡ Gợi ý design system:

- Tách rõ:
    - `HR Data Layer`
    - `Attendance Layer`
    - `Insurance Rule Engine`
    - `Payroll Engine`
- Có thêm:
    - **Audit log từng bước**
    - **Trace graph như hình này**

👉 Debug sẽ nhanh gấp 10 lần 😎

---


### Các phân hệ liên quan đến bảo hiểm

![](Ins_TaiLieuBaoHiem_01_image21.png)

### Nhân sự

![](Ins_TaiLieuBaoHiem_01_image22.png)

### Chấm công

![](Ins_TaiLieuBaoHiem_01_image23.png)

### Lương

![](Ins_TaiLieuBaoHiem_01_image24.png)

### Bảo Hiểm

![](Ins_TaiLieuBaoHiem_01_image25.png)

### Hệ thống

![](Ins_TaiLieuBaoHiem_01_image26.png)
---

## Lỗi thường gặp / Bug đã gặp

| Triệu chứng | Root cause | Cách fix |
|-------------|-----------|---------|
| | | |

---

## Văn bản pháp lý / Căn cứ

- **Luật / Nghị định**: Luật BHXH 2014 (sửa đổi 2019)
- **Thông tư**:
- **Hiệu lực từ**: 

---

## Ghi chú thêm / Lessons Learned

- 

---

## Liên kết

- [[wiki/sources/INS-C70-TinhLuong]]
- [[wiki/sources/INS-InsuranceMonthJoin]]
- [[wiki/flows/Flow-KhaiBaoiBHXH]]

---
## 🔗 Xem thêm

[[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/00-INDEX|⬆ INDEX — Tài Liệu Bảo Hiểm 01]]

- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/01-gioi-thieu|Giới Thiệu & Từ Viết Tắt]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/02-mindmap|Sơ Đồ Mindmap]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/03-nghiep-vu-bieu-mau|Nghiệp Vụ & Biểu Mẫu BH]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/05-database|Cấu Trúc Database]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/06-uml|Mô Hình UML & Activity Diagram]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/07-bao-cao-dong|Báo Cáo Động]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/08-van-de-bh|Vấn Đề Bảo Hiểm & Cấu Hình]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/09-bieu-do-code|Biểu Đồ Code (Kỹ Thuật)]]
