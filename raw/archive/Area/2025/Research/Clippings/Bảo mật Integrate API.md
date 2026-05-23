---
title: Bảo mật Integrate API
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=99221598
created: 2026-02-09
tags:
  - document
  - "#security"
  - "#integrate"
  - "#vnpay"
like: false
CommitLink: http://172.21.35.3:8080/tfs/HRMCollection/_git/HRM9/commit/8632cd413e105ce70004c41ed05ef0e339a2c4ee?path=%2FMain%2FSource%2FProjects%2FHRM.ServiceCenter%2FServices%2FHRM.SC.Service.Identity%2FConfig.cs&gridItemType=2&mpath=%2FMain%2FSource%2FProjects%2FHRM.ServiceCenter%2FServices%2FHRM.SC.Service.Identity%2FConfig.cs&opath=%2FMain%2FSource%2FProjects%2FHRM.ServiceCenter%2FServices%2FHRM.SC.Service.Identity%2FConfig.cs&mversion=GC8632cd413e105ce70004c41ed05ef0e339a2c4ee&oversion=GC6722e07e589e0e2d2961e2d61e9669570f98412c&diffParent=diffparent1&_a=compare
---
# **I. Mô tả**

Service Integration là 1 service dành cho các bên thứ ba như (vnedoc, cmdb, …) tích hợp vào hệ thống HRM. Các bên thứ 3 sẽ thực hiện gọi api của service integration để lấy data từ hệ thống HRM.

# **II. Xác định phạm vi** 

Phạm vi đánh giá tập trung vào Service Integration và các cơ chế bảo mật phục vụ tích hợp với bên thứ ba, bao gồm endpoint cấp token /connect/token và các API tích hợp hiện có tại thời điểm đánh giá (Chỉ có 2 api sample là /connect/token và api/Hre_Profile/GetInfoProfileByEmail). Các API chưa được triển khai hoặc chưa được sử dụng chính thức không thuộc phạm vi phân tích chi tiết.

# **III. Luồng, Logic hoạt động của service integration**

Service Integration được thiết kế để cho phép hệ thống bên thứ ba truy cập dữ liệu HR thông qua cơ chế xác thực OAuth 2.0 sử dụng grant type client_credentials. Trong mô hình này, hệ thống bên thứ ba không sử dụng tài khoản người dùng màm xác thực bằng cặp client_id và client_secret để lấy access_token, sau đó sử dụng token này để gọi các API của Integration Service,

1. Yêu cầu cấp Access Token (Third-party System -> Identity Service)

Hệ thống bên thứ ba gửi yêu cầu cấp access token đến identity service thông qua endpoint /connect/token , sử dụng OAuth 2.0 grant type client_credentials. Dữ liệu gửi kèm bao gồm client_id, client_secret và scope yêu cầu.
![[Pasted image 20260209141055.png]]

**Trust Boundary #1 (Auth Boundary), tại đây toàn bộ dữ liệu đầu vào từ hệ thống bên thứ ba được coi là không đáng tin cậy và cần được xác thực.**

1. Xác thực Client và cấp Access Token

Identity service xác thực thông tin client (client_id và client_secret). Nếu tt hợp lệ, hệ thống sẽ cấp một access token với scope api.

Access token được cấp cho phép hệ thống bên thứ ba truy cập các API của Integration Service theo thiết kế hiện tại.

1. Identity Service trả về access token cho hệ thống bên thứ ba. Token này được sử dụng trong các yêu cầu API tiếp theo và đại diện cho danh tính của client, không gắn với bất kỳ người dùng cụ thể nào.
2. Hệ thống bên thứ ba sử dụng access token vừa nhận được để gửi yêu cầu đến các API của Integration Service, thông qua header Authorization: Bearer <access_token>.

**Trust Boundary #2 (Token-based Access Boundary), nơi access token được coi là dữ liệu nhạy cảm và có thể bị lạm dụng nếu bị lộ.**

1. Integration Service thực hiện xác thực access token, bao gồm:

- Kiểm tra chữ ký (signature)
- Kiểm tra issuer 
- Kiểm tra audience
- Kiểm tra scope

  Chỉ khi token hợp lệ và đáp ứng đầy đủ  các điều kiện, yêu cầu API mới được xử lý tiếp

1. Sau khi xác thực thành công, Integration Service gửi yêu cầu truy vấn dữ liệu đến Database HRM để lấy dữ liệu phục vụ tích hợp.

**Trust Boundary #3 (Sensitive Data Boundary).**

1. Database HRM trả dữ liệu cho Integration Service, sau đó Integration Service xử lý và trả kết quả cuối cùng về cho hệ thống bên thứ ba.

# **IV. Lỗi bảo mật được phát hiện** 

Client bên thứ 3 bị cấp scope quá rộng (scope "api") → nguy cơ truy cập API nhạy cảm ngoài phạm vi Integration

**1) Tóm tắt ngắn**  
- ClientId dành cho bên thứ 3: hrm_api_itg_hreApi.  
- Trước đây client này được phép xin access token với scope "api".  
- Scope "api" đang là scope “chung”, được nhiều API service trong hệ thống chấp nhận → token của bên thứ 3 có thể gọi nhiều API nội bộ không được phép (vượt phạm vi Integration).  
- Khắc phục: tạo scope riêng cho Integration (HRE) là "hrm_itg_hre_api", giới hạn client hrm_api_itg_hreApi chỉ được xin scope này, và Integration Service chỉ chấp nhận scope này.  
- Đồng thời tắt phát hành audience tĩnh "{issuer}/resources" để tránh token bị các service khác “accept nhầm” theo audience quá chung.

**2) Bối cảnh hệ thống**  
- Identity Service (HRM.SC.Service.Identity): cấp OAuth2 access token (client_credentials) cho client.  
- Integration Service (HRM.Integration.Service.ApiCore): API được bên thứ 3 gọi.  
- Các service API nội bộ khác (HR/SC/HrmSystem/...): cũng dùng JWT Bearer để validate token từ Identity Service.

**3) Hiện trạng trước khi khắc phục**  
**3.1 Hiện trạng**  
- Bên thứ 3 được cấp client_id / client_secret (client_credentials).  
- Khi gọi POST /connect/token, họ xin token với scope="api".

**3.2 Vấn đề**  
- Scope "api" đang có phạm vi quá rộng (scope dùng chung).  
- Nhiều API service trong hệ thống “nhận” token scope "api" như một loại token hợp lệ.  
=> Token của bên thứ 3 (mục đích chỉ để gọi Integration) vô tình trở thành “vé vào cổng” cho nhiều API khác.

**4) Vì sao nguy hiểm dù đã có client_secret?**  
- client_secret chỉ chứng minh “ai đang gọi” (client nào), KHÔNG tự động giới hạn “được phép gọi API nào”.  
- Nếu scope được cấp quá rộng, thì client hợp lệ (có secret đúng) vẫn có thể gọi các API ngoài phạm vi cho phép.  
- Đây là lỗi phân quyền (authorization) / cấp quyền quá mức (over-permission), không phải lỗi xác thực (authentication).

**5) Kịch bản khai thác thực tế**  
Giả sử bên thứ 3:  
1) Xin token bằng hrm_api_itg_hreApi + scope=api.  
2) Dùng token đó gọi:  
   - Integration API (đúng mục đích) → OK  
   - Một API nội bộ khác (không được phép, có thể nhạy cảm) → có thể vẫn OK nếu service đó chỉ kiểm tra token “hợp lệ” + audience phù hợp, nhưng không kiểm tra scope/permission chi tiết.

Lưu ý: bên thứ 3 không cần “hack” secret. Chỉ cần họ có token hợp lệ + biết endpoint cần gọi là đã có rủi ro.

**6) Nguyên nhân gốc**  
- Dùng 1 scope chung ("api") cho nhiều mục đích:  
  + token nội bộ (service-to-service, portal, job, batch…)  
  + token cho bên thứ 3 (chỉ nên giới hạn Integration)  
- Một số service chỉ validate token theo issuer/audience/signature mà không enforce scope theo từng API.  
- IdentityServer có thể emit thêm audience tĩnh "{issuer}/resources" (audience quá chung) khiến token dễ được accept nhầm ở nơi khác nếu họ validate theo audience này.

**7) Khắc phục đã triển khai**  
7.1 Tạo scope riêng cho Integration  
- Tạo scope mới: oauth_2_api (scope dành riêng cho Integration/HRE).  
- Định nghĩa ApiResource tương ứng: oauth_2_api.

7.2 Giới hạn client của bên thứ 3  
- Client hrm_api_itg_hreApi: AllowedScopes chỉ còn "oauth_2_api".  
- Không còn được xin scope "api".

7.3 Integration Service “chỉ chấp nhận” scope mới  
- Integration Service cấu hình authorization để yêu cầu claim scope chứa "oauth_2_api".  
=> Token có scope khác (vd: "api") sẽ bị từ chối.

7.4 Giảm rủi ro bypass audience chung  
- Tắt EmitStaticAudienceClaim (KHÔNG phát hành aud="{issuer}/resources" trong access token).  
- Mục tiêu: token của scope riêng không mang thêm audience quá chung làm service khác accept nhầm.