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
# INS — Mô Hình UML & Activity Diagram

> **Domain**: Bảo hiểm (BHXH / BHYT / BHTN)
> **Khách hàng**: VnResource (nội bộ)
> **Ngày ghi**: 21/02/2015
> **Nội dung**: UseCase Diagram, Class Diagram, Activity Diagram: Trích nộp BH, BC D02, C70A, EBHXH, Truy lĩnh

---

## UseCase Diagram

![](Ins_TaiLieuBaoHiem_01_image28.png)

🧠 1. Actor chính
👤 Employee (user hệ thống)
👉 Là người thao tác tất cả nghiệp vụ
🛡️ 2. MODULE BẢO HIỂM (core chính)
🔹 Chức năng:
Khai báo lương BHXH & lao động
→ include: Tính trích nộp BHXH
Nhập chứng từ
Điều chỉnh BH

👉 Ý nghĩa:

Đây là nơi khai báo + thay đổi dữ liệu BH
Và tự động sinh ra số tiền phải đóng
💰 3. MODULE LƯƠNG
Tính lương

👉 Phụ thuộc:

Dữ liệu từ Bảo hiểm (trích nộp BH)


BH tính trước → Lương mới tính đúng

📊 4. MODULE BÁO CÁO
🔹 Xuất các file:
Xuất A01
Xuất D02
Xuất Tờ khai BHXH

👉 Đây là output để:

Nộp cơ quan BH
Lưu trữ / đối soát
🔗 5. LUỒNG NGHIỆP VỤ CHUẨN
👉 Flow đúng:
Khai báo BH
Tính trích nộp BH
Nhập chứng từ / điều chỉnh
Tính lương
Xuất báo cáo (A01, D02, tờ khai)
🔥 Tóm lại 1 câu:

Bảo hiểm là bước đầu (xác định tiền đóng) → Lương là bước tính tiền → Báo cáo là bước xuất file.

---

## Insurance Class Diagram

![](Ins_TaiLieuBaoHiem_01_image29.png)

# 🧠 **1. TRUNG TÂM HỆ THỐNG**

### 🔹 `Hre_Profile` (Nhân viên)

👉 Đây là **bảng gốc (master)**

- Chứa thông tin nhân viên
- Là **foreign key trung tâm** của gần như tất cả bảng BH

📌 Kết luận:

> 90% bảng đều link về `ProfileID`

---

# 🔗 **2. NHÓM NGHIỆP VỤ CHÍNH**

## 🟢 **(A) Nhóm CHỨNG TỪ & SỰ KIỆN BH**

|Bảng|Ý nghĩa|
|---|---|
|`Ins_InsuranceRecord`|Hồ sơ BH (core record)|
|`Ins_LeaveDayIns`|Nghỉ hưởng BH|
|`Ins_ChildSick`|Con ốm|
|`Ins_HealthCard`|Thẻ BHYT|

👉 Quan hệ:

- `Hre_Profile (1) → (n) Ins_InsuranceRecord`
- `InsuranceRecord → ChildSick / LeaveDay / HealthCard`

📌 Insight:

> Đây là **event data (phát sinh)**

---

## 🔵 **(B) Nhóm LƯƠNG BẢO HIỂM**

|Bảng|Ý nghĩa|
|---|---|
|`Sal_InsuranceSalary`|Lương đóng BH|
|`Ins_ProfileInsuranceMonthly`|Dữ liệu BH theo tháng|
|`Ins_InsuranceForPayrollMonthly`|Map sang payroll|

👉 Quan hệ:

- `Profile → InsuranceSalary (1-n)`
- `Profile → ProfileInsuranceMonthly (1-n)`
- `Monthly → PayrollMonthly`

📌 Insight:

> Đây là **data tính toán theo tháng**

---

## 🟣 **(C) Nhóm CẤU HÌNH BH**

|Bảng|Ý nghĩa|
|---|---|
|`Cat_ValueEntity`|Mức trần BHXH|
|`Cat_RateInsurance`|Tỷ lệ đóng BH|
|(Config khác)|BHTN theo vùng|

👉 Quan hệ:

- Không phụ thuộc Profile trực tiếp
- → được dùng trong tính toán

📌 Insight:

> Đây là **rule engine (config)**

---

## 🟠 **(D) Nhóm BÁO CÁO & OUTPUT**

|Bảng|Ý nghĩa|
|---|---|
|`Ins_ReportD02`|Header báo cáo|
|`Ins_ReportD02Item`|Chi tiết từng nhân viên|

👉 Quan hệ:

- `Profile → ReportItem`
- `Report → nhiều ReportItem`

📌 Insight:

> Đây là **output cuối để nộp BH**

---

## 🔴 **(E) Nhóm ĐIỀU CHỈNH**

|Bảng|Ý nghĩa|
|---|---|
|`Ins_InsuranceSalaryPayBack`|Truy thu / điều chỉnh|

👉 Quan hệ:

- Link Profile + tháng

📌 Insight:

> Đây là **fix sai / truy thu BH**

---

# 🔄 **3. LUỒNG DỮ LIỆU (QUAN TRỌNG NHẤT)**

### 👉 Flow chuẩn:

Hre_Profile  
   ↓  
InsuranceRecord (event)  
   ↓  
ProfileInsuranceMonthly (tổng hợp tháng)  
   ↓  
InsuranceSalary (lương BH)  
   ↓  
InsuranceForPayrollMonthly (map sang lương)  
   ↓  
ReportD02Item (xuất báo cáo)

---

# 🔥 **4. TÓM LẠI MỐI LIÊN HỆ**

## 🧩 **Quan hệ chính**

|From|To|Type|
|---|---|---|
|Profile|InsuranceRecord|1 - N|
|Profile|InsuranceMonthly|1 - N|
|Monthly|PayrollMonthly|1 - 1 / N|
|Profile|ReportItem|1 - N|
|Report|ReportItem|1 - N|

---

# 💡 **5. INSIGHT DEBUG (rất quan trọng 😏)**

### ⚡ Khi sai BH:

👉 Check theo thứ tự:

1. ❌ `ReportD02Item` → sai output
2. ❌ `ProfileInsuranceMonthly` → sai tháng
3. ❌ `InsuranceRecord` → sai event
4. ❌ `Profile` → sai dữ liệu gốc

---

### ⚡ Khi sai tiền:

👉 Check:

- `Sal_InsuranceSalary`
- `Cat_RateInsurance`

---

### ⚡ Khi sai truy thu:

👉 Check:

- `Ins_InsuranceSalaryPayBack`

---

# 🚀 **6. KẾT LUẬN 1 CÂU**

> **Profile là gốc → Event tạo dữ liệu → Monthly tổng hợp → Salary tính tiền → Report xuất kết quả.**

---


##  Activity Diagram

### Xử lý Trích Nộp Bảo Hiểm Xử lý Trích Nộp Bảo Hiểm

![](Ins_TaiLieuBaoHiem_01_image30.png)


# 🧠 **TỔNG QUAN**

👉 Mục tiêu:

> **Xác định nhân viên nào phải đóng BH và tính số tiền phải đóng trong tháng**

---

# 🔄 **FLOW CHI TIẾT**

## 🔹 **1. Khởi tạo**

- Bắt đầu quy trình **Trích nộp**
- Chọn:
    - Phòng ban (PB)
    - Tháng làm

👉 Scope dữ liệu cần xử lý

---

## 🔹 **2. Lấy danh sách nhân viên**

- Load **DS NV theo PB + tháng**

👉 Input chính cho toàn bộ pipeline

---

## 🔹 **3. Xác định tháng bắt đầu đóng BH**

- Tính:
    - `MonthBeginInsSocial`
    - `MonthBeginInsHealth`
    - `MonthBeginInsUnEmp`

👉 Mục tiêu:

- Biết NV bắt đầu đóng từng loại BH từ khi nào

---

## 🔹 **4. Xác định có đóng hay không**

- Set flag:
    - `IsHaveInsSocial`
    - `IsHaveInsHealth`
    - `IsHaveInsUnEmp`

👉 Đây là bước **Eligibility (quan trọng nhất)**

📌 Rule thường gặp:

- Nghỉ >14 ngày → không đóng
- Nghỉ việc → không đóng
- Chưa đủ điều kiện → không đóng

---

## 🔹 **5. Tính tiền BH**

- Tính:
    - `MoneyInsuranceSocial`
    - `MoneyInsuranceHealth`
    - `MoneyInsuranceUnEmp`

👉 Dựa vào:

- Lương BHXH
- Tỷ lệ đóng
- Mức trần

---

## 🔹 **6. Lưu kết quả**

- Lưu vào bảng:
    - `Ins_ProfileInsuranceMonthly`

👉 Đây là bảng **snapshot theo tháng**

---

# 🔗 **3. LIÊN KẾT DATASTORE**

### 🟢 Input:

- **Lưu đối tượng NV (Profile)**

### 🔵 Output:

- **Ins_ProfileInsuranceMonthly**
    - Lưu trạng thái + số tiền BH theo tháng

---

# 🔥 **TÓM LẠI 1 CÂU**

> **Flow này = chọn nhân viên → xác định có đóng BH không → tính tiền → lưu theo tháng.**

---

####  Xử lý Tính tháng bắt đầu nộp BHXH,BHYT,BHTN

#### ![](Ins_TaiLieuBaoHiem_01_image31.png)

# 🧠 **MỤC TIÊU**


- `MonthBeginSocial`
- `MonthBeginHealth`
- `MonthBeginUnEmp`

👉 Tức là: **NV bắt đầu đóng từng loại BH từ tháng nào**

---

# 🔄 **FLOW RÚT GỌN**

## 🔹 **1. Xác định tháng kiểm tra**

- Input: `MonthCheck`
- Lấy:
    - Ngày cuối tháng
    - Danh sách lương BHXH

👉 Scope dữ liệu để tính

---

## 🔹 **2. Lặp từng nhân viên**

- Lấy:
    - Lịch sử BH
    - Lương BHXH trong tháng

---

## 🔹 **3. Xử lý trường hợp tạm hoãn / quay lại**

- Nếu NV có **ngày quay lại làm (DateComeBack)**:
    - Cập nhật lại `DateHire = DateComeBack`

👉 Xem như **NV mới quay lại → reset logic**

---

## 🔹 **4. Kiểm tra có đóng BH không**

- Check từng loại:
    - BHXH?
    - BHYT?
    - BHTN?

👉 Nếu **không đóng → bỏ qua**

---

## 🔹 **5. Xác định mốc bắt đầu (quan trọng nhất)**

### 🟢 Case 1: Có nghỉ tạm hoãn → quay lại

👉 Lấy:

MonthBeginInsurance = DateComeBack

---

### 🔵 Case 2: Không tạm hoãn

👉 Lấy:

MonthBeginInsurance = DateEffect (ngày hiệu lực lương BHXH đầu tiên)

---

### 🔴 Case 3: Không có dữ liệu

👉

MonthBeginInsurance = null

---

## 🔹 **6. Gán cho từng loại BH**

MonthBeginSocial  = MonthBeginInsurance (nếu có đóng BHXH)  
MonthBeginHealth  = MonthBeginInsurance (nếu có đóng BHYT)  
MonthBeginUnEmp   = MonthBeginInsurance (nếu có đóng BHTN)

---

# 🔥 **TÓM LẠI 1 CÂU**

> **Tháng bắt đầu đóng BH = ngày hiệu lực đầu tiên hoặc ngày quay lại làm sau tạm hoãn.**

---

Xử lý Kiểm Tra Nôp BHXH,BHYT,BHTN

![](Ins_TaiLieuBaoHiem_01_image32.png)

####  Xử lý tính lương và mức đóng của BHXH , BHYT,BHTN

![](Ins_TaiLieuBaoHiem_01_image33.png)

###  Xử Lý Báo Cáo

####  Xử Lý Tăng Giảm Cho Báo Cáo D02

![](Ins_TaiLieuBaoHiem_01_image34.png)

#### 

#### Xử Lý Tăng Báo Cáo D02

![](Ins_TaiLieuBaoHiem_01_image35.png)

####  Xử Lý Giảm Báo Cáo D02

![](Ins_TaiLieuBaoHiem_01_image36.png)

###  BC Đuôi D02

#### ![](Ins_TaiLieuBaoHiem_01_image37.png)Mô Hình

> ![](Ins_TaiLieuBaoHiem_01_image38.png)

- Dữ liệu đầu kỳ trong BC đuôi D02 sẽ "**không**" lấy những dữ liệu đã
  điều chỉnh.

####  Các Bảng xử lý D02

- Bảo Hiểm

  - Ins_ProfileInsuranceMonthly

  - Ins_InsuranceRecord (chứng từ bảo hiểm)

- Nhân Sự

  - Hre_Profile

  - Hre_Contract (Cat_ContractType)

  - Hre_StopWorking

| Các trạng thái Bảo Hiểm |  |
| --- | --- |
| Loại | Trạng Thái |
| Tăng | Tăng lao động (tăng LĐ , tăng LĐ do tạm hoãn) ([E_TANG_LD]{.mark}) Tăng do nghỉ 14 ngày Tăng sau thai sản Tăng sau bệnh (E_TANG_TS) Tăng BHTN Tăng BHYT |
| Giảm | Giảm do tạm hoãn ([E_GIAM_QUIT_SUSPENSE]{.mark}) Nghỉ việc sau khi nghỉ sinh con Giảm LĐ trả thẻ BHYT kịp thời Giảm LĐ không trả thẻ BHYT Giảm LĐ Giảm Bệnh Giảm do nghỉ hơn 14 ngày |
| Thay Đổi Lương | Giảm lương thay đổi chức danh nghề Giảm mức đóng Tăng Lương và thay đổi chức danh nghề Tăng mức đóng |
| Thay Đổi Chức Danh Nghề | Thay Đổi Chức Danh Nghề |
| Trường hợp đặc biệt | Nghỉ việc sau khi nghỉ sinh con Giảm do nghỉ \>=14 sau thai sản (nằm trong loại giảm) Nghỉ việc mà tháng trước nghỉ \>=14 ngày (nằm trong loại giảm) Giảm Lao Động Do Chuyển Nơi Đóng BH (nằm trong loại giảm) Tăng Lao Động Do Chuyển Nơi Đóng BH (nằm trong loại tăng) |

###  Xử lý chức năng tính truy lĩnh bảo hiểm

- **Mục đích :**

<!-- -->

- Điều chỉnh cho nv(kể cả NV nghỉ việc) \* Điều chỉnh tiền đóng BH và
  tiền HDTJob \*

- Điều chỉnh sai lệch tiền BHXH của các tháng trước(vd: tháng 5 điều
  chỉnh cho tháng 3,4 với sai lệch 100,000)

- Đóng BH cho các tháng trước quên đóng (đóng toàn bộ tiền cho tháng
  trước) (vd: tháng 05 điều chỉnh cho tháng 3,4 với số tiền là
  3,000,000)

<!-- -->

- **Cách tính truy lĩnh**

<!-- -->

- Trước khi tính thì xoá Ins_profileInsuranceMonthly chưa truy lĩnh (dựa
  vào profile,monthYear,Ispayback=0) (Dựa vào cấu hình cho phép xoa hay
  không)

- Trước khi tính thì xoá D02Item chưa truy lĩnh (dựa vào
  profile,Ispayback=0) (dựa vào cấu hình cho phép xoá hay không)

- Điều chỉnh số tiền đóng BHXH cho các tháng trước ( dựa vào
  FromMonthYearEffect , ToMonthYearEffect) cho tháng được chọn
  (MonthYearEffect)

- Dựa vào số tiền tháng được truy lĩnh (vd: 2 tháng) sẽ them vào 2 dòng
  vào Ins_ProfileInsuranceMonthly và Ins_ReportD02Item (với IsPayBack là
  true)

Vd: Dữ liệu thật trong phân tích bảo hiểm và phân tích D02

| Dữ liệu phân tích bảo hiểm tháng **05/2015** và truy lĩnh cho tháng **03/2015 , 04/2015** |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| **Ins_ProfileInsuranceMonthly** |  |  |  |  |  |
| NV | MonthYear | MonthYearEffect | InsuranceSalary | IsPayBack |  |
| 001 | 05/2015 | 04/2015 | 500,000.00 | TRUE | Điều Chỉnh |
| 001 | 05/2015 | 03/2015 | 500,000.00 | TRUE | Điều Chỉnh |
| 001 | 05/2015 | 05/2015 | 3,000,000.00 | FALSE | PT BH |
| Tháng **05/2015** : nhận tổng số lương là 4,000,000 (bao gồm 500,000 điều chỉnh cho tháng **03/2015** và 500,000 điều chỉnh cho tháng **04/2015**) |  |  |  |  |  |
| Dữ liệu D02 tháng **05/2015** và điều chỉnh D02 cho tháng **03/2015 , 04/2015** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| **Ins_ReportD02Item** |  |  |  |  |  |  |
| NV | FromMonth | ToMonth | Salary | Status | IsPayBack |  |
| 001 | 04/2015 | 04/2015 | 500,000.00 | Truy tăng | TRUE | Điều Chỉnh |
| 001 | 03/2015 | 03/2015 | 500,000.00 | Truy tăng | TRUE | Điều Chỉnh |
| 001 | 05/2015 | 05/2015 | 3,000,000.00 | tăng lao động | FALSE | PT D02 |

- **\
  Biểu đồ lớp cho điều chỉnh bảo hiểm :**

![](Ins_TaiLieuBaoHiem_01_image39.png)

- **\
  Biểu đồ hoạt động cho điều chỉnh bảo hiểm :**

![](Ins_TaiLieuBaoHiem_01_image40.png)

###  Kiểm tra nghỉ \>= 14 ngày trong phân tích bảo hiểm

- Duyệt từ ngày của tháng kiểm tra (đầu tháng đến cuối tháng)

- Nếu nghỉ việc trong tháng kiểm tra , tính các ngày (sau ngày nghỉ
  việc) đến cuối tháng (ngoại trừ ngày nghỉ lễ)

- Nguoc lại nếu có ca thì kiểm tra 1 số trường hợp

  - Leaveday (thuộc loại ngày nghỉ BHXH trả)

  - Workday (không đăng ký nghỉ leaveday ,ko phải ngày nghỉ lễ,intime1
    và outtime1 là null)

  - Record

> ![](Ins_TaiLieuBaoHiem_01_image41.png)

###  Kiểm tra nghỉ Thai Sản trong phân tích bảo hiểm

- Đk nghỉ thai sản : những ngày nghỉ(att_leaveday) thuộc loại ngày nghỉ
  (có **InsuranceType** là **E_PREGNANCY_SUCKLE**) và đã approved trong
  khoảng thời gian chu kỳ bảo hiểm(16-\>15 tháng \[N\])

- Kiểm tra nv có nghỉ thai sản trong tháng kiểm tra (nằm trong chu kỳ
  bảo hiểm)

  - Ngày kết thúc thai sản nằm trong chu kỳ bảo hiểm tháng kiểm tra =\>
    không tính nghỉ thai sản

  - Kiểm tra Leaveday hoặc Ins_Record . Nếu nằm trong chu kỳ bảo hiểm
    =\> nghỉ thai sản

- Nếu NV có đóng BHXH 6 tháng trong 12 tháng liền kề (so với tháng kiểm
  tra)

  - Có : Nghỉ Thai Sản

  - Không: nghỉ \>=14 ngày

![](Ins_TaiLieuBaoHiem_01_image42.png)

![](Ins_TaiLieuBaoHiem_01_image43.png)

###  BC Chưa Có BHXH,BHYT (\[TK01-TS\] , \[TK02-TS\])

- Lấy danh sách nhân viên

- Mẫu TK01-TS : Tờ khai lần đầu tham gia BHXH,BHYT

> ![](Ins_TaiLieuBaoHiem_01_image8.png)

- Mẫu KT2-TS : Tờ khai thay đổi thông tin tham gia BHXH,BHYT

> ![](Ins_TaiLieuBaoHiem_01_image9.png)

###  BC D02

![](Ins_TaiLieuBaoHiem_01_image44.png)

- Bổ sung -- tách riêng các trạng thái nghỉ 14 ngày ( Không lương, nghỉ
  ốm, nghỉ 14 ngày ) của báo cáo D02V2:

| Các trạng thái nghi 14 ngày theo 3 trang thái (nghỉ ốm, nghỉ không lương, nghỉ 14 ngày) |  |
| --- | --- |
| trạng thái D02 V2 | Diễn giải |
| E_GIAM_LEAVE_SICK_AFTER_UNPAID | Nghỉ ốm sau khi nghỉ không lương |
| E_GIAM_14DAY_AFTER_UNPAID | Nghỉ \>= 14 ngày sau khi nghỉ không lương |
| E_GIAM_QUIT_AFTER_UNPAID | Nghỉ việc sau khi nghỉ không lương |
| E_GIAM_QUIT_AFTER_SICK | Nghỉ việc sau khi nghỉ ốm |
| E_GIAM_UNPAID_AFTER_SICK | Nghỉ không lương sau khi nghỉ ốm |
| E_GIAM_14DAY_AFTER_SICK | Nghỉ \>= 14 ngày sau khi nghỉ ốm |
| E_GIAM_SICK_AFTER_PREGNANT | Nghỉ ốm sau khi sinh con |
| E_GIAM_UNPAID_AFTER_PREGNANT | Nghỉ không lương sau khi sinh con |
| E_GIAM_UNPAID_AFTER_14DAY | Nghỉ không lương sau khi nghỉ \>= 14 ngày |
| E_GIAM_SICK_AFTER_14DAY | Nghỉ ốm sau khi nghỉ \>= 14 ngày |

- **Bổ sung trạng thái tiền lương cũ và tiền lương mới.**

| **Trạng thái D02 tăng** | **Diễn giải**     **Lương cũ         **Lương mới |
| --- | --- |
| OldBasicSalary** | NewBasicSalary** |
| E_TANG_LUONG_CHANGEJOBNAME | Tăng lương và     N-1                N |
                                 thay đổi theo                        
                                 chức danh nghề.                      

| E_TANG_LD | Tăng lao động.    0                  N |
| E_TANG_BENH | Tăng sao bệnh     0                  N |
| E_TANG_LEAVE_14WORKINGDAYS | Tăng do nghỉ \>=  0                  N |
                                 14 ngày.                             

| E_TANG_BHTN_SPLIT | Tham gia BHTN     0                  N |
                                 (tách khi tăng                       
                                 lao động)                            

| E_TANG_TS | Tăng sao thai sản 0                  N |
| E_TANG_BHTN_TANGLUONG_SPLIT | Tăng lương thì    0                  N |
                                 tăng lương BHXH                      

| E_TANG_LD_CHANGE_INSPLACE | Tăng lao động     N                  N |
                                 chuyển nơi đóng                      
                                 bảo hiểm.                            

| E_TANG_LD_CHANGE_LEGALENTITY | Tăng LĐ do thay   N                  N |
                                 đổi pháp nhân                        

| E_TANG_BHTN_GIAMLUONG_SPLIT | Tăng BHTN nhưng   0                  N-1 |
                                 giảm lương                           

| E_TANG_BHTN_GIAMLD_SPLIT | Tăng BHTN giảm    N-1                N-1 |
                                 lao động.                            

| E_TANG_BHYT | Tăng BHYT         N-1                N |
| E_CHANGEJOBNAME | Thay đổi chức     N-1                N |
                                 danh nghề                            

| E_TANG_BHTN | Tăng BHTN         N-1                N |
| --- | --- |
| **Trạng thái D02 giảm** | **Diễn giải**      **Lương cũ         **Lương mới |
| --- | --- |
| OldBasicSalary** | NewBasicSalary** |
| E_GIAM_LUONG_CHANGEJOBNAME | Giảm lương thay    N-1                N |
                                 đổi chức danh                         
                                 nghề.                                 

| E_GIAM_LEAVE_14WORKINGDAYS | Giảm do nghỉ \>=   N-1                N-1 |
                                 14 ngày.                              

| E_GIAM_BHYT | Giảm BHYT.         N-1                N |
| E_GIAM_BHTN | Giảm BHTN          N-1                N |
| E_GIAM_LD | Giảm lao động.     N-1                N-1 |
| E_GIAM_TS | Giảm thai sản      N-1                N-1 |
| E_GIAM_TS_QUIT | Nghỉ việc sao khi  N-1                N-1 |
                                 nghỉ sinh con                         

| E_GIAM_LD_NOT_BHYT | Giảm lao động      N-1                N-1 |
                                 không trả thẻ BHYT                    

| E_GIAM_QUIT_SUSPENSE | Giảm do tạm hoãn.  N-1                N-1 |
| E_GIAM_LD_BHYT | Giảm bảo hiểm trả  N-1                N-1 |
                                 thẻ kịp thời                          

| E_GIAM_LD_BHYT_KOKIPTHOI | Giảm lao động trả  N-1                N-1 |
                                 thẻ không kịp thời                    

| E_GIAM_LD_CHANGE_INSPLACE | Giảm lao động do   N-1                N-1 |
                                 đổi nơi đóng BH                       

| E_GIAM_LD_CHANGE_LEGALENTITY | Giảm LĐ do thay    N-1                N-1 |
                                 đổi pháp nhân                         

| E_CHANGEJOBNAME | Thay đổi chức danh N-1                N |
| nghề |

### BC D02 VNPT

#### Cách lấy dữ liệu của báo cáo D02 VNPT

| **D02 VNPT** |  |  |
| --- | --- | --- |
| Mã | Tên | Cách lấy dữ liệu |
| [VNPTD02V2Colume0]{.mark} |  | Stt |
| [VNPTD02V2Colume1]{.mark} | Tên NV | ProfileName |
| [VNPTD02V2Colume2]{.mark} | Số sổ BH | Profile.[SocialInsNo]{.mark} |
| [VNPTD02V2Colume3]{.mark} | Ngày sinh | Profile.[DateOfBirth]{.mark} |
| [VNPTD02V2Colume4]{.mark} | Giới Tính | Profile.Gender |
| [VNPTD02V2Colume5]{.mark} | Chức danh , chức vụ | Ins_ReportD02ItemV2.JobName |
| [VNPTD02V2Colume6]{.mark} | Số thẻ BHYT | Hre_HealthInsuranceCard.HealthInsNo |
| [VNPTD02V2Colume7]{.mark} | Mức lương đầu kỳ | Nếu Ins_ReportD02ItemV2.Type = E_TANG AND Ins_ReportD02ItemV2.Status = E_TANG_LD 🡺 Null Ngược lại là Ins_ReportD02ItemV2.OldBasicSalary |
| [VNPTD02V2Colume8]{.mark} | Mức lương cuối kỳ | Nếu (Ins_ReportD02ItemV2.Type = E_TANG AND Ins_ReportD02ItemV2.Status = E_TANG_LD) **hoặc** Ins_ReportD02ItemV2.Type = (E_TANG_LUONG OR E_GIAM_LUONG) 🡺 Ins_ReportD02ItemV2.NewBasicSalary Ngược lại 🡺 Null |
| [VNPTD02V2Colume9]{.mark} |  | INS_REPORTD02ITEMV2.Allowance1 + INS_REPORTD02ITEMV2.Allowance2 + INS_REPORTD02ITEMV2.Allowance3 + INS_REPORTD02ITEMV2.Allowance4 + INS_REPORTD02ITEMV2.[AllowanceAdditional]{.mark} |
| [VNPTD02V2Colume10]{.mark} |  | INS_REPORTD02ITEMV2.Allowance1 |
| [VNPTD02V2Colume11]{.mark} |  | INS_REPORTD02ITEMV2.Allowance2 |
| [VNPTD02V2Colume12]{.mark} |  | INS_REPORTD02ITEMV2.Allowance3 |
| [VNPTD02V2Colume13]{.mark} | Các khoản bổ sung | INS_REPORTD02ITEMV2.[AllowanceAdditional]{.mark} |
| [VNPTD02V2Colume14]{.mark} | Từ tháng/năm | **Nếu** (Ins_ReportD02ItemV2.Status = E_DieuChinhGiam **OR** Ins_ReportD02ItemV2. Status = E_DieuChinhTang) **AND** IsPayBacks=1 🡺 Ins_ReportD02ItemV2.DateStart **Ngược lại: 🡺** Ins_ReportD02ItemV2.MonthFrom |
| [VNPTD02V2Colume15]{.mark} | Ghi chú | **Nếu** Ins_ReportD02ItemV2.Status = E_TANG_LD **OR** Ins_ReportD02ItemV2.Status = E_GIAM_TS **🡺** Ins_ReportD02ItemV2.MonthFrom **Ngược lại 🡺** null |
| VNPTD02V2Colume16 | Trả thẻ | B1: Lấy ra dòng dữ liệu trong bảng Hre_HealthInsuranceCard thỏa: Hre_HealthInsuranceCard.HealthInsIssueDate \<= Ins_ReportD02ItemV2.MonthTo && Hre_HealthInsuranceCard.HealthInsIssueDate lớn nhất B2: Nếu Hre_HealthInsuranceCard.ReceiveHealthIns=1 🡺 "X" Ngược lại 🡺 Null |
| [VNPTD02V2Colume17]{.mark} | Ngày trả thẻ | B1: Lấy ra dòng dữ liệu trong bảng Hre_HealthInsuranceCard thỏa: Hre_HealthInsuranceCard.HealthInsIssueDate \<= Ins_ReportD02ItemV2.MonthTo && Hre_HealthInsuranceCard.HealthInsIssueDate lớn nhất B2: Nếu Hre_HealthInsuranceCard.ReceiveHealthIns=1 🡺 Hre_HealthInsuranceCard.ReceiveHealthInsDate Ngược lại 🡺 Null |
| [VNPTD02V2Colume18]{.mark} | Tỉ lệ đóng | Ins_ReportD02ItemV2.RateSocialIns + Ins_ReportD02ItemV2.RateHealthIns + Ins_ReportD02ItemV2.RateUnEmpIns |
| [VNPTD02V2Colume]{.mark}19 | Ngày Sinh | Nếu Hre_Profile.DayOfBirth = null or Hre_Profile.MonthOfBirth = null 🡺 Hre_Profile.YearOfBirth Ngược lại 🡺 Hre_Profile.DateOfBirth |
| [VNPTD02V2Colume20]{.mark} | Chỉ có năm sinh | Nếu Hre_Profile.DayOfBirth = null or Hre_Profile.MonthOfBirth = null 🡺 "X" |
| [VNPTD02V2Colume2]{.mark}1 | Giới tính | Nếu Hre_Profile.Gender = E_MALE 🡺 1 Nếu Hre_Profile.Gender = E_FEMALE 🡺 0 Ngược lại 🡺 Null |
| [VNPTD02V2Colume2]{.mark}2 | Mã quốc tịch | Hre_Profile.[NationalityID]{.mark} =\>Cat_Country.Code |
| [VNPTD02V2Colume2]{.mark}3 | Mã Dân Tộc | Hre_Profile.EthnicID=\> Cat_EthnicGroup.Code |
| [VNPTD02V2Colume2]{.mark}4 | Mã Tỉnh bệnh viện | B1: Lấy ra dòng dữ liệu trong bảng Hre_HealthInsuranceCard thỏa: Hre_HealthInsuranceCard.HealthInsIssueDate \<= Ins_ReportD02ItemV2.MonthTo && Hre_HealthInsuranceCard.HealthInsIssueDate lớn nhất B2: Lấy Hre_HealthInsuranceCard[.ProvinceHospital]{.mark} của dòng dữ liệu tìm được ở B1 |
| [VNPTD02V2Colume2]{.mark}5 | Mã bệnh viện | B1: Lấy ra dòng dữ liệu trong bảng Hre_HealthInsuranceCard thỏa: Hre_HealthInsuranceCard.HealthInsIssueDate \<= Ins_ReportD02ItemV2.MonthTo && Hre_HealthInsuranceCard.HealthInsIssueDate lớn nhất B2: Lấy Hre_HealthInsuranceCard.[HealthTreatmentPlaceCode]{.mark} của dòng dữ liệu tìm được ở B1 |
| [VNPTD02V2Colume2]{.mark}6 | Mã Tỉnh Nơi Sinh | [Hre_Profile.PProvinceID =\> Cat_Province]{.mark}.Code |
| [VNPTD02V2Colume2]{.mark}7 | Mã Huyện Nơi Sinh | [Hre_Profile.PDistrictID =\> Cat_District]{.mark}.Code |
| [VNPTD02V2Colume]{.mark}28 | Mã Xã Nơi Sinh | [Hre_Profile. VillageID =\> Cat_Village]{.mark}.Code |
| [VNPTD02V2Colume]{.mark}29 | CMND | Hre_Profile.IDNo |
| [VNPTD02V2Colume3]{.mark}0 | Ngày cấp CMND | Hre_Profile.[IDDateOfIssue]{.mark} |
| [VNPTD02V2Colume3]{.mark}1 | Mã Tĩnh Cấp | Hre_Profile.[IDPlaceOfIssue]{.mark} |
| [VNPTD02V2Colume3]{.mark}2 | Số nhà thường trú | Hre_Profile.[PAddress]{.mark} |
| [VNPTD02V2Colume3]{.mark}3 | Mã xã thường trú | [Hre_Profile.VillageID =\> Cat_Village]{.mark}.Code |
| [VNPTD02V2Colume3]{.mark}4 | Mã quận thường trú | [Hre_Profile.PDistrictID =\> Cat_District]{.mark}.Code |
| [VNPTD02V2Colume3]{.mark}5 | Mã tỉnh thường trú | [Hre_Profile.PProvinceID =\> Cat_Province]{.mark}.Code |
| [VNPTD02V2Colume3]{.mark}6 | Số nhà tạm trú | Hre_Profile.[TAddress]{.mark} |
| [VNPTD02V2Colume3]{.mark}7 | Mã phường tạm trú | [Hre_Profile.TVillageID =\> Cat_Village]{.mark}.Code |
| [VNPTD02V2Colume]{.mark}38 | Mã Quận tạm trú | [Hre_Profile.TDistrictID =\> Cat_District]{.mark}.Code |
| [VNPTD02V2Colume]{.mark}39 | Mã tỉnh tạm trú | [Hre_Profile.TProvinceID =\> Cat_Province]{.mark}.Code |
| [VNPTD02V2Colume]{.mark}40 | Mã Phương Án | Ins_ReportD02ItemV2.Status =\> Ins_TypeD02.DisplayCode **Where Ins_ReportD02ItemV2.Status = Ins_TypeD02.CommentCode** |
| [VNPTD02V2Colume4]{.mark}1 | Tên Phương Án | Ins_ReportD02ItemV2.Status =\> Ins_TypeD02.DisplayName **Where Ins_ReportD02ItemV2.Status = Ins_TypeD02.CommentCode** |
| [VNPTD02V2Colume42]{.mark} | Loại Bảo hiểm | Ins_ReportD02ItemV2.Type |
| [VNPTD02V2Colume43]{.mark} | Họ tên chủ hộ | Hre_ProfileMoreInfo.HouseholderFullName |
| [VNPTD02V2Colume44]{.mark} | Số điện thoại | Hre_ProfileMoreInfo.Telephone |
| [VNPTD02V2Colume45]{.mark} | Ngày sinh chủ hộ | Hre_ProfileMoreInfo.HouseHoldDateOfBirth |
| [VNPTD02V2Colume46]{.mark} | Mã hộ gia đình | Hre_ProfileMoreInfo.HouseHoldCode |
| [VNPTD02V2Colume47]{.mark} | Sổ hộ khẩu | Hre_ProfileMoreInfo.HouseholdBookNo |
| [VNPTD02V2Colume48]{.mark} | Loại giấy tờ | Hre_ProfileMoreInfo.PapersType |
| [VNPTD02V2Colume49]{.mark} | Quan hệ với chủ hộ | Hre_ProfileMoreInfo.HouseHolderRelativeTypeID Cat_RelativeType.RelativeTypeName |
| [VNPTD02V2Column50]{.mark} | Dân tộc | Hre_Profile.EthnicID =\> Cat_EthnicGroup.EthnicGroupName |
| [VNPTD02V2Column51]{.mark} | Mã Nhân Viên | Hre_Profile.CodeEmp |
| [VNPTD02V2Column52]{.mark} | Ngày hiệu lực hợp đồng(nếu không có phụ lục hợp đồng thì sẽ lấy số hợp đồng) | Hre_Contract.DateStart |
| [VNPTD02V2Column53]{.mark} | Mã hợp đồng | Hre_Contract.Code |
| [VNPTD02V2Column54]{.mark} | Nơi làm việc theo danh sách khối | Cat_UnitStructure.UnitName |
| [VNPTD02V2Column55]{.mark} | CellGroup | Hre_Profile.BloodType |
| [VNPTD02V2Column56]{.mark} | Tên quận/huyện khai sinh | Cat_District.DistrictName |
| [VNPTD02V2Column57]{.mark} | Tên phường/xã khai sinh | Cat_Village.VillageName |
| [VNPTD02V2Column58]{.mark} | Tên tỉnh/thành địa chỉ liên hệ | Cat_Province.ProvinceName |
| [VNPTD02V2Column59]{.mark} | Tên quận/huyện liên hệ | Cat_District.DistrictName |
| [VNPTD02V2Column60]{.mark} | Tên phường/xã liên hệ | Cat_Village.VillageName |
| [VNPTD02V2Column61]{.mark} | Số điện thoại của NV | Hre_Profile.CellPhone |

#### Nghiệp vụ phân tích đợt báo cáo D02 V2

- So sánh 2 đợt kề cận, nếu đợt trước không có dữ liệu sẽ so với đợt
  trước nửa.

![](Ins_TaiLieuBaoHiem_01_image45.png)

### Mẫu EBHXH

#### Mẫu EBHXH Tăng

| Mẫu EBHXH Tăng |  |  |
| --- | --- | --- |
| Mã | Tên | Cách lấy dữ liệu |
| eBHXHD02TSTangCol0 | Stt | Stt |
| eBHXHD02TSTangCol1 | Họ và tên | Profile.ProfileName |
| eBHXHD02TSTangCol2 | Số định danh | Profile.SocialInsNo |
| eBHXHD02TSTangCol3 | Ngày sinh | Profile.DateOfBirth |
| eBHXHD02TSTangCol4 | Nữ(X) | Profile.Gender |
| eBHXHD02TSTangCol5 | Cấp bật, chức vụ, chức danh nghề | InsuranceMonthly.JobName |
| eBHXHD02TSTangCol6 | Tiền đồng | D02Item.NewBasicSalary |
| eBHXHD02TSTangCol7 | Hệ số | DBNull.Value |
| eBHXHD02TSTangCol8 | CV | D02Item.Allowance1 |
| eBHXHD02TSTangCol9 | TNVK | D02Item.Allowance2 |
| eBHXHD02TSTangCol10 | TN Nghề | D02Item.Allowance3 |
| eBHXHD02TSTangCol11 | Khác | D02Item.AllowanceAdditional |
| eBHXHD02TSTangCol12 | Hiệu lực HD/QD Từ ngày | Ins_ReportD02item.DateStart |
| eBHXHD02TSTangCol13 | Hiệu lực HD/QD Đến ngày | Ins_ReportD02item.DateEnd |
| eBHXHD02TSTangCol14 | Loại tăng | D02Item.Status |
| eBHXHD02TSTangCol15 | Số HD/QD tăng | Ins_ReportD02item.DecisionNo |
| eBHXHD02TSTangCol16 | Loại HD | insReportD02Item.DecisionType |
| eBHXHD02TSTangCol17 | Ngày ký HD | Ins_ReportD02item.DecisionDatesigned |
| eBHXHD02TSTangCol18 | Tỉ lệ đóng | 32.5 |
| eBHXHD02TSTangCol19 | Đối tượng | "1" |
| eBHXHD02TSTangCol20 | Tình trạng sổ BHXH | Ins_ReportD02Item.Hre_Profile.SocialInsNo |
| eBHXHD02TSTangCol21 | Đóng BHXH cả tháng | "X" |
| eBHXHD02TSTangCol22 | Mã Tỉnh | Ins_ReportD02Item.Hre_Profile =\> Hre_HealthInsuranceCard.ProvinceHospital |
| eBHXHD02TSTangCol23 | Mã Bệnh viện | Profile.[HealthTreatmentPlaceCode]{.mark} |
| eBHXHD02TSTangCol24 | Mã Quốc Tịch | Hre_Profile.NationalityID =\> Cat_Country.Code |
| eBHXHD02TSTangCol25 | Tên dân tộc | Hre_Profile.EthnicID =\> Cat_EthnicGroup.EthnicGroupName |
| eBHXHD02TSTangCol26 | Số CMND | Hre_Profile.IDNo hoặc Hre_Profile.PassportNo |
| eBHXHD02TSTangCol27 | Ngày cấp | Ins_ReportD02Item.Hre_Profile.IDDateOfIssue |
| eBHXHD02TSTangCol28 | Mã tỉnh cấp | Cat_Province.PProvinceID =\> PlaceOfIssueIDCode |
| eBHXHD02TSTangCol29 | Tên Xã/Phường thường trú | pVillageName =\> Cat_Village.VillageName |
| eBHXHD02TSTangCol30 | Tên Quận/Huyện thường trú | pDistrictName =\> Cat_District. DistrictName |
| eBHXHD02TSTangCol31 | Tên Tỉnh/TP thường trú | pProvinceName =\> Cat_Province.ProvinceName |
| eBHXHD02TSTangCol32 | Số Nhà (địa chỉ thường trú) | Profile.PAddress |
| eBHXHD02TSTangCol33 | Mã Phường/Xã thường trú | pVillageCode |
| eBHXHD02TSTangCol34 | Mã Quận/Huyện thường trú | pDistrictCode |
| eBHXHD02TSTangCol35 | Mã Tĩnh/TP thường trú | pProvinceCode |
| eBHXHD02TSTangCol36 | Số Nhà (địa chỉ tạm trú) | TAddress |
| eBHXHD02TSTangCol37 | Mã Phường/Xã tạm trú | tVillageCode |
| eBHXHD02TSTangCol38 | Mã Quận/Huyện tạm trú | tDistrictCode |
| eBHXHD02TSTangCol39 | Mã Tỉnh/TP tạm trú | tProvinceCode |
| eBHXHD02TSTangCol40 | Số ĐT | Profile.HomePhone |
| eBHXHD02TSTangCol41 | Email | Profile.Email |
| eBHXHD02TSTangCol42 | Cha/Me | DBNull.Value |
| eBHXHD02TSTangCol43 | Thân Nhân Khác | DBNull.Value |
| eBHXHD02TSTangCol44 | Mã nhân viên | Profile.CodeEmp |
| eBHXHD02TSTangCol45 | Số tài khoản | Sal_SalaryInformation.AccountNo |
| eBHXHD02TSTangCol46 | Ngân hàng | Cat_Bank.BankName.BankName |
| eBHXHD02TSTangCol47 | Chi nhánh ngân hàng | Sal_SalaryInformation.BankBrandName |
| eBHXHD02TSTangCol48 | Lương BHXH | Ins_ReportD02Item.InsuranceSalary |
| eBHXHD02TSTangCol49 | Phòng ban E_BRANCH | Cat_OrgUnit.E_BRANCH (nếu không có dữ liệu sẽ lấy Cat_Orgstructure.OrgStructureName) |
| eBHXHD02TSTangCol50 | Nơi cấp bảo hiểm xã hội | Hre_Profile.SocialInsIssuePlace |
| eBHXHD02TSTangCol51 | Nơi ĐK khám bệnh | Hre_Profile.HealthTreatmentPlace |
| eBHXHD02TSTangCol52 | Mã ngân hàng | Sal_SalaryInformation.BankID =\> Cat_Bank.BankCode |
| eBHXHD02TSTangCol53 | Mã chi nhánh ngân hàng của nhân viên | Sal_SalaryInformation.BranchID =\> Cat_Branch.BranchCode |
| eBHXHD02TSTangCol54 | Tên Quốc Tịch | Hre_Profile.Cat_Country =\> Cat_Country.nationallityName |
| eBHXHD02TSTangCol55 | Tên Phường/Xã tạm trú | tVillageName =\> Cat_Village.VillageName |
| eBHXHD02TSTangCol56 | Tên Quận/Huyện tạm trú | tDistrictName =\> Cat_District.DistrictName |
| eBHXHD02TSTangCol57 | Tên Tỉnh/TP tạm trú | pProvinceName =\> Cat_Province.ProvinceName |
| eBHXHD02TSTangCol58 | Mã Tỉnh/TP của chứng minh thư | Hre_Profile.IDNoProvinceID =\> Cat_Province.Code |
| eBHXHD02TSTangCol59 | Tên Tỉnh/TP của chứng minh thư | Hre_Profile.IDNoProvinceID =\> Cat_Province.ProvinceName |
| eBHXHD02TSTangCol60 | Mã Quận/Huyện của chứng minh thư | Hre_Profile.IDNoDistrictID =\> Cat_District.Code |
| eBHXHD02TSTangCol61 | Tên Quận/Huyện của chứng minh thư | Hre_Profile.IDNoDistrictID =\> Cat_District.DistrictName |
| eBHXHD02TSTangCol62 | Mã Xã/Phường của chứng minh thư | Hre_Profile.IDNoAVillageID =\> Cat_Village.Code |
| eBHXHD02TSTangCol63 | Tên Xã/Phường của chứng minh thư | Hre_Profile.IDNoAVillageID =\> Cat_Village.VillageName |
| eBHXHD02TSTangCol64 | Họ tên chủ hộ | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseholderFullName |
| eBHXHD02TSTangCol65 | Số điện thoại của chủ hộ | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.Telephone |
| eBHXHD02TSTangCol66 | Số sổ hộ khẩu/ Số sổ tạm trú | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseholdBookNo |
| eBHXHD02TSTangCol67 | Loại giấy tờ | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.PapersType |
| eBHXHD02TSTangCol68 | Tên tỉnh thành của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.ProvinceName |
| eBHXHD02TSTangCol69 | Mã Tỉnh thành của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.Code |
| eBHXHD02TSTangCol70 | Tên quận huyện của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.DistrictName |
| eBHXHD02TSTangCol71 | Mã quận huyện của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.Code |
| eBHXHD02TSTangCol72 | Tên phường xã của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.VillageName |
| eBHXHD02TSTangCol73 | Mã phường xã của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.Code |
| eBHXHD02TSTangCol74 | Tỉnh thành | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseHoldCode |
| eBHXHD02TSTangCol75 | Quận huyện | Ins_ReportD02Item.RegionID.Code |
| eBHXHD02TSTangCol76 | Phường xã | Ins_ReportD02Item.RegionID.RegionName |
| eBHXHD02TSTangCol77 | Mã dân tộc | Ins_ReportD02Item.ProfileID.EthnicID.Code |
| eBHXHD02TSTangCol78 | Hình thức báo tăng lao động | Ins_ReportD02Item.StatusName |
| eBHXHD02TSTangCol79 | Ghi chú | Ins_TypeD02.DisplayName |
| eBHXHD02TSTangCol80 | Số sổ BHXH | Hre_Profile.SocialInsNo |
| eBHXHD02TSTangCol81 | Mức lương cũ | Ins_ReportD02Item.OldBasicSalary |
| eBHXHD02TSTangCol82 | Mức lương mới | Ins_ReportD02Item.NewBasicSalary |

#### Mẫu EBHXH Giảm

| Mẫu EBHXH Giảm |  |  |
| --- | --- | --- |
| Mã | Tên | Cách lấy dữ liệu |
| eBHXHD02TSGiamCol0 | Stt | Stt |
| eBHXHD02TSGiamCol1 | Họ Và Tên | Profile.ProfileName |
| eBHXHD02TSGiamCol2 | Số Định Danh | Profile.SocialInsNo |
| eBHXHD02TSGiamCol3 | Ngày Sinh | Profile.DateOfBirth |
| eBHXHD02TSGiamCol4 | Nữ(X) | Profile.Gender |
| eBHXHD02TSGiamCol5 | Cấp Bật ,Chức Vụ , Chức Danh Nghề | InsuranceMonthly.JobName |
| eBHXHD02TSGiamCol6 | Tiền Đồng | D02Item.NewBasicSalary |
| eBHXHD02TSGiamCol7 | Hệ Sô | DBNull.Value |
| eBHXHD02TSGiamCol8 | CV | D02Item.Allowance1 |
| eBHXHD02TSGiamCol9 | TNVK | D02Item.Allowance2 |
| eBHXHD02TSGiamCol10 | TN Nghề | D02Item.Allowance3 |
| eBHXHD02TSGiamCol11 | Khác | D02Item.AllowanceAdditional |
| eBHXHD02TSGiamCol12 | Hiệu Lực HĐ/QĐ Từ Ngày | Ins_ReportD02item.DateStart |
| eBHXHD02TSGiamCol13 | Hiệu Lực HĐ/QĐ Đến Ngày | Ins_ReportD02item.DateEnd |
| eBHXHD02TSGiamCol14 | Loại Giảm | D02Item.Status |
| eBHXHD02TSGiamCol15 | Số HĐ/QĐ Giảm | insReportD02ItemV2.DecisionNo |
| eBHXHD02TSGiamCol16 | Ngày Quyết | dateDecision |
| eBHXHD02TSGiamCol17 | Tỉ Lệ Đóng | 32.5 |
| eBHXHD02TSGiamCol18 | Đã Báo Giảm | DBNull.Value |
| eBHXHD02TSGiamCol19 | Giảm |  |
| eBHXHD02TSGiamCol20 | Không Trả Thẻ BHYT | "1" |
| eBHXHD02TSGiamCol21 | Mã Thẻ BHYT | DBNull.Value |
| eBHXHD02TSGiamCol22 | Ngày Trả Thẻ | Hre_Profile.ReceiveHealthInsDate |
| eBHXHD02TSGiamCol23 | Từ | DBNull.Value |
| eBHXHD02TSGiamCol24 | Đến | DBNull.Value |
| eBHXHD02TSGiamCol25 | Thời Gian Thai Sản | DBNull.Value |
| eBHXHD02TSGiamCol26 | Mã nhân viên | Profile.CodeEmp |
| eBHXHD02TSGiamCol27 | Số tài khoản | Sal_SalaryInformation.AccountNo |
| eBHXHD02TSGiamCol28 | Ngân hàng | Cat_Bank.BankName |
| eBHXHD02TSGiamCol29 | Chi nhánh ngân hàng | Sal_SalaryInformation.BankBrandName |
| eBHXHD02TSGiamCol30 | Lương BHXH | insReportD02Item.InsuranceSalary |
| eBHXHD02TSGiamCol31 | Phòng ban E_BRANCH | orgUnit_E_Brach |
| eBHXHD02TSGiamCol32 | Nơi cấp bảo hiểm xã hội | Hre_Profile.SocialInsIssuePlace |
| eBHXHD02TSGiamCol33 | Nơi ĐK khám bệnh | Hre_Profile.HealthTreatmentPlace |
| eBHXHD02TSGiamCol34 | Quốc tịch nhân viên | Hre_Profile.NationalityID =\> Cat_Country.CountryName |
| eBHXHD02TSGiamCol35 | Tên tỉnh thành của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.ProvinceName |
| eBHXHD02TSGiamCol36 | Mã tỉnh thành của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.Code |
| eBHXHD02TSGiamCol37 | Tên quận huyện của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.DistrictName |
| eBHXHD02TSGiamCol38 | Mã quận huyện của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.Code |
| eBHXHD02TSGiamCol39 | Tên phường xã của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.VillageName |
| eBHXHD02TSGiamCol40 | Mã phường xã của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.Code |
| eBHXHD02TSGiamCol41 | Mã hộ gia đình | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseHoldCode |
| eBHXHD02TSGiamCol42 | Mã vùng miền | Ins_ReportD02Item.RegionID.Code |
| eBHXHD02TSGiamCol43 | Tên vùng miền | Ins_ReportD02Item.RegionID.RegionName |
| eBHXHD02TSGiamCol44 | Mã dân tộc | Ins_ReportD02Item.ProfileID.EthnicID.Code |
| eBHXHD02TSGiamCol45 | Tháng năm | dtMonthYear truyền từ view(kendoDateTimePicker) vào controller(function SearchiBHXHTangD02TS). |
| eBHXHD02TSGiamCol46 | Hình thức báo giảm lao động | Ins_ReportD02Item.StatusName |
| eBHXHD02TSGiamCol47 | Ghi chú | Ins_ReportD02Item.DisplayName |
| eBHXHD02TSGiamCol48 | Số sổ BHXH | Hre_Profile.SocialInsNo |
| eBHXHD02TSGiamCol49 | Mã phương án | Ins_TypeD02.StatusCode |
| eBHXHD02TSGiamCol50 | Điều chỉnh mức đóng BH | Ins_ReportD02Item.OldBasicSalary |
| eBHXHD02TSGiamCol51 | Từ ngày | dateFrom |
| eBHXHD02TSGiamCol52 | Đến ngày | dateTo |

#### Mẫu EBHXH Điều chỉnh

| Mẫu EBHXH Điều chỉnh |  |  |
| --- | --- | --- |
| Mã | Tên | Cách lấy dữ liệu |
| eBHXHD02TSDieuChinhCol0 | Stt | Stt |
| eBHXHD02TSDieuChinhCol1 | Họ Và Tên | Profile.ProfileName |
| eBHXHD02TSDieuChinhCol2 | Số Định Danh | Profile.SocialInsNo |
| eBHXHD02TSDieuChinhCol3 | Ngày Sinh | Profile.DateOfBirth |
| eBHXHD02TSDieuChinhCol4 | Nữ(X) | Profile.Gender |
| eBHXHD02TSDieuChinhCol5 | Cấp Bật ,Chức Vụ , Chức Danh Nghề | InsuranceMonthly.JobName |
| eBHXHD02TSDieuChinhCol6 | Tiền Đồng | D02Item.NewBasicSalary |
| eBHXHD02TSDieuChinhCol7 | Hệ Sô | DBNull.Value |
| eBHXHD02TSDieuChinhCol8 | CV | D02Item.Allowance1 |
| eBHXHD02TSDieuChinhCol9 | TNVK | D02Item.Allowance2 |
| eBHXHD02TSDieuChinhCol10 | TN Nghề | D02Item.Allowance3 |
| eBHXHD02TSDieuChinhCol11 | Khác | D02Item.AllowanceAdditional |
| eBHXHD02TSDieuChinhCol12 | Hiệu Lực HĐ/QĐ Từ Ngày | Ins_ReportD02item.DateStart |
| eBHXHD02TSDieuChinhCol13 | Hiệu Lực HĐ/QĐ Đến Ngày | Ins_ReportD02item.DateEnd |
| eBHXHD02TSDieuChinhCol14 | Loại Tăng | D02Item.Status |
| eBHXHD02TSDieuChinhCol15 | Số HĐ/QĐ Tăng | Ins_ReportD02item.DecisionNo |
| eBHXHD02TSDieuChinhCol16 | Loại HĐ | insReportD02Item.DecisionType |
| eBHXHD02TSDieuChinhCol17 | Ngày Kí HĐ | Ins_ReportD02item.DecisionDatesigned |
| eBHXHD02TSDieuChinhCol18 | Tỉ Lệ Đóng | 32.5 |
| eBHXHD02TSDieuChinhCol19 | Đối Tượng | "1" |
| eBHXHD02TSDieuChinhCol20 | Tình Trạng Sổ BHXH | Ins_ReportD02Item.Hre_Profile.SocialInsNo |
| eBHXHD02TSDieuChinhCol21 | Đóng BHXH Cả Tháng | "X" |
| eBHXHD02TSDieuChinhCol22 | Mã Tĩnh | Ins_ReportD02Item.Hre_Profile =\> Hre_HealthInsuranceCard.ProvinceHospital |
| eBHXHD02TSDieuChinhCol23 | Mã Bệnh Viện | Profile.[HealthTreatmentPlaceCode]{.mark} |
| eBHXHD02TSDieuChinhCol24 | Mã Quốc Tịch | Hre_Profile.NationalityID =\> Cat_Country.Code |
| eBHXHD02TSDieuChinhCol25 | Tên Dân Tộc | Hre_Profile.EthnicID =\> Cat_EthnicGroup.EthnicGroupName |
| eBHXHD02TSDieuChinhCol26 | Số CMND | Hre_Profile.IDNo hoặc Hre_Profile.PassportNo |
| eBHXHD02TSDieuChinhCol27 | Ngày Cấp | Ins_ReportD02Item.Hre_Profile.IDDateOfIssue |
| eBHXHD02TSDieuChinhCol28 | Mã Tĩnh Cấp | Cat_Province.PProvinceID =\> PlaceOfIssueIDCode |
| eBHXHD02TSDieuChinhCol29 | Tên Xã/Phường thường trú | pVillageName =\> Cat_Village.VillageName |
| eBHXHD02TSDieuChinhCol30 | Tên Quận/Huyện thường trú | pDistrictName =\> Cat_District. DistrictName |
| eBHXHD02TSDieuChinhCol31 | Tên Tỉnh/TP thường trú | pProvinceName =\> Cat_Province.ProvinceName |
| eBHXHD02TSDieuChinhCol32 | Số Nhà (địa chỉ thường trú) | Profile.PAddress |
| eBHXHD02TSDieuChinhCol33 | Mã Phường/Xã thường trú | pVillageCode |
| eBHXHD02TSDieuChinhCol34 | Mã Quận/Huyện thường trú | pDistrictCode |
| eBHXHD02TSDieuChinhCol35 | Mã Tĩnh/TP thường trú | pProvinceCode |
| eBHXHD02TSDieuChinhCol36 | Số Nhà (địa chỉ tạm trú) | TAddress |
| eBHXHD02TSDieuChinhCol37 | Mã Phường/Xã tạm trú | tVillageCode |
| eBHXHD02TSDieuChinhCol38 | Mã Quận/Huyện tạm trú | tDistrictCode |
| eBHXHD02TSDieuChinhCol39 | Mã Tỉnh/TP tạm trú | tProvinceCode |
| eBHXHD02TSDieuChinhCol40 | Số ĐT | Profile.HomePhone |
| eBHXHD02TSDieuChinhCol41 | Email | Profile.Email |
| eBHXHD02TSDieuChinhCol42 | Cha/Me | DBNull.Value |
| eBHXHD02TSDieuChinhCol43 | Thân Nhân Khác | DBNull.Value |
| eBHXHD02TSDieuChinhCol44 | Mã nhân viên | Profile.CodeEmp |
| eBHXHD02TSDieuChinhCol45 | Số tài khoản | Sal_SalaryInformation.AccountNo |
| eBHXHD02TSDieuChinhCol46 | Ngân hàng | Cat_Bank.BankName.BankName |
| eBHXHD02TSDieuChinhCol47 | Chi nhánh ngân hàng | Sal_SalaryInformation.BankBrandName |
| eBHXHD02TSDieuChinhCol48 | Lương BHXH | Ins_ReportD02Item.InsuranceSalary |
| eBHXHD02TSDieuChinhCol49 | Phòng ban E_BRANCH | Cat_OrgUnit.E_BRANCH (nếu không có dữ liệu sẽ lấy Cat_Orgstructure.OrgStructureName) |
| eBHXHD02TSDieuChinhCol50 | Nơi cấp bảo hiểm xã hội | Hre_Profile.SocialInsIssuePlace |
| eBHXHD02TSDieuChinhCol51 | Nơi ĐK khám bệnh | Hre_Profile.HealthTreatmentPlace |
| eBHXHD02TSDieuChinhCol52 | Mã ngân hàng | Sal_SalaryInformation.BankID =\> Cat_Bank.BankCode |
| eBHXHD02TSDieuChinhCol53 | Mã chi nhánh ngân hàng của nhân viên | Sal_SalaryInformation.BranchID =\> Cat_Branch.BranchCode |
| eBHXHD02TSDieuChinhCol54 | Tên Quốc Tịch | Hre_Profile.Cat_Country =\> Cat_Country.nationallityName |
| eBHXHD02TSDieuChinhCol55 | Tên Phường/Xã tạm trú | tVillageName =\> Cat_Village.VillageName |
| eBHXHD02TSDieuChinhCol56 | Tên Quận/Huyện tạm trú | tDistrictName =\> Cat_District.DistrictName |
| eBHXHD02TSDieuChinhCol57 | Tên Tỉnh/TP tạm trú | pProvinceName =\> Cat_Province.ProvinceName |
| eBHXHD02TSDieuChinhCol58 | Mã Tỉnh/TP của chứng minh thư | Hre_Profile.IDNoProvinceID =\> Cat_Province.Code |
| eBHXHD02TSDieuChinhCol59 | Tên Tỉnh/TP của chứng minh thư | Hre_Profile.IDNoProvinceID =\> Cat_Province.ProvinceName |
| eBHXHD02TSDieuChinhCol60 | Mã Quận/Huyện của chứng minh thư | Hre_Profile.IDNoDistrictID =\> Cat_District.Code |
| eBHXHD02TSDieuChinhCol61 | Tên Quận/Huyện của chứng minh thư | Hre_Profile.IDNoDistrictID =\> Cat_District.DistrictName |
| eBHXHD02TSDieuChinhCol62 | Mã Xã/Phường của chứng minh thư | Hre_Profile.IDNoAVillageID =\> Cat_Village.Code |
| eBHXHD02TSDieuChinhCol63 | Tên Xã/Phường của chứng minh thư | Hre_Profile.IDNoAVillageID =\> Cat_Village.VillageName |
| eBHXHD02TSDieuChinhCol64 | Họ tên chủ hộ | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseholderFullName |
| eBHXHD02TSDieuChinhCol65 | Số điện thoại của chủ hộ | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.Telephone |
| eBHXHD02TSDieuChinhCol66 | Số sổ hộ khẩu/ Số sổ tạm trú | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseholdBookNo |
| eBHXHD02TSDieuChinhCol67 | Loại giấy tờ | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.PapersType |
| eBHXHD02TSDieuChinhCol68 | Tên tỉnh thành của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.ProvinceName |
| eBHXHD02TSDieuChinhCol69 | Mã Tỉnh thành của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.ProvinceBirthCertificateID.Code |
| eBHXHD02TSDieuChinhCol70 | Tên quận huyện của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.DistrictName |
| eBHXHD02TSDieuChinhCol71 | Mã quận huyện của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.DistrictBirthCertificateID.Code |
| eBHXHD02TSDieuChinhCol72 | Tên phường xã của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.VillageName |
| eBHXHD02TSDieuChinhCol73 | Mã phường xã của ProfileMoreInfoID | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.VillageBirthCertificateID.Code |
| eBHXHD02TSDieuChinhCol74 | Mã hộ gia đình | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.HouseHoldCode |
| eBHXHD02TSDieuChinhCol75 | Mức lương cũ | Ins_ReportD02Item.OldBasicSalary |
| eBHXHD02TSDieuChinhCol76 | Quận huyện | Ins_ReportD02Item.RegionID.Code |
| eBHXHD02TSDieuChinhCol77 | Phường xã | Ins_ReportD02Item.RegionID.RegionName |
| eBHXHD02TSDieuChinhCol78 | Mã dân tộc | Ins_ReportD02Item.ProfileID.EthnicID.Code |

### Mẫu BC BHXH đã chi trả

**Mục đích BC:** Xuất Danh sách chi trả tiền TC OD -- TS -- NDS của BHXH
đối với những chứng từ đã có Ngày thanh toán BH.

**Enum xuất BC của chứng từ theo từng nhân viên:**

- Họ tên: Ins_InsuranceRecord.ProfileID =\>
  Sal_SalaryInformation.AccountName

- MSNV: Ins_InsuranceRecord.ProfileID =\> Hre_Profile.CodeEmp

- Số TK: Ins_InsuranceRecord.ProfileID =\>
  Sal_SalaryInformation.AccountNo

- NHTH (Ngân hàng thụ hưởng): Mã Ngân hàng -- Tên Chi nhánh Ngân hàng

- Số tiền: Ins_InsuranceRecord.Amount

  - **SUM(Ins_InsuranceRecord.Amount)**

- Nội dung: Ins_InsuranceRecord.InsuranceType

**GHÉP CHUỔI (Ins_InsuranceRecord.InsuranceType) bằng dấu ';'**

**Xuất Phiếu:**

- Xuất nhiều sheet: Mỗi nhân viên với một chứng từ sẽ được xuất ra một
  sheet

- Xuất nhiều file excel(nén trong file .zip): Mỗi nhân viên ứng với một
  chứng từ sẽ được xuất ra một file excel và tất cả file này được nén
  trong file .zip

### BC C70A-HD

**Mục Đích C70A-HD :**

- Giải quyết trợ cấp ốm đau, thai sản, dưỡng sức, phục hồi sức khỏe đối
  với người lao động trong doanh nghiệp.

**Mô Tả Các Cột :**

> **Cột Lương BHXH** \[SalaryIns\] (Cột 5):

- **Thai sản các loại:** Lấy lương BH trung bình đóng BH 6 tháng gần
  nhất(Nếu số tháng đóng không đủ 6 tháng =\> lấy lương trung bình ứng
  với các tháng đóng)

- **Ngắn ngày, dài ngày, con ốm:** Lấy lương BHXH gần nhất

- **Dưỡng sức và LĐ nam hưởng trợ cấp vợ sanh:** SalaryIns =0

> **Note:** Cách lấy lương BHXH dựa vào ngày hiệu lực(ngày bắt đầu chứng
> từ)

- **Chứng từ thai Sản:**

  - InsRecord.DateStart \>15 =\> 15\[thang N+1\]

  - InsRecord.DateStart \<=15 =\> 15\[thang N\]

- **Chứng từ ngắn ngày,dài ngày, con ốm:**

  - tháng trước chưa tham gia BH =\> lấy tháng tham gia BH

  - Tháng trước đã tham gia BH =\> lấy tháng trước của ngày chứng
    từ(ngày 15)

> **Cột tiền (Số tiền trợ cấp trong kỳ)** (Cột 11):

- [Khám Thai , tránh thai]{.mark}

  - [(]{.mark}\[SalaryIns\] [/ 24) \*]{.mark} \[SoNgayNghiChungTu\]

- [Sảy Thai ,]{.mark} nạo hút thai, thai lưu

  - [(]{.mark}\[SalaryIns\] [/ 30) \*]{.mark} \[SoNgayNghiChungTu\]

- [Sinh con]{.mark},nữ mang thai hộ sinh con, nữ nhờ mang thai hộ nhận
  con

  - Số ngày nghỉ TS \<= 190 ngày :

    - \[SalaryIns\] \* 6 + \[LuongToiThieu\] \* \[HesoSinhCon\]

  - Số ngày nghỉ TS \> 190 :

    - \[SalaryIns\]\*\[SoThangNhan\]+\[LuongToiThieu\]\*\[HeSoCon\]

- Lao động nam hưởng trợ cấp 1 lần vợ sinh con

  - \[SalaryIns\] = 0 (không tính lương BHXH cho trường hợp này)

  - \[LuongToiThieu\]\* \[HesoSinhCon\]

- Lao động nam hưởng trợ cấp nghỉ khi vợ sinh(5 đến 14 ngày)

  - (\[SalaryIns\]/24)\*\[SoNgayNghi\]

- Ốm ngắn ngày , con ốm

  - (\[SalaryIns\]/\[24\])\*\[SoNgayNghi\]\*75%

- Dài ngày

> (\[SalaryIns\]/\[24\])\*TiLeC70A
>
> Trong đó : TiLeC70A = 180\*75%+(\[SoNgayNghi\] -180)\*HeSo
>
> Nếu là ốm dài ngày: \[SoNgayNghi\] bao gồm cả cuối tuần và ngày lễ

- Dưỡng Sức TS, TNLĐ, dưỡng sức ốm đau

  - \[LuongToiThieu\]\*\[SoNgayNghi\]\*RateRestore

> **Cột Luỹ kế từ đầu năm**:

- Ghi tổng số ngày được nghỉ hưởng chế độ cộng dồn từ đầu năm đến hết kỳ
  thanh toán.

**[Note:]{.underline}**

1.  HesoSinhCon : sinh đôi (4) , sinh thường (2)

2.  SoThangNhan : \[Số ngày TS\]/30

3.  HeSo :

| a. | Đóng \< 15 năm (45%) |
| b. | Đóng \>15 năm đến 30 năm (55%) |
| c. | Đóng \> 30 năm (65%) |

4.  RateRestore

| a. | Nghỉ tại gia (30%) |
| b. | Nghỉ tập trung (40%) |

5.  LuongToiThieu : Lương tối thiểu trong cấu hình (gần với tháng kiểm
    tra nhất) \[Cat_ValueEntity\]

**Hạng Mục C70A:**

A.  Chế Độ Đau Ốm

B.  Chế Độ Thai Sản

C.  Dưỡng Sức Phục Hồi Sau Ốm

D.  Dưỡng Sức Phục Hồi Sau Sinh

E.  Dưỡng Sức Phục Hồi Sức Khoẻ Sau TNLĐ , Bệnh Nghề Nghiệp

**Logic C70A:**

- Lấy danh sách chứng từ trong 1 năm trở về trước (trong kỳ đang tính
  ),dùng để lấy luỹ kế

> ![](Ins_TaiLieuBaoHiem_01_image46.png)

###  Danh Sách Đóng BHXH

- Thể hiện danh sách nv đóng BH từ tháng đến tháng

- Dữ liệu lấy trong Ins_ProfileInsuranceMonthly

- Những thông tin thể hiện trong cột tháng:

  - Số tiền

  - Nghỉ Việc

    - Nghỉ Việc (nằm trong chu kỳ giảm lao động)

    - Chuyển nơi đóng BH

  - Nghỉ Thai Sản (dựa vào dữ liệu bảo hiểm)

  - Nghỉ \>= 14 ngày (dựa vào dữ liệu BH)

> Note: Nghiệp vụ đổi nơi đóng bảo hiểm trong báo cáo này : NV 001
> chuyển nơi đóng BH từ Vĩnh Phúc sang Hà Nam .

- Dòng 1 (Vĩnh Phúc) : cột số tiền thể hiện "Nghỉ Việc"

- Dòng 2 ( Hà Nam) : cột số tiền thể hiện "Số Tiền"

![](Ins_TaiLieuBaoHiem_01_image47.png)

###  DS NV Đủ Đk Tham Gia BH

- Lấy dữ liệu bảo hiểm (ins_ProfileInsuranceMonthly) theo tháng kiểm tra
  (có đóng BHXH)

- Duyệt danh sách nv trong dữ liệu bảo hiểm

  - Hiển thị dữ liệu NV

  - Nếu không đóng BHXH =\> set lương BHXH là null

  - Nếu không đóng BHYT =\> set lương BHYT là null

  - Nếu không đóng BHTN =\> set lương BHTN là null

![](Ins_TaiLieuBaoHiem_01_image48.png)

###  BC Kế Toán 01 ( chưa điều chỉnh BH)

- Lấy dữ liệu bảo hiểm có đóng BHXH (có mã chi phí Costcentre)

- Lọc dữ liệu theo mã chi phí

- Lọc dữ liệu **không điều chỉnh bảo hiểm**

> ![](Ins_TaiLieuBaoHiem_01_image49.png)

###  BC Kế Toán 02 (điều chỉnh bảo hiểm)

- Lấy dữ liệu bảo hiểm có đóng BHXH (và cả dữ liệu bảo hiểm không đóng
  BHXH có điều chỉnh BH)

- Lấy dữ liệu bảo hiểm (có mã chi phí Costcentre)

- Lọc dữ liệu theo mã chi phí

- Lọc dữ liệu bảo hiểm **có điều chỉnh**

> ![](Ins_TaiLieuBaoHiem_01_image50.png)

###  DS Chức Danh Tổng Hợp

- Lấy dữ liệu bảo hiểm tháng chọn (~~chỉ lấy những nv có lương
  BHXH(bỏ)~~)(theo monthYearEffect bằng tháng kiểm tra)

- Lấy danh sách BH tháng trước (tháng kiểm tra))(theo monthYearEffect
  bằng tháng kiểm tra)

- Duyệt danh sách BH đã điều chỉnh

  - Hiển thị thông tin NV

  - Không hiển thị những NV có :

    - Tháng check và tháng trước không đóng BHXH

    - ~~Tháng Check và tháng trước nghỉ thai sản (chưa nghỉ việc)(bỏ)~~

    - ~~Tháng Check và tháng trước nghỉ \>=14 ngày (chưa nghỉ
      việc)(bỏ)~~

    - ~~Bắt đầu nghỉ việc từ tháng trước so với tháng kiểm tra(bỏ)~~

![](Ins_TaiLieuBaoHiem_01_image51.png)

###  Bảo Hiểm Mở Rộng

- Lấy danh sách bảo hiểm theo từ tháng đến tháng

- Duyệt từ tháng đến tháng

  - Lấy DS BH theo tháng

  - Dòng đầu : dòng tháng (cột name)

    - Lấy tổng số NV (không đếm NV đã điều chỉnh bảo hiểm)

    - Tổng lương : Tổng lương BHXH (không điều chỉnh)

    - Tổng BHXH : tổng tiền BHXH NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh )

    - Tổng BHYT : tổng tiền BHYT NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh )

    - Tổng BHTN : tổng tiền BHTN NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh )

  - Dòng sau : dòng thể hiện các nơi đóng BH (lọc theo nơi đóng BH)

    - Lấy tổng số NV theo nơi đóng BH (Không cộng NV đã điều chỉnh BH)

    - Tổng lương : Tổng lương BHXH (không điều chỉnh) theo nơi đóng BH

    - Tổng BHXH : tổng tiền BHXH NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh ) theo nơi đóng BH

    - Tổng BHYT : tổng tiền BHYT NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh ) theo nơi đóng BH

    - Tổng BHTN : tổng tiền BHTN NLĐ đóng và NSDLĐ đóng (bao gồm cả điều
      chỉnh ) theo nơi đóng BH

![](Ins_TaiLieuBaoHiem_01_image52.png)

###  BC DS NV Hưởng Trợ Cấp Nặng Nhọc , Độc Hại, Nguy Hiểm

###  BC Dữ Liệu HDT Lần 2

- Lấy dữ liệu bảo hiểm của tháng check ( nv có đóng BHXH)

- Lấy ds ngày nghỉ (leaveday) trong tháng check và thuộc loại ngày nghỉ
  không đóng BH

- Lấy ds HDTJob

[**\[Số ngày không làm HDTJob\]** = Số Ngày Trong Tháng - Số Ngày
Nghỉ(cat_dayoff theo th]{.mark}áng năm[) - Số Ngày Nghỉ leaveday
(kh]{.mark}ông đóng BHXH [theo profile) - (numday_HDTJob_4
+numday_HDTJob_5)]{.mark}

![](Ins_TaiLieuBaoHiem_01_image53.png)

###  BC Dữ Liệu TAS Lần 2

- Nghỉ 14 ngày (giống logic của phân tích bảo hiểm)

###  Dữ Liệu D02Type (Điều Chỉnh BH)

| **Ins_TypeD02** **Dữ Liệu Trạng Thái D02 (Điều Chỉnh BH)** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| STT | TypeCode | TypeName | StatusCode | StatusName | Comment | CommentCode |
| 1 | E_Dieu_Chinh | Điều Chỉnh | E_DieuChinhTang | Điều Chỉnh Tăng | Truy Tăng | E_DieuChinhTang |
| 2 | E_Dieu_Chinh | Điều Chỉnh | E_DieuChinhTang | Điều Chỉnh Tăng | Điều Chỉnh Tăng | E_DieuChinhTang |
| 3 | E_Dieu_Chinh | Điều Chỉnh | E_DieuChinhTang | Điều Chỉnh Tăng | Điều Chỉnh Tăng Lương | E_DieuChinhTang |
| 4 | E_Dieu_Chinh | Điều Chỉnh | E_DieuChinhGiam | Điều Chỉnh Giảm | Truy Giảm | E_DieuChinhGiam |
| 5 | E_Dieu_Chinh | Điều Chỉnh | E_DieuChinhGiam | Điều Chỉnh Giảm | Điều Chỉnh Giảm Lương | E_DieuChinhGiam |
| 6 | E_Dieu_Chinh | Điều Chỉnh | E_DieuChinhGiam | Điều Chỉnh Giảm | Điều Chỉnh Giảm | E_DieuChinhGiam |

### BC D02 VIETTEL

I.  Ý NGHĨA BC D02 Viettel: tương tự như BC D02,

> Nhưng có điểm khác biệt để tránh nhằm lẫn BC Viettel và các báo cáo
> D02 khác, là BC D02 viettel không gôm Nhóm, và chỉ xử lý các trạng
> thái được cấu hình.

Mẫu BC cũng tương tự như các mẫu BC D02.

> Vẫn có các cột tiêu chí: đều giống như báo cáo D02.

Dữ liệu được lấy từ 2 bảng

a.  Bảng thông tin thẻ BHXH **(Hre_HealthInsuranceCard)**

| **Hre_HealthInsuranceCard** **(Thẻ BHYT)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | HealthInsNo | NVarchar(50) |  | Số Sổ BHYT |
|  | HealthInsIssueDate | DateTime |  | Ngày Cấp BHYT |
|  | HealthInsExpiredDate | DateTime |  | Ngày Hết Hạn BHYT |
|  | HealthTreatmentPlace | Nvarchar(100) |  | Nơi Đăng Ký Khám Bệnh |
|  | HealthTreatmentPlaceCode | NVarchar(50) |  | Mã Bệnh Viện Đăng Ký Khám |
|  | IsPeriodicExamination | bit |  | Khám Sức Khỏe Định Kỳ |
|  | ReceiveHealthIns | bit |  | Đã Trả Thẻ BHYT |
|  | ReceiveHealthInsDate | DateTime |  | Ngày Trả Thẻ BHYT |
|  | IsRegisterHealthIns | bit |  | Tham Gia BHYT |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
| --- | --- | --- 
b.  Bảng thông tin nhân viên **(Hre_Profile)**

II\. Dữ liệu sẽ được lây từ bảng Hre_HealthInsuranceCard đúng với điều
kiện.

Hre_HealthInsuranceCard.Hre_profileID = Ins_ReportD02Item.ProflerID lấy
nhân viên nhận xét

Hre_HealthInsuranceCard.HealthInsIssueDate \<= Ins_ReportD02Item.MonthTo

AND Hre_HealthInsuranceCard.HealthInsIssueDate Lấy ngày lớp nhất

Từ dữ liệu tìm kiếm bên trên xuất

Lấy các thông tin cần thiết của bảng nhân viên

- Dựa vào Hre_Profile.ID = Ins_ReportD02Item.ProfileID.

- Từ dữ liệu trả về Thông tin nhân viên thỏa điều kiện.

- Mã nhân viên = insReportD02Item.CodeEmp

- Tên nhân viên = insReportD02Item.ProfileName

- Giới tính = insReportD02Item.Gender

- Ngày sinh = insReportD02Item.DateOfBirth

- ..............

#### Cách lấy dữ liệu cho báo cáo D02 viettel.

| **D02 VIETTEL** |  |  |
| --- | --- | --- |
| Mã | Tên | Cách lấy dữ liệu |
| CodeEmp | Mã nhân viên | insReportD02Item.CodeEmp |
| ProfileName | Tên nhân viên | insReportD02Item.ProfileName |
| Gender | Giới tính | insReportD02Item.Gender |
| DateOfBirth | Ngày sinh | insReportD02Item.DateOfBirth |
| SocialInsNo | Số sổ BH | insReportD02Item.SocialInsNo |
| JobName | Tên công việc | insReportD02Item.JobName |
| OrgStructureName | Phòng ban | insReportD02Item.OrgStructureName |
| ProvinceName | Tên tỉnh. | insReportD02Item.ProvinceName |
| WorkPlaceName | Tên nơi làm việc | insReportD02Item.WorkPlaceName |
| MonthYear |  | insReportD02Item.MonthYear |
| NewBasicSalary |  | insReportD02Item.NewBasicSalary |
| OldAllowance1 | Phụ cấp 1 lương CB | insReportD02Item.OldAllowance1 |
| OldAllowance2 | Phụ cấp 2 lương CB | insReportD02Item.OldAllowance2 |
| OldAllowance3 | Phụ cấp 3 lương CB | insReportD02Item.OldAllowance3 |
| OldAllowance4 | Phụ cấp 4 | insReportD02Item.OldAllowance4 |
| NewBasicSalary | Tiền lương hiện mới | insReportD02Item.NewBasicSalary |
| OldBasicSalary | Tiền lương cũ | insReportD02Item.OldBasicSalary |
| RateBHXH | Lương BHXH | insReportD02Item.RateSocialIns |
| RateBHYT | Lương BHYT | insReportD02Item.RateHealthIns |
| RateBHTN | Lương BHTN | insReportD02Item.RateUnEmpIns |
| DisplayCode | Mã PA | [Ins_TypeD02]{.mark}.DisplayCode |
| DisplayName | Tên PA | [Ins_TypeD02]{.mark}.DisplayName |
| ProvinceHospital | Mã tỉnh BV KCB | Hre_HealthInsuranceCard.ProvinceHospital |
| HealthTreatmentPlaceCode | Mã BV KCB | Hre_HealthInsuranceCard.HealthTreatmentPlaceCode |
| HealthTreatmentPlace | Tên BV KCB | Hre_HealthInsuranceCard.HealthTreatmentPlace |
| ReceiveHealthIns | Trả thẻ | Hre_HealthInsuranceCard.ReceiveHealthIns |
| HealthInsNo | Thẻ BHYT | Hre_HealthInsuranceCard.HealthInsNo |
| NationalityID | Mã quốc tịch | Hre_Profile.NationalityID =\> Cat_Country.Code |
| IDNo | CMND | Hre_Profile.IDNo |
| [IDDateOfIssue]{.mark} | Ngày cấp CMND | Hre_Profile.[IDDateOfIssue]{.mark} |
| [IDPlaceOfIssue]{.mark} | Nơi cấp CMND | Hre_Profile.[IDPlaceOfIssue]{.mark} |
| [PAddress]{.mark} | Số nhà thường trú | Hre_Profile.[PAddress]{.mark} |
| [VillageID]{.mark} | Mã xã/phường thường trú | [Hre_Profile.VillageID =\> Cat_Village]{.mark}.Code |
| [PDistrictID]{.mark} | Mã quận thường trú | [Hre_Profile.PDistrictID =\> Cat_District]{.mark}.Code |
| [PProvinceID]{.mark} | Mã tỉnh thường trú | [Hre_Profile.PProvinceID =\> Cat_Province]{.mark}.Code |
| Comment | Ghi chú | insReportD02Item.Comment |

### 1.46.24 Chứng từ BH

![](Ins_TaiLieuBaoHiem_01_image54.emf)
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
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/04-chuoi-gia-tri|Chuỗi Giá Trị (Lean Production)]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/05-database|Cấu Trúc Database]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/07-bao-cao-dong|Báo Cáo Động]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/08-van-de-bh|Vấn Đề Bảo Hiểm & Cấu Hình]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/09-bieu-do-code|Biểu Đồ Code (Kỹ Thuật)]]
