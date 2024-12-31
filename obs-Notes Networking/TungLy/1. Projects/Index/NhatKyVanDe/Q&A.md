---
Mã vấn đề: INS02
Tiêu đề: Ebhxh lỗi nơi đóng
Related: "[[0.Nhật Ký Vấn Đề]]"
tags:
  - "#nhatkyvande"
  - "#Q-A"
---
Q: Phân tích bảo hiểm xã hội nơi đóng A, và phân tích BH nơi đóng B ở tháng trước. Tại sao ebhxh không ra dữ liệu
A: Nơi đóng bh dựa vào Hre_Profile

### Câu hỏi 1
#### Tag : #khoadoituong #sys 
#### Q:  Trường hợp khóa phòng ban A , nhưng phòng ban B bị khóa
#### A:  
	- Nguyên nhân: Chưa truyền orgStructureID trước khi check lock
	- Giải pháp : có hỗ trợ hàm chung để truyền OrgStructureID :  
		- hàm`GetWorkHistoryEntity` : lấy lịch sử nhân viên
![[Pasted image 20240613173831.png]]
		- Hàm Att_UpdateWorkHistory : dùng set lich sử nhân viên vào model

---

### Câu hỏi 2
#### Tag : 
#### Q:  
#### A:  
	- Nguyên nhân:
	- Giải pháp:

