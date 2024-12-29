---
aliases:
  - Tài liệu tiêu chuẩn của Nghĩa
date: 30/05/2024
tags:
  - "#daily"
  - "#standardSE"
permalink:
---
Dựa trên tài liệu bạn đã cung cấp, dưới đây là tóm tắt các loại lỗi phổ biến cùng với các tiêu chuẩn để khắc phục sau này:

### Tóm tắt các loại lỗi:

1. **Lỗi logic và quyền chỉnh sửa:**
    
    - Vấn đề không cho phép chỉnh sửa nhưng vẫn có logic load.
    - Không mô tả rõ ràng nếu không chọn dòng thì xử lý ra sao.
2. **Lỗi khi load dữ liệu:**
    
    - Phải load lại lưới mới có dữ liệu.
    - Không tự động clear lưới khi chọn nhiều nhân viên.
3. **Lỗi giao diện:**
    
    - Popup nhảy sát lề dưới màn hình thay vì ở giữa màn hình.
    - Các control dính sát nhau, thiếu khoảng cách.
    - Lỗi vị trí các cột mặc định khi đổi qua lại giữa các màn hình.
4. **Lỗi validate:**
    
    - Validate sai tên field.
    - Không chặn ngày kết thúc trước ngày bắt đầu.
    - Validate maxlength sai.
5. **Lỗi lưu dữ liệu:**
    
    - Lỗi báo trùng dữ liệu khi chỉnh sửa.
    - Không lưu được một số thông tin khi chọn nhiều nhân viên.
6. **Lỗi dịch ngôn ngữ:**
    
    - Dịch sai key dịch EN của các field.
    - Thiếu key dịch cho các vùng lưới.

### Tiêu chuẩn khắc phục:

1. **Cải thiện logic và quyền chỉnh sửa:**
    
    - Rà soát và cập nhật logic cho các trường hợp không chỉnh sửa để đảm bảo hợp lý.
    - Thêm mô tả chi tiết trong tài liệu về các trường hợp không chọn dòng hoặc chọn nhiều dòng.
2. **Cải thiện quá trình load dữ liệu:**
    
    - Tối ưu hoá quá trình load dữ liệu để không cần phải load lại lưới.
    - Đảm bảo lưới tự động clear khi có thay đổi về nhân viên được chọn.
3. **Cải thiện giao diện:**
    
    - Đảm bảo popup hiển thị ở vị trí trung tâm màn hình.
    - Thêm khoảng cách giữa các control để cải thiện trải nghiệm người dùng.
    - Xác định và duy trì vị trí các cột mặc định khi chuyển đổi giữa các màn hình.
4. **Cải thiện validate:**
    
    - Đảm bảo các field được validate đúng tên và logic.
    - Thêm các điều kiện validate ngày để không cho phép ngày kết thúc trước ngày bắt đầu.
    - Xác định và sửa các thông báo maxlength để đúng với field tương ứng.
5. **Cải thiện lưu dữ liệu:**
    
    - Kiểm tra và khắc phục các lỗi báo trùng khi chỉnh sửa.
    - Đảm bảo tất cả thông tin được lưu khi chọn nhiều nhân viên.
6. **Cải thiện dịch ngôn ngữ:**
    
    - Kiểm tra và cập nhật các key dịch EN cho chính xác.
    - Bổ sung các key dịch còn thiếu trong các vùng lưới.

### Bảng tóm tắt:

|Loại lỗi|Mô tả vấn đề|Giải pháp|
|---|---|---|
|Lỗi logic và quyền chỉnh sửa|Không cho chỉnh sửa nhưng có logic load.|Rà soát logic, thêm mô tả chi tiết cho các trường hợp không chọn dòng.|
|Lỗi khi load dữ liệu|Phải load lại lưới mới có dữ liệu.|Tối ưu hóa quá trình load dữ liệu, tự động clear lưới khi thay đổi nhân viên.|
|Lỗi giao diện|Popup nhảy sát lề, control dính sát nhau.|Đảm bảo popup ở trung tâm, thêm khoảng cách giữa các control.|
|Lỗi validate|Validate sai tên field, maxlength sai.|Đảm bảo validate đúng tên field, cập nhật điều kiện validate ngày.|
|Lỗi lưu dữ liệu|Báo trùng khi chỉnh sửa, không lưu đủ thông tin khi chọn nhiều nhân viên.|Kiểm tra và khắc phục lỗi báo trùng, đảm bảo lưu đủ thông tin.|
|Lỗi dịch ngôn ngữ|Sai key dịch EN, thiếu key dịch.|Kiểm tra và cập nhật key dịch EN, bổ sung key dịch còn thiếu.|

# Tài liệu chuẩn hóa standard SE
Dựa trên tài liệu "StandardUI SE.doc" bạn đã cung cấp, dưới đây là một bảng tóm tắt các tiêu chuẩn mà bạn có thể áp dụng để khắc phục lỗi và đảm bảo chất lượng hệ thống:

### Tiêu chuẩn giao diện (UI Standards)

|**Tiêu chuẩn**|**Mô tả**|
|---|---|
|**Tỷ lệ màn hình chuẩn**|Hỗ trợ màn hình chế độ chuẩn: 1366 x 768|
|**Đường dẫn**|Tên đường dẫn trùng với tên màn hình. Ví dụ: Trang chủ > Chấm công > DS Tăng ca|
|**Các danh sách**|Phải có chữ “DS” đứng đầu cho tiếng Việt và “List” đứng cuối cho tiếng Anh|
|**Các màn hình báo cáo**|Phải có chữ “BC” đứng đầu cho tiếng Việt và “Report” đứng cuối cho tiếng Anh|
|**Điều kiện lọc**|Các control có độ rộng và canh chỉnh theo tiêu chuẩn cụ thể|
|**Hiển thị trên lưới**|Độ rộng và canh lề dữ liệu theo kiểu dữ liệu cụ thể, ví dụ: Code: 60px, Name: 120px|
|**Màu trạng thái trên lưới**|Mã màu cho các trạng thái như Lưu tạm, Yêu cầu, Chờ duyệt, Từ chối, Hủy, Xác nhận|

### Tiêu chuẩn button (Button Standards)

|**Tiêu chuẩn**|**Mô tả**|
|---|---|
|**Thứ tự hiển thị button**|Tạo mới > Tìm kiếm > Xuất word > Xuất excel > Đổi cột > Xóa|
|**Icon button**|Sử dụng icon thích hợp cho các button như duyệt, xác nhận, hủy bỏ|
|**Button chuẩn**|Tìm kiếm, Tạo mới, Chỉnh sửa, Xóa, Tạo mẫu, Đổi cột, Xuất BC|

### Tiêu chuẩn xử lý control (Control Handling Standards)

|**Tiêu chuẩn**|**Mô tả**|
|---|---|
|**Điều kiện lọc**|Cho phép search nhiều (multiselect), hiển thị mã và tên, từ ngày đến ngày|
|**Control ngày tháng**|Phải có từ - đến, không nhập hiểu là vô cùng, định dạng dd/mm/yyyy|
|**Control nhập sai định dạng ngày tháng**|Hệ thống sẽ tự động xóa đi dữ liệu và không tô đỏ|
|**Logic tìm kiếm**|Tìm kiếm mã nhân viên cho phép tìm nhiều, load danh mục không load danh mục có check “Vô hiệu”|

### Tiêu chuẩn mô tả xử lý (Processing Description Standards)

|**Tiêu chuẩn**|**Mô tả**|
|---|---|
|**Lưới dữ liệu**|Mô tả data source chính và trạng thái nếu có, điều kiện tìm kiếm|
|**Màn hình tạo mới**|Data source của các control khác data source chính, liệt kê các enum nếu data source của control là enum|
|**Tiêu chuẩn đặt bộ button “Lưu”**|Popup đặt giữa màn hình, trên trang mới thì góc trên tay trái màn hình|
|**Tiêu chuẩn chức năng**|Chuẩn enum trên lưới và xuất excel, thêm field động, dịch tên trường|

### Tiêu chuẩn thông báo (Notification Standards)

|**Tiêu chuẩn**|**Mô tả**|
|---|---|
|**Thông báo không thể bỏ trống**|[Tên field] không thể bỏ trống.|
|**Thông báo thành công**|Nền xanh lá cây|
|**Thông báo thất bại**|Nền đỏ nhạt|
|**Thông báo cảnh báo**|Nền vàng cam/ chữ đen|
|**Kiểm tra điều kiện xóa, duyệt**|Thông báo số dòng bị thỏa điều kiện/tổng số dòng, kiểm tra và xử lý ngay khi click button xử lý|
|**Logic thông báo khi vượt giới hạn DB**|Xử lý thông báo khi lưu|

### Tiêu chuẩn khi thêm 1 màn hình mới (New Screen Standards)

|**Tiêu chuẩn**|**Mô tả**|
|---|---|
|**Đầy đủ các button chuẩn**|Tìm kiếm, Thêm, Xóa, Sửa, Xuất excel, Đổi cột|
|**Phân quyền các button**|Bắt buộc nhập/Ẩn hiện/Dịch theo Super admin|
|**Cấu hình kiểm tra trùng**|Theo file fieldinfo/fieldinfoSpec|
|**Key dịch tiếng Anh và tiếng Việt**|Phải có key dịch cho các label và thông báo|
|**Mô tả các cột hiển thị mặc định trên lưới**|BA phải note rõ|

### Tiêu chuẩn tạo mới/điều chỉnh trên lưới (Grid Standards)

| **Tiêu chuẩn**                              | **Mô tả**                                                                            |     |
| ------------------------------------------- | ------------------------------------------------------------------------------------ | --- |
| **Tạo mới/Điều chỉnh trên lưới**            | Cho phép tạo mới, chỉnh sửa dữ liệu trên lưới, xử lý lưu và hủy thay đổi             |     |
| **Cho phép điều chỉnh các field trên lưới** | Các cột mặc định vị trí không cho phép đổi cột, các cột ẩn cho phép đổi cột hiển thị |     |

Áp dụng các tiêu chuẩn trên sẽ giúp cải thiện chất lượng hệ thống và giảm thiểu lỗi trong quá trình phát triển và bảo trì. Hy vọng bảng tóm tắt này sẽ hữu ích cho bạn trong việc quản lý và khắc phục các vấn đề trong hệ thống của mình


>[!gemini]+ Tóm tắt
>**Tóm tắt Tài liệu tiêu chuẩn của Nghĩa**
> 
> **1. Lỗi logic và quyền chỉnh sửa**
> - Cải thiện logic, mô tả trường hợp không chỉnh sửa.
> 
> **2. Lỗi load dữ liệu**
> - Tối ưu hóa quá trình load, tự động xóa lưới khi cần thiết.
> 
> **3. Lỗi giao diện**
> - Điều chỉnh vị trí popup, thêm khoảng cách giữa các nút.
> 
> **4. Lỗi validate**
> - Cập nhật điều kiện validate, sửa thông báo maxlength.
> 
> **5. Lỗi lưu dữ liệu**
> - Khắc phục lỗi báo trùng, lưu đủ thông tin khi chọn nhiều nhân viên.
> 
> **Tiêu chuẩn khắc phục**
> 
> * Tiêu chuẩn UI: Tỷ lệ màn hình, đặt tên đường dẫn, hiển thị trên lưới.
> * Tiêu chuẩn button: Thứ tự button, sử dụng biểu tượng thích hợp.
> * Tiêu chuẩn xử lý control: Điều kiện lọc, control ngày tháng.
> * Tiêu chuẩn mô tả xử lý: Mô tả trạng thái lưới, các enum.
> * Tiêu chuẩn thông báo: Định dạng thông báo, kiểm tra điều kiện xóa, duyệt.


