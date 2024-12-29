---
aliases: 
date: 2024-08-09
tags:
  - daily
---
### Vấn đề cache quyền danh mục lỗi lặp lại

**Hiện trạng** :
- Hệ thống đang có: 
+ Cache Memory (dựa vào lib MemoryOptions, thư viện .Net hỗ trợ) => Nếu có vấn đề liên quan tới dựng IIS (chia làm 4 pool, thì sẽ không động bộ cache được, do từng pool đang quản lý dữ liệu riêng biệt,
muốn giải quyết được việc này bắt buộc phải nâng framework của hệ thống lên)
+ Cache Redis (Cache phân tán, sử dụng NoSQL + Tool Redis để lưu trữ cặp Key,Value)
=> Vấn đề ban đầu đang gặp phải khi dựng Services 3.0 đang chưa đồng bộ dữ liệu cache giữa services cũ + mới, nên đã phát triển Cache Redis để đồng bộ 
dữ liệu cache giữa các services (tất cả dự án đều phải bật cache redis).
- Sau đó, dự án yêu cầu hỗ trợ phân quyền danh mục theo dự án, trong đó có một số danh mục đã sử dụng cache
=> Hiện trạng đang xử lý sau khi lấy dữ liệu cache thì filter lại theo điều kiện của phân quyền danh mục để lấy được danh sách tổng (sau khi đã phân quyền).

- Hiện trạng hệ thống đang apply cache không có sự thống nhất

### Vấn đề 2
Tính công dùng task.run, không lấy được header UserID nên không lấy được dữ liệu quyền danh muc. Khi lưu người dùng, chỉ clear cache system (không clear 4 pool) => khi lưu người dùng clear cache 5 pool (main, portal, hr, sys, apiV3)

### Vấn đề phân quyền rồi nhưng api v3 không nhận
- Khi clear cache quyền, clear cả 5 pool, tuy nhiên, khi goi api clear pool api v3 thì gọi task run (trong đó lại gọi header, khi dùng task.run thì không lấy được header).
- Giải pháp: add header vào task run.
	- vd: 
```cs
	// Capture the current HttpContext 
	var context = HttpContext.Current; 	
	// Execute the action inside a Task  
	Task.Run(() => { 
	
	// Set the HttpContext for this thread 
	HttpContext.Current = context; 
	
	// Execute the action 
	action(); 
	
	});
```


Chưa add vào main
[Commit a37ec67c: [Tung.Ly 20240810]: khi lưu người dùng sẽ tự động add header vào task run … - Microsoft Team Foundation Server](http://172.21.35.3:8080/tfs/HRMCollection/_git/HRM9/commit/a37ec67c03ee148484a9931e5d06d418dfd67bcb)





--- 
**Tóm tắt các ý chính:**

1. **Vấn đề cache quyền danh mục lỗi lặp lại:** Do hệ thống không đồng bộ dữ liệu cache giữa các dịch vụ và không áp dụng cache thống nhất.
2. **Tính công dùng task.run:** Khi sử dụng task.run, không lấy được header `UserID`, dẫn đến vấn đề lấy dữ liệu quyền danh mục và xóa cache không hiệu quả.
3. **Phân quyền rồi nhưng api v3 không nhận:** Việc xóa cache quyền không hiệu quả khi sử dụng task.run trên api v3 do không truyền được header.
4. **Giải pháp:** Thêm header vào task.run để lấy được dữ liệu quyền danh mục và xóa cache hiệu quả.

 --- 


