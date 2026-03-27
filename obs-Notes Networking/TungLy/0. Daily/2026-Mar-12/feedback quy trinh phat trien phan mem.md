---
Mã: "202603210832"
aliases:
date: 2026-03-21
tags:
  - "#quy-trinh"
Project:
---


Ngoài ra anh nhận thấy có 1 số điểm rủi ro:

- Nặng về kiểm soát quá chặt chẽ dễ dẫn đến chậm(gồm 6,7 bước: Từ GAP → Task → Planning → Dev → QC → PE → Done), Task nhỏ (USP < 2) cũng đi full flow → tốn thời gian.

- Dễ thắt cổ chai ở PM và EM (vì bị dồn khá task review khá nhiều).

  

Bên dưới là 1 số ý kiển của anh:

  

1. Hiện trạng:

Quy trình bị kẹt cổ chai tại PM và EM do duyệt tuần tự → làm tăng thời gian chờ, ảnh hưởng tiến độ sprint.

Chưa thấy xuất hiện của BA (BA đang thuộc PE)

Chưa phân loại theo độ phức tạp → task nhỏ vẫn đi full flow, gây lãng phí thời gian.

Chưa có luồng riêng cho issue golive → xử lý sự cố còn chậm do phải qua toàn bộ quy trình.

  

2. Đề xuất:

Cho phép PM + EM review song song để giảm thời gian chờ.

Flow trước: PE → PM → EM → SE → QC → PE

Flow sau : PE → (PM + EM song song) → SE → QC → PE

  

Phân loại theo USP:

Task nhỏ → bỏ qua bước EM review (usp <3)

Task lớn → giữ nguyên quy trình

  

Bổ sung luồng lỗi golive khẩn cấp riêng:

Flow cũ : PE → PM → EM → Planning → SE → QC → PE → Done

Flow mới: SE → QC → PE → Done

  

Áp dụng cho lỗi golive vận hành

Kiểm soát bằng flag (ví dụ: IsHotfix) để tránh lạm dụng. Vì bug vận hành sẽ ưu tiên cao nhất.

![[Pasted image 20260321083440.png]]

![[Pasted image 20260321083451.png]]
![[Pasted image 20260321083501.png]]
![[Pasted image 20260321083509.png]]