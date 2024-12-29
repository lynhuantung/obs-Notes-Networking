---
aliases: 
date: 2024-08-16
tags:
  - daily
Link: "[[SQL_Query_Performance_Improved]]"
storeName: Get_MasterDataForUser
---
### Phân tích trước và sau khi refactor

**Trước khi refactor:**

- Mã code ban đầu sử dụng một truy vấn `OUTER APPLY` để lấy dữ liệu từ bảng `Cat_MasterDataGroupItem` và `Cat_MasterDataGroup`.
- Truy vấn chính được thực hiện bên trong một truy vấn lồng nhau, khiến việc đọc và bảo trì khó khăn hơn.
- Dữ liệu được nhóm lại sử dụng `STRING_AGG` để kết hợp các `ObjectID` thành một chuỗi.
- Mã cũng sử dụng biến `@IsCheckMasterData` để kiểm tra cấu hình và đưa vào kết quả.

**Sau khi refactor:**

- **Tối ưu hóa biến:** Biến `@IsCheckMasterData` được tính trước bằng cách sử dụng `SELECT TOP 1 1` thay vì `SELECT 1`, điều này tối ưu hơn khi chỉ cần kiểm tra sự tồn tại.
    
- **Sử dụng bảng tạm (Temp Table):**
    
    - Truy vấn bên trong `OUTER APPLY` được thay thế bằng một bảng tạm `#MasterDataGroupItems`.
    - Việc sử dụng bảng tạm giúp:
        - Tránh việc thực thi lại truy vấn con nhiều lần, cải thiện hiệu suất.
        - Giúp mã trở nên dễ đọc hơn và dễ bảo trì hơn do tách biệt rõ ràng các bước xử lý dữ liệu.
        - Tối ưu hóa việc truy cập dữ liệu, đặc biệt khi dữ liệu cần được truy vấn nhiều lần trong cùng một stored procedure.
- **Tối ưu hóa nhóm và kết hợp:**
    
    - Sau khi lưu trữ dữ liệu trong bảng tạm, kết quả được nhóm lại và kết hợp (`STRING_AGG`) một cách hiệu quả hơn với truy vấn đơn giản hơn.
    - Nhờ việc sử dụng bảng tạm, có thể thực hiện nhóm và kết hợp một cách dễ dàng và ít rủi ro hơn về hiệu suất.

### Tóm lại

Sau khi refactor, stored procedure đã trở nên hiệu quả hơn nhờ vào việc:

- **Cải thiện hiệu suất:** Sử dụng bảng tạm thay vì `OUTER APPLY` giúp tối ưu hóa truy vấn, giảm thiểu các truy vấn lồng nhau và cải thiện hiệu suất tổng thể.
- **Tăng tính dễ đọc và bảo trì:** Mã trở nên rõ ràng hơn, dễ hiểu hơn nhờ vào việc tách biệt các bước xử lý dữ liệu và sử dụng bảng tạm.
- **Tính hiệu quả của phép toán:** Việc tính toán biến `@IsCheckMasterData` bằng cách sử dụng `TOP 1` tối ưu hơn khi chỉ cần kiểm tra sự tồn tại của dữ liệu.

## Link:
[[Cải thiện performance Get_MasterDataForUser]]