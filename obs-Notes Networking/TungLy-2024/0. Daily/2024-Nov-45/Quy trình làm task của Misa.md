---
aliases: 
date: 2024-11-06
tags:
  - daily
  - "#misa"
  - "#quytrinh"
  - "#quanlytaisan"
Link Confluence: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=43878692
---

# Giới thiệu
---

- Quy trình triển khai yêu cầu từ khách hàng này được thực hiện qua các bước chính, bắt đầu từ khâu thu thập và phân tích yêu cầu, chuyển giao cho Dev thực hiện, kiểm tra nội bộ và cuối cùng là kiểm tra cùng khách hàng. Trong quy trình, **PE** chịu trách nhiệm trao đổi, chốt yêu cầu với khách hàng, đồng thời hỗ trợ Dev trong suốt quá trình phát triển. **Dev** sẽ thực hiện yêu cầu, kiểm tra sản phẩm, và đảm bảo rằng sản phẩm hoàn thiện đáp ứng đầy đủ mong đợi của khách hàng. Quy trình này giúp đơn giản hóa luồng công việc và tăng tốc độ triển khai trong các dự án có quy mô nhỏ.

# Mục đích quy trình
---

- Quy trình này nhằm tối ưu hóa thời gian và nguồn lực trong việc tiếp nhận và triển khai yêu cầu từ khách hàng. Mục tiêu là đảm bảo rằng các yêu cầu của khách hàng được nắm bắt rõ ràng, chuyển giao hiệu quả đến Dev, và sản phẩm cuối cùng được kiểm tra kỹ lưỡng trước khi bàn giao. Dù không có sự tham gia của BA và QC, quy trình vẫn hướng đến việc cung cấp một sản phẩm chất lượng cao, đáp ứng đúng nhu cầu và mang lại sự hài lòng cho khách hàng.

# Quy trình làm task của Misa
---

### 1. **Thu thập yêu cầu từ khách hàng**

- **Người thực hiện**: **PE**
- **Mô tả**: PE gặp gỡ và trao đổi với khách hàng để nắm rõ yêu cầu và mong muốn của họ, ghi chú lại các ý chính và chi tiết yêu cầu.

### 2. **Soạn tài liệu yêu cầu khách hàng**

- **Người thực hiện**: **PE**
- **Mô tả**: Dựa trên các thông tin thu thập được, PE tạo ra một tài liệu chi tiết mô tả các yêu cầu của khách hàng, bao gồm các tính năng cần thiết và bất kỳ điều kiện cụ thể nào khác mà khách hàng yêu cầu.

### 3. **Đánh giá yêu cầu khách hàng**

- **Người thực hiện**: **PE và Dev**
- **Mô tả**: PE chia sẻ tài liệu yêu cầu với **Dev** để Dev xem xét và đánh giá tính khả thi của yêu cầu. Dev có thể đưa ra các thắc mắc hoặc đề xuất cải tiến, và PE sẽ làm việc lại với khách hàng nếu có vấn đề cần làm rõ.

### 4. **Chốt yêu cầu và tạo task**

- **Người thực hiện**: **PE**
- **Mô tả**: Sau khi đạt được sự đồng thuận về yêu cầu và chi tiết, PE chốt yêu cầu cuối cùng với khách hàng, rồi tạo task trong hệ thống quản lý công việc, mô tả chi tiết yêu cầu và gán task này cho **Dev**.

### 5. **Phát triển sản phẩm**

- **Người thực hiện**: **Dev**
- **Mô tả**: Dev nhận task, tiến hành phát triển tính năng và thực hiện các công việc cần thiết để hoàn thành theo tài liệu yêu cầu của khách hàng.

### 6. **Kiểm tra nội bộ (Self-test)**

- **Người thực hiện**: **Dev**
- **Mô tả**: Sau khi hoàn thành phát triển, Dev tự kiểm tra (test) tính năng và đảm bảo sản phẩm hoạt động đúng như yêu cầu trước khi đánh dấu task là "Resolved".

### 7. **Kiểm tra và nghiệm thu sản phẩm với khách hàng**

- **Người thực hiện**: **PE**
- **Mô tả**: Sau khi Dev đánh dấu task là "Resolved", PE tiến hành kiểm tra (test) sản phẩm cùng với khách hàng để xác nhận rằng tính năng được phát triển đáp ứng đúng yêu cầu và mong đợi của họ. Nếu có lỗi hoặc điều chỉnh cần thiết, PE sẽ chuyển lại task cho Dev để sửa.

## Flowchart của quy trình làm task
---
![[Pasted image 20241106092423.png]]


## Ý kiến cá nhân của DEV- VnR
---
Quy trình hiện tại thiếu **BA** và **QC** sẽ giúp ngắn gọn và tiết kiệm thời gian, nhưng tiềm ẩn rủi ro:

1. **Thiếu phân tích chi tiết từ BA**: PE có thể bỏ sót hoặc hiểu sai yêu cầu của khách hàng, dẫn đến Dev thực hiện không đúng ý định hoặc phải chỉnh sửa nhiều lần.
    
2. **Thiếu kiểm tra chất lượng từ QC**: Dev tự kiểm tra dễ thiếu tính khách quan, dẫn đến lỗi nhỏ hoặc vấn đề trong trải nghiệm người dùng mà chỉ phát hiện khi khách hàng sử dụng, gây ảnh hưởng đến uy tín.
    
3. **PE gánh nhiều trách nhiệm**: PE phải kiêm nhiệm nhiều vai trò, dễ dẫn đến quá tải và thiếu sót trong phân tích hoặc kiểm tra.
    

### Giải pháp đề xuất:

- **Thêm bước review giữa PE và Dev** để giảm lỗi.
- **Sử dụng checklist** khi Dev kiểm tra sản phẩm.
- **Đào tạo PE và Dev** về phân tích và kiểm tra để hỗ trợ vai trò BA và QC.

Tóm lại, quy trình ngắn gọn nhưng sẽ cần biện pháp bổ sung để đảm bảo **yêu cầu chính xác** và **chất lượng** khi bàn giao.