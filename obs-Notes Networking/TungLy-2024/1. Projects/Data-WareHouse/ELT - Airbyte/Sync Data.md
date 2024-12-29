---
aliases: 
date: 2024-11-05
tags:
  - daily
---
Đồng bộ data sang datawarehouse
[[Sources]]
[[Builder]]
[[Destinations]]


# Cấu hình đồng bộ
Airbyte để cấu hình dữ liệu từ "Source" đến "Destination". Các lựa chọn được bạn khoanh đỏ là các cấu hình của **sync mode** trong Airbyte. Dưới đây là giải thích chi tiết từng tùy chọn trong phần "Sync Mode":
![[Pasted image 20241113160524.png]]
1. <font color="#8064a2"><b>Incremental | Append + Deduped </b></font>
   - **Incremental**: Đây là chế độ chỉ đồng bộ các bản ghi mới hoặc đã cập nhật từ lần đồng bộ trước đó. Điều này giúp tiết kiệm thời gian và tài nguyên khi chỉ cần xử lý những thay đổi thay vì toàn bộ dữ liệu.
   - **Append + Deduped**: Với tùy chọn này, các bản ghi mới sẽ được thêm vào đích (destination) và Airbyte sẽ **loại bỏ các bản ghi trùng lặp** **dựa vào giá trị khóa chính** (primary key). Điều này giúp đảm bảo không có dữ liệu trùng lặp trong đích.

2. **Full refresh | Overwrite**
   - **Full refresh**: Tùy chọn này sẽ đồng bộ toàn bộ dữ liệu từ nguồn (source) mỗi lần, tức là không quan tâm đến lần đồng bộ trước đó đã có dữ liệu nào. Đây là lựa chọn phù hợp khi bạn muốn đảm bảo dữ liệu hoàn toàn khớp nhau giữa source và destination.
   - **Overwrite**: Khi sử dụng **overwrite**, **Airbyte sẽ xóa hết dữ liệu** hiện tại ở đích và ghi lại toàn bộ dữ liệu mới từ nguồn. Điều này có thể tốn tài nguyên và chỉ nên sử dụng khi bạn cần dữ liệu cập nhật hoàn toàn.

3. **Incremental | Append**
   - **Incremental**: Cũng giống như ở trên, tùy chọn này chỉ đồng bộ các bản ghi mới hoặc đã thay đổi từ lần đồng bộ trước.
   - **Append**: Với **append**, các bản ghi mới hoặc thay đổi sẽ được thêm vào đích, không loại bỏ các bản ghi cũ, kể cả khi các bản ghi đó đã thay đổi. Điều này có thể dẫn đến tình trạng trùng lặp dữ liệu.

4. **Full refresh | Append**
   - **Full refresh**: Đồng bộ toàn bộ dữ liệu từ nguồn mỗi lần.
   - **Append**: Tùy chọn **append** sẽ chỉ thêm dữ liệu mới vào đích mà không xóa dữ liệu đã có, tức là toàn bộ dữ liệu hiện tại sẽ được giữ lại và thêm dữ liệu mới vào. Điều này có thể hữu ích nếu bạn cần giữ lại lịch sử của dữ liệu.

### Khi nào sử dụng từng tùy chọn:
- **Incremental | Append + Deduped**: Nếu bạn cần cập nhật dữ liệu nhanh chóng và đảm bảo không có bản ghi trùng lặp.
- **Full refresh | Overwrite**: Khi bạn cần đảm bảo dữ liệu đích phải hoàn toàn giống với dữ liệu nguồn, không giữ lại bản ghi cũ.
- **Incremental | Append**: Khi bạn muốn bổ sung dữ liệu mới mà không cần quan tâm đến các bản ghi cũ.
- **Full refresh | Append**: Khi cần giữ lại lịch sử của dữ liệu, nhưng muốn thêm toàn bộ dữ liệu mới từ nguồn.

Hy vọng giải thích này giúp bạn chọn đúng cấu hình phù hợp với nhu cầu của bạn. 😊 Nếu bạn cần thêm chi tiết về một trường hợp cụ thể, cứ hỏi mình nhé!