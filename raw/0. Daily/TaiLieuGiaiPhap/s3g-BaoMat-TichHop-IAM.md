---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, bao-mat, iam, sso, oauth2]
date: 2026-04-30
section: "§3.5 Bảo mật IAM"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Chi tiết: [[05-CDC-KhoaChinh-BaoMat-IAM]]
**Liên quan:** [[Tài khoản người dùng, cơ chế đăng nhập & chứng thực]]

## Bảo mật tích hợp & tích hợp với IAM hiện hữu

> 3.5.1 Hỗ trợ OAuth2.0/OpenID Connect và/hoặc mTLS cho API.

Phầm mềm (Vnresource) hỗ trợ cơ chế **xác thực và phân quyền truy cập API** theo các chuẩn bảo mật phổ biến như **OAuth2.0 và OpenID Connect**, cho phép kiểm soát truy cập an toàn đối với các dịch vụ tích hợp giữa hệ thống và các nền tảng bên ngoài như **ESB, Data Platform hoặc MDM**. Các cơ chế này hỗ trợ xác thực theo token và quản lý phiên truy cập theo chuẩn hiện đại, đảm bảo an toàn trong quá trình trao đổi dữ liệu liên hệ thống.

Bên cạnh đó, hệ thống hỗ trợ triển khai cơ chế **xác thực hai chiều thông qua mTLS (mutual TLS)** trong các kịch bản tích hợp yêu cầu mức độ bảo mật cao, giúp xác thực đồng thời cả phía máy khách và máy chủ trong quá trình kết nối API, nâng cao mức độ bảo vệ dữ liệu khi truyền tải qua môi trường mạng.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu hỗ trợ các chuẩn bảo mật **OAuth2.0/OpenID Connect và/hoặc mTLS cho API**, đồng thời phù hợp triển khai trong kiến trúc tích hợp doanh nghiệp yêu cầu mức độ an toàn cao khi kết nối với **Data Platform, ESB hoặc các hệ thống quản trị dữ liệu tập trung**.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image47.jpg){width="6.873966535433071in" height="3.75in"}

3.5.2 Cho phép tích hợp với phần mềm IAM/SSO hiện có (ví dụ: Entra ID/AD/ Keycloak/ADFS/LDAP) để cấp token truy cập dịch vụ.

Phầm mềm (Vnresource) hỗ trợ **tích hợp với các nền tảng IAM/SSO hiện có** thông qua các chuẩn xác thực phổ biến như **OAuth2.0, OpenID Connect, SAML2.0 hoặc LDAP**, cho phép cấp **token truy cập dịch vụ (access token)** phục vụ kiểm soát truy cập an toàn giữa người dùng và các hệ thống tích hợp liên quan. Cơ chế này hỗ trợ kết nối với các giải pháp IAM/SSO phổ biến như Entra ID/AD, Keycloak, ADFS hoặc LDAP theo kiến trúc xác thực tập trung của đơn vị.

Bên cạnh đó, hệ thống hỗ trợ cấu hình tích hợp SSO theo mô hình **Identity Provider (IdP) -- Service Provider (SP)**, cho phép đồng bộ danh tính người dùng, kế thừa chính sách xác thực tập trung và quản lý vòng đời truy cập theo hệ thống IAM hiện hữu, đảm bảo tính thống nhất trong quản trị tài khoản và phân quyền truy cập dịch vụ.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu **tích hợp với phần mềm IAM/SSO hiện có để cấp token truy cập dịch vụ**, đồng thời hỗ trợ triển khai hiệu quả trong kiến trúc xác thực tập trung khi kết nối với các nền tảng như **ESB, Data Platform hoặc các hệ thống nghiệp vụ liên thông** trong môi trường CNTT doanh nghiệp.

3.5.3 Cho phép cấu hình phạm vi (scope)/role cho từng client tích hợp (ứng dụng ETL, ESB, Data Platform,...).

Phầm mềm (Vnresource) hỗ trợ cơ chế **cấu hình phạm vi truy cập (scope) và vai trò (role)** cho từng **client tích hợp** như ứng dụng ETL, ESB, Data Platform hoặc các hệ thống nghiệp vụ liên thông khác thông qua các chuẩn xác thực và phân quyền API như **OAuth2.0/OpenID Connect**. Cơ chế này cho phép kiểm soát chi tiết quyền truy cập của từng client theo từng nhóm dịch vụ hoặc phạm vi dữ liệu được phép khai thác.

Bên cạnh đó, hệ thống hỗ trợ cấu hình phân quyền theo từng **ứng dụng tích hợp (client application)**, bao gồm giới hạn phạm vi truy cập API, giới hạn loại dữ liệu được phép truy xuất hoặc cập nhật, cũng như kiểm soát quyền theo môi trường tích hợp (ví dụ: test, staging, production), đảm bảo tuân thủ chính sách bảo mật và quản trị truy cập tập trung của đơn vị.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu **cấu hình scope/role cho từng client tích hợp**, đồng thời hỗ trợ triển khai hiệu quả trong kiến trúc tích hợp doanh nghiệp khi kết nối với các nền tảng như **ETL, ESB hoặc Data Platform**, đảm bảo kiểm soát truy cập dịch vụ an toàn và linh hoạt theo từng kịch bản tích hợp.