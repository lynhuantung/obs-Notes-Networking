---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, versioning, backward-compat, changelog]
date: 2026-04-30
section: "§3.13 Quản lý schema"
---

← [[s3n-Yc-VanHanh-TichHop]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]

## Quản lý thay đổi interface/schema

3.13.1 Tất cả interface/API/file schema phải có versioning; đảm bảo tương thích ngược khi thay đổi (backward compatible) hoặc có phương án song song version.

Phần mềm (VnResource) cam kết áp dụng cơ chế quản lý phiên bản (versioning) đối với toàn bộ interface, API và file schema trong phạm vi tích hợp, nhằm bảo đảm tính ổn định, liên tục và khả năng kiểm soát khi hệ thống phát sinh thay đổi trong quá trình vận hành và phát triển.

Mọi interface/API và file schema được thiết kế và triển khai theo nguyên tắc có định danh phiên bản rõ ràng (ví dụ: v1, v2, hoặc theo chuẩn semantic versioning), được ghi nhận trong tài liệu kỹ thuật và phản ánh trực tiếp trong cấu trúc endpoint, header hoặc metadata của file schema tương ứng. Việc đánh số phiên bản được thực hiện nhất quán, minh bạch và có thể tra cứu, đối soát bởi đội kỹ thuật của PTSC/Data Platform.

Đối với các thay đổi phát sinh trong quá trình vận hành, VnResource cam kết ưu tiên nguyên tắc tương thích ngược (backward compatibility), theo đó:

- Các thay đổi không phá vỡ cấu trúc hiện tại (thêm trường, mở rộng danh mục, bổ sung endpoint...) được thực hiện trong phạm vi phiên bản hiện hành, bảo đảm hệ thống tích hợp phía PTSC/Data Platform không bị ảnh hưởng mà không cần cập nhật.

- Các thay đổi có tác động đến cấu trúc hoặc hành vi hiện tại (xóa trường, thay đổi kiểu dữ liệu, điều chỉnh logic nghiệp vụ...) được triển khai theo phiên bản mới, đồng thời duy trì song song phiên bản cũ trong khoảng thời gian chuyển tiếp được thống nhất trước, giúp PTSC/Data Platform có đủ thời gian thực hiện nâng cấp và kiểm thử mà không gián đoạn vận hành.

Trong trường hợp áp dụng phương án song song version (multi-version coexistence), VnResource cung cấp:

- Lộ trình chuyển đổi phiên bản rõ ràng, bao gồm thời điểm deprecated và thời điểm ngừng hỗ trợ phiên bản cũ

- Tài liệu migration hướng dẫn chi tiết các bước nâng cấp từ phiên bản cũ sang phiên bản mới

- Môi trường kiểm thử (sandbox/staging) hỗ trợ PTSC/Data Platform xác nhận tính tương thích trước khi chuyển đổi chính thức trên môi trường production

Toàn bộ chính sách versioning, lộ trình thay đổi và phương án xử lý tương thích được thông báo trước, lập thành tài liệu chính thức và thống nhất với PTSC/Data Platform trước khi triển khai, bảo đảm mọi thay đổi đều được kiểm soát, có kế hoạch và không gây rủi ro bất ngờ cho hệ thống tích hợp đang vận hành.

Với cách tiếp cận này, phần mềm VnResource bảo đảm tính bền vững của các kết nối tích hợp, khả năng phát triển hệ thống liên tục và kiểm soát rủi ro khi thay đổi, đáp ứng yêu cầu về versioning và backward compatibility trong môi trường vận hành thực tế của PTSC

3.13.2 Phải có changelog và quy trình thông báo thay đổi trước khi loại bỏ phiên bản cũ (deprecation policy) theo thời gian tối thiểu do Chủ đầu tư quy định.

Phần mềm (**VnResource**) áp dụng **changelog và chính sách quản lý thay đổi phiên bản (deprecation policy)** đối với toàn bộ **interface, API và file schema tích hợp**, nhằm đảm bảo các hệ thống liên quan được thông báo kịp thời trước khi loại bỏ hoặc ngưng hỗ trợ các phiên bản cũ. Cơ chế này giúp duy trì tính ổn định và khả năng vận hành liên tục của các kênh tích hợp trong kiến trúc CNTT tổng thể của đơn vị.

Cụ thể, hệ thống thực hiện:

- **Changelog phiên bản:** Ghi nhận toàn bộ thay đổi trong từng phiên bản interface/API/file schema, bao gồm các bổ sung, sửa đổi hoặc xóa bỏ các trường dữ liệu, logic xử lý hoặc tham số kết nối. Changelog được lưu trữ trong tài liệu kỹ thuật và trên hệ thống quản lý version, cho phép đội kỹ thuật dễ dàng tra cứu lịch sử thay đổi và đánh giá tác động đối với các kênh tích hợp hiện hữu.

- **Quy trình thông báo trước khi deprecate:** Mỗi khi chuẩn bị loại bỏ hoặc ngừng hỗ trợ một phiên bản cũ, hệ thống sẽ thực hiện thông báo tới Chủ đầu tư và các bên liên quan theo **thời gian tối thiểu do Chủ đầu tư quy định**, bao gồm thông tin về phiên bản bị loại bỏ, lý do deprecation, thời hạn ngừng hỗ trợ, và hướng dẫn chuyển đổi sang phiên bản mới.

- **Hỗ trợ song song nhiều phiên bản:** Trong thời gian thông báo, hệ thống vẫn duy trì hỗ trợ các phiên bản cũ, cho phép các hệ thống tích hợp có thời gian chuyển đổi sang phiên bản mới mà không làm gián đoạn trao đổi dữ liệu.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu về **changelog và quy trình thông báo thay đổi trước khi loại bỏ phiên bản cũ (deprecation policy)**, đồng thời hỗ trợ Chủ đầu tư kiểm soát các thay đổi tích hợp, duy trì vận hành ổn định và giảm thiểu rủi ro gián đoạn dữ liệu trong quá trình nâng cấp hoặc thay đổi hệ thống.

4.  **YÊU CẦU PHI CHỨC NĂNG**