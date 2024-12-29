---
aliases:
  - Giải trình cache phân quyền không apply cho API V3
date: 2024-08-10
tags:
  - daily
  - "#cache_quyen_danh_muc"
---

> [!Tóm tắt các ý chính]
> **1.Vấn đề cache quyền danh mục lỗi lặp lại:** Do hệ thống không đồng bộ dữ liệu cache giữa các dịch vụ và không áp dụng cache thống nhất.
> 
> **2. Tính công dùng task.run:** Khi sử dụng task.run, không lấy được header `UserID`, dẫn đến vấn đề lấy dữ liệu quyền danh mục và xóa cache không hiệu quả.
> 
> **3. Phân quyền rồi nhưng api v3 không nhận:** Việc xóa cache quyền không hiệu quả khi sử dụng task.run trên api v3 do không truyền được header.
> 
> **4. 0Giải pháp:** Thêm header vào task.run để lấy được dữ liệu quyền danh mục và xóa cache hiệu quả.


> [!VẤN ĐỀ CACHE QUYỀN DANH MỤC LỖI]
> 
> Hiện trạng :
> - Hệ thống đang có: 
> + Cache Memory (dựa vào lib MemoryOptions, thư viện .Net hỗ trợ) => Nếu có vấn đề liên quan tới dựng IIS (chia làm 4 pool, thì sẽ không động bộ cache được, do từng pool đang quản lý dữ liệu riêng biệt,
> muốn giải quyết được việc này bắt buộc phải nâng framework của hệ thống lên)
> + Cache Redis (Cache phân tán, sử dụng NoSQL + Tool Redis để lưu trữ cặp Key,Value)
> => Vấn đề ban đầu đang gặp phải khi dựng Services 3.0 đang chưa đồng bộ dữ liệu cache giữa services cũ + mới, nên đã phát triển Cache Redis để đồng bộ 
> dữ liệu cache giữa các services (tất cả dự án đều phải bật cache redis).
> - Sau đó, dự án yêu cầu hỗ trợ phân quyền danh mục theo dự án, trong đó có một số danh mục đã sử dụng cache
> => Hiện trạng đang xử lý sau khi lấy dữ liệu cache thì filter lại theo điều kiện của phân quyền danh mục để lấy được danh sách tổng (sau khi đã phân quyền).
> 
> - Hiện trạng hệ thống đang apply cache không có sự thống nhất
> 
> userid, và chua clear 4 pool
> 
> Tính công dùng task.run, không lấy được header UserID nên không lấy được dữ liệu quyền danh muc
> Khi lưu người dùng, chỉ clear cache system (không clear 4 pool) => 