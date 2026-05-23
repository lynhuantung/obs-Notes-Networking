# INS FAQ — 4 Góc Nhìn Trục Trặc Khi Phân Tích Bảo Hiểm

## Tổng quan
Khi phân tích BH không thành công, dùng 4 góc nhìn để khoanh vùng nguyên nhân:
1. Bộ phận liên quan
2. Loại trục trặc
3. Qui trình
4. 4M (Con người / Máy / Dữ liệu / Phương pháp)

---

## 1. Bộ phận liên quan

### Module Nhân Sự (HRE)
- Nơi đóng BH của NV có thay đổi không?
- Chức danh / Chức vụ có thay đổi không? (ảnh hưởng tên công việc trên D02)
- NV có đang nghỉ tạm hoãn không?

### Module Chấm Công (ATT)
- Ngày nghỉ đã được duyệt chưa?
- Tổng hợp công đã được tính chưa (có dữ liệu `Att_Workday`)?
- NV có đăng ký nghỉ đúng loại ngày nghỉ chưa?

### Module Lương (SAL)
- Lương BHXH (`Sal_InsuranceSalary`) đã có dữ liệu chưa?
- Số tiền lương BHXH có bằng 0 không?

### Module Bảo Hiểm (INS)
- Thiết lập BH đã cấu hình đúng chưa (chu kỳ, config phân tích theo HĐ...)?
- Công thức BH trong `Cat_InsuranceElement` đã đúng chưa?

### Module Hệ Thống (SYS)
- Múi giờ server/client có đồng bộ không?
- Phân quyền App Pool IIS có đủ không?

---

## 2. Loại trục trặc

### Công thức BH sai
- Công thức tính lương BH trong `Cat_InsuranceElement` trả về 0 hoặc sai
- Hỏi PE: công thức là gì, các biến trong công thức có dữ liệu không?

### Công thức tên công việc sai
- Tên công việc trên D02 bị trống hoặc sai
- Kiểm tra: chức danh NV có được cấu hình không, công thức `GetJobNameByFomular` có đúng không?

### Thiếu field
- Dữ liệu thiếu trường bắt buộc (VD: không có lương BHXH, không có HĐ loại đóng BH)

### Sai tiền tệ
- Hỏi PE: hệ thống có cấu hình tiền tệ không? Có cập nhật tỉ giá không?

---

## 3. Qui trình

### Lấy thông tin NV
- NV nghỉ việc trước kỳ đầu BH (`dateStartNewlabor`) → không phân tích
- Checklist: NV nghỉ ngày nào? So với ngày bắt đầu chu kỳ BH thế nào?

### Tháng bắt đầu tham gia BH
- NV có lương BHXH chưa? `DateEffect` là ngày nào?

### Kiểm tra đóng BH
- Tháng tham gia có dữ liệu không?
- NV có nghỉ việc trong kỳ không?
- NV có nghỉ thai sản không? Ngày bắt đầu/kết thúc có nằm trong chu kỳ [15/N-1 → 14/N] không?

### Kiểm tra nghỉ 14 ngày
- Tổng hợp công (`Att_Workday`) đã có dữ liệu chưa?
- Ngày nghỉ đã đăng ký và duyệt chưa (`Att_Leaveday`)?

### Tính lương BHXH
- Công thức tính lương BH có đúng không?
- Dữ liệu lương BHXH (`Sal_InsuranceSalary`) có giá trị không?

---

## 4. 4M Framework

### Con người (Man)
- PE có cấu hình BH đúng không? (Thiết lập BH, chu kỳ, config)
- PE có kiểm tra công thức BH không?

### Máy (Machine)
- Máy chủ có đủ bộ nhớ không? (IIS OOM → phân tích bị treo/lỗi)
- Múi giờ server/client có đồng bộ không?

### Dữ liệu đầu vào (Material)
- Công thức BH (`Cat_InsuranceElement`) có đúng không?
- Dữ liệu lương BHXH (`Sal_InsuranceSalary`) có giá trị không?
- NV có đang nghỉ tạm hoãn không?

### Phương pháp (Method)
- Qui trình phân tích BH có được thực hiện đúng thứ tự 5 bước không?
- Dữ liệu đầu vào (Công, Lương, Nhân sự) đã được chuẩn bị trước khi phân tích chưa?
