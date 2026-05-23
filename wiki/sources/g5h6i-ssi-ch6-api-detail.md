---
type: source
code: g5h6i
description: "SSI Ch.6 API detail: 4 yêu cầu chung, 14 GET endpoints, 10 POST/PUT endpoints — endpoint, request/response schema, đáp ứng VnResource"
tags:
  - ssi
  - api
  - integration
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/sources/q3r6t-ssi-api-spec]]"
---

# Source: SSI Ch.6 — API Tích hợp (Chi tiết đầy đủ)

## Tóm tắt

Chương 6 bao gồm **4 yêu cầu chung** (6.1.x) về quản lý API Key, bảo mật, hiệu suất, tài liệu; **14 GET APIs** (6.2.1–6.2.14) lấy dữ liệu từ HRM ra; và **10 POST/PUT APIs** (6.3.1–6.3.10) đồng bộ dữ liệu vào HRM. Tất cả đều được VnResource (VNR) đáp ứng.

**Response format chuẩn:**
```json
{
  "success": true/false,
  "data": [{}, {}, {}],   // null nếu success = false
  "message": ""           // có error message nếu success = false
}
```
**GET List**: hỗ trợ phân trang với `PageIndex`, `PageSize`; mỗi record có `TotalRow`, `RowNumber`.  
**POST/PUT**: validate dữ liệu, trả về tên lỗi chính xác.

---

## 6.1 — Yêu cầu chung API

### 6.1.1 — Quản lý API Key

**Yêu cầu:**
> Hệ thống cho phép quản lý API key để phân quyền truy cập APIs và theo dõi tích hợp (Generate key mới, sửa, xóa).

**Đáp ứng:**
> Hệ thống đáp ứng đầy đủ và toàn diện yêu cầu của hồ sơ thầu. Với giao diện quản lý API Key tập trung hỗ trợ Generate, Sửa, Xóa kết hợp cơ chế phân quyền chi tiết theo Scope/IP Whitelist/Rate Limiting và hệ thống giám sát tích hợp theo thời gian thực, chúng tôi cam kết đảm bảo mọi kết nối API với hệ thống của SSI đều được kiểm soát an toàn, minh bạch và có thể truy vết đầy đủ.

---

### 6.1.2 — Tiêu chuẩn bảo mật API

**Yêu cầu:**
> API phải tuân thủ các tiêu chuẩn bảo mật, bao gồm mã hóa dữ liệu và xác thực.

**Đáp ứng:**
> Hệ thống đáp ứng hoàn toàn yêu cầu về việc tuân thủ các tiêu chuẩn bảo mật cho API. Chúng tôi xây dựng kiến trúc API dựa trên nguyên tắc "Security by Design", đảm bảo mọi luồng dữ liệu và yêu cầu truy cập đều được xác thực mạnh mẽ (Strong Authentication) và mã hóa toàn diện (Comprehensive Encryption).

**Các cơ chế tích hợp được hỗ trợ:**

- **REST API:** Cung cấp đầy đủ API theo chuẩn RESTful, định dạng JSON/XML, hỗ trợ xác thực và phân quyền, khả năng mở rộng đa nền tảng.
- **Webhook:** Chủ động gửi dữ liệu/sự kiện đến hệ thống khác theo thời gian thực (real-time integration).
- **SSO (Single Sign-On):** Đăng nhập một lần, tích hợp Identity Provider doanh nghiệp.
- **OAuth2 / OpenID Connect:** Xác thực và ủy quyền an toàn khi tích hợp bên thứ ba.

**Bảo mật tích hợp (Integration Security):**
- Xác thực API: OAuth2, JWT, API Key
- Mã hóa dữ liệu: HTTPS/TLS
- IP Whitelist / Rate Limit
- Audit log khi tích hợp

**Mã hóa dữ liệu:**
- **Truyền tải:** HTTPS/TLS 1.2 — ngăn nghe lén và thay đổi dữ liệu.
- **Lưu trữ:** Dữ liệu nhạy cảm (mật khẩu) mã hóa AES, hash+salt bằng bcrypt.

---

### 6.1.3 — Hiệu suất API

**Yêu cầu:**
> API phải đảm bảo hiệu suất cao, với thời gian phản hồi nhanh và khả năng xử lý tải lớn. Theo dõi sheet 1.Sizing.

**Đáp ứng:**
> API đáp ứng đầy đủ yêu cầu hiệu suất cao theo hồ sơ thầu, đảm bảo thời gian phản hồi nhanh và khả năng xử lý tải lớn, với năng lực thiết kế và kiểm chứng dựa trên Sheet "1.Sizing", đồng thời có cơ chế giám sát và báo cáo bằng chứng rõ ràng để SSI nghiệm thu.

