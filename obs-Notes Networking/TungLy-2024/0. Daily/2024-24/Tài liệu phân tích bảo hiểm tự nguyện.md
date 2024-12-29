---
aliases: 
date: 2024-06-12
---
# Phân tích bảo hiểm tự nguyện
# Logic
Logic phân tích bảo hiểm tự nguyện

Các cấu hình:

Trạng thái nghỉ được phân tích BHTN

Thay đổi pháp nhân theo (BHTN)

=========

Lấy các dòng “nhân viên nghỉ việc” -  StopWorking where

-          Status thỏa cấu hình “Trạng thái nghỉ được phân tích BHTN”

-          DateStop >= ngày phân tích

-          DateStop mới nhất

ð  List ProfileID nv nghỉ việc vẫn phân tích được List(1) – **chưa phải kết quả cuối cùng (làm bước (*) xong gán tiếp List(1))**

ð  List(1) = List(1) - PhucLoi_Giam(ProfileID)

(*)Lấy dòng Phúc lợi đã báo giảm: select from Ins_VoluntaryInsInfo

-          ProfileID thuộc List(1)

-          Status != Hủy và Từ chối

-          RelativeID = null

-          StartDate <= ngày phân tích < EndDate

-          InsType = InsType truyền vô

-          Lấy các dòng có DateEnd = DateStop ứng với Profile

ð  List PhucLoi_Giam(ProfileID)

Lấy các dòng “nhân viên không có StopWorking” select from Hre_Profile where

-          DateHireNew/DateHire <= ngày phân tích

-          ProfileID không nằm trong listProfileID của Hre_StopWorking

ð  List ProfileID nv không nghỉ việc (2)

Lấy list nv: select Hre_Profile where

-          DateQuit = null HOẶC DateQuit >= ngày phân tích

-          profileID thuộc list(1) HOẶC profileID thuộc list(2)

-          DateHireNew/DateHire <= ngày phân tích

ð  List ProfileID (3)

Lấy dòng QTCT của nv:

1)      QTCT: select Hre_WorkHistory where

-          profileID thuộc List(3)

-          Status = Duyệt

-          Ngày phân tích.addMonths(-1) <= DateEffect <= ngày phân tích

-          Lấy dòng DateEffect mới nhất (=> không trùng nv)

ð  QTCT(ALL)

-          Nếu có QTCT pháp nhân thì loại trừ ra:

ð  QTCT = QTCT(ALL) – QTCT(PN)

2)      QTCT pháp nhân:

-          Áp dụng cho phân tích Giữa kỳ

-          Từ QTCT(ALL) where Org/Company tương ứng cấu hình “Thay đổi pháp nhân theo (BHTN)”

ð  QTCT(PN)

Lấy Seniority

Lấy ContractType

Lấy Cat_VoluntaryInsType (NormSubject = true)

Lấy Ins_NormsVoluntaryIns

Foreach ListProfile (3)

-          … mapping Ins_NormsVoluntaryIns => ra list VoluntaryInsInfo đề xuất (PhucLoi_DeXuat)

Lấy DS phúc lợi :

1)       Ins_VoluntaryInsInfo: where

-          profileID thuộc listProfileID(3)

-          Status <> Hủy && Từ chối && Relative = null

-          StartDate <= ngày phân tích <= EndDate

-          InsType = InsType input

ð  PhucLoi_ALL

-          Nếu có PhucLoi(PN) thì loại trừ ra:

ð  PhucLoi = PhucLoi(ALL) – PhucLoi(PN)

2)      Ins_VoluntaryInsInfo pháp nhân:

-          Từ PhucLoi_2 where thêm ProfileID thuộc ProfileID trong QTCT(PN)

ð  PhucLoi_PN

======

Loại trừ PhucLoi_DeXuat có độ ưu tiên >= độ ưu tiên PhucLoi

ð  PhucLoi_DeXuat =  Loại trừ PhucLoi_DeXuat có độ ưu tiên >= độ ưu tiên PhucLoi

PhucLoi_PN = PhucLoi_PN.where(Cat_OrgStructure.BRANCH/COMPANY <> QTCT(PN).BRANCH/COMPANY)

Nếu có PhucLoi_PN xử lý PhucLoi_PN sau đó add vào PhucLoi_DeXuat

ð  PhucLoi_DeXuat = PhucLoi_DeXuat + PhucLoi_PN

~~Loại trừ các dòng PhucLoi_DeXuat có DateEnd = DateEnd ứng ProfileID, VoluntaryInsTypeID trong PhucLoi_ALL~~

ð  PHUCLOI_DEXUAT

Trường hợp phân tích giữa kỳ báo giảm

User phải tìm “Ngày phân tích” <= ngày nghỉ việc




--- 
**Tóm tắt 5 Ý chính:**

1. **Xác định nhân viên nghỉ việc:** Xác định những nhân viên đã nghỉ việc và vẫn được phân tích bảo hiểm tự nguyện. [[Phân tích bảo hiểm tự nguyện]]
2. **Xác định phúc lợi đã báo giảm:** Xác định các phúc lợi tự nguyện đã được báo giảm. [[Bảo hiểm tự nguyện]]
3. **Xác định nhân viên hợp lệ:** Xác định những nhân viên hợp lệ để phân tích, bao gồm cả những nhân viên đang làm việc và nghỉ việc. [[Nhân viên]]
4. **Xác định thông tin hợp đồng:** Xác định thông tin về thâm niên, loại hợp đồng, loại bảo hiểm tự nguyện và tỷ lệ hưởng. [[Hợp đồng]]
5. **Tính toán phúc lợi đề xuất:** Tính toán phúc lợi tự nguyện đề xuất cho từng nhân viên, ưu tiên phúc lợi hiện tại hơn phúc lợi đề xuất. [[Phúc lợi]]

 --- 


