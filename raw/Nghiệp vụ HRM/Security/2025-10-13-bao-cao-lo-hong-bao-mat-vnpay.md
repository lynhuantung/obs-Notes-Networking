# Báo cáo lỗ hổng bảo mật – VnPay (Đợt 13/10/2025)

> **Phát hiện bởi:** VnPay  
> **Ngày phát hiện:** 13/10/2025  

---

## 1. CWE-926 – Improper Export of Android Application Components

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-926 |
| **Tác động** | Mobile client app |
| **Mức độ** | Low |
| **Trạng thái** | Mới phát hiện |

**Mô tả:**  
Ứng dụng mobile app thiếu check root các thiết bị. Tạo bàn đạp cho các cuộc tấn công quan trọng.

**Phạm vi ảnh hưởng:**  
Ảnh hưởng đến các thiết bị di động đang bật chế độ 'nhà phát triển' hoặc đã bị root máy thì không thể sử dụng được app.

**Cách khắc phục:**  
Bổ sung cơ chế check root thiết bị cho ứng dụng mobile app.

---

## 2. CWE-804 – Bypass CAPTCHA (Chức năng đăng nhập)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-804 |
| **Tác động** | Hệ thống |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Hệ thống đang thực hiện bổ sung cơ chế captcha cho phần login. Captcha được sinh ra bằng cách gọi api `GET /Account/GetCaptchaImage`. Tuy nhiên api này không cần xác thực + captcha được sinh ra không gán liền với 1 request → Dẫn tới hacker có thể gọi api để tạo ra các giá trị captcha sử dụng cho việc bruteforce đăng nhập.

**Phạm vi ảnh hưởng:**  
Không thể login account super-admin theo cách thông thường.

**Cách khắc phục:**  
Chỉ sử dụng login SSO.

---

## 3. CWE-269 – Privilege Escalation

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-269 |
| **Tác động** | Employee portal |
| **Mức độ** | Critical |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Hệ thống thiếu cơ chế phân quyền phía server, ứng dụng đang hoàn toàn dựa vào response trả về ở api `testpermission` để thực hiện phân quyền cho 1 user (đang phân quyền phía client). Từ đó dẫn tới hacker có thể chỉnh sửa response trả về để thực hiện nâng quyền 1 người dùng.

**Phạm vi ảnh hưởng:**  
Ảnh hưởng đến hiệu năng của api `testpermission` do phải xử lý thêm logic tạo chữ ký, tác động không đáng kể (không ảnh hưởng nhiều đến trải nghiệm người dùng).

**API liên quan:**  
`GET /api/TestShared/TestPermission`

**Cách khắc phục:**  
Các key quyền trả về trong api `testpermission` có kèm theo chữ ký tránh làm giả data response.

---

## 4. CWE-840 – Business Logic Errors (Đăng ký OT)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-840 |
| **Tác động** | Employee portal |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Tại chức năng đăng ký OT, hệ thống đang thiếu cơ chế validate từ đó người dùng có thể lạm dụng giờ OT.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**Cách khắc phục:**  
Cấu hình thời gian tối đa được phép OT và thời gian tối đa làm việc trong 1 ngày ở màn hình `#/Hrm_Main_Web/Sys_AttendanceConfig/Create`.

---

## 5. CWE-613 – Insufficient Session Expiration (TTL token quá dài)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-613 |
| **Tác động** | Employee portal |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Trên môi trường product, TTL của token đang để quá lâu.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng vì login tại main portal đang dùng clientid là `hrm_portal` và `hrm_main`.

**Cách khắc phục:**  
Giới hạn lại time sống của token, giảm TTL của token cho clientId (`hrm10_portal_local`, `hrm10_portal_app`), từ 2 tháng → 1 ngày.

---

## 6. CWE-613 – Insufficient Session Expiration (Token không bị hủy sau logout)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-613 |
| **Tác động** | Employee portal |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Sau khi thực hiện chức năng đăng xuất khỏi ứng dụng và lưu lại Authorization (trước khi đăng xuất) và thực hiện gửi một request bất kỳ đến hệ thống (sử dụng Authorization cũ trong request) thì request vẫn được hệ thống chấp nhận. Từ đây team pentest nhận thấy rằng sau khi đăng xuất khỏi ứng dụng thì Authorization không được hủy ngay sau đó mà vẫn có thể sử dụng được. Điều này có thể dẫn đến các vấn đề nghiêm trọng khi hacker chiếm được Authorization và sẽ sử dụng được Token này trong khoảng thời gian dài.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**Cách khắc phục:**  
Sau khi logout thì add token đó vào blacklist tránh tái sử dụng token đó.

---

## 7. CWE-209 – Information Exposure Through an Error Message

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-209 |
| **Tác động** | Employee portal |
| **Mức độ** | Low |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Ứng dụng để lộ chi tiết nội bộ (stack trace, đường dẫn code, framework version) qua thông báo lỗi.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**Cách khắc phục:**  
Cấu hình lại không cho thấy chi tiết lỗi trên môi trường prod.

---

## 8. CWE-79 – Stored XSS (Employee portal)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-79 |
| **Tác động** | Employee portal |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Ứng dụng đang sử dụng Kendo UI framework để xử lý cho các trường nhập input. Phiên bản Kendo UI đang dùng hiện tại cho phép render trực tiếp mã JS độc hại lên browser → Dẫn tới các payload JS độc hại sẽ được thực thi.

**Phạm vi ảnh hưởng:**  
Ảnh hưởng hiệu năng vì thêm bước kiểm tra validate XSS, nhưng không gây ảnh hưởng đến trải nghiệm người dùng.

**API liên quan:**
```
POST /Home/SaveTranslate (tất cả các param)
POST /api/Hre_ProfileWorkList/CreateOrUpdateComment
```

**Cách khắc phục:**  
Ngăn chặn value có chứa XSS lưu thành công đến server.

---

## 9. CWE-598 – Use of GET Request Method With Sensitive Query Strings

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-598 |
| **Tác động** | Identity |
| **Mức độ** | Medium |
| **Trạng thái** | Đang xử lý |

**Mô tả:**  
Hệ thống đang sử dụng phương thức GET để truyền dữ liệu nhạy cảm trên URL → dẫn tới dễ lộ lọt thông tin quan trọng.

**API liên quan:**  
`GET /identityHub?id=*&access_token=*`

**Cách khắc phục:**  
(Chưa có)

---

## 10. CWE-521 – Weak Password Requirements

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-521 |
| **Tác động** | Employee portal |
| **Mức độ** | Low |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Chính sách mật khẩu yếu, dẫn tới người dùng có thể đặt mật khẩu là các ký tự đặc biệt, không quan tâm tới độ dài.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**Cách khắc phục:**  
Cấu hình bảo mật tại màn hình 'Cấu hình bảo mật', hoặc chuyển sang chỉ login qua SSO.

---

## 11. CWE-284 – Broken Access Control (Employee portal)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-284 |
| **Tác động** | Employee portal |
| **Mức độ** | High |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Lỗ hổng cho phép người dùng thực hiện các chức năng ngoài quyền hạn được cấp phát.

**Phạm vi ảnh hưởng:**  
Ảnh hưởng hiệu năng vì cần check lại danh sách userapprove là hợp lệ, không ảnh hưởng đến trải nghiệm người dùng.

