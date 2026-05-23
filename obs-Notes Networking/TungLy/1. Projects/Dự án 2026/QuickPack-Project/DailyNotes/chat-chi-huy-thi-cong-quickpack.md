---
Mã: Update-Daily
aliases: 
date: 2025-04-23
time: 06:40
Week: "02"
tags:
  - daily
  - chat-log
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-nguon-luc-se-qpvn|Issue: Thiếu nguồn lực SE]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/decision-chan-ky-tu-dac-biet-ma-field|Decision: Chặn ký tự đặc biệt trường MÃ]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-server-infrastructure-qpvn|Issue: Server & Hạ tầng]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/task-tracking-phan-he-qpvn|Task theo Phân hệ]]"
---

> ℹ️ **File này là chat log gốc (raw).** Đã được tổ chức lại thành các ghi chú cấu trúc bên dưới.

## 🔗 Các ghi chú được tổng hợp từ file này

| Ghi chú | Nội dung |
|---------|----------|
| [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-nguon-luc-se-qpvn\|Issue: Thiếu nguồn lực SE]] | Timeline leo thang, số MM, bài học |
| [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/decision-chan-ky-tu-dac-biet-ma-field\|Decision: Chặn ký tự đặc biệt]] | 2 giải pháp → chọn GP1, cách triển khai |
| [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-server-infrastructure-qpvn\|Issue: Server & Hạ tầng]] | Server UAT, lỗi API, lỗi IIS, Redis |
| [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/task-tracking-phan-he-qpvn\|Task theo Phân hệ]] | 8 phân hệ, đợt UAT, bug block |

---

## Chat log gốc

Hi anh @Trần Duy Tùng anh @Lý Nhuận Tùng ,
Hiện tại server UAT của QPVN là server vật lý, đang cài app và SQL chung trên đó.

Tuần sau sẽ dựng link PRD.
IT QPVN hỏi mình phương án dựng server để có tốc độ tốt nhất. Đang định để server vật lý hiện tại làm server SQL, mình tư vấn server app nên dựng trên VM hay trên con vật lý đó luôn.
Nhờ các anh hỗ trợ.

Trần Phước Hạc đã trả lời Trần Duy Tùng11:19
Task làm trong sprint là lọc lại theo như này hả Hạc.
Đúng r anh. 
24 - 28/11/2025: Các task để các bạn SE dự án confirm

24 - 28/11/2025 (Bảo): Đang xin SE từ anh Bảo để làm tăng cường.

Task làm trong sprint là lọc lại theo như này hả Hạc.
25/11/2025

Trần Duy Tùng 11:17


Trần Phước Hạc 15:59
Dạ có chị

Nguyễn Thị Kim Hồng 15:33
2 task thu hồi này có cần gấp k Hạc

Nguyễn Thị Kim Hồng đã trả lời Trần Phước Hạc15:33
Dear anh @Trần Duy Tùng , team đã chốt list task của các phân hệ: HRE, ATT, REC, TRA. Nhờ anh assign các bạn xử lý ạ.
Phân hệ INS và EVA không có gap.
Phân hệ SAL em chưa raise xong, xin bổ sung sau.
Kế hoạch dự án:
- 14/10 - 17/10/2025: training 
- 15/11/2025: hoàn tất UAT.
Các bug thì team sẽ test và raise nếu có phát sinh, bug thì team k chốt được.

Trần Duy Tùng đã thêm Nguyễn Thị Kim Hồng vào nhóm
07/10/2025

Trần Phước Hạc 00:29
Dear anh @Trần Duy Tùng , team đã chốt list task của các phân hệ: HRE, ATT, REC, TRA. Nhờ anh assign các bạn xử lý ạ.
Phân hệ INS và EVA không có gap.
Phân hệ SAL em chưa raise xong, xin bổ sung sau.
Kế hoạch dự án:
- 14/10 - 17/10/2025: training 
- 15/11/2025: hoàn tất UAT.
Các bug thì team sẽ test và raise nếu có phát sinh, bug thì team k chốt được.

Trần Phước Hạc 09:09
Dạ em cảm ơn ạ, team sẽ rà soát danh sách task moify và chốt vào thứ 2 tuần sau.
04/10/2025

Trần Quốc Bảo 09:03
@Trần Phước Hạc em rà soát task của QPVN đã được confirm hết chưa và deadline khi nào nhé. Trong buổi họp tối 2/10 thì đã xác định QPVN nằm trong danh sách ưu tiên cần xử lý task hoàn thành trước 15/10/2025 với @Trần Duy Tùng và anh @Phạm Văn Hiển rồi nhé

Trần Phước Hạc 10:04
Dạ cảm ơn anh Tùng
sau khi phân quyền thư mục lại, chay duoc roi nha @Trần Phước Hạc

thấy đang thiếu quan IIS_IUSRS,
a phân lại full nha Hạc
09:52



Trần Phước Hạc 09:41
Dạ dc
09:41
a clear cache redis cai nha Hac và restart pool portal duoc ko
Dạ em gửi

Trần Phước Hạc 09:39
Ultra
id: 114812044
PW QuickPack@Vn
09:39
cho a ultra để a kiem tra

Trần Phước Hạc 09:25
Dạ có đủ file anh liệt kê

Trần Phước Hạc đã trả lời Lý Nhuận Tùng09:25
@Trần Phước Hạc :
kiem tra trong thu muc portal co cac file ben duoi ko?

/Apps/mobile/ConfigList.json", "/Apps/mobile/ConfigList_SPEC.json");
/Apps/mobile/ConfigListFilter.json", "/Apps/mobile/ConfigListFilter_SPEC.json");
/Apps/mobile/ConfigListDetail.json", "/Apps/mobile/ConfigListDetail_SPEC.json");
/Apps/mobile/ConfigField.json", "/Apps/mobile/ConfigField_SPEC.json");
/Apps/mobile/ConfigMappingSalary.json", "/Apps/mobile/ConfigMappingSalary_SPEC.json");
/Apps/mobile/ConfigChart.json", "/Apps/mobile/ConfigChart_SPEC.json");

11/09/2025
Bạn đã trả lời Trần Phước Hạc
08:30
API lỗi:
https://site1.hrquickpack.vn:8002/Portal/GetConfigApp
@Trần Phước Hạc :
kiem tra trong thu muc portal co cac file ben duoi ko?

/Apps/mobile/ConfigList.json", "/Apps/mobile/ConfigList_SPEC.json");
/Apps/mobile/ConfigListFilter.json", "/Apps/mobile/ConfigListFilter_SPEC.json");
/Apps/mobile/ConfigListDetail.json", "/Apps/mobile/ConfigListDetail_SPEC.json");
/Apps/mobile/ConfigField.json", "/Apps/mobile/ConfigField_SPEC.json");
/Apps/mobile/ConfigMappingSalary.json", "/Apps/mobile/ConfigMappingSalary_SPEC.json");
/Apps/mobile/ConfigChart.json", "/Apps/mobile/ConfigChart_SPEC.json");


Trần Phước Hạc 21:10
API lỗi:
https://site1.hrquickpack.vn:8002/Portal/GetConfigApp
10/09/2025

Trần Phước Hạc 19:38
Dear anh @Trần Duy Tùng , hôm qua giờ em đào tạo và uat QPVN. Có bị lỗi xoay xoay app, em nhờ Nhân team app check thì bạn báo bị lỗi api, BE check mới được.

Sáng mai cho em mượn 1 bạn để kiểm tra và fix lỗi app nha anh.

Lỗi trên chỉ bị bên KH, ở nhà k bị

Trần Phước Hạc 11:02
Dạ em đã nhận thông tin, cảm ơn anh Tùng
09/09/2025

Trần Duy Tùng 09:16
Hi @Trần Phước Hạc , như kế hoạch, hết hôm nay sẽ chuyển SE qua xử lý dự án tiếp theo em nhé.
CC: Anh @Trần Quốc Bảo

Trần Quốc Bảo đã trả lời Trần Duy Tùng09:22
Còn Hạc 3 người full tháng 09 đồng nghĩa Hạc đang có ds task raise cần làm trong tháng 09 là 3 MMs.
Chỗ điều thêm người này anh đang cần đánh giá lại nhé @Trần Phước Hạc, a @Trần Quốc Bảo . 
Tạm thời vẫn phân bổ Như tiếp tục, còn bổ sung ai sau lễ khoảng ngày 04 anh thông tin.
theo tn này thì hôm nay Tùng phản hồi nhé


Trần Phước Hạc 09:21
Dear anh @Phạm Văn Hiển, anh @Trần Duy Tùng , nhờ phản hồi giúp em ạ
04/09/2025

Trần Phước Hạc 08:05
Dear anh @Trần Duy Tùng ,
Tuần sau từ 09/09 - 12/09 team sẽ đào tạo và UAT ở khách hàng.
Nhưng số lượng task hiện tại vẫn còn nguyên, mỗi ngày Như chỉ xử lý được 2 task.

Nhờ anh phân bổ người gấp ạ.

Trần Duy Tùng đã trả lời Trần Phước Hạc22:12
Em mới họp ra.

Em cần 03 người làm full tháng 9.
Giai đoạn UAT nên sẽ có nhiều vấn đề cần xử lý.

Cộng với em sẽ raise thêm task của 4 phân hệ tiếp theo làm trong tháng 9 để tháng 10 UAT tiếp.
Còn Hạc 3 người full tháng 09 đồng nghĩa Hạc đang có ds task raise cần làm trong tháng 09 là 3 MMs.
Chỗ điều thêm người này anh đang cần đánh giá lại nhé @Trần Phước Hạc, a @Trần Quốc Bảo . 
Tạm thời vẫn phân bổ Như tiếp tục, còn bổ sung ai sau lễ khoảng ngày 04 anh thông tin.

Trần Phước Hạc 14:55
Em mới họp ra.

Em cần 03 người làm full tháng 9.
Giai đoạn UAT nên sẽ có nhiều vấn đề cần xử lý.

Cộng với em sẽ raise thêm task của 4 phân hệ tiếp theo làm trong tháng 9 để tháng 10 UAT tiếp.

Trần Duy Tùng 14:51
@Trần Phước Hạc ơi
Tuần nào đến tuần nào? , bao nhiêu MM
Em cần người thêm như thế nào trong tháng 9

Trần Duy Tùng 14:44
@Trần Phước Hạc

Trần Phước Hạc đã trả lời Trần Duy Tùng14:05
Em giao cho Như
Như cũng dc giao các task quan trọng r anh 
Em giao cho Như

Trần Duy Tùng 14:05
Hạc ơi.

Trần Phước Hạc 09:26
Cho em mượn trước 1 bạn xử lý gấp 3 bug QPVN2128, QPVN2158, QPVN2146 này trước nha anh Tùng.

Tại bị block không setup tiếp được. Ngày 08/09/2025 team bắt đầu đào tạo KH và UAT mà giờ này còn quá trời task chưa làm xong.

Trần Duy Tùng đã trả lời Trần Quốc Bảo08:44
@Trần Duy Tùng khi nào có thông tin để phản hồi cho dự án được vậy em
Vâng, trong hôm nay nha anh @Trần Quốc Bảo

Trần Quốc Bảo 08:41
@Trần Duy Tùng khi nào có thông tin để phản hồi cho dự án được vậy em
29/08/2025

Trần Phước Hạc đã trả lời Trần Duy Tùng08:02
Nếu gần hết timeline mà task còn thì em nhắn anh trước cái nhé
Dạ nhờ anh Tùng assign SE hỗ trợ giúp em nhé. Hiện tại task đã tăng hơn so với ngày hôm qua
- 29 task chờ SE resolve
- 6 task chờ SE fix bug.
Tổng 35 task
Nếu gần hết timeline mà task còn thì em nhắn anh trước cái nhé

Mà Hạc xem lúc anh đưa người có đưa timeline
Để anh xem Hạc nhé

Trần Duy Tùng 15:06
A nhận thông tin rồi.

Trần Phước Hạc 15:01
Hi anh @Phạm Văn Hiển , anh @Trần Duy Tùng ,
Nhờ các Anh xem xem nguồn lực cho dự án QPVN với nha.
Hiện tại có nhiều bug block luồng không test tiếp được.

28/08/2025

Trần Phước Hạc 09:55
Dear anh @Trần Duy Tùng , hiện tại dự án QPVN còn 30 task ở PTSP:
- 2 task BA
- 28 task SE

Mà SE đã rút từ cuối ngày 27/08, đang không có người xử lý, nhờ anh điều phối người hỗ trợ tiếp ạ.
@Trần Phước Hạc : a chốt lại là giảm thiểu can thiệp code gây rối, 
giờ mình làm là sửa trong field_info.xml và nhập pattern validate custom và hiển thị message custom của mình.
Về xử lý , e liệt kê các màn hinh và PE cũng có thể cấu hình trong field_info.xml.

Nếu xử lý ko được thì báo SE hỗ trợ 1 màn hình mẫu cho PE cấu hình.

26/08/2025
Bạn đã trả lời Chính mình
14:14
vậy chốt lại là giải pháp 1 nha @Trần Phước Hạc .
Mình làm tương tự cách lúc trước (kế thừa xử lý anh Sáng trước đây) xử lý là trong textbox khi nhập ký tự đặc biệt thì sẽ tự xóa ký tự đặc biệt.


Bạn đã trả lời Chính mình
09:02
@Trần Phước Hạc , @Trịnh Trần Thế Thông :
Anh trình bày 2 giải pháp cho vấn đề "trường mã" không nhập ký tự đặc biệt.

📝 Giải pháp 1: Chặn ký tự đặc biệt ngay khi nhập

- Cách làm: Sửa control nhập liệu (textbox). Nếu người dùng gõ ký tự đặc biệt thì hệ thống tự động xoá.

- Thời gian thực hiện:

	+ Vì đã có sẵn hàm chung, chỉ cần bật thêm 1 tùy chọn (bool).

	+ Ước tính: ~5 phút cho 1 control.

- Ưu điểm: Trải nghiệm tốt, người dùng thấy rõ ràng ngay lập tức.

- Nhược điểm: Cần khai báo tại từng control "MÃ".


📝 Giải pháp 2: Kiểm tra khi bấm Lưu

- Cách làm: Khi lưu dữ liệu, hệ thống kiểm tra các field có chữ “code” → nếu chứa ký tự đặc biệt sẽ báo lỗi.

- Thời gian thực hiện:

	+ Chỉ cần viết 1 lần.

	+ Ước tính: rất nhanh.

- Ưu điểm: Triển khai nhanh, không cần chỉnh từng control.

- Nhược điểm: Rủi ro kiểm nhầm các field có chữ “code” nhưng không phải “MÃ”; người dùng chỉ biết lỗi khi bấm lưu → tốn thời gian nhập lại.
vậy chốt lại là giải pháp 1 nha @Trần Phước Hạc .
Mình làm tương tự cách lúc trước (kế thừa xử lý anh Sáng trước đây) xử lý là trong textbox khi nhập ký tự đặc biệt thì sẽ tự xóa ký tự đặc biệt.
Bạn đã trả lời Trần Phước Hạc
08:33
Dear anh @Lý Nhuận Tùng ,
Dự án QPVN yêu cầu các trường "MÃ" không được nhập các ký tự đặc biệt để tránh lỗi hệ thống.
Nhờ anh đánh giá giải pháp thực hiện tiết kiệm thời gian nhất cho yêu cầu này.
@Trần Phước Hạc , @Trịnh Trần Thế Thông :
Anh trình bày 2 giải pháp cho vấn đề "trường mã" không nhập ký tự đặc biệt.

 Giải pháp 1: Chặn ký tự đặc biệt ngay khi nhập

- Cách làm: Sửa control nhập liệu (textbox). Nếu người dùng gõ ký tự đặc biệt thì hệ thống tự động xoá.

- Thời gian thực hiện:

	+ Vì đã có sẵn hàm chung, chỉ cần bật thêm 1 tùy chọn (bool).

	+ Ước tính: ~5 phút cho 1 control.

- Ưu điểm: Trải nghiệm tốt, người dùng thấy rõ ràng ngay lập tức.

- Nhược điểm: Cần khai báo tại từng control "MÃ".


 Giải pháp 2: Kiểm tra khi bấm Lưu

- Cách làm: Khi lưu dữ liệu, hệ thống kiểm tra các field có chữ “code” → nếu chứa ký tự đặc biệt sẽ báo lỗi.

- Thời gian thực hiện:

	+ Chỉ cần viết 1 lần.

	+ Ước tính: rất nhanh.

- Ưu điểm: Triển khai nhanh, không cần chỉnh từng control.

- Nhược điểm: Rủi ro kiểm nhầm các field có chữ “code” nhưng không phải “MÃ”; người dùng chỉ biết lỗi khi bấm lưu → tốn thời gian nhập lại.
08:29
đợi xiu a gửi lại giải pháp nha @Trần Phước Hạc
22/08/2025

Trần Phước Hạc 07:54
Dạ màn hình thì bên em liệt kê, anh định cách làm ntn để @Trịnh Trần Thế Thông cùng nắm và bên em biết hướng raise task
11:14
thấy nhiều man hình
Bạn đã trả lời Trần Phước Hạc
11:14
Dear anh @Lý Nhuận Tùng ,
Dự án QPVN yêu cầu các trường "MÃ" không được nhập các ký tự đặc biệt để tránh lỗi hệ thống.
Nhờ anh đánh giá giải pháp thực hiện tiết kiệm thời gian nhất cho yêu cầu này.
tất cả màn hình có mã luôn phải ko Hạc.
21/08/2025

Trần Phước Hạc 09:22
Dear anh @Lý Nhuận Tùng ,
Dự án QPVN yêu cầu các trường "MÃ" không được nhập các ký tự đặc biệt để tránh lỗi hệ thống.
Nhờ anh đánh giá giải pháp thực hiện tiết kiệm thời gian nhất cho yêu cầu này.

Trần Phước Hạc 15:02
Dạ hiện trạng anh Tùng điều phối SE như sau:
1/ Như:
- Từ ngày 15/08 đến ngày 30/08

2/ Quan:
- Từ ngày 20/08 đến hết ngày 27/08

3/ Tú:
- Từ ngày 19/08 đến hết ngày 27/08

MMs còn bị thiếu nhiều so với em yêu cầu + việc cung cấp quá trễ.
Tuy nhiên em sẽ bắt đầu điều phối từ mai để các bạn làm task dự án.

Trần Duy Tùng đã trả lời Trần Quốc Bảo15:00
@Trần Duy Tùng chỗ quân thi công dự án này theo @Trần Phước Hạc đề xuất có chưa em
Đã sắp xếp rồi anh @Trần Quốc Bảo nha.
18/08/2025

Trần Quốc Bảo 14:22
@Trần Duy Tùng chỗ quân thi công dự án này theo @Trần Phước Hạc đề xuất có chưa em
15/08/2025

Trần Duy Tùng đã trả lời Trần Quốc Bảo08:43
@Trần Duy Tùng xem sắp xếp người nha e
Để em xem rồi báo lại dự án nhé.

Trần Quốc Bảo đã trả lời Trần Phước Hạc22:50
Hi anh @Trần Duy Tùng ,
Em xin tháng 8/2025 có 3 manmonth SE để xử lý task.
Mà anh cấp cho em chưa tới 0,5 manmonth.

Giờ các task đều chờ Như làm, bạn đang yêu cầu đánh độ ưu tiên. Em thấy cách làm này sẽ không xử lý kịp task.
Anh @Lý Nhuận Tùng ngâm của em mất nửa tháng rồi, giờ em cần khoảng 3 bạn SE cùng join vào xử lý.
@Trần Duy Tùng xem sắp xếp người nha e

14/08/2025

Trần Phước Hạc 14:06
Đã chỉnh sửa
Hi anh @Trần Duy Tùng ,
Em xin tháng 8/2025 có 3 manmonth SE để xử lý task.
Mà anh cấp cho em chưa tới 0,5 manmonth.

Giờ các task đều chờ Như làm, bạn đang yêu cầu đánh độ ưu tiên. Em thấy cách làm này sẽ không xử lý kịp task.
Anh @Lý Nhuận Tùng ngâm của em mất nửa tháng rồi, giờ em cần khoảng 3 bạn SE cùng join vào xử lý.
13/08/2025

Trần Phước Hạc 10:56
@Lý Nhuận Tùng


Trần Phước Hạc 10:08
Dear anh @Trần Duy Tùng , Product đang có quy định dự án đủ 5 task mới được xin nguồn lực hả anh?
12/08/2025

Trần Phước Hạc 09:56
Dear anh @Lý Nhuận Tùng hiện tại đã đến giữa tháng, và chưa task nào được SE thực hiện.
Đang rất rủi ro, nhờ anh action gấp ạ.

Trần Phước Hạc 09:45
Hi anh @Lý Nhuận Tùng , nhờ anh cung cấp deadline cho các task đã ở SE.
Cuối hôm nay cung cấp thêm deadline của các task Thông làm trong ngày.

Trịnh Trần Thế Thông đã trả lời Trần Phước Hạc09:10
@Trịnh Trần Thế Thông có 8 task ở BA, nhờ em cho deadline thực hiện.
Dear anh @Lý Nhuận Tùng , đã có 3 task modify ở SE, nhờ anh điều phối nguồn lực xử lý.
Em nhận thông tin anh @Trần Phước Hạc ạ
Về deadline chi tiết, em xin thông tin như sau: 
1) 1 Task UNI: em sẽ hoàn thành trong hôm nay (cụ thể là trong sáng nay) 
2) 3 task ATT: em sẽ hoàn thành trong hôm nay
3) 4 task REC: em sẽ hoành thành vào ngày mai 
Nếu có thay đổi thì em sẽ báo lại deadline ạ

11/08/2025

Trần Phước Hạc 08:57
@Trịnh Trần Thế Thông có 8 task ở BA, nhờ em cho deadline thực hiện.
Dear anh @Lý Nhuận Tùng , đã có 3 task modify ở SE, nhờ anh điều phối nguồn lực xử lý.

Trần Phước Hạc 11:24
Em gửi full SRS dự án nha:
https://drive.google.com/file/d/18jjcY5p2Ba0_uKlp_qaQneP_jUkXbCn-/view?usp=sharing
Dự án này có 3 module khó:
+ Đồng phục thiết bị: Cảnh báo tồn kho và số lượng sắp cấp.
+ SAL: Lương sản phẩm (lệch chu kỳ lương chính)
+ TRA: Quy trình đào tạo nhân viên mới theo đợt.

Các module còn lại không gap/ gap tiện ích.
Đây là timeline dự án.
Sẽ cao điểm cần product ở các tháng 08 và 09. Tóm tắt:
+ Tháng 08/2025: Phát triển các gap ở phân hệ HRE, ATT, REC, Đồng phục thiết bị
=> Tháng 09/2025 PE sẽ UAT 4 phân hệ trên, cần SE fix bug song song.

+ Tháng 09/2025: Phát triển các gap ở phân hệ INS, SAL, TRA, EVA
=> Tháng 10/2025 PE sẽ UAT 4 phân hệ trên, cần SE fix bug song song.

Tháng 11/2025 KH sẽ UAT kết hợp 8 phân hệ.
Mốc quan trọng: 01/12/2025: Dự án go-live.

 2


Trần Phước Hạc 10:29
Dạ cảm ơn anh @Trần Duy Tùng ,
Hello anh @Lý Nhuận Tùng @Trần Phan Minh Trí @Trịnh Trần Thế Thông .
Dự án này cũng dễ dễ xơi, mn cùng phối hợp chặt chém để thành công dự án này nhé.



Trần Duy Tùng 10:28
Anh add các thành viên chính thi công vào group nhé @Trần Phước Hạc 
@Lý Nhuận Tùng @Trịnh Trần Thế Thông @Trần Phan Minh Trí

 2
Trần Duy Tùng đã thêm Trần Phan Minh Trí, Trịnh Trần Thế Thông và 1 người khác vào nhóm
30/07/2025

Trần Phước Hạc 09:55
Good morning anh @Trần Duy Tùng 


- Mốc go-live: 01/12/2025
- Mốc UAT: Em chia làm 2 đợt UAT, mỗi đợt 4 phân hệ, không phân biệt UAT1-2. Làm xong phân hệ nào thì xác nhận xong phân hệ đó.
+ Đợt 1: HRE, ATT, REC, Đồng phục thiết bị: Hoàn tất UAT trong tháng 9.
+ Đợt 2: INS, SAL, TRA, EVA: Hoàn tất UAT trong tháng 10
Dự án có 8 phân hệ:
- HRE
- ATT
- INS
- SAL
- REC
- TRA
- EVA
- Đồng phục thiết bị.
29/07/2025

Trần Phước Hạc 10:57
Dear anh @Trần Duy Tùng ,
Dự án QPVN đã xong SRS. Nhờ anh phân bổ giúp em EM cho dự án nhé.

Trần Quốc Bảo đã trả lời Trần Phước Hạc12:54
Hi anh @Trần Duy Tùng ,
Em cần tách source cho dự án QuickPack (QPVN) để dựng link nội bộ VnR và link test cho KH

Giờ em email nhờ tách source thôi hay phải làm thủ tục gì nữa ạ?
Với cho em hỏi giờ vẫn tách source ITL hay source nào khác?
@Trần Duy Tùng đang nghỉ phép, em trao đổi thêm với A Hiển nha
11/07/2025

Trần Phước Hạc 09:44
Hi anh @Trần Duy Tùng ,
Em cần tách source cho dự án QuickPack (QPVN) để dựng link nội bộ VnR và link test cho KH

Giờ em email nhờ tách source thôi hay phải làm thủ tục gì nữa ạ?
Với cho em hỏi giờ vẫn tách source ITL hay source nào khác?
Trần Phước Hạc đã thay đổi ảnh đại diện nhóm

Nguyễn Thị Lan Vy 11:36
Dạ e tạm thời tạo trướ