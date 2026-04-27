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
# INS — Nghiệp Vụ & Biểu Mẫu Bảo Hiểm

> **Domain**: Bảo hiểm (BHXH / BHYT / BHTN)
> **Khách hàng**: VnResource (nội bộ)
> **Ngày ghi**: 21/02/2015
> **Nội dung**: Quy trình, biểu mẫu TK01/TK02/D02/D03/C70A; nghiệp vụ tăng/giảm LĐ, mức đóng; IBHXH; EBHXH; mapping V6-V8

---

## Chức năng tương ứng với nghiệp vụ

### Các chức năng bảo hiểm

| **Thời điểm** | **Bước thực hiện** | **Mô tả** | **Template** | **Table liên quan** | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| Khi có nhân viên mới | Khai báo lương đóng bảo hiểm & loại đóng (BHXH, BHYT, BHTN) |  |  | Sal_InsuranceSalary |  |
| Khi có nhân viên mới | Xuất danh sách đề nghị tham gia bảo hiểm xã hội (A01)\ Xuất tờ khai bảo hiểm (A01-TS) |  | A01 & A01-TS | Hre_Profile | Bảo điều chỉnh đúng |
| Trước khi tính lương (Nộp Tờ khai trước ngày 20 hằng tháng, nộp tiền trước 30 hằng thái) | Tính trích nộp bảo hiểm (NV đóng bao nhiêu, Cty bao nhiêu, tăng LĐ, giảm LĐ, tăng giảm mức đóng (điều chỉnh lương)... | Cho phép thêm / xóa /sửa sau khi đã tính (Ins_ReportD02Item)\ Thêm trạng thái Tự chỉnh, tự tính | D02 | Lưu dữ liệu vào: Ins_ProfileInsuranceMonthly Ins_ReportD02\ Ins_ReportD02Item |  |
| Quy định Cty (Sau tính bảo hiểm trích nộp) | Tính lương (lấy bảo hiểm đã trích nộp) | Sử dụng kết quả ở Ins_ProfileInsuranceMonthly để lấy qua trừ bảo hiểm tại lương |  | Sal_PayrollTable\ Sal_PayrollTableItem |  |
| Dựa theo ngày phát sinh chứng từ | Nhập Chứng từ ốm đau, thai sản, nghỉ ngắn ngày, con ốm... | *Sau khi NV nộp chứng từ:\ - Cty kiểm tra đúng thì trả tiền cho NV trước\ - Sau x ngày, Cơ quan bảo hiểm, trả HS duyệt và trả tiền cho Cty sau.* |  | Ins_InsuranceRecord\ Ins_ChildSick (nếu loại chứng từ con ốm) | Phải có chức năng |
| Sau khi nhập chứng từ ốm đau.. | Xuất tờ khai: ốm đau, thai sản, nghỉ ngắn ngày, con ốm... | Dùng Enum Status cho table Ins_InsuranceRecord để đánh dấu chứng từ đã thanh toán hay chưa | Xuất C70A | Load dữ liệu từ các table: Ins_ChildSick\ Ins_InsuranceRecord\ Ins_ProfileInsuranceMonthly |  |

##  Các Biểu Mẫu Bảo Hiểm

### Mẫu TK01-TS

Tờ khai tham gia BHXH, BHYT

> ![](Ins_TaiLieuBaoHiem_01_image8.png)

*[Enum xuất BC mẫu TK01-TS:]{.underline}*

| **Tên enum** | **Ý nghĩa** |
| --- | --- |
| «GenderView» | Giới tính |
| «EthnicGroupName» | Dân tộc |
| «VillageBirthCertificate» | \[06.1\]. Xã (phường, thị trấn) |
| «ProvinceBirthCertificate» | Tỉnh (Tp) |
| «PAddress» | Số nhà, đường phố, thôn xóm |
| «PVillageName» | \[07.2\]. Xã (phường, thị trấn) |
| «PDistrictName» | \[07.3\]. Huyện (quận, thị xã, Tp thuộc tỉnh) |
| «PProvinceName» | \[07.4\]. Tỉnh (Tp): |
| «SocialInsOldNo» | \[09\]. Mã số BHXH (đã cấp) |
| «CellPhone» | Số điện thoại liên hệ |
| «IDNo» | Số CMND/ Hộ chiếu/ Thẻ căn cước |
| «HouseHoldCode» | Mã số hộ gia đình (đã cấp) |
| «HealthTreatmentPlace» | Nơi đăng ký khám bệnh, chữa bệnh ban đầu |

### Mẫu TK02-TS

Tờ khai thay đổi thông tin tham gia BHXH,BHYT

![](Ins_TaiLieuBaoHiem_01_image9.png)

### Mẫu D02-TS

Danh sách lao động tham gia BHXH, BHYT

Kê khai lao động, tiền lương tham gia BHXH, BHYT, BHTN;

Điều chỉnh mức đóng BHXH, BHYT, BHTN;

Trách nhiệm lập thuộc đơn vị sử dụng lao động khi có phát sinh tăng/giảm
lao động hoặc tăng/giảm tiền lương.

![](Ins_TaiLieuBaoHiem_01_image10.png)

### Mẫu D03-TS

Danh sách người chỉ tham gia BHYT

![](Ins_TaiLieuBaoHiem_01_image11.png)

### Mẫu C70A

![](Ins_TaiLieuBaoHiem_01_image12.png)

1\. Mục đích lập mẫu c70a-HD:

Căn cứ đề nghị giải quyết trợ cấp ốm đau, thai sản, dưỡng sức, phục hồi
sức khỏe đối với người lao động trong doanh nghiệp.

2\. Trách nhiệm và căn cứ lập mẫu c70a-HD:

Danh sách này do đơn vị sử dụng lao động lập cho từng đợt, tùy thuộc vào
số người hưởng trợ cấp phát sinh, đơn vị có thể đề nghị làm nhiều đợt
trong tháng, theo tháng hoặc theo quý.

Trường hợp danh sách có nhiều tờ thì giữa các tờ phải có dấu giáp lai.

Cơ sở để lập theo các giấy tờ sau:

\- Giấy chứng nhận nghỉ việc hưởng BHXH,

\- Giấy khám chữa bệnh của con,

\- Bản sao sổ y bạ của con, phiếu hội chẩn,

\- Giấy khám thai, bản sao giấy chứng sinh,

\- Bản sao giấy khai sinh, giấy ra viện,

\- Quyết định công nhận việc nuôi con nuôi\...

Đồng thời kèm Danh sách được cơ quan BHXH duyệt của đợt trước (nếu có).

3\. Hướng dẫn ghi mẫu c70a-HD:

Phần 1. DANH SÁCH ĐỀ NGHỊ HƯỞNG CHẾ ĐỘ MỚI PHÁT SINH

Cột A, B ghi số thứ tự, họ và tên của người hưởng chế độ.

Cột 1 ghi số sổ BHXH hoặc số định danh của người hưởng chế độ.

Cột 2 ghi điều kiện tính hưởng:

\* Đối với chế độ ốm đau:

\- Nếu là bệnh thông thường thì bỏ trống và mặc nhiên được hiểu là bệnh
thông thường

\- Nếu bản thân người lao động bị bệnh cần chữa trị dài ngày thì ghi:
BDN

\* Đối với chế độ thai sản:

\- Đối với khám thai: để trống;

\- Đối với sảy thai, nạo hút thai: ghi theo tuổi thai, VD: thai 3 tuần
tuổi ghi 03T, thai 3 tháng tuổi ghi : 03Th

\- Đối với sinh con ghi: SC và số con đã được sinh, VD sinh 1 con ghi:
SC, sinh đôi ghi: SC02

\- Nhận con nuôi ghi: NCN

\- Mẹ chết, cha hưởng chế độ chăm sóc con sau sinh ghi: MC01

\- Nếu người nuôi dưỡng hưởng chế độ chăm con, ghi: MC02

\- Nếu con dưới 60 ngày tuổi chết, ghi: 60-

\- Nếu con trên 60 ngày tuổi chết, ghi: 60+

\- Nếu thực hiện các biện pháp đặt vòng, triệt sản: Đặt vòng thì ghi:
ĐV, triệt sản thì ghi: TS.

\* Đối với dưỡng sức phục hồi sức khỏe:

\- Đối với dưỡng sưc phục hồi sức khỏe( DSPHSK) sau ốm đau các bệnh
thông thường thì bỏ trống và mặc nhiên được hiểu là bệnh thông thường
nghỉ 05 ngày.

\- Đối với DSPHSK ốm đau phải phẫu thuật: ghi PT.

\- Đối với DSPHSK do mắc các bệnh cần chữa trị dài ngày ghi: BDN.

Trường hợp dưỡng sức tại gia đình thì bỏ qua không phải ghi tiếp nhưng
nếu tại cơ sở tập trung thì ghi: BDN/TT

\- DSPHSK sau thai sản: sinh 01 con, sảy thai, nạo thai, hút thai, thai
chết lưu: bỏ trống.

\- DSPHSK sau sinh mổ: PT

DSPHSK sinh đôi trở lên: SC02 nếu nghỉ tại gia đình thì chỉ ghi SC02
nhưng nếu nghỉ tập trung thì ghi: SC02/TT, với nghỉ DSPHSK sinh một con
phải phẫu thuật : PT/TT.

\- Đối với DSPHSK sau tai nạn lao động BNN ghi tỷ lệ suy giảm khả năng
lao động, nếu nghỉ tại gia đình thì bỏ trống chỉ ghi 35, nếu nghỉ tại cơ
sở tập trung thì ghi TT, ví dụ người bị TN LĐBNN nghỉ dưỡng sức tại cơ
sở tập trung tổn hại 35% khả năng lao động: 35/TT.

Cột 3/ Điều kiện tính hưởng về thời điểm:

\- Con ốm: ghi ngày tháng năm sinh của con. VD: 10/09/2015

\- Sinh con: ghi ngày tháng năm sinh của con.

\- Nhận nuôi con nuôi: ghi ngày tháng năm sinh của con.

\- Dưỡng sức PHSK sau sinh, hoặc sau ốm đau: ghi ngày tháng năm trở lại
làm việc. VD sau khi nghỉ hết chế độ thai sản quay trở lại làm việc ngày
10 tháng 9 năm 2015 thì ghi: 10/09/2015

\- DSPHSK sau TNLĐBNN: ghi ngày tháng năm hội đồng giám định y khoa kết
luận mức suy giảm khả năng lao động. VD: 10/09/2015.

Cột 4/ Ghi ngày tháng năm người lao động thực tế nghỉ việc hưởng chế độ
theo quy định.

\- Con ốm: ghi ngày tháng năm sinh của con đến ngày nghỉ hết chế độ. VD:
con sinh ngày 09/09/2015. thì ghi tại cột từ ngày: 09/09/2015

\- Nhận nuôi con nuôi: ghi ngày tháng năm sinh của con. VD: con sinh
ngày 090/09/2015 thì ghi tại cột từ ngày: 09/09/2015

\- Dưỡng sức PHSK sau sinh, hoặc sau ốm đau: ghi ngày tháng năm thực tế
bắt đầu nghỉ hưởng chế độ. VD sau khi nghỉ hết chế độ thai sản quay trở
lại làm việc ngày 10 tháng 9 năm 2015 và được BCHCĐ và đơn vị cho nghỉ
từ ngày 15 thì ghi: 15/09/2015.

\- DSPHSK sau TNLĐBNN: ghi ngày tháng năm hội đồng giám định y khoa kết
luận mức suy giảm khả năng lao động. VD: 10/08/2015.

Cột 5/ghi ngày tháng năm cuối cùng người lao động thực tế nghỉ hưởng chế
độ theo quy định.

\- Con ốm: ghi ngày tháng năm nghỉ cuối cùng VD: con ốm được nghỉ 7 ngày
từ ngày 15/09/2015 đến ngày 19 tháng 9 thì ghi 19/09/2015

\- Sinh con: ghi ngày tháng năm nghỉ cuối cùng của chế độ thai sản sinh
con: VD con sinh ngày 10 tháng 9 năm 2015 thì ghi tại cột 5 :
10/03/2016.

\- Nhận nuôi con nuôi: ghi ngày tháng năm nghỉ cuối cùng của chế độ thai
sản nhận nuôi con nuôi: VD con sinh ngày 10 tháng 9 năm 2015 thì ghi tại
cột 5 : 10/03/2016.

\- Dưỡng sức PHSK sau sinh, hoặc sau ốm đau: ghi ngày tháng năm trở lại
làm việc. VD sau khi nghỉ hết chế độ thai sản quay trở lại làm việc ngày
10 tháng 9 năm 2015 thì ghi: 10/09/2015

\- DSPHSK sau TNLĐBNN: ghi ngày tháng năm hội đồng giám định y khoa kết
luận mức suy giảm khả năng lao động. VD: 10/09/2015.

Cột 6/ Ghi tổng số ngày thực tế người lao động nghỉ việc trong kỳ đề
nghị giải quyết.

PHẦN 2; DANH SÁCH ĐỀ NGHỊ ĐIỀU CHỈNH SỐ ĐÃ ĐƯỢC GIẢI QUYẾT

Phần này được lập đối với người lao động đã được cơ quan BHXH giải quyết
hưởng trợ cấp trong các đợt trước nhưng do tính sai mức hưởng hoặc phát
sinh về hồ sơ, về chính sách hoặc tiền lương làm thay đổi mức hưởng,
phải điều chỉnh lại theo quy định

Các cột A,B,1: ghi như nội dung hướng dẫn tại phần 1.

Cột 2: Ghi đợt/ tháng/ năm đã được giải quyết.

Cột 3: Ghi rõ nội dung phải điều chỉnh như: tiền lương làm căn cứ tính
hưởng, số ngày nghỉ, mức hưởng\...

Cột C: Lý do điều chỉnh: Ghi cụ thể lý do phải điều chỉnh mức hưởng. Ví
dụ: Tiền lương tính hưởng BHXH do điều chỉnh theo lương cơ sở, do được
nâng lương, do tính sai, do bổ xung hồ sơ\...

Phần cuối danh sách phải có đầy đủ xác nhận của người lập, Thủ trưởng
đơn vị sử dụng lao động. Nếu trong danh sách có người hưởng trợ cấp
dưỡng sức, PHSK thì có thêm phần xác nhận của người đại diện có thẩm
quyền của công đoàn cơ sở (trường hợp đơn vị chưa có tổ chức công đoàn
thì phải ghi rõ chưa có tổ chức công đoàn).

Danh sach này lập trên khổ A3 hoặc A4, nộp cho cơ quan BHXH nơi đơn vị
đóng BHXH 01 bản kèm theo bản điện tử cơ sở dữ liệu của danh sách và
toàn bộ hồ sơ theo quy định. Đơn vị sử dụng lao động chịu trách nhiệm về
các thông tin nêu trong danh sách.

Thông thường khoảng 03 ngày làm việc kể từ ngày nộp mẫu c70a-HD, doanh
nghiệp sẽ nhận được Danh sách giải quyết hưởng chế độ ốm đau, thai sản,
dưỡng sức, phục hồi sức khỏe- mẫu c70b-HD, (Mẫu c70b-HD do cơ quan bảo
hiểm lập).

### BC Kế Toán 01 và 02 (Dữ Liệu Thanh Toán BH NV)

![](Ins_TaiLieuBaoHiem_01_image13.png)

## Nghiệp vụ Bảo Hiểm

### Nghiệp vụ (Tăng Lao động)

#### Đối với nhân viên tăng mới hoàn toàn (kể cả nhân viên đã có sổ BHXH)

   Phải lập danh sách D02-TS đồng thời phải lập tờ khai cấp sổ bảo hiểm
xã hội (Mẫu A01 - TS) cho những nhân viên mới.

**Tăng lao động kịp thời trong tháng**

Đơn vị phát sinh tăng lao động tháng 02/2014, báo cáo tăng lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014.

**Tăng lao động có đóng bổ sung tháng trước:**

Đơn vị phát sinh tăng lao động tháng 01/2014, báo cáo tăng lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014. Vậy thời gian từ đến
sẽ là từ tháng 01-2014 đến tháng 02-2014

#### Tăng mới cho những nhân viên Thai sản, nghỉ ốm đi làm Ví dụ: Nhân viên A nghỉ

Thai sản từ tháng 10-2013 đến tháng 04-2014 đi làm lại. Thì người dùng
phải báo tăng lại cho nhân viên này và ghi rõ lý do tăng

#### Tăng tham gia BHTN

Người lao động dã tham gia BHXH, BHYT nhưng chưa đủ điều kiện tham gia
BHTN, đến tháng 02/2014 đủ điều kiện tham gia BHTN, đơn vị báo cáo tăng
đóng BHTN từ tháng 02/2014.

### Nghiệp vụ tăng (Mức đóng)

#### Tăng lương, phụ cấp báo cáo kịp thời

Là mức tăng khi nhân viên được điều chỉnh tăng mức đóng BHXH. Tại nghiệp
vụ này ghi rõ mức lương cũ và mức lương mới thay đổi như thế nào.

#### Tăng lương có truy nộp BHXH, BHYT, BHTN

Ghi các trường hợp người lao động có điều chỉnh tăng lương và phụ cấp
nhưng chưa đóng kịp thời phải truy đóng số tiền BHXH, BHYT, BHTN của các
tháng trước.

Ví dụ: Tăng lương là tháng 01-2014 nhưng trong tháng 01-2014 quên không
đóng phần tang cho tháng này. Đến tháng 02-2014 người dùng ghi nhận tăng
lương là từ tháng 01-2014 đến tháng 02-2014

#### Điều chuyển lao động

Trường hợp điều chuyển lao động có thay đổi chức danh thì cũng ghi nhận
trong nghiệp vụ này.

### Nghiệp vụ Giảm

#### Giảm lao động báo cáo kịp thời trong tháng, có thu hồi thẻ BHYT:

VD: Đơn vị phát sinh giảm lao động tháng 02/2014, báo cáo giảm lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014, thẻ BHYT có giá trị
sử dụng từ 01/01/2012 đến 31/03/2014.

#### Giảm lao động báo cáo kịp thời trong tháng, không thu hồi thẻ BHYT:

VD: Đơn vị phát sinh giảm lao động tháng 02/2014, báo cáo giảm lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014, thẻ BHYT có giá trị
sử dụng từ 01/01/2014 đến 31/03/2014. Nhưng nhân viên không trả thẻ cho
công ty

#### Giảm lao động, truy giảm các tháng trước có thu hồi thẻ BHYT:

VD: Đơn vị phát sinh giảm lao động tháng 01/2014, báo cáo giảm lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014, thẻ BHYT có giá trị
sử dụng từ 01/01/2014 đến 31/03/2014

#### Giảm lao động, truy giảm các tháng trước không thu hồi thẻ BHYT:

VD: Đơn vị phát sinh giảm lao động tháng 01/2014, báo cáo giảm lao động,
tiền lương, phụ cấp đóng BHXH, BHYT tháng 02/2014, thẻ BHYT có giá trị
sử dụng từ 01/01/2014 đến 31/03/2014

### Nghiệp vụ Mẫu D02 

- Phần lao động tăng:

> Đưa vào đối với các trường hợp Lao động tăng mới, tăng sau ốm, thai
> sản, nghỉ không lương, điều chỉnh tăng mức đóng, truy thu BHXH, BHYT,
> BHTN.

- Phần lao động giảm:

> Đưa vào đối với các trường hợp Lao động nghỉ việc do chấm dứt hợp
> đồng, nghỉ ốm, nghỉ thai sản, nghỉ không lương, điều chỉnh giảm mức
> đóng, thoái thu BHXH, BHTY, BHTN.

- Cột tiêu chí:

> \- STT: điền số thứ tự theo từng phần\
> - Họ và tên: họ và tên người lao động\
> - Số định danh: điền số sổ BHXH của người lao động (nếu có)\
> - Cấp bậc, chức vụ, chức danh nghề, nơi làm việc: ghi rõ cấp bậc, chức
> vụ, chức danh nghề, nơi làm việc (nếu không làm việc tại khu vực đặt
> trụ sở chính).\
> - Tiền lương: ghi mức tiền lương chính\
> - CV: ghi hệ số phụ cấp chức vụ đối với người có chức vụ lãnh đạo
> trong cơ quan Hành chính - Sự nghiệp\
> - TN VK, TN Nghề: ghi tỷ lệ % Thâm niên vượt khung, Thâm niên nghề (ví
> dụ: được hưởng thâm niên vượt khung 5% thì ghi vào cột TN VK là 5,
> được hưởng thâm niên nghề 10% thì ghi vào cột TN Nghề là 10)\
> - PC khác: ghi mức phụ cấp khác được đóng BHXH theo quy định.\
> - Từ tháng: ghi tháng bắt đầu báo tăng hoặc báo giảm hoặc điều
> chỉnh\....\
> - Ghi chú: vì không có cột ĐẾN THÁNG nên trong cột ghi chú cần ghi rõ
> nội dung nghiệp vụ và đến tháng nào để cán bộ BHXH hiểu rõ nghiệp vụ
> đơn vị muốn yêu cầu. Ví dụ: điều chỉnh tăng lương từ tháng 05/2014
> nhưng đến tháng 10/2014 mới báo điều chỉnh tăng lương thì ghi vào cột
> Tiền lương là Mức lương mới, Từ tháng ghi 05/2014, Ghi chú ghi Tăng
> lương đến tháng 10/2014.
>
> Có thể viết tắt các nội dung nghiệp vụ như sau:\
> Ký hiệu Nội dung\
> AD Truy thu nguyên lương (BHXH + BHYT + BHTN\
> CD Điều chỉnh chức danh\
> DC Điều chỉnh lương (BHXH + BHYT + BHTN)\
> DN Dieu chinh tham gia that nghiep (MLTT thoi diem)\
> GH Giảm hẳn ((BHXH + BHYT + BHTN)\
> GN Giảm tham gia BHTN\
> KL Nghi khong luong ((BHXH + BHYT + BHTN)\
> OF Nghỉ do ốm đau/Nghỉ không lương ((BHXH + BHYT + BHTN)\
> ON Đi làm lại sau (BHXH + BHYT + BHTN)\
> SB Thoái thu nguyên lương (BHXH, BHTN)\
> TM Tăng mới (BHXH + BHYT + BHTN)\
> TN Tăng tham gia BHTN\
> TS Thai sản (BHXH + BHYT + BHTN)\
> TT Truy thu BHYT\
> TU Thoái thu BHYT

| **Trạng Thái D02** |  |
| --- | --- |
| Loại | Diễn Giải |
| Tăng | Tăng Do Nghỉ 14 Ngày Đi Làm Lại Tăng LĐ Tăng Sau Nghỉ Tạm Hoãn Tăng Thai Sản Tăng Bệnh Tăng BHTN Tăng BHYT |
| Giảm | Giảm Nghỉ Tạm Hoãn Giảm LĐ Giảm Thai Sản Giảm Bệnh Giảm Do Nghỉ \>= 14 Ngày |
| Thay Đổi Lương | Giảm Lương Và Thay Đổi Chức Danh Giảm Mức Đóng Tăng Lương Và Thay Đổi Chức Danh Tăng Mức Đóng Thay Đổi Chức Danh |
| Điều chỉnh | Điều chỉnh tăng Điều chỉnh giảm Điều chỉnh chức danh |
| Khác | Nghỉ luôn sau thai sản Nghỉ 14 ngày sau thai sản Nghỉ Việc Mà Tháng Trước Nghỉ \>= 14 Ngày Giảm Thai Sản Giảm LĐ Do Đổi Nơi Đóng BH Tăng LĐ Do Đổi Nơi Đóng BH |

###  Logic Lấy số quyết định ( Các loại D02)

- Nếu loại tăng là "**TM**" (Tăng mới BHXH + BHYT + BHTN) thì:

  - DateStart = Hre_Contract.DateStart

  - DateEnd = Null

  - DecisionNo = Hre_Contract.ContractNo

  - DesicionType = Hre_Contract.ContractTypeID

  - DecisionDatesigned = Hre_Contract.DateSigned

- Nếu loại tăng là "**AD**" (Truy thu nguyên lương (BHXH + BHYT + BHTN))
  thì :

  - DateStart = Ins_InsuranceSalaryPayback.FromMonthEffect

  - DateEnd = Ins_InsuranceSalaryPayback. ToMonthEffect

  - DecisionNo = Null

  - DesicionType = Null

  - DecisionDatesigned = Null

- Nếu loại tăng là "**ON**" (Nghỉ thai san, ốm ngắn / dài ngày đi làm
  lại (BHXH + BHYT + BHTN)) hoặc "**TD**" (Tăng mới chuyển từ nơi khác
  đến) hoặc "**TT**" (Tăng tham gia BHYT) hoặc "**TN**" (Tăng tham gia
  BHTN) thì:

  - DateStart = Ins_ReportD02.DateMonth

  - DateEnd = Null

  - DecisionNo = Null

  - DesicionType = Null

  - DecisionDatesigned = Null

- Nếu loại tăng là "**DC**" (Điều chỉnh lương (BHXH + BHYT + BHTN)) hoặc
  "**CD**" (Tăng điều chỉnh chức danh) thì:

  - DateStart = Hre\_ ContractExtend. DateStart

  - DateEnd = Hre\_ ContractExtend. DateEnd

  - DecisionNo = Hre\_ ContractExtend. AnnexCode

  - DesicionType = Hre\_ ContractExtend. AppendixContractTypeID

  - DecisionDatesigned = Hre\_ ContractExtend.
    DateSignedAppendixContract

- Nếu loại tăng là "**GH**" (Giảm hẳn) thì :

  - DateStart = Hre_Profile. DateQuit

  - DateEnd = Null

  - DecisionNo = Hre_Profile. ResignNo

  - DesicionType = Null

  - DecisionDatesigned = Hre_Profile. DateQuitSign

- Nếu loại tăng là "**SB**" (Bổ sung giảm nguyên lương) thì :

  - DateStart = Ins_InsuranceSalaryPayback.FromMonthEffect

  - DateEnd = Ins_InsuranceSalaryPayback. ToMonthEffect

  - DecisionNo = Null

  - DesicionType = Null

  - DecisionDatesigned = Null

- Nếu loại tăng là "**OF_1**" (Nghỉ ốm ngắn ngày) hoặc "**OF_2**" (Nghỉ
  ốm dài ngày / Thai sản không đủ dk hưởng chế độ thai sai) hoặc
  "**GD**" (Giảm đến nơi khác) hoặc "**TU**" (Giảm BHYT) hoặc "**GN**"
  (Giảm BHTN) hoặc "**KL**" (Giảm nghỉ không lương) thì :

  - DateStart = Ins_ReportD02.DateMonth

  - DateEnd = Null

  - DecisionNo = Null

  - DesicionType = Null

  - DecisionDatesigned = Null

- Nếu loại tăng là "**DC**"(Giảm mức đóng) thì :

  - DateStart = Hre\_ ContractExtend. DateStart

  - DateEnd = Hre\_ ContractExtend. DateEnd

  - DecisionNo = Hre\_ ContractExtend. AnnexCode

  - DesicionType = Hre\_ ContractExtend. AppendixContractTypeID

  - DecisionDatesigned = Hre\_ ContractExtend.
    DateSignedAppendixContract

- Nếu loại tăng là "**TS**"( (Nghỉ thai sản và đủ dk hưởng chế độ thai
  sản) thì :

  - DateStart = Hre_Profile.DateStartPregnant

  - DateEnd = Hre_Profile.DateEndPregnant

  - DecisionNo = null

  - DesicionType = null

  - DecisionDatesigned = null

### Nghiệp Vụ IBHXH (tăng và giảm) 

| **IBHXH Giảm** |  |  |
| --- | --- | --- |
| Mã IBHXH Giảm | trạng thái D02 | Diễn giải |
| GH | E_GIAM_LD E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS E_GIAM_TS_QUIT E_GIAM_QUIT_SUSPENSE | Giảm lao động Nghỉ việc mà trước đó nghỉ \>= 14 ngày Nghỉ việc sau khi nghỉ thai sản Giảm do nghỉ tạm hoãn |
| GD | E_GIAM_LD_CHANGE_INSPLACE | Giảm lao động do chuyển nơi đóng BH |
| KL | E_GIAM_LEAVE_14WORKINGDAYS | Giảm do nghỉ hơn 14 ngày |
| TS | E_GIAM_TS E_GIAM_PREGNANT_14WORKINGDAYS | Giảm thai sản Giảm do nghỉ \>= 14 ngày sau thai sản |
| SB | E_DieuChinhGiam | Điều chỉnh giảm |
| DC | E_GIAM_LUONG E_GIAM_LUONG_CHANGEJOBNAME | Giảm mức đóng Giảm lương thay đổi chức danh |
| CD | E_CHANGEJOBNAME | Đổi chức danh |
| TU | E_GIAM_LD_BHYT E_GIAM_LD_NOT_BHYT E_GIAM_BHYT E_GIAM_LD_BHYT_KOKIPTHOI | Giảm lao động trả thẻ BHYT kịp thời Giảm lao động không trả thẻ Giảm BHYT Giảm lao động không trả BHYT kịp thời |
| GN | E_GIAM_BHTN | Giảm BHTN |
| OF_1 | E_GIAM_BENH | Giảm bệnh |
| GL | E_GIAM_LD_CHANGE_LEGALENTITY | Giảm LĐ thay đổi pháp nhân |
| **IBHXH Tăng** |  |  |
| --- | --- | --- |
| Mã IBHXH Tăng | trạng thái D02 | Diễn giải |
| TM | E_TANG_LD | Tăng lao động |
| TD | E_TANG_LD_CHANGE_INSPLACE | Tăng lao động do chuyển nơi đóng BH |
| ON | E_TANG_TS E_TANG_BENH E_TANG_LEAVE_14WORKINGDAYS | Tăng thai sản Tăng bệnh Tăng do nghỉ \>= 14 ngày |
| DC | E_TANG_LUONG E_TANG_LUONG_CHANGEJOBNAME | - Tăng mức đóng - Tăng lương thay đổi chức danh nghề |
| CD | E_CHANGEJOBNAME | Đổi chức danh |
| AD | E_DieuChinhTang | Điều chỉnh tăng |
| TT | E_TANG_BHYT | Tăng BHYT |
| TN | E_TANG_BHTN | Tăng BHTN |
| TL | E_TANG_LD_CHANGE_LEGALENTITY | Tăng LĐ thay đổi pháp nhân |
| Mẫu IBHXH Tăng |  |  |
| --- | --- | --- |
| Mã | Tên | Cách lấy dữ liệu |
| [iBHXHD02TSTangCol0]{.mark} |  | Stt |
| [iBHXHD02TSTangCol1]{.mark} | Tên NV | ProfileName |
| [iBHXHD02TSTangCol2]{.mark} | Số sổ BH | Profile.[SocialInsNo]{.mark} |
| [iBHXHD02TSTangCol3]{.mark} | Ngày sinh | Profile.[DateOfBirth]{.mark} |
| [iBHXHD02TSTangCol4]{.mark} | Giới Tính | Profile.Gender |
| [iBHXHD02TSTangCol5]{.mark} | Chức danh , chức vụ | InsuranceMonthly.JobName |
| [iBHXHD02TSTangCol6]{.mark} | Lương BHXH | D02.NewBasicSalary |
| [iBHXHD02TSTangCol7]{.mark} | Hệ số |  |
| [iBHXHD02TSTangCol8]{.mark} | PC1 | D02.Allowance1 |
| [iBHXHD02TSTangCol9]{.mark} | PC2 | D02.Allowance2 |
| [iBHXHD02TSTangCol10]{.mark} | PC3 | D02.Allowance3 |
| [iBHXHD02TSTangCol11]{.mark} | PC khác | D02.[AllowanceAdditional]{.mark} |
| [iBHXHD02TSTangCol12]{.mark} | Hiệu Lực HĐ/QĐ Từ Ngày | Ins_ReportD02item. DateStart |
| [iBHXHD02TSTangCol13]{.mark} | Hiệu Lực HĐ/QĐ Đến Ngày | Ins_ReportD02item.DateEnd |
| [iBHXHD02TSTangCol14]{.mark} | Trạng thái D02 | [insReportD02ItemStatus]{.mark} |
| [iBHXHD02TSTangCol15]{.mark} | Số HĐ/QĐ Tăng | Ins_ReportD02item.DecisionNo |
| [iBHXHD02TSTangCol16]{.mark} | Loại HĐ | insReportD02Item.DecisionType |
| [iBHXHD02TSTangCol17]{.mark} | Ngày Kí HĐ | Ins_ReportD02item.DecisionDatesigned |
| [iBHXHD02TSTangCol18]{.mark} | Tỉ lệ đóng | 32.5 |
| [iBHXHD02TSTangCol19]{.mark} | Đối tượng | 1 |
| [iBHXHD02TSTangCol20]{.mark} | Tình trạng sổ BH | Nếu Hre_Profile.SocialInsNo = Null thì 1, ngược lại là 2 |
| [iBHXHD02TSTangCol21]{.mark} | Đóng BHXH cả tháng | X |
| [iBHXHD02TSTangCol22]{.mark} | Mã Tỉnh bệnh viện | [Profile.ProvinceHospital]{.mark} |
| [iBHXHD02TSTangCol2]{.mark}3 | Mã bệnh viện | Profile.[HealthTreatmentPlaceCode]{.mark} |
| [iBHXHD02TSTangCol24]{.mark} | Mã quốc tịch | Hre_Profile.NationalityID=\> Cat_Country.Code |
| [iBHXHD02TSTangCol25]{.mark} | Dân tộc | Hre_Profile.EthnicID =\>Cat_EthnicGroup.EthnicGroupName |
| [iBHXHD02TSTangCol26]{.mark} | CMND | Profile.IDNo (nếu là người VN) hoặc Profile. PassportNo (nếu là người nước ngoài. |
| [iBHXHD02TSTangCol27]{.mark} | Ngày cấp CMND | Profile.[IDDateOfIssue]{.mark} (nếu là người VN) hoặc Profile. PassportDateOfIssue (nếu là người nước ngoài) |
| [iBHXHD02TSTangCol28]{.mark} | Mã Tĩnh Cấp | Profile.[IDPlaceOfIssue]{.mark} |
| [iBHXHD02TSTangCol29]{.mark} | tên phuong xa thường tru | pVillageName =\> Cat_Village.VillageName |
| [iBHXHD02TSTangCol30]{.mark} | tên quan/huyen thường tru | [pDistrictName]{.mark} =\> Cat_District. DistrictName |
| [iBHXHD02TSTangCol31]{.mark} | tên tinh/TP thường trú | [pProvinceName]{.mark} =\> Cat_Province.ProvinceName |
| [iBHXHD02TSTangCol32]{.mark} | Số nhà thường trú | Profile.[PAddress]{.mark} |
| [iBHXHD02TSTangCol33]{.mark} | Mã xã thường trú | [pVillage]{.mark}Code |
| [iBHXHD02TSTangCol34]{.mark} | Mã quận thường trú | [pDistrict]{.mark}Code |
| [iBHXHD02TSTangCol35]{.mark} | Mã tỉnh thường trú | [pProvince]{.mark}Code |
| [iBHXHD02TSTangCol36]{.mark} | Số nhà tạm trú | Profile.[TAddress]{.mark} |
| [iBHXHD02TSTangCol37]{.mark} | Mã phường tạm trú | [tVillage]{.mark}Code |
| [iBHXHD02TSTangCol38]{.mark} | Mã Quận tạm trú | [tDistrict]{.mark}Code |
| [iBHXHD02TSTangCol39]{.mark} | Mã tỉnh tạm trú | [tProvince]{.mark}Code |
| [iBHXHD02TSTangCol40]{.mark} |  | Profile.[HomePhone]{.mark} |
| [iBHXHD02TSTangCol41]{.mark} |  | Profile.Email |
| [iBHXHD02TSTangCol42]{.mark} | Cha/mẹ |  |
| [iBHXHD02TSTangCol43]{.mark} | Thân nhân khác |  |
| [iBHXHD02TSTangCol44]{.mark} |  | Profile.CodeEmp |
| [iBHXHD02TSTangCol4]{.mark}5 | Số tài khoản | Sal_SalaryInformation.AccountNo |
| [iBHXHD02TSTangCol4]{.mark}6 | Ngân hàng | Cat_Bank.BankName |
| [iBHXHD02TSTangCol4]{.mark}7 | Chi nhánh ngân hàng | Sal_SalaryInformation.BankBrandName |
| [iBHXHD02TSTangCol4]{.mark}8 | Lương BHXH | Ins_ReportD02Item.InsuranceSalary |
| [iBHXHD02TSTangCol4]{.mark}9 | Phòng ban E_BRANCH | Cat_OrgUnit.E_BRANCH (nếu không có dữ liệu sẽ lấy Cat_Orgstructure.OrgStructureName) |
| [iBHXHD02TSTangCol50]{.mark} | Nơi cấp BHXH | Hre_Profile.SocialInsIssuePlace |
| [iBHXHD02TSTangCol51]{.mark} | Nơi đăng ký khám bệnh | Hre_Profile.HealthTreatmentPlace |
| [iBHXHD02TSTangCol52]{.mark} | Mã ngân hàng | Sal_SalaryInformation.BankID =\> Cat_Bank.BankCode |
| [iBHXHD02TSTangCol53]{.mark} | Mã chi nhánh ngân hàng | Sal_SalaryInformation.BranchID =\> Cat_Branch.BranchCode |
| [iBHXHD02TSTangCol54]{.mark} | Tên Quốc Tịch | Hre_Profile.Cat_Country =\> Cat_Country.nationallityName |
| [iBHXHD02TSTangCol55]{.mark} | Tên Phường/Xã tạm trú | tVillageName =\> Cat_Village.VillageName |
| [iBHXHD02TSTangCol56]{.mark} | Tên Quận/Huyện tạm trú | tDistrictName =\> Cat_District.DistrictName |
| [iBHXHD02TSTangCol57]{.mark} | Tên Tỉnh/TP tạm trú | pProvinceName =\> Cat_Province.ProvinceName |
| [iBHXHD02TSTangCol58]{.mark} | Mã Tỉnh/TP của CMND | Hre_Profile.IDNoProvinceID =\> Cat_Province.Code |
| [iBHXHD02TSTangCol59]{.mark} | Tên Tỉnh/TP của CMND | Hre_Profile.IDNoProvinceID =\> Cat_Province.ProvinceName |
| [iBHXHD02TSTangCol60]{.mark} | Mã Quận/Huyện của CMND | Hre_Profile.IDNoDistrictID =\> Cat_District.Code |
| [iBHXHD02TSTangCol61]{.mark} | Tên Quận/Huyện của CMND | Hre_Profile.IDNoDistrictID =\> Cat_District.DistrictName |
| [iBHXHD02TSTangCol62]{.mark} | Mã Xã/Phường của CMND | Hre_Profile.IDNoAVillageID =\> Cat_Village.Code |
| [iBHXHD02TSTangCol63]{.mark} | Tên Xã/Phường của CMND | Hre_Profile.IDNoAVillageID =\> Cat_Village.VillageName |
| [iBHXHD02TSTangCol64]{.mark} | Họ tên chủ hộ | Ins_ReportD02Item .ProfileID.ProfileMoreInfoID.HouseholderFullName |
| [iBHXHD02TSTangCol65]{.mark} | Số điện thoại của chủ hộ | Ins_ReportD02Item.ProfileID .ProfileMoreInfoID.Telephone |
| [iBHXHD02TSTangCol66]{.mark} | Số sổ hộ khẩu/ Số sổ tạm trú | Ins_ReportD02Item.ProfileID .ProfileMoreInfoID.HouseholdBookNo |
| [iBHXHD02TSTangCol67]{.mark} | Loại giấy tờ | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID.PapersType |
| [iBHXHD02TSTangCol68]{.mark} | Tỉnh thành | Ins_ReportD02Item.ProfileID .ProfileMoreInfoID.ProvinceBirthCertificateID.ProvinceName |
| [iBHXHD02TSTangCol69]{.mark} | Mã tỉnh thành | Ins_ReportD02Item.ProfileID .ProfileMoreInfoID.ProvinceBirthCertificateID.Code |
| [iBHXHD02TSTangCol70]{.mark} | Quận huyện | Ins_ReportD02Item.ProfileID .ProfileMoreInfoID.DistrictBirthCertificateID.DistrictName |
| [iBHXHD02TSTangCol71]{.mark} | Mã quận huyện | Ins_ReportD02Item.ProfileID .ProfileMoreInfoID.DistrictBirthCertificateID.Code |
| [iBHXHD02TSTangCol72]{.mark} | Phường xã | Ins_ReportD02Item.ProfileID .ProfileMoreInfoID.VillageBirthCertificateID.VillageName |
| [iBHXHD02TSTangCol73]{.mark} | Mã phường xã | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID .VillageBirthCertificateID.Code |
| [iBHXHD02TSTangCol74]{.mark} | Mã hộ gia đình | Ins_ReportD02Item.ProfileID .ProfileMoreInfoID.HouseHoldCode |
| [iBHXHD02TSTangCol75]{.mark} | Mã vùng miền | Ins_ReportD02Item.RegionID.Code |
| [iBHXHD02TSTangCol76]{.mark} | Tên vùng miền | Ins_ReportD02Item.RegionID.RegionName |
| [iBHXHD02TSTangCol77]{.mark} | Mã dân tộc | Ins_ReportD02Item.ProfileID. EthnicID. Code |
| [iBHXHD02TSTangCol78]{.mark} | Tiền Đồng Lương cu | Ins_ReportD02Item.OldBasicSalary |
| [iBHXHD02TSTangCol79]{.mark} | Trang thai D02 | Ins_ReportD02Item.Status |
| [iBHXHD02TSTangCol80]{.mark} | Số sổ BHXH | Ins_ReportD02Item.Hre_Profile.SocialInsNo |
| Mẫu IBHXH Giảm |  |  |
| --- | --- | --- |
| Mã | Tên | Cách lấy dữ liệu |
| [iBHXHD02TSGiamCol0]{.mark} | Số thứ tự | Stt­­ |
| [iBHXHD02TSGiamCol1]{.mark} | Tên NV | [Profile.ProfileName]{.mark} |
| [iBHXHD02TSGiamCol2]{.mark} | Số sổ BH | Profile.[SocialInsNo]{.mark} |
| [iBHXHD02TSGiamCol3]{.mark} | Ngày sinh | Profile.[DateOfBirth]{.mark} |
| [iBHXHD02TSGiamCol4]{.mark} | Giới tính (nữ là X) | Profile.[Gender]{.mark} |
| [iBHXHD02TSGiamCol5]{.mark} | Chức danh chức vụ | InsuranceMonthly.JobName |
| [iBHXHD02TSGiamCol6]{.mark} | Lương BHXH | [D02Item.NewBasicSalary]{.mark} |
| [iBHXHD02TSGiamCol7]{.mark} |  |  |
| [iBHXHD02TSGiamCol8]{.mark} | Phụ cấp 1 | D02Item.[Allowance1]{.mark} |
| [iBHXHD02TSGiamCol9]{.mark} | PC 2 | D02Item.[Allowance2]{.mark} |
| [iBHXHD02TSGiamCol10]{.mark} | PC 3 | D02Item.[Allowance]{.mark}3 |
| [iBHXHD02TSGiamCol11]{.mark} | PC thêm | D02Item.[AllowanceAdditional]{.mark} |
| [iBHXHD02TSGiamCol12]{.mark} | Ngày hiệu lực HĐ (từ ngày) | Ins_ReportD02item.DateStart |
| [iBHXHD02TSGiamCol13]{.mark} | Ngày hiệu lực HĐ (Đến ngày) | Ins_ReportD02item.DateEnd |
| [iBHXHD02TSGiamCol14]{.mark} | Trạng thái D02 | D02Item.Status |
| [iBHXHD02TSGiamCol15]{.mark} | Số HĐ | Ins_ReportD02item.DecisionNo |
| [iBHXHD02TSGiamCol16]{.mark} | Ngày ký HĐ | Ins_ReportD02item.DecisionDatesigned |
| [iBHXHD02TSGiamCol17]{.mark} | Tỉ lệ đóng (cố định là 32.5) | 32.5 |
| [iBHXHD02TSGiamCol18]{.mark} | Đã Báo Giảm |  |
| [iBHXHD02TSGiamCol19]{.mark} | Giảm | Nếu loại "GH (Giảm hẳn)" thì 1, ngược lại null |
| [iBHXHD02TSGiamCol20]{.mark} | Không Trả Thẻ BHYT | Nếu Hre_Profile.ReceiveHealthIns = 1 thì "X", ngược lại Null |
| [iBHXHD02TSGiamCol21]{.mark} | Mã Thẻ BHYT |  |
| [iBHXHD02TSGiamCol22]{.mark} | Ngày Trả Thẻ | Hre_Profile. ReceiveHealthIn­­­sDate |
| [iBHXHD02TSGiamCol2]{.mark}3 | Từ |  |
| [iBHXHD02TSGiamCol24]{.mark} | Đến |  |
| [iBHXHD02TSGiamCol25]{.mark} | Thời Gian Thai Sản |  |
| [iBHXHD02TSGiamCol26]{.mark} | Mã NV | Profile.CodeEmp |
| iBHXHD02TSGiamCol27 | Số tài khoản | Sal_SalaryInformation.AccountNo |
| iBHXHD02TSGiamCol28 | Ngân hàng | Cat_Bank.BankName |
| iBHXHD02TSGiamCol29 | Chi nhánh ngân hàng | Sal_SalaryInformation.BankBrandName |
| iBHXHD02TSGiamCol30 | Lương BHXH | Hre_Profile.**Sal_InsuranceSalary** |
| iBHXHD02TSGiamCol31 | Phòng ban E_BRANCH | Cat_OrgUnit.E_BRANCH (nếu không có dữ liệu sẽ lấy Cat_Orgstructure.OrgstructureName) |
| iBHXHD02TSGiamCol32 | Nơi cấp bảo hiểm xã hội | Hre_Profile.SocialInsIssuePlace |
| iBHXHD02TSGiamCol33 | Nơi ĐK khám bệnh | Hre_Profile.HealthTreatmentPlace |
| iBHXHD02TSGiamCol34 | Quốc tịch nhân viên | Hre_Profile.NationalityID =\> Cat_Country.CountryName |
| iBHXHD02TSGiamCol35 | Tỉnh thành | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID .ProvinceBirthCertificateID.ProvinceName |
| iBHXHD02TSGiamCol36 | Mã tỉnh thành | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID .ProvinceBirthCertificateID.Code |
| iBHXHD02TSGiamCol37 | Quận huyện | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID .DistrictBirthCertificateID.DistrictName |
| iBHXHD02TSGiamCol38 | Mã quận huyện | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID .DistrictBirthCertificateID.Code |
| iBHXHD02TSGiamCol39 | Phường xã | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID .VillageBirthCertificateID.VillageName |
| iBHXHD02TSGiamCol40 | Mã phường xã | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID .VillageBirthCertificateID.Code |
| iBHXHD02TSGiamCol41 | Mã hộ gia đình | Ins_ReportD02Item.ProfileID.ProfileMoreInfoID .HouseHoldCode |
| iBHXHD02TSGiamCol42 | Mã vùng miền | Ins_ReportD02Item.RegionID.Code |
| iBHXHD02TSGiamCol43 | Tên vùng miền | Ins_ReportD02Item.RegionID.RegionName |
| iBHXHD02TSGiamCol44 | Mã dân tộc | Ins_ReportD02Item.ProfileID. EthnicID. Code |
| iBHXHD02TSGiamCol45 | Tên Tỉnh/TP thường trú | Ins_ReportD02Item.ProfileID.PprovinceID.ProvinceName |
| iBHXHD02TSGiamCol46 | Tên Quận/Huyện thường trú | Ins_ReportD02Item.ProfileID.PdistrictID.DistrictName |
| iBHXHD02TSGiamCol47 | Tên Xã/Phường thường trú | Ins_ReportD02Item.ProfileID.VillageID.VillageName |
| iBHXHD02TSGiamCol48 | Số Nhà (địa chỉ thường trú) | Ins_ReportD02Item.ProfileID.PAddress |
| iBHXHD02TSGiamCol49 | Tên Tỉnh/TP tạm trú | Ins_ReportD02Item.ProfileID.TprovinceID.ProvinceName |
| iBHXHD02TSGiamCol50 | Tên Quận/Huyện tạm trú | Ins_ReportD02Item.ProfileID.TdistrictID.DistrictName |
| iBHXHD02TSGiamCol51 | Tên Xã/Phường tạm trú | Ins_ReportD02Item.ProfileID.TAVillageID.VillageName |
| iBHXHD02TSGiamCol52 | Số Nhà (địa chỉ tạm trú) | Ins_ReportD02Item.ProfileID.TAddress |
| iBHXHD02TSGiamCol53 | Tên dân tộc | Cat_EthnicGroup.EthnicGroupName |
| iBHXHD02TSGiamCol54 | Tiền Đồng lương củ | Ins_ReportD02Item.OldBasicSalary |
| iBHXHD02TSGiamCol55 | Số CMND | Hre_Profile.IDNo hoặc Hre_Profile.PassportNo |
| iBHXHD02TSGiamCol56 | Trạng thái D02 | Ins_ReportD02Item.Status |
| iBHXHD02TSGiamCol57 | Họ tên chủ hộ | Ins_ReportD02Item.Hre_Profile.Hre_ProfileMoreInfo. HouseholderFullName |
| iBHXHD02TSGiamCol58 | Số sổ hộ khẩu/ số sổ tạm trú | Ins_ReportD02Item.Hre_Profile.Hre_ProfileMoreInfo. HouseholdBookNo |
| iBHXHD02TSGiamCol59 | Mã nơi đăng ký khám chữa bệnh | Ins_ReportD02Item.Hre_Profile.IDNoProvinceID =\> Cat_Province.ProvinceName |
| iBHXHD02TSGiamCol60 | Ngày vào làm | Ins_ReportD02Item.Hre_Profile.DateHire |
| iBHXHD02TSGiamCol61 | Mã quốc tịch | Ins_ReportD02Item.Hre_Profile.NationalityID.Code |
| iBHXHD02TSGiamCol62 | số sổ BHXH | Ins_ReportD02Item.Hre_Profile.SocialInsNo |
| iBHXHD02TSGiamCol63 | Ngày cấp CMND | Ins_ReportD02Item.Hre_Profile.IDDateOfIssue |
| iBHXHD02TSGiamCol64 | Nơi cấp CMND | Ins_ReportD02Item.Hre_Profile.IDPlaceOfIssue |
| iBHXHD02TSGiamCol65 | Mã tỉnh đăng ký KCB | Ins_ReportD02Item.Hre_Profile =\> Hre_HealthInsuranceCard.ProvinceHospital |
| iBHXHD02TSGiamCol66 | Điện thoại chủ hộ | Ins_ReportD02Item.Hre_Profile.Hre_ProfileMoreInfo.Telephone |
| iBHXHD02TSGiamCol67 | Tên Tỉnh TP của chứng minh thư | Ins_ReportD02Item.Hre_Profile.IDNoProvinceID =\> Cat_Province.ProvinceName |
| iBHXHD02TSGiamCol68 | Mã Tỉnh TP của chứng minh thư | Ins_ReportD02Item.Hre_Profile.IDNoProvinceID =\> Cat_Province.Code |
| iBHXHD02TSGiamCol69 | Tên Quan Huyen của chứng minh thư | Ins_ReportD02Item.Hre_Profile.IDNoDistrictID =\> Cat_District.DistrictName |
| iBHXHD02TSGiamCol70 | Mã Quận Huyen của chứng minh thư | Ins_ReportD02Item.Hre_Profile.IDNoDistrictID =\> Cat_District.Code |
| iBHXHD02TSGiamCol71 | Tên phuong xa của chứng minh thư | Ins_ReportD02Item.Hre_Profile.IDNoAVillageID =\> Cat_Village.VillageName |
| iBHXHD02TSGiamCol72 | Mã phuong xa của chứng minh thư | Ins_ReportD02Item.Hre_Profile.IDNoAVillageID =\> Cat_Village.Code |
| iBHXHD02TSGiamCol73 | Mã phường xã của địa chỉ tạm trú | Ins_ReportD02Item.Hre_Profile.VillageID =\> Cat_Village.Code |
| iBHXHD02TSGiamCol74 | Mã phường xã của địa chỉ thường trú | Ins_ReportD02Item.Hre_Profile.TAVillageID =\> Cat_Village.Code |

### Nghiệp Vụ EBHXH (tăng, giảm và điều chỉnh)

| **EBHXH Tăng** |  |  |
| --- | --- | --- |
| Mã EBHXH Tăng | trạng thái D02 | Diễn giải |
| TM | E_TANG_LD | Tăng lao động |
| TD | E_TANG_LD_CHANGE_INSPLACE | Tăng lao động do chuyển nơi đóng BH |
| ON | E_TANG_TS E_TANG_BENH E_TANG_LEAVE_14WORKINGDAYS | Tăng thai sản Tăng bệnh Tăng do nghỉ \>= 14 ngày |
| DC | E_TANG_LUONG E_TANG_LUONG_CHANGEJOBNAME | - Tăng mức đóng - Tăng lương thay đổi chức danh nghề |
| CD | E_CHANGEJOBNAME | Đổi chức danh |
| AD | E_DieuChinhTang | Điều chỉnh tăng |
| TT | E_TANG_BHYT | Tăng BHYT |
| TN | E_TANG_BHTN | Tăng BHTN |
| **EBHXH Giảm** |  |  |
| --- | --- | --- |
| Mã EBHXH Giảm | trạng thái D02 | Diễn giải |
| GH | E_GIAM_LD E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS E_GIAM_TS_QUIT E_GIAM_QUIT_SUSPENSE | Giảm lao động Nghỉ việc mà trước đó nghỉ \>= 14 ngày Nghỉ việc sau khi nghỉ thai sản Giảm do nghỉ tạm hoãn |
| GD | E_GIAM_LD_CHANGE_INSPLACE | Giảm lao động do chuyển nơi đóng BH |
| KL | E_GIAM_LEAVE_14WORKINGDAYS | Giảm do nghỉ hơn 14 ngày |
| TS | E_GIAM_TS E_GIAM_PREGNANT_14WORKINGDAYS | Giảm thai sản Giảm do nghỉ \>= 14 ngày sau thai sản |
| SB | E_DieuChinhGiam | Điều chỉnh giảm |
| TU | E_GIAM_LD_BHYT E_GIAM_LD_NOT_BHYT E_GIAM_BHYT E_GIAM_LD_BHYT_KOKIPTHOI | Giảm lao động trả thẻ BHYT kịp thời Giảm lao động không trả thẻ Giảm BHYT Giảm lao động không trả BHYT kịp thời |
| GN | E_GIAM_BHTN | Giảm BHTN |
| OF_1 | E_GIAM_BENH | Giảm bệnh |
| GL | E_GIAM_LD_CHANGE_LEGALENTITY | Giảm mức đóng Giảm LĐ thay đổi pháp nhân |
| **EBHXH Điều chỉnh** |  |  |
| --- | --- | --- |
| Mã EBHXH Điều chỉnh | trạng thái D02 | Diễn giải |
| GH | E_GIAM_LD E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS E_GIAM_TS_QUIT E_GIAM_QUIT_SUSPENSE | Giảm lao động Nghỉ việc mà trước đó nghỉ \>= 14 ngày Nghỉ việc sau khi nghỉ thai sản Giảm do nghỉ tạm hoãn |
| GD | E_GIAM_LD_CHANGE_INSPLACE | Giảm lao động do chuyển nơi đóng BH |
| KL | E_GIAM_LEAVE_14WORKINGDAYS | Giảm do nghỉ hơn 14 ngày |
| TS | E_GIAM_TS E_GIAM_PREGNANT_14WORKINGDAYS | Giảm thai sản Giảm do nghỉ \>= 14 ngày sau thai sản |
| SB | E_DieuChinhGiam | Điều chỉnh giảm |
| TU | E_GIAM_LD_BHYT E_GIAM_LD_NOT_BHYT E_GIAM_BHYT E_GIAM_LD_BHYT_KOKIPTHOI | Giảm lao động trả thẻ BHYT kịp thời Giảm lao động không trả thẻ Giảm BHYT Giảm lao động không trả BHYT kịp thời |
| GN | E_GIAM_BHTN | Giảm BHTN |
| OF_1 | E_GIAM_BENH | Giảm bệnh |
| GL | E_GIAM_LD_CHANGE_LEGALENTITY | Giảm mức đóng Giảm LĐ thay đổi pháp nhân |
| CD | E_CHANGEJOBNAME | Đổi chức danh |

## Các Bảng sử dụng phân hệ bảo hiểm

| **STT** **Tên bảng** | **Mô tả** |

          2 Hre_Profile                       

          3 Cat_OrgStructure                  

| 4 Sys_AsynTask | xử lý phần trăm |
| 5 Cat_DayOff | Ngày nghỉ lễ |
| 6 Sal_InsuranceSalary | lương BHXH |
| 7 Hre_StopWorking | Xử lý nghỉ tạm hoãn |
| 8 Cat_GradePayroll | chế độ lương để lấy công thức bao hiểm |
| 9 Ins_InsuranceRecord | chứng từ bảo hiểm |
| 10 Cat_LeaveDayType | Loại ngày nghỉ có InsuranceType là |
                                             E_PREGNANCY_SUCKLE

| 11 Att_LeaveDay | ngày nghỉ |
| 12 Cat_HDTJobType | Loại HDTJOB (honda moi sử dụng) |
| 13 Cat_ExchangeRate | Dùng để chuyển đổi tiền tệ |
| 14 Cat_ValueEntity | Mức trần đóng BH |
| 15 Cat_Element | phần tử bảo hiểm |
| 16 Cat_Region | Vùng miền |
| 17 Cat_RegionDetail | Chi tiết vùng miền |
| 18 Cat_RateInsurance | Tỉ lệ bảo hiểm |
| 19 Sal_BasicSalary | lấy phần tử lương cơ bản để lấy các phụ cấp (lấy |
                                             LCB đã approved)

| 20 Cat_SalaryRank | lấy phần tử |
| 21 Cat_UnusualAllowanceCfg | lấy phần tử |
| 22 Cat_OrgStructureType | lấy phần tử |
| 23 Cat_JobTitle | lấy phần tử |
| 24 Cat_Position | lấy phần tử |
| 25 Cat_UsualAllowance | Phụ cấp |
| 26 Hre_WorkHistory | lấy dữ liệu lịch sử phong ban, chuc danh , chuc |
                                             vu,....

| 27 Cat_GradeAttendance | lay du lieu nghi 14 ngay (Ds Chế Độ công không Sử |
                                             Dụng In/Out)

| 28 Att_Grade | lay du lieu nghi 14 ngay (ds NV sử dụng chế độ |
                                             công)

| 29 Att_Workday | lay du lieu nghi 14 ngay (ds workday khong bao |
                                             gom nhung nguoi co che do luong ko su dung may
                                             quet the)

| 30 Att_Roster | lay du lieu nghi 14 ngay (???) |
| 31 Att_RosterGroup | lay du lieu nghi 14 ngay (???) |
| 32 Hre_HDTJob | lay du lieu nghi 14 ngay |
| 33 Cat_SalaryClass | Phần tử bảo hiểm |
| 34 Cat_AbilityTile | Phần tử bảo hiểm |
| 35 Cat_HDTJobGroup | Phần tử bảo hiểm |
| 36 Sal_Grade | Phần tử bảo hiểm |
| 37 Sal_UnusualAllowance | Phần tử bảo hiểm |
| 38 Ins_ReportD02 | BC D02 |
| 39 Ins_ReportD02Item | BC D02 |
| 40 Ins_ReportD02V2 | BC D02 V2 |
| 41 Ins_ReportD02ItemV2 | BC D02 V2 |
| 42 Ins_InsuranceSalaryPayback | Điều chỉnh bảo hiểm |
| 43 Ins_TypeD02 | Loại D02 |
| 44 Ins_InsuranceForPayrollMonthly | Phân tích bảo hiểm chốt tính lương |
| 45 Hre_HealthInsuranceCard | Thẻ BHYT |
| 46 Cat_HealthTreatmentPlace | Nơi đăng ký khám bệnh |
| 47 Cat_ExchangeRate | Tỉ giá |
| 48 Cat_InsuranceGrade | Chế độ bảo hiểm (công thức nghỉ 14 ngày) |
| 49 Ins_InsuranceGrade | Chế độ bảo hiểm NV (công thức nghỉ 14 ngày) |
| 50 Hre_Relatives | Người thân |
| 51 Cat_Village | Phường xã |
| 52 Cat_UnAllowCfgAmount | Mức thưởng phụ cấp |
| 53 Hre_ContractExtend | Số phụ lục |
| 54 Cat_Branch | Chi nhánh |
| 55 Cat_EmployeeType | Loại nhân viên |
| 56 Cat_WorkPlace | Nơi làm việc |
| 57 Att_CutOffDuration | Kỳ công |
| 58 Sys_UserInfo | Người dùng |
| 59 Sal_SalaryInformation | Thông tin lương |
| 60 Hre_ProfileMoreInfo | Thông tin thêm |

         61 Cat_NameEntity                   

| 62 Cat_Religion | Tôn giáo |
| 63 Ins_ChildSick | Con ốm |
| 64 Cat_EthnicGroup | Dân tộc |
| 65 Cat_District | Quận huyện |
| 66 Cat_Country | Thành phố |
| 67 Cat_CostCentre | Chi phí |

         68 Sys_FieldInfoCustomValue         

| 69 Cat_UnitStructure | Khối PB |
| 70 Cat_EnumTranslate | Dịch enum |
| 71 Hre_Contract | Hợp đồng |
| 72 Ins_InsuranceRecord | Chứng từ bảo hiểm |

## Mapping (V8 , V7 , V6)

| **So sánh mapping giữa các phiên bản (Bảo Hiểm bản Ver6, Ver7, Ver8)** |  |  |  |
| --- | --- | --- | --- |
| **Insurance (Ver 8)** | **Insurance (Ver 7)** | **Insurance (Ver 6)** | **Mô Tả (V8)** |
| Hre_Profile | Hre_Profile | Hre_Profile |  |
| **Ins_ProfileInsuranceMonthly** | **Ins_ProfileInsuranceMonthly** |  | Trích nộp bảo hiểm |
| **Ins_InsuranceForPayrollMonthly** |  |  | Trích nộp BH tính chốt lương |
| Ins_InsuranceRecord | Hre_InsuranceRecord | Hre_InsuranceRecord | Chứng Từ BH |
| Sal_InsuranceSalary | Sal_BasicSalary | Sal_BasicSalary | Lương BHXH |
| Att_LeaveDay | Att_LeaveDay | Att_LeaveDay | Dùng nghỉ \>=14 ngày, Thai sản |
| Cat_DayOff | Cat_DayOff | Cat_DayOff | Nghỉ lễ |
| Cat_ExchangeRate | Cat_ExchangeRate | Cat_ExchangeRate | Tỉ giá |
| Hre_Contract | Hre_Contract | Hre_Contract | Hợp đồng mới nhất |
|  | **Cat_GradeConfig** | **Cat_GradeConfig** | Tăng mới LĐ(cấu hình loại hợp đồng đóng BH) |
|  |  | **Sal_Grade** |  |
| Att_Roster | Att_Roster | Att_Roster | Dùng cho nghỉ \>=14 |
| Ins_ReportD02 | Ins_ReportD02 | Ins_ReportD02 |  |
| Ins_ReportD02Item | Ins_ReportD02Item | Ins_ReportD02Item |  |
| Cat_ValueEntity | Cat_ValueEntity | Cat_ValueEntity | Mức trần /luong tối thiểu |
| Cat_RateInsurance | Cat_RateInsurance | Cat_RateInsurance | Tỉ Lệ BH |
| Att_Workday | Unknown | Unknown | Dùng nghỉ \>=14 ngày |
| Hre_HDTJob | Unknown | Unknown | HDTJob dành cho Honda |
| Note: |  |  |  |
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
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/04-chuoi-gia-tri|Chuỗi Giá Trị (Lean Production)]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/05-database|Cấu Trúc Database]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/06-uml|Mô Hình UML & Activity Diagram]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/07-bao-cao-dong|Báo Cáo Động]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/08-van-de-bh|Vấn Đề Bảo Hiểm & Cấu Hình]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/09-bieu-do-code|Biểu Đồ Code (Kỹ Thuật)]]