---

### 6.1.4 — Tài liệu API

**Yêu cầu:**
> Nhà thầu phải cung cấp tài liệu chi tiết về thiết kế, cách sử dụng và tích hợp API.

**Đáp ứng:**

> - Đối với các API GET List: VNR sẽ hỗ trợ phân trang. Dữ liệu trả về dạng danh sách đã được phân trang. Ngoài thông tin Query theo mỗi API sẽ có thêm 2 thông số: `PageIndex` và `PageSize`. Dữ liệu trả về trên mỗi record sẽ có `TotalRow` (tổng số record) và `RowNumber` (số thứ tự).
> - Đối với các API POST hoặc PUT: VNR sẽ hỗ trợ validate dữ liệu, bắt và thông báo chính xác tên lỗi trả về.
> - Dữ liệu trả về sẽ có dạng như sau:

```json
{
  "success": true/false,
  "data": [{}, {}, {}],
  "message": ""
}
```

**HTTP Status Codes:**

| Code | Ý nghĩa |
|------|---------|
| 200 | OK — Truy vấn thành công |
| 201 | Created — Tài nguyên mới được tạo |
| 202 | Accepted — Đã chấp nhận, chưa xong |
| 204 | No Content — Không có dữ liệu trả về |
| 400 | Bad Request — Yêu cầu lỗi |
| 401 | Unauthorized — Không có quyền |
| 403 | Forbidden — Bị cấm truy nhập |
| 404 | Not Found — Không tìm thấy tài liệu |
| 405 | Method Not Allowed — Phương thức không được phép |
| 408 | Request Timeout — Hết thời gian yêu cầu |
| 500 | Internal Server Error |
| 501 | Not Implemented |
| 502 | Bad Gateway |
| 503 | Service Unavailable |
| 504 | Gateway Timeout |

---

## 6.2 — GET APIs (Lấy dữ liệu từ HRM)

> Hệ thống đáp ứng hoàn toàn yêu cầu cung cấp danh sách API tích hợp lấy thông tin từ HRM (GET). Kiến trúc API theo hướng mở rộng linh hoạt để phát sinh thêm endpoint mới theo yêu cầu thực tế của SSI.

---

### 6.2.1 — Cơ cấu tổ chức

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin cơ cấu tổ chức và người quản lý đơn vị theo phân cấp: phòng ban, công ty, chi nhánh, văn phòng giao dịch, danh sách và số lượng nhân viên theo từng cấu phần tổ chức.

**Endpoints:**

**Nhóm Cơ cấu & Người quản lý:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy thông tin cơ cấu tổ chức | `GET /api/Profile/GetOrgStructure` | Trả về bảng dữ liệu phòng ban |
| 2 | Lấy thông tin người quản lý | `GET /api/Hre_Profile/GetHeadOrgStructure` | Trả về bảng dữ liệu quản lý phòng ban |

**Nhóm Headcount:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy thống kê nhân sự toàn cây tổ chức | `GET /api/Profile/headcount-summary` | Trả về bảng tổng hợp số lượng nhân viên theo từng cấp: Công ty, Chi nhánh, Văn phòng giao dịch, Phòng ban |

---

### 6.2.2 — Thông tin nhân viên

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin nhân viên theo mã nhân viên, username hoặc toàn bộ nhân viên. Lấy ra dữ liệu thông tin công việc và tổ chức (chức danh, cấp bậc, phòng ban,..), thông tin cá nhân (địa chỉ, CCCD,...), quá trình làm việc và một số thông tin khác có thể khai thác được trên hồ sơ nhân viên.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu thông tin nhân viên | `GET /api/Profile/GetListProfile` | Trả về bảng dữ liệu thông tin nhân viên |

---

### 6.2.3 — Thông tin ứng viên

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin ứng viên theo mã nhân viên, username hoặc toàn bộ ứng viên.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu thông tin ứng viên | `GET /api/Recruitment/GetCandidate` | Trả về bảng dữ liệu thông tin ứng viên |

---

### 6.2.4 — Danh sách chức danh/cấp bậc/vị trí

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin danh sách chức danh/cấp bậc/vị trí.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu chức danh | `GET /api/Category/GetListJobTitle` | Trả về bảng dữ liệu thông tin chức danh |
| 2 | Lấy dữ liệu cấp bậc | `GET /api/Category/GetListAbilitititle` | Trả về bảng dữ liệu thông tin cấp bậc |
| 3 | Lấy dữ liệu vị trí | `GET /api/Category/GetListPosition` | Trả về bảng dữ liệu thông tin vị trí |

---

### 6.2.5 — Bảng công

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin bảng công theo ngày (từ đến), mã nhân viên, username, phòng ban hoặc toàn bộ nhân viên. Lấy ra dữ liệu: ngày, công chuẩn, chấm công thực tế, công tính lương, ca làm việc.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu bảng công master | `GET /api/Attendancetable/GetListAttendanceTable` | Trả về bảng dữ liệu thông tin bảng công master |
| 2 | Lấy dữ liệu bảng công detail | `GET /api/Attendancetable/GetListAttendanceTableDetail` | Trả về bảng dữ liệu thông tin bảng công chi tiết |

---

### 6.2.6 — Chi phí lương

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin chi phí lương & các khoản trích (cấu phần) theo lương (BH, Thuế, phúc lợi) theo nhân viên.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu chi phí lương | `GET /api/Salary/GetListUnusalAllowance` | Trả về bảng dữ liệu thông tin bảng chi phí lương |

---

### 6.2.7 — Phiếu lương

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin phiếu lương theo kỳ, mã nhân viên/username. Có mã hóa thông tin đầu cuối theo key được cung cấp.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu phiếu lương theo kỳ, mã nhân viên | `GET /api/Salary/GetListPayroll` | Trả về bảng dữ liệu thông tin phiếu lương theo kỳ, mã nhân viên |

---

### 6.2.8 — Cấu hình công, ca, holiday

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin cấu hình công, ca, holiday.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu cấu hình công | `GET /api/Attendance/GetListConfigAttendance` | Trả về bảng dữ liệu thông tin cấu hình công |
| 2 | Lấy dữ liệu cấu hình ca | `GET /api/Attendance/GetListConfigRoster` | Trả về bảng dữ liệu thông tin cấu hình ca |
| 3 | Lấy dữ liệu cấu hình holiday | `GET /api/Attendance/GetListConfigHoliday` | Trả về bảng dữ liệu thông tin cấu hình Holiday |

---

### 6.2.9 — Cấu hình loại nghỉ phép, chế độ, công tác, OT, WFH

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin cấu hình danh sách loại nghỉ phép, nghỉ chế độ, công tác, OT, WFH,...

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu cấu hình loại nghỉ phép | `GET /api/Attendance/GetListLeavedayType` | Trả về bảng dữ liệu thông tin cấu hình loại nghỉ phép |
| 2 | Lấy dữ liệu cấu hình loại công tác | `GET /api/Attendance/GetListBusinessType` | Trả về bảng dữ liệu thông tin cấu hình loại công tác |
| 3 | Lấy dữ liệu cấu hình OT | `GET /api/Attendance/GetListOvertimeType` | Trả về bảng dữ liệu thông tin cấu hình loại OT |
| 4 | Lấy dữ liệu cấu hình nghỉ chế độ | `GET /api/Attendance/GetListPregnancyType` | Trả về bảng dữ liệu thông tin cấu hình loại nghỉ chế độ |
| 5 | Lấy dữ liệu cấu hình nghỉ WFH | `GET /api/Attendance/GetListWFHType` | Trả về bảng dữ liệu thông tin cấu hình loại nghỉ WFH |

---

### 6.2.10 — Danh sách nghỉ phép/công tác/OT

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin danh sách nghỉ phép/công tác/OT theo công ty / đơn vị / nhân viên / chức danh.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu nghỉ phép | `GET /api/Attendance/GetListLeaveday` | Trả về bảng dữ liệu thông tin nghỉ phép |
| 2 | Lấy dữ liệu công tác | `GET /api/Attendance/GetListBusiness` | Trả về bảng dữ liệu thông tin công tác |
| 3 | Lấy dữ liệu OT | `GET /api/Attendance/GetListOvertimeType` | Trả về bảng dữ liệu thông tin OT |

---

### 6.2.11 — Quỹ phép còn lại

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin quỹ phép còn lại cho trường hợp nghỉ phép, nghỉ chế độ, công tác, OT, WFH... Theo ngày (từ đến), mã nhân viên, username, phòng ban hoặc toàn bộ nhân viên. Lấy ra dữ liệu: Nhân viên, loại phép, Số phép đã sử dụng, số phép còn hạn, số phép hết hạn, số phép chuyển năm, tổng cộng.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu quỹ nghỉ phép | `GET /api/Attendance/GetListRemainLeaveday` | Trả về bảng dữ liệu thông tin quỹ nghỉ phép |

---

### 6.2.12 — Quyết toán thôi việc

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin quyết toán thôi việc: các chi phí chi trả cho nhân sự khi nghỉ việc.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu quyết toán thôi việc | `GET /api/Profile/GetListSettlement` | Trả về bảng dữ liệu thông tin quyết toán thôi việc |

---

### 6.2.13 — Thông tin ESOP

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin Esop của nhân sự khi thôi việc (QĐ, phiếu chuyển nhượng, bảng tính số tiền Esop được nhận...).

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu Esop của nhân sự khi thôi việc | `GET /api/Profile/GetListEsop` | Trả về bảng dữ liệu thông tin Esop của nhân sự khi thôi việc |

---

### 6.2.14 — Hạn mức tuyển dụng còn lại

**Yêu cầu:**
> Nhà thầu cung cấp API lấy thông tin hạn mức tuyển dụng còn lại theo công ty/phòng ban/vị trí.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Lấy dữ liệu hạn mức tuyển dụng còn lại theo công ty/phòng ban/vị trí | `GET /api/Recruitment/GetListLimitRecruitment` | Trả về bảng dữ liệu thông tin hạn mức tuyển dụng còn lại theo công ty/phòng ban/vị trí |

---

## 6.3 — POST/PUT APIs (Đồng bộ dữ liệu vào HRM)

> Danh sách API tích hợp đồng bộ thông tin sang HRM (POST/PUT) — tối thiểu và có thể phát sinh theo nhu cầu nghiệp vụ.

---

### 6.3.1 — Cập nhật thông tin nghỉ phép

**Yêu cầu:**
> Nhà thầu cung cấp API cập nhật thông tin nghỉ phép cho nhân viên theo mã nhân viên / username, loại nghỉ phép, nghỉ chế độ, công tác, OT, WFH... ngày request (từ-đến).

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Cập nhật thông tin nghỉ phép | `GET /api/Attendance/CreateOrUpdateLeaveday` | Cập nhật thông tin nghỉ phép |

---

### 6.3.2 — Cập nhật thông tin cá nhân nhân viên

**Yêu cầu:**
> Nhà thầu cung cấp API cập nhật thông tin cá nhân của nhân viên theo mã nhân viên/username. Thông tin được phép cập nhật bao gồm: thông tin cá nhân, liên hệ, học vấn, nhân thân, quá trình công tác tại đơn vị khác,...

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Cập nhật thông tin cá nhân | `GET /api/Attendance/CreateOrUpdateProfile` | Cập nhật thông tin cá nhân |

---

### 6.3.3 — Cập nhật ủy quyền quyết toán thuế

**Yêu cầu:**
> Nhà thầu cung cấp API cập nhật các trường hợp nhân viên muốn ủy quyền quyết toán thuế cho công ty.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Cập nhật nhân viên ủy quyền quyết toán thuế | `GET /api/Tax/CreateOrUpdateDelegateTax` | Cập nhật ủy quyền quyết toán thuế |

---

### 6.3.4 — Cập nhật kết quả đánh giá HQCV

**Yêu cầu:**
> Nhà thầu cung cấp API cập nhật Kết quả đánh giá HQCV theo mã nhân viên/username hoặc phòng ban, theo kỳ đánh giá.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Cập nhật kết quả đánh giá HQCV | `GET /api/Profile/CreateOrUpdateEEvalutionWorkList` | Cập nhật kết quả đánh giá HQCV |

---

### 6.3.5 — Nhận thông tin kết quả đánh giá HQCV

**Yêu cầu:**
> Nhà thầu cung cấp API nhận thông tin Kết quả đánh giá HQCV theo mã nhân viên/username hoặc phòng ban, theo kỳ đánh giá.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Nhận thông tin kết quả đánh giá HQCV | `GET /api/Profile/GetListEvalutionWorkList` | Nhận thông tin kết quả đánh giá HQCV |

---

### 6.3.6 — Nhận kết quả học tập, giảng dạy

**Yêu cầu:**
> Nhà thầu cung cấp API nhận thông tin Kết quả học tập, giảng dạy: list khóa học hoàn thành theo nhân viên (nếu có quản lý).

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Nhận thông tin Kết quả học tập, giảng dạy | `GET /api/Training/GetListResultLearning` | Nhận thông tin kết quả học tập, giảng dạy |

---

### 6.3.7 — Nhận kết quả các Đợt thi độc lập

**Yêu cầu:**
> Nhà thầu cung cấp API nhận thông tin Kết quả các Đợt thi độc lập: Điểm tổng hợp kỳ thi phân bậc của nhân viên theo đợt / năm.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Nhận thông tin Kết quả các Đợt thi độc lập | `GET /api/Training/GetListResultExamPeriod` | Nhận thông tin kết quả các Đợt thi độc lập |

---

### 6.3.8 — Nhận kết quả hoàn thành KPI Đào tạo

**Yêu cầu:**
> Nhà thầu cung cấp API nhận thông tin Kết quả hoàn thành KPI Đào tạo: số giờ học, giảng dạy đã hoàn thành theo năm của từng nhân viên.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Nhận thông tin kết quả hoàn thành KPI Đào tạo | `GET /api/Training/GetListResultEavKPITraining` | Nhận thông tin kết quả hoàn thành KPI Đào tạo |

---

### 6.3.9 — Cập nhật đề xuất tuyển dụng

**Yêu cầu:**
> Nhà thầu cung cấp API cập nhật thông tin đề xuất tuyển dụng sang HRM: vị trí tuyển dụng, số lượng, công ty, phòng ban bao gồm tạo mới, cập nhật, hủy đề xuất.

**Endpoints:**

| STT | Tên API | Endpoint | Mô tả |
|-----|---------|----------|-------|
| 1 | Cập nhật thông tin đề xuất tuyển dụng sang HRM | `GET /api/Recruitment/CreateOrUpdateProposal` | Cập nhật thông tin đề xuất tuyển dụng sang HRM |

---

### 6.3.10 — Tích hợp API nội bộ SSI (xuất chứng từ khấu trừ thuế)

**Yêu cầu:**
> Nhà thầu sẵn sàng tích hợp với API có sẵn của hệ thống nội bộ SSI cho nghiệp vụ xuất chứng từ khấu trừ thuế của nhân viên.

**Đáp ứng:**

> Nhà thầu đáp ứng hoàn toàn yêu cầu về việc tích hợp hệ thống. Chúng tôi khẳng định sự sẵn sàng về mặt kỹ thuật và quy trình để thực hiện kết nối, tích hợp với các API hiện có của hệ thống nội bộ SSI phục vụ cho nghiệp vụ xuất chứng từ khấu trừ thuế của nhân viên. Nhà thầu cam kết đảm bảo việc tích hợp diễn ra an toàn, bảo mật và không làm ảnh hưởng đến tính ổn định của cả hai hệ thống.

**Phương án triển khai tích hợp (Integration Approach):**

**Bước 1 — Khảo sát và Kết nối (Discovery & Connectivity):**
- Nghiên cứu tài liệu API của SSI: tiếp nhận và phân tích đặc tả API (Swagger/Postman/Word) liên quan đến dữ liệu thuế, nhân viên và xuất chứng từ.
- Xác định phương thức kết nối: RESTful API (qua HTTPS), SOAP, hoặc các phương thức truyền tin khác mà SSI áp dụng.
- Thiết lập môi trường kết nối: VPN, Whitelisting IP, hoặc API Gateway giữa HRM và hệ thống nội bộ SSI.

**Bước 2 — Quy trình tích hợp nghiệp vụ (Workflow Integration):**
1. **Truy xuất dữ liệu nguồn:** HRM gọi API của SSI để lấy thông tin thu nhập, giảm trừ gia cảnh, dữ liệu thuế.
2. **Xử lý và Tính toán:** HRM thực hiện logic tính thuế (nếu cần) hoặc chuẩn hóa dữ liệu theo định dạng chứng từ khấu trừ.
3. **Thực hiện xuất chứng từ:** HRM gọi API của SSI để gửi lệnh xuất chứng từ hoặc đẩy dữ liệu sang SSI in ấn/phát hành chứng từ điện tử theo quy chuẩn cơ quan thuế.

**Bước 3 — Đảm bảo an toàn và nhất quán dữ liệu:**
- **Xác thực & Ủy quyền:** OAuth 2.0, API Key, hoặc JWT — chỉ cho phép yêu cầu hợp lệ truy cập dữ liệu thuế nhạy cảm.
- **Xử lý lỗi & Ánh xạ dữ liệu:** Exception Handling + Data Mapping chặt chẽ — nếu API SSI gặp sự cố, HRM ghi nhận lỗi chính xác, không làm sai lệch dữ liệu thuế.
- **Tính toàn vẹn:** Truyền tải qua kênh mã hóa TLS 1.2/1.3, tuân thủ quy tắc nhất quán giữa hai hệ thống.

---

## Liên kết

- [[wiki/projects/SSI-Project]]
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]
- [[wiki/sources/q3r6t-ssi-api-spec]]