**API liên quan:**
```
POST /api/Att_TAMScanLogRegister/CreateOrUpdateInOutRegister (Đăng ký quên chấm công)
POST /api/Att_LeaveDay/CreateOrUpdateLeaveday (Đăng ký nghỉ phép)
POST /api/Att_LeaveDay/SetApproveLeaveDayInPortal (Duyệt nghỉ phép)
POST /api/Att_LateEarlyAllowed/CreateOrUpdateLateEarlyAllowed (Đăng ký xin đi trễ)
POST /api/Att_LateEarlyAllowed/SetRejectLateEarlyInPortal (Hủy duyệt xin đi trễ, về sớm)
POST /api/Att_LateEarlyAllowed/SetApproveLateEarlyInPortal (Duyệt xin đi trễ, về sớm)
POST /api/Att_TAMScanLogRegister/SetRejectInOutInPortal (Hủy duyệt quên chấm công)
POST /api/Att_LeaveDay/SetRejectLeaveDayInPortal (Hủy duyệt nghỉ phép)
POST /api/Att_OvertimePlan/CreateOrUpdateOvertimePlanNew (Đăng ký OT)
POST /api/Att_OvertimePlan/SetApproveOvertimePlanInPortal (Duyệt OT)
POST /api/Att_OvertimePlan/SetRejectOvertimePlanInPortal (Hủy duyệt OT)
POST /api/Att_PregnancyRegister/CreateOrUpdatePregnancy (Đăng ký hưởng chế độ)
POST /api/Att_PregnancyRegister/SetRejectPregnancyRegister (Hủy duyệt hưởng chế độ)
POST //api/Hre_Contract/GetContractByID (Xem hợp đồng)
POST /api/Hre_StopWorking/CreateOrUpdateStopWorking (Tạo/cập nhật đơn xin nghỉ việc)
POST /api/Hre_StopWorking/SetRequestChangeStopWorking (Yêu cầu chỉnh sửa lại đơn nghỉ việc)
POST /api/Hre_StopWorking/SetRejectStopWorking (Hủy duyệt nghỉ việc)
POST /api/Hre_StopWorking/SetApproveStopWorking (Duyệt nghỉ việc)
POST /api/Att_TAMScanLogRegister/SetApproveAndRejectInOutInPortal (Duyệt hoặc hủy duyệt việc chấm công)
POST /api/Hre_Personal/UpdatePersonalInfo (Update thông tin cá nhân)
POST /api/Hre_ProfileWorkList/GetDetailProfileWorkList (Xem chi tiết công việc của 1 user)
POST /api/Hre_ProfileWorkList/CreateOrUpdateProfileWorkList (Thêm công việc)
POST /api/Hre_ProfileWorkList/CreateOrUpdateComment (Tạo/Cập nhật ghi chú công việc)
DELETE /api/Hre_ProfileWorkList/DeleteComment (Xóa ghi chú công việc)
POST /api/Hre_ProfileAPI/New_GetProfileAllNewPortal (Thông tin nhân sự > Quản lý hồ sơ nhân sự)
https://hrm-portal-uat.backendofficetest.vn/my-app/#/human-resources/hr-records/<id>?tabEnum=ProfileInfomation (Xem thông tin của 1 nhân viên khác)
POST /api/Hre_ProfileWorkList/ProcessCompletedProfileWorkList (Hoàn thành công việc)
```

**Cách khắc phục:**  
- Đối với duyệt (duyệt/hủy): tại các api đã có xác thực user thông qua token đang login là có quyền (duyệt/hủy).  
- Đối với đăng ký: tại các api đã có kiểm tra phần body của api không chứa các ProfileID không thuộc về chính user đang login, ngăn chặn đăng ký cho người khác (áp dụng tính năng đăng ký hộ đang tắt). Có kiểm tra danh sách userapprove từ FE đẩy cho server là hợp lệ và đúng theo cấu hình hệ thống.

---

## 12. CWE-284 – Improper Access Control Lead to Account Take Over (HR Main BO)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-284 |
| **Tác động** | HR Main BO |
| **Mức độ** | Critical |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Lỗ hổng cho phép attacker có thể thực hiện các hành vi vượt quyền và có thể chiếm được quyền super admin của hệ thống. Và lỗ hổng tồn tại trên tất cả các API được xác thực bằng trường `.SSO.Cookies.Main`.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
POST /api/Sys_User/
POST /api/SysDataPermission
GET /Sys_User/SysUserInfo/?id=?
```

**Cách khắc phục:**  
Tại api update user `POST /api/Sys_User/` có kiểm tra thêm quyền api cần key quyền màn hình `Sys_User` để truy cập sử dụng api này.

---

## 13. CWE-770 – Allocation of Resources Without Limits or Throttling

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-770 |
| **Tác động** | HR Main BO |
| **Mức độ** | High |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Hệ thống thiếu cơ chế limit response trả về + thiếu validate limit request gửi đi dẫn tới 1 request có thể lấy được toàn bộ thông tin, gây tiêu tốn tài nguyên mạng, treo, DoS.

**Phạm vi ảnh hưởng:**  
Ảnh hưởng đến tính năng đổi cột tại 1 số màn hình dùng những api này (không thể set pagesize quá 50 record).

**API liên quan:**
```
POST /api/Hre_ProfileAPI/New_GetProfileAllNewPortal --> "dataSourceRequestString":"page=&pageSize="
POST /Hre_GetData/GetRequestInfoModelList/ -> pageSize
POST /Hre_GetDataV2/GetListReqDocumentFromRequesstInfo/ -> pageSize
POST /Att_GetData/GetHre_HouseHoldSalaryInformationList
POST /Hre_GetData/GetProfileListKaizen/ -> pageSize
POST /Hre_GetData/GetListProfiles/ -> pageSize
POST /Hre_GetData/GetProfileAllListKaizen/ -> pageSize
POST /Sal_GetData/GetBasicSalary/ -> pageSize
```

**Cách khắc phục:**  
Giới hạn page-size cho 1 số api nhạy cảm. Giới hạn tối đa 50 record, nếu vượt quá 50 record thì tự đặt về 50 record.

---

## 14. CWE-306 – Missing Authentication for Critical Function

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-306 |
| **Tác động** | HR Main BO |
| **Mức độ** | High |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
- 1 số chức năng thiếu cơ chế xác thực, cho phép bất kỳ người dùng ẩn danh nào có thể truy cập, gây lộ lọt thông tin nhân viên.  
- 1 số chức năng download file thiếu cơ chế xác thực, cho phép bất kỳ người dùng ẩn danh nào có thể truy cập, download thông tin dữ liệu.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
GET /Att_GetData/CheckIsExistedCache/?cacheID=<id>
POST /Att_GetData/GetErrorMessageRespone
GET /Downloads/<Tên file>
```

**Cách khắc phục:**  
Đã thêm cơ chế phân quyền cho các api nhạy cảm.

---

## 15. CWE-79 / CWE-97 – Stored XSS (HR Main BO)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-79 / CWE-97 |
| **Tác động** | HR Main BO |
| **Mức độ** | High |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Ứng dụng đang sử dụng Kendo UI framework để xử lý cho các trường nhập input. Phiên bản Kendo UI đang dùng hiện tại cho phép render trực tiếp mã JS độc hại lên browser → Dẫn tới các payload JS độc hại sẽ được thực thi.

**Phạm vi ảnh hưởng:**  
Ảnh hưởng hiệu năng nhưng không đáng kể.

**API liên quan:**
```
POST /Home/SaveTranslate
```

**Cách khắc phục:**  
Đã validate XSS cho api.

---

## 16. CWE-200 – Sensitive Information Disclosure (Lộ IP server)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-200 |
| **Tác động** | HR Main BO |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Ở request hệ thống đang để lộ IP gốc của server.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
POST /api/Att_LateEarlyAllowed
POST /api/Sys_FieldInfoCustom/
```

**Cách khắc phục:**  
Kiểm tra thì đây là public-IP của client.

---

## 17. CWE-840-2 – Business Logic Errors (Nhầm tài khoản khi login bằng email)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-840 |
| **Tác động** | HR Main BO |
| **Mức độ** | High |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Hệ thống thiếu cơ chế validate, dẫn tới nếu update email của userA là username của userB → thì khi userB login sẽ sang tài khoản của userA → khiến ứng dụng hoạt động sai với logic nghiệp vụ.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
POST /api/Sys_User/
```

**Cách khắc phục:**  
Sửa stored procedure, để tự phát hiện đây là loại login theo userlogin hay email, để có thể so sánh WHERE cho đúng tránh case bảo mật nghiệp vụ này.

---

## 18. CWE-212 – Improper Removal of Sensitive Information Before Storage or Transfer

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-212 |
| **Tác động** | HR Main BO |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Lỗ hổng cho phép người dùng có thể view password của toàn bộ user trong hệ thống.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
POST /Sys_GetData/GetUserList
GET /Sys_AttendanceConfig/Create
GET /Sys_User/SysUserInfo/?id=fcd4089f-bcf6-4c6d-abe2-f4952ff3a75e
```

**Cách khắc phục:**  
Lược bỏ đi những thông tin nhạy cảm trong response trả về.

---

## 19. CWE-284 – Improper Access Control (HR Main BO – nhiều API)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-284 |
| **Tác động** | HR Main BO |
| **Mức độ** | High |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Người dùng có thể thực hiện các chức năng ngoài quyền hạn được cấp phát.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
POST /Hre_GetData/CreateTemplate
POST /api/Att_TAMScanLog
POST /api/Sys_FieldInfoCustom/
POST /Hre_GetData/GetFieldInfoCustomByTableName
POST /Att_GetData/GetTAMScanLogList
POST /Sys_GetData/GetAsynTaskList
/Sys_CodeConfig/Sys_ConfigTranslateByKey
POST /Sys_GetData/GetTemplateEmailList
POST /api/Sys_TemplateSendMail/
POST /api/Sys_User/
POST /Sys_GetData/GetUserList
```

**Cách khắc phục:**  
Kiểm tra xác thực bằng key quyền tại các api. Những user thuộc nhóm quyền nào được cấp key quyền tương ứng thì mới được phép truy cập.

---

## 20. CWE-639 / CWE-693 – Authorization Bypass Through User-Controlled Key

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-639 / CWE-693 |
| **Tác động** | HR Main BO |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Lỗ hổng cho phép người dùng không có quyền có thể chỉnh sửa/truy xuất đối tượng dựa trên mã định danh.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
POST /Sys_AutoBackup/RemoveSelected/
POST /Cat_MasterDataGroup/RemoveSelected/
POST /Sys_User/RemoveSelected/
POST /Sys_TemplateSendMail/RemoveSelected/
POST /Sys_HttpClientConfig/RemoveSelected/
POST /Rec_JobVacancy/RemoveSelected/
POST /Cat_AttachmentDownloadConfiguration/RemoveSelected/
POST /Rec_GetData/ProcessCancelJobvacancy/
POST /Rec_CandidateProfile/RemoveSelecteds/
```

**Cách khắc phục:**  
Validate ID truyền vào để chắc rằng người dùng được quyền trên ID này trên 1 api cụ thể.

---

## 21. CWE-20 – Improper Input Validation

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-20 |
| **Tác động** | HR Main BO |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Ứng dụng không kiểm tra đầy đủ nội dung nhập vào từ người dùng dẫn đến sai logic nghiệp vụ, sai thông tin được lưu trữ.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
POST /api/Sys_Common/UploadChunk
POST /api/Cat_Survey/
POST /api/Ins_VoluntaryInsInfo/
POST /api/*/
```

**Cách khắc phục:**  
Tạo danh sách blacklist và whitelist để ngăn dữ liệu độc hại truyền lên server.

---

## 22. CWE-209 – Information Exposure Through an Error Message (HR Main BO)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-209 |
| **Tác động** | HR Main BO |
| **Mức độ** | Low |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Ứng dụng để lộ chi tiết nội bộ (stack trace, đường dẫn code, framework version) qua thông báo lỗi.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
GET /Fin_ApprovedPurchaseRequest/DetailPurchaseRequest
POST /Sys_GetData/GetListProfiles/
```

**Cách khắc phục:**  
Cấu hình trên môi trường prod thì không show chi tiết lỗi.

---

## 23. CWE-79 / CWE-97 – XSS (Cross-site Scripting qua SaveTranslate)

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-79 / CWE-97 |
| **Tác động** | HR Main BO |
| **Mức độ** | Medium |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Lỗi XSS qua việc chèn JS.

**API liên quan:**
```
POST /Home/SaveTranslate
```

**Cách khắc phục:**  
Kiểm tra và chặn các dấu hiệu có chứa XSS để validate trước khi vào api.

---

## 24. CWE-89 – SQL Injection

| Trường | Nội dung |
|---|---|
| **Mã lỗ hổng** | CWE-89 |
| **Tác động** | HR Main BO |
| **Mức độ** | Critical |
| **Trạng thái** | Đã đóng / Bỏ qua |

**Mô tả:**  
Ứng dụng cho phép Query SQL tùy ý, attacker có thể lợi dụng để truy vấn toàn bộ cơ sở dữ liệu hệ thống.

**Phạm vi ảnh hưởng:**  
Không ảnh hưởng.

**API liên quan:**
```
POST /api/Sys_PivotTable/
```

**Cách khắc phục:**  
- Tại Api này chỉ cho phép các query chỉ chứa tên của stored procedure.  
- Chỉ cho phép 1 tài khoản là super admin được phép vào api này.  
- Lọc các query SQL có chứa từ khóa nguy hiểm: `update, create, delete, drop, select, ...`

---

## Tổng hợp theo mức độ

| Mức độ | Số lượng |
|---|---|
| Critical | 4 (CWE-269, CWE-284 Account Takeover, CWE-89 SQLi, CWE-284 Privilege Escalation BO) |
| High | 6 (CWE-284 Employee, CWE-770, CWE-306, CWE-79 BO, CWE-840-2, CWE-284 BO nhiều API) |
| Medium | 10 |
| Low | 4 |

## Tổng hợp theo trạng thái

| Trạng thái | Số lượng |
|---|---|
| Đã đóng / Bỏ qua | 23 |
| Đang xử lý | 1 (CWE-598 Identity) |
| Mới phát hiện | 1 (CWE-926 Mobile) |
