![](Sys_TaiLieuHeThong_01_image1.png)

<u>Document History</u>

| **Date** | **Revision** | **Description** | **PIC** |
|:--:|:--:|----|----|
| 25-05-2016 | 1.0.0.1 | Tạo Menu word | Tung.Ly |
| 28-05-2016 | 1.0.0.2 | Phân quyền dữ liệu NV và ứng viên | Tung.Ly |
| 06-02-2018 | 1.0.0.2 | Hướng dẫn cấu hình chức năng quên mật khẩu | Ngan.Nguyen |

<u>Nội Dung - Content</u>

[TÀI LIỆU YÊU CẦU DỰ ÁN – [1](#_Toc407693598)](#_Toc407693598)

[VNRESOURCE HRM PRO 8 [1](#_Toc407693599)](#_Toc407693599)

[MODULE HỆ THỐNG [1](#_Toc166228963)](#_Toc166228963)

[1. Cấu Trúc DB [3](#câu-truc-db)](#câu-truc-db)

[1.1 Sys_UserInfo [3](#sys_userinfo)](#sys_userinfo)

[1.2 Sys_Resource [4](#sys_resource)](#sys_resource)

[1.3 Sys_ResourceAll [4](#sys_resourceall)](#sys_resourceall)

[1.4 Sys_Group [5](#sys_group)](#sys_group)

[1.5 Sys_GroupPermission2 [5](#sys_grouppermission2)](#sys_grouppermission2)

[1.6 Sys_DataPermission [6](#sys_datapermission)](#sys_datapermission)

[1.7 Sys_AllSetting [7](#sys_allsetting)](#sys_allsetting)

[1.8 Sys_UserApprove [8](#sys_userapprove)](#sys_userapprove)

[2. Mô Hình UML [9](#mô-hình-uml)](#mô-hình-uml)

[2.1 System Class Diagram [9](#system-class-diagram)](#system-class-diagram)

[2.2 System Module Use Case Diagram (Tổng Quát) [10](#system-module-use-case-diagram-tông-quat)](#system-module-use-case-diagram-tông-quat)

[2.2.1 Create Group Permission [11](#create-group-permission)](#create-group-permission)

[2.2.2 Update Resource [12](#update-resource)](#update-resource)

[2.2.3 Create And Permiss for user [12](#create-and-permiss-for-user)](#create-and-permiss-for-user)

[2.2.4 Check Permission [13](#check-permission)](#check-permission)

[2.2.5 Check Permission Visible Menu [13](#check-permission-visible-menu)](#check-permission-visible-menu)

[2.2.6 Get Permissions [14](#get-permissions)](#get-permissions)

[2.2.7 Approve (Phê duyệt chức năng) [14](#approve-phê-duyêt-chưc-năng)](#approve-phê-duyêt-chưc-năng)

[2.3 System Activity Diagram [15](#system-activity-diagram)](#system-activity-diagram)

[2.3.1 Cập Nhật Tài Nguyên [15](#cập-nhật-tài-nguyên)](#cập-nhật-tài-nguyên)

[2.3.2 Thêm Quyền Cho Nhiều User Cùng Lúc [16](#thêm-quyền-cho-nhiều-user-cùng-lúc)](#thêm-quyền-cho-nhiều-user-cùng-lúc)

[2.3.3 Phân Quyền Tài Nguyên [17](#phân-quyền-tài-nguyên)](#phân-quyền-tài-nguyên)

[2.3.4 Phân Quyền dữ liệu nhân viên [18](#phân-quyền-dữ-liệu-nhân-viên)](#phân-quyền-dữ-liệu-nhân-viên)

[2.3.4.1 Dữ liệu phòng ban đã phân quyền [18](#dữ-liệu-phòng-ban-đã-phân-quyền)](#dữ-liệu-phòng-ban-đã-phân-quyền)

[2.3.4.2 Phân quyền dữ liệu nhân viên [19](#phân-quyền-dữ-liệu-nhân-viên-1)](#phân-quyền-dữ-liệu-nhân-viên-1)

[2.3.5 Phân Quyền dữ liệu ứng viên [20](#phân-quyền-dữ-liệu-ứng-viên)](#phân-quyền-dữ-liệu-ứng-viên)

[2.3.5.1 Dữ liệu ứng viên đã phân quyền [20](#dữ-liệu-ứng-viên-đã-phân-quyền)](#dữ-liệu-ứng-viên-đã-phân-quyền)

[2.3.5.2 Phân Quyền dữ liệu ứng viên [21](#phân-quyền-dữ-liệu-ứng-viên-1)](#phân-quyền-dữ-liệu-ứng-viên-1)

[2.3.5.3 Enum Gởi Mail [22](#enum-gởi-mail)](#enum-gởi-mail)

[2.3.5.4 Ý nghĩa các key trong webconfig [23](#ý-nghĩa-các-key-trong-webconfig)](#ý-nghĩa-các-key-trong-webconfig)

[2.3.5.5 Use Case (khảo sát hiện trạng) [29](#use-case-khảo-sát-hiện-trạng)](#use-case-khảo-sát-hiện-trạng)

[Ca sử dụng bảo mật hệ thống tổng quát [29](#ca-sử-dụng-bảo-mật-hệ-thống-tổng-quát)](#ca-sử-dụng-bảo-mật-hệ-thống-tổng-quát)

[Ca sử dụng bảo mật hệ thống đăng nhập [30](#ca-sử-dụng-bảo-mật-hệ-thống-đăng-nhập)](#ca-sử-dụng-bảo-mật-hệ-thống-đăng-nhập)

[Ca sử dụng bảo mật hệ thống khi thay đổi mật khẩu [33](#ca-sử-dụng-bảo-mật-hệ-thống-khi-thay-đổi-mật-khẩu)](#ca-sử-dụng-bảo-mật-hệ-thống-khi-thay-đổi-mật-khẩu)

[Màn hình cấu hình bảo mật [36](#màn-hình-cấu-hình-bảo-mật)](#màn-hình-cấu-hình-bảo-mật)

[2.3.5.6 Chức năng quên mật khẩu [37](#chức-năng-quên-mật-khẩu)](#chức-năng-quên-mật-khẩu)

[Cấu trúc dữ liệu [44](#cấu-trúc-dữ-liệu)](#cấu-trúc-dữ-liệu)

[Luồng xử lý [45](#luồng-xử-lý)](#luồng-xử-lý)

[Xử lý đăng nhập bảo mật hệ thống [45](#xử-lý-đăng-nhập-bảo-mật-hệ-thống)](#xử-lý-đăng-nhập-bảo-mật-hệ-thống)

[Xử lý thay đổi mật khẩu (bảo mật hệ thống) [46](#xử-lý-thay-đổi-mật-khẩu-bảo-mật-hệ-thống)](#xử-lý-thay-đổi-mật-khẩu-bảo-mật-hệ-thống)

[Xử lý reset mật khẩu [47](#xử-lý-reset-mật-khẩu)](#xử-lý-reset-mật-khẩu)

# Cấu Trúc DB

## Sys_UserInfo

**Sys_UserInfo**

| Tên hiển thị | Tên field | Kiểu dữ liệu | Khoá Ngoại | Diễn giải |
| --- | --- | --- | --- | --- |
| Not null | UserInfoName | NVARCHAR(100) |  |  |
|  | UserLogin | NVARCHAR(50) |  | Tên đăng nhập |
|  | Password | VARCHAR(100) |  |  |
|  | FullName | NVARCHAR(200) |  |  |
|  | OrgStructureID | Uniqueidentifier | Cat_OrgStructure |  |
|  | ProfileID | Uniqueidentifier | Hre_Profile |  |
| Not null | IsActivate | bit |  |  |
|  | Email | Varchar(100) |  |  |
|  | UserGroupID | Uniqueidentifier |  | Chưa sử dụng |
|  | SurveyID | Uniqueidentifier |  |  |
|  | UserType | Varchar(50) |  |  |
|  | DateChangePasssword | DateTime |  |  |
|  | DateStart | DateTime |  |  |
|  | DateEnd | DateTime |  |  |
|  | DatePasswordExpired | DateTime |  |  |
|  | Code | Nvarchar(32) |  |  |
|  | IsCheckLDAP | bit |  |  |
|  | LDAPDatasource | Varchar(1000) |  |  |
|  | IsPortal | bit |  |  |
|  | LdapConfigID | Uniqueidentifier | Sys_LdapConfig |  |

## Sys_Resource

**Sys_Resource**

| Tên hiển thị | Tên field | Kiểu dữ liệu | Khoá Ngoại | Diễn giải |
| --- | --- | --- | --- | --- |
|  | ResourceName | Nvarchar(100) |  |  |
|  | Category | Nvarchar(100) |  | Tên Module |
|  | Notes | Nvarchar(200) |  |  |
|  | Code | Nvarchar(32) |  |  |
|  | ResourceType | Nvarchar(50) |  | MetaData,Other |
|  | ModuleName | Nvarchar(50) |  | Tên Module |

## Sys_ResourceAll

**Sys_ResourceAll**

| Tên hiển thị | Tên field | Kiểu dữ liệu | Khoá Ngoại | Diễn giải |
| --- | --- | --- | --- | --- |
|  | ResourceName | Nvarchar(100) |  |  |
|  | Category | Nvarchar(100) |  | Tên Module |
|  | Notes | Nvarchar(200) |  |  |
|  | Code | Nvarchar(32) |  |  |
|  | ResourceType | Nvarchar(50) |  | MetaData,Other |
|  | ModuleName | Nvarchar(50) |  | Tên Module |
|  | IsUsed | Bit |  | Đang sử dụng |
|  |  |  |  |  |

## Sys_Group

**Sys_Group**

| Tên hiển thị | Tên field | Kiểu dữ liệu | Khoá Ngoại | Diễn giải |
| --- | --- | --- | --- | --- |
|  | GroupName | Nvarchar(200) |  |  |
|  | Notes | Nvarchar(500) |  |  |
|  | Code | Nvarchar(32) |  |  |
|  | IsActivate | Bit |  |  |

## Sys_GroupPermission2

**Sys_GroupPermission2**

| Tên hiển thị | Tên field | Kiểu dữ liệu | Khoá Ngoại | Diễn giải |
| --- | --- | --- | --- | --- |
|  | GroupID | Uniqueidentifier | Sys_Group |  |
|  | Code | Nvarchar(32) |  |  |
|  | ResourceID | Uniqueidentifier | Sys_Resource |  |
|  | PrivilegeNumber | int |  | Quyền View,Create,edit,Delete, export, import, create Template, change column |

## Sys_DataPermission

**Sys_DataPermission**

| Tên hiển thị | Tên field | Kiểu dữ liệu | Khoá Ngoại | Diễn giải |
| --- | --- | --- | --- | --- |
|  | Code | Nvarchar(50) |  |  |
| Not null | GroupID | Uniqueidentifier | Sys_Group |  |
|  | Branches | Image |  | orderNumber đã mã hóa thành byte |
|  | DataGroups | Image |  |  |
|  | DataGroup | Nvarchar(2000) |  |  |
|  | OrgStructure | varchar(8000) |  | orderNumber |
| Not null | UserID | Uniqueidentifier | Sys_UserInfo |  |
|  | EmployeeType | Varchar(4000) |  |  |
|  | WorkPlace | Varchar(4000) |  |  |
|  | IsNotCheckPermisstion | bit |  |  |
|  | Position | Varchar(4000) |  |  |
|  | SalaryClass | Varchar(4000) |  |  |
|  | EmployeeStatus | Varchar(4000) |  |  |
|  | GradePayroll | Varchar(4000) |  |  |
|  | GradeAttendance | Varchar(4000) |  |  |
|  | PayrollGroup | Varchar(4000) |  |  |
|  | Operator | Nvarchar(50) |  |  |
|  | OperatorField | Varchar(200) |  |  |
|  | CodeBranch | Varchar(4000) |  |  |
|  | Unit | Varchar(8000) |  |  |
|  | OrgStructureExtends | Varchar(8000) |  | Thêm order number phòng ban |
|  | ContractType | Varchar(4000) |  |  |
|  | JobTitle | Varchar(4000) |  |  |

## Sys_AllSetting

**Sys_AllSetting**

| Tên hiển thị | Tên field | Kiểu dữ liệu | Khoá Ngoại | Diễn giải |
| --- | --- | --- | --- | --- |
|  | Name | Nvarchar(150) |  |  |
|  | Value1 | Nvarchar(500) |  |  |
|  | Value2 | Nvarchar(150) |  |  |
|  | Value3 | Nvarchar(4000) |  |  |
|  | Value4 | Nvarchar(4000) |  |  |
|  | ModuleName | Nvarchar(150) |  |  |
|  | UserID | Uniqueidentifier |  |  |

## Sys_UserApprove

**Sys_UserApprove**

| Tên hiển thị | Tên field | Kiểu dữ liệu | Khoá Ngoại | Diễn giải |
| --- | --- | --- | --- | --- |
|  | Code | Nvarchar(32) |  |  |
|  | UserApproveID | Uniqueidentifier | Sys_UserInfo |  |
|  | OrgStructureID | Uniqueidentifier | Cat_OrgStructure |  |
|  | Type | Varchar(50) |  |  |
|  | Notes | Nvarchar(500) |  |  |
|  | PermistionType | Varchar(50) |  |  |
|  | IsMasterApprove | bit |  |  |
|  | IsNoGetMail | bit |  |  |
|  | IsAllowApproveMySelf | bit |  |  |
|  | CurrentStatus | Nvarchar(150) |  |  |
|  | UserRequestID | Uniqueidentifier | Sys_UserInfo |  |
|  |  |  |  |  |

# Mô Hình UML

1.  

## System Class Diagram

![](Sys_TaiLieuHeThong_01_image2.png)

## System Module Use Case Diagram (Tổng Quát)

![](Sys_TaiLieuHeThong_01_image3.png)

### Create Group Permission

![](Sys_TaiLieuHeThong_01_image4.png)

| Tên Use Case | Phân Nhóm Quyền |
| --- | --- |
| Actors | Admin |
| Mô Tả | Phân nhóm quyền sử dụng 1 số tài nguyên (sau này dùng nhóm này để phân quyền cho user) |
| Đầu Vào | Phải đăng nhập vào hệ thống với quyền super admin hoặc quyền user được phép thực hiện chức năng phân quyền |
| Kết Quả | Success: Tạo nhóm quyền thành công Fail: xuất thông báo không tạo được nhóm quyền hoặc cập nhật tài nguyên thất bại |
| Ngoại Lệ |  |
| Kịch Bản | Biểu diễn bằng biểu đồ trình tự đặc biệt gọi là biểu đồ trình tự hệ thống |

Kịch Bản Phân Nhóm Quyền (Biểu đồ trình tự hệ thống)

Các Qui Tắt(R) :

### Update Resource

![](Sys_TaiLieuHeThong_01_image6.png)

### Create And Permiss for user

![](Sys_TaiLieuHeThong_01_image7.png)

### Check Permission

![](Sys_TaiLieuHeThong_01_image8.png)

### Check Permission Visible Menu

![](Sys_TaiLieuHeThong_01_image9.png)

### Get Permissions

![](Sys_TaiLieuHeThong_01_image10.png)

### Approve (Phê duyệt chức năng)

![](Sys_TaiLieuHeThong_01_image11.png)

## System Activity Diagram

## Cập Nhật Tài Nguyên

![](Sys_TaiLieuHeThong_01_image12.png)

## Thêm Quyền Cho Nhiều User Cùng Lúc

![](Sys_TaiLieuHeThong_01_image13.png)

## Phân Quyền Tài Nguyên

![](Sys_TaiLieuHeThong_01_image14.png)

## Phân Quyền dữ liệu nhân viên

## Dữ liệu phòng ban đã phân quyền

![](Sys_TaiLieuHeThong_01_image15.png)

## Phân quyền dữ liệu nhân viên

![](Sys_TaiLieuHeThong_01_image16.png)

## Phân Quyền dữ liệu ứng viên

## Dữ liệu ứng viên đã phân quyền

![](Sys_TaiLieuHeThong_01_image17.png)

## Phân Quyền dữ liệu ứng viên

![](Sys_TaiLieuHeThong_01_image18.png)

## Enum Gởi Mail

**Enum Gởi Mail**

| Mã Phần Tử | Tên Phần Tử | Các Enum |
| --- | --- | --- |
| E_NOTIFYRESETPASSWORD | Thông Báo Reset Password | E_Password E_UserInfoName E_UserLogin |
| E_Confirm_Reset_Password | Hệ thống Xác nhận quên mật khẩu đăng nhập | E_UserInfoName E_UserLogin E_ConfirmedMailLink |
| E_NOTIFYUSERPASS | Thông báo thay đổi mật khẩu | Tên người dùng: E_UserInfoName Tên đăng nhập: E_UserLogin Mật khẩu: E_Password Link main : E_Main Link portal: E_Portal |
| Link confirm theo dạng : http://192.168.1.3:2700/E_ConfirmedMailLink |  |  |
| Lưu ý: các mã phần tử không được có khoảng trắng |  |  |

![](Sys_TaiLieuHeThong_01_image19.png)

## Ý nghĩa các key trong webconfig

**Keys trong webconfig**

| Key | Ý nghĩa/ Ghi chú |
| --- | --- |
| Hrm_Main_Web | url của web main |
| <add key="Hrm_Main_Web" value="http://192.168.1.212/"/> |  |
| Hrm_Hre_Service | Url của HR service |
| <add key="Hrm_Hre_Service" value="http://192.168.1.212:1000/" /> |  |
| Hrm_Sys_Service | Url của System service |
| <add key="Hrm_Sys_Service" value="http://192.168.1.212:2000/" /> |  |
| IsEncryptData | Mã hóa dữ liệu |
| <add key="IsEncryptData" value="True" /> |  |
| reCaptchaPublicKey | Recapchar Public |
| <add key="reCaptchaPublicKey" value="6LcNnxYUAAAAAG6Peqwo8CqqNUlFuhcvnNOa8DoA" /> |  |
| reCaptchaPrivateKey | Recapchar Private |
| <add key="reCaptchaPrivateKey" value="6LcNnxYUAAAAACBmFDyw2_c25GAb6QW3KIsgGJF8" /> |  |
| UserName | Tên đăng nhập superadmin |
| <add key="UserName" value="123" /> |  |
| Password | Mật khẩu superadmin |
| <add key="Password" value="202cb962ac59075b964b07152d234b70" /> |  |
| UserLoginName | User đăng nhập full quyền đại diện superadmin |
| <add key="UserLoginName" value="hanh.nguyen"/> |  |
| UserId | UserID của userLoginName trong bảng sys_UserInfo (đại diện superadmin) |
| <add key="UserId" value="BB12B2A7-9EC5-4780-A2BD-703009F7C254"/> |  |
| SessionTimeOut | Timeout session (phút), thời gian tự hủy session |
| <add key="SessionTimeOut" value="1000" /> |  |
| IsAudit |  |
| <add key="IsAudit" value="False" /> |  |
| TimeExpireToken | Timeout token (phút) |
| <add key="TimeExpireToken" value="3" /> |  |
| Hrm_Sys_Warning_Speed | Tốc độ cảnh báo kết nối mạng |
| <add key="Hrm_Sys_Warning_Speed" value="301" /> |  |
| Hrm_Sys_IsCheckNetwork | Hiển thị kết nối mạng |
| <add key="Hrm_Sys_IsCheckNetwork" value="true" /> |  |
| LogFolders | Thư mục log |
| <add key="LogFolders" value="HRM.Presentation.WindowsService\bin\Debug\Log" /> |  |
| Format_Decimal_Number | Số lẻ sau số thập phân |
| <add key="Format_Decimal_Number" value="2"/> |  |
| Format_Decimal_Money | Số lẻ sau số tiền |
| <add key="Format_Decimal_Money" value="2"/> |  |
| UploadURL | Đường dẫn upload |
|  |  |
| TemplateURL | Đường dẫn template |
|  |  |
| IsLdapSignIn | Login bằng ldap |
| <add key="IsLdapSignIn" value="false"/> |  |
| LdapSignInSource |  |
| <add key="LdapSignInSource" value="@thaco.com.vn, @vinamazda.vn, @dqmcorp.vn,"/> |  |
| ProfileID |  |
|  |  |
| OnlyGoogleSignIn | bool |
| <add key="OnlyGoogleSignIn" value="false"/> |  |
| IsGoogleSignIn | bool |
| <add key="IsGoogleSignIn" value="false"/> |  |
| ModeProfilerLog | Ghi log request ALL : ghi log tất cả request None(mặc định nếu không cấu hình): tắt tính năng ghi log Error: chỉ ghi log các request lỗi (status khác 200) |
| <add key="ModeProfilerLog" value="ALL" /> |  |
| maxUrlLength maxQueryStringLength maxRequestLength | Dung lượng tối đa upload file (Đơn vị MB) |
| <httpRuntime targetFramework="4.6.2" maxUrlLength="32766" maxQueryStringLength="2097151" maxRequestLength="2097151" requestValidationMode="2.0" relaxedUrlToFileSystemMapping="true" /> |  |
| Keys trong webconfig Portal |  |
| Key | Ý nghĩa/ Ghi chú |
| reCaptchaPublicKey | Captcha public key |
| <add key="reCaptchaPublicKey" value="6LcNnxYUAAAAAG6Peqwo8CqqNUlFuhcvnNOa8DoA" /> |  |
| reCaptchaPrivateKey | Captcha private key |
| <add key="reCaptchaPrivateKey" value="6LcNnxYUAAAAACBmFDyw2_c25GAb6QW3KIsgGJF8" /> |  |
| Portal_Permission |  |
|  |  |
| Hrm_Main_Web | url của web main |
| <add key="Hrm_Main_Web" value="http://localhost:6100/" /> |  |
| Hrm_Hre_Service | url của web hre service |
| <add key="Hrm_Hre_Service" value="http://localhost:4000/" /> |  |
| Hrm_Sys_Service | url của web system service |
| <add key="Hrm_Sys_Service" value="http://localhost:5000/" /> |  |
| Hrm_EmpPortal_Web | url của web portal |
| <add key="Hrm_EmpPortal_Web" value="http://localhost:6200/" /> |  |
| IsGoogleSignIn | Đăng nhập bằng google |
| <add key="IsGoogleSignIn" value="false" /> |  |
| GoogleClientID |  |
| <add key="GoogleClientID" value="124692086234-v6i7j0eutmc53sc9mfmotdpvljbitj5q.apps.googleusercontent.com" /> |  |
| SupperAdmin |  |
| <add key="SupperAdmin" value="nam.hoang" /> |  |
| NewPortal |  |
| <add key="NewPortal" value="true" /> |  |
| UseLanguage | Sử dụng ngôn ngữ |
| <add key="UseLanguage" value="VN,EN" /> |  |
| ModeProfilerLog | Ghi log |
| <add key="ModeProfilerLog" value="ALL" /> |  |
| SM_HomeLink |  |
| <add key="SM_HomeLink" value="https://uat-vnresource.savemoney.vn/" /> |  |
| SessionTimeOut | Timeout session (phút) : thời gian portal tự động hủy session |
| <add key="SessionTimeOut" value="15" /> |  |
|  |  |
|  |  |

Tất cả keys config

ProjectName

UploadURL

TemplateURL

Uploads

ScriptPath

StorePath

DownloadURL

UseDataBaseName

CompanyName

LicenseKey

VnrConnectionString

UserName

UserLoginName

UserId

Password

ProfileID

OnlyGoogleSignIn

IsGoogleSignIn

IsLdapSignIn

isLdapSignIn2Class

GoogleClientID

ClientID

SessionTimeOut

appSettings

connectionStrings

HRM_VersionBuild_Api

Survey_Endpoint_Api

Chat_Endpoint_Socket

Chat_Endpoint_Api

Hrm_Sys_NewsOutLink

UseLanguageMain

Hrm_Chat_Api

Hrm_Chat_Web

UseLanguage

NewPortal

Hrm_ServiceHr_Web

SupperAdmin

reCaptchaPrivateKey

reCaptchaPublicKey

Hrm_Main_Web

Hrm_Sys_Service

Hrm_Sys_Service_Local

Hrm_Sys_Warning_Speed

Hrm_Sys_IsCheckNetwork

TimeExpireToken

eWebUrl

Hrm_Hre_Service

Hrm_Hre_Service_Local

SM_HomeLink

Hrm_EFY_Web

Hrm_Output_Data_Uri

Hrm_Main_Web_Local

Hrm_Att_Service_Path_Report

Hrm_StaffPortal_Web

Hrm_EmpPortal_Web

Hrm_Dyna_Report

Hrm_Sal_ElementName_Comission

Portal_Permission

Hrm_RecNew_Web

Hrm_Rec_WebV2

Hrm_WebServices

Hrm_Api_Service

SettingThemeID

UserLogin

LanguageCode

PageSize

Hrm_WebServiceInsSal

KeyTimeOut

IsWriteLogApi

IsAuthenticated

IsRecruimentWebService

IsRecruimentWebSal

IsEncryptData

IsEncryptDataProfile

IsDisbleRealWorkDayCount

Home_Index_LanguageChange

IsHiddenGridSort

MongoDB_Chat_Host

MongoDB_Chat_Port

MongoDB_Chat_DatabaseName

MongoDB_Chat_UserName

MongoDB_Chat_Password

IsValueField

HRM_SYS_USERSETTING_LANGUAGE_API

IsLoadIframeNewLayout

IsAudit

LdapSignInSource

New_Layout

Format_Decimal_Number

Format_Decimal_Money

NotifyServerToken_FCM

NotifyServerLink_FCM

UseRedisServer

UseHtmlEncode

SsoVtcEnable

ModeProfilerLog

AllowAnonymousRequest

UseOldLayout

SsoVtcSecret

SsoVtcServer

SsoVtcClientID

LogFolders

IsSettingColor

New_Tab_Attendance_TamScanApp_Portal

Att_WorkDayDetail_Portal_Mobile

HRM_Tab_Attendance_AnnualDetail_Portal_Mobile

New_Attendance_CompensationDetail_Portal

New_Attendance_RemainingLeave_Portal

New_Attendance_ChildCareCompensation_Portal

New_Attendance_AnnualMenses_Portal

New_Attendance_AttendanceTableDetail_Portal

New_Personal_New_InstantFeedbackSendToMe_Portal

New_Personal_New_InstantFeedbackCreatedByMe_Portal

IsCheckPermissionEdit

## Use Case (khảo sát hiện trạng)

### Ca sử dụng bảo mật hệ thống tổng quát

![](Sys_TaiLieuHeThong_01_image20.png)

### Ca sử dụng bảo mật hệ thống đăng nhập

![](Sys_TaiLieuHeThong_01_image21.png)

#### Mục đích

- Đảm bảo hệ thống đăng nhập an toàn khi đăng nhập

#### Tóm lượt

- Sau khi đã cấu hình bảo mật , người dùng đăng nhập , hệ thống sẽ kiểm tra xem có người dùng đã đăng nhập từ máy tính khác chưa , kiểm tra xem người dùng đã bị khóa hay chưa , kiểm tra mật khẩu đã hết hạn.

#### Tác nhân 

- **Người dùng** (phân quyền cho người dùng)

- **Super Admin** (sử dụng toàn bộ hệ thống)

#### Điều kiện đầu vào 

- Người dùng thao tác đăng nhập

- Đã cấu hình cho phép bảo mật hệ thống

#### Điều kiện đầu ra

- Truy xuất vào trang chủ

- Trang thay đổi thay mật khẩu

#### Kịch bản chính 

![](Sys_TaiLieuHeThong_01_image22.png)

### Ca sử dụng bảo mật hệ thống khi thay đổi mật khẩu

![](Sys_TaiLieuHeThong_01_image23.png)

#### Mục đích

- Đảm bảo hệ thống thay đổi mật khẩu một cách bảo mật (kí tự bảo mật phải có hoa thường, có số, có ký tự đặc biệt, không được thay đổi mật khẩu trước đó

#### Tóm lượt

- Sau khi đã cấu hình bảo mật , người dùng thay đổi mật khẩu phải thoải các tiêu chí

  - Phải có chữ hoa và chữ thường

  - Phải có ký tự số

  - Phải có ký tự đặt biệt

  - Số ký tự tối thiểu

  - Không cho thay đổi mật khẩu trùng với những mật khẩu trước đó

#### Tác nhân 

- **Người dùng** (phân quyền cho người dùng)

- **Super Admin** (sử dụng toàn bộ hệ thống)

#### Điều kiện đầu vào 

- Thay đổi mật khẩu một người dùng

- Đã cấu hình cho phép bảo mật hệ thống

#### Điều kiện đầu ra

- Thông báo thay đổi thay mật khẩu

####  Kịch bản chính 

![](Sys_TaiLieuHeThong_01_image24.png)

### Màn hình cấu hình bảo mật

Danh sách tính năng có thể cấu hình

- Capcha đăng nhập: Khi đăng nhập cần phải hoàn thành capcha thì mới đăng nhập được. Hiện tại đang sử dụng capcha google

- Bắt buộc thay đổi pass mật khẩu lần đầu: Sau khi tạo mới tài khoản User đăng nhập lần đầu phải thay đổi mật khẩu.

- Thay đổi mật khẩu theo chu kỳ (ngày): Kể từ lần đổi mật khẩu gần nhất thì cách bao nhiều ngày bắt buộc User phải đổi mật khẩu.

- Thời gian cảnh báo gần hết hạn mật khẩu (ngày): Cảnh báo cho User biết sắp đến ngày bắt buộc đổi mật khẩu.

- Chiều dài tối thiểu của mật khẩu

- Số chữ số tối thiểu (kí tự)

- Số ký tự đặc biệt tối thiểu

- Số lần nhập sai mật khẩu TK bị khóa: Đăng nhập sai nhiều lần tài khoản sẽ bị khóa

- Số phút tạm khóa: cấu hình thời tạm khóa hoặc bỏ trống thì khóa luôn

<!-- -->

- Giao diện tiếng Việt

![](Sys_TaiLieuHeThong_01_image25.png)

Các quy định mật khẩu sẽ được apply là:

- User lần đầu đăng nhập bắt buộc phải thay đổi mật khẩu

- Mật khẩu bắt buộc phải có ký tự Hoa và chữ Thường

- Độ dài mật khẩu phải từ 8 ký tự

- Bắt buộc phải có ít nhất 1 ký tự số

- Bắt buộc phải có ít nhất 1 ký tự đặc biệt

- Nếu User đăng nhập sai 5 lần sẽ bị khóa

Để bắt buộc tất cả User phải thay đổi mật khẩu thì có cách:

- Bước 1: Sử dụng thêm cấu hình đổi mật khẩu theo chu kỳ

- Bước 2: Update toàn bộ dữ liệu 2 cột **DateChangePasssword **và **DatePasswordExpired **về giá trị ngày nhỏ hơn ngày hiện tại.

- Bước 3: (Ở bước này nếu KH muốn sử dụng cấu hình bảo mật này thì không cần làm)

  - Hỗ trợ để sau khi tất cả User đổi mật khẩu hết thì bỏ cấu hình này.

  - Cách làm thì có thể đựa theo ngày đổi mật khẩu để lấy được danh sách các User chưa chịu đổi mật khẩu sau đó thông báo email

##  Chức năng quên mật khẩu

1.  **Cách để vào màn hình quên mật khẩu**

![](Sys_TaiLieuHeThong_01_image26.png)

2.  **Quá trình gửi mail xác nhận quên mật khẩu**

*Step 1: Điền thông tin để khôi phục mật khẩu*

![](Sys_TaiLieuHeThong_01_image27.png)

*Step 2: Xác nhận link khôi phục password trong email*

![](Sys_TaiLieuHeThong_01_image28.png)

*Step 3: Nhận được thông báo thành công*

![](Sys_TaiLieuHeThong_01_image29.png)

*Step 4: Kiểm tra email lần 2 để nhận mật khẩu mới*

![](Sys_TaiLieuHeThong_01_image30.png)

3.  **Hướng dẫn tạo template**

Chức năng khôi phục mật khẩu bao gồm 2 template

1)  *Template Hệ thống Xác nhận quên mật khẩu đăng nhập*

Vào Trang chủ-\> Hệ thống-\> Mẫu gửi mail để tạo mẫu cho email xác nhận quên mật khẩu.

![](Sys_TaiLieuHeThong_01_image31.png)

Nội dung Template (bảng mẫu) gồm có 3 Enum sau:

![](Sys_TaiLieuHeThong_01_image32.png)

2)  *Template Thông Báo Reset Mật Khẩu*

Vào Trang chủ-\> Hệ thống-\> Mẫu gửi mail để tạo template cho email reset mật khẩu.

![](Sys_TaiLieuHeThong_01_image33.png)

Nội dung Template:

![](Sys_TaiLieuHeThong_01_image34.png)

4.  **Các sự cố khi quê mật khẩu**

    1.  *Sai UserName*

> ![](Sys_TaiLieuHeThong_01_image35.png)

2.  *Sai Email*

![](Sys_TaiLieuHeThong_01_image36.png)

3.  *Không nhập captcha xác nhận khi đăng nhập.*

4.  *Không nhấn Link xác nhận email quên mật khẩu:*

Khi không nhấn link xác nhận từ email xác nhận hệ thống sẽ không gửi lại email reset password.

Password sẽ không được khôi phục.

##  Cấu trúc dữ liệu

![](Sys_TaiLieuHeThong_01_image37.png)

##  Luồng xử lý

### Xử lý đăng nhập bảo mật hệ thống

![](Sys_TaiLieuHeThong_01_image38.png)

###  Xử lý thay đổi mật khẩu (bảo mật hệ thống)

![](Sys_TaiLieuHeThong_01_image39.png)

### Xử lý reset mật khẩu

![](Sys_TaiLieuHeThong_01_image40.png)

**Mô tả quy trình reset mật khẩu:**

Dưới đây là bảng mô tả các bước trong quy trình reset mật khẩu cho người dùng, bao gồm mỗi bước và mô tả chi tiết của nó:

| Bước trong Flowchart | Mô tả |
|----|----|
| Bắt đầu (Start) | Bước khởi đầu của quy trình. |
| Chọn nhân viên và reset mật khẩu | Người dùng chọn nhân viên cần reset mật khẩu. |
| Reset mật khẩu | Thực hiện việc reset mật khẩu cho nhân viên đã chọn. |
| Kiểm tra mẫu mail | Kiểm tra xem có mẫu mail reset mật khẩu sẵn có không. |
| Mẫu mail có sẵn (Có) | Nếu có mẫu mail, tiến hành kiểm tra email của người dùng để gửi mật khẩu mới. |
| Mẫu mail không có (Không) | Nếu không có mẫu mail, hiển thị thông báo lỗi. |
| Kiểm tra email người dùng | Kiểm tra xem người dùng đã có email hay chưa. |
| Có email | Nếu có email, gửi mail reset mật khẩu. |
| Không có email | Nếu không có email, lấy email từ thông tin của nhân viên. |
| Lấy email từ nhân viên | Kiểm tra email nhân viên. Nếu có, tiếp tục gửi mail reset. Nếu không, hiển thị thông báo lỗi. |
| Nhận mail và link khôi phục mật khẩu | Người dùng nhận mail và link khôi phục mật khẩu. |
| Tạo mật khẩu mới ngẫu nhiên | Tạo mật khẩu mới cho người dùng. |

Quy trình này giúp đơn giản hóa việc reset mật khẩu cho người dùng và đảm bảo an toàn thông tin cá nhân, hỗ trợ người dùng trong việc nhanh chóng khôi phục quyền truy cập vào tài khoản một cách an toàn
