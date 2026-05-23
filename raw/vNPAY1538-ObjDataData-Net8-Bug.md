# vNPAY1538 — Lỗi App Hiển Thị Chi Tiết Ngày Nghỉ Trống (Obj.Data.Data)

**Ticket:** vNPAY1538  
**Date:** 2026-04-28  
**Module:** ATT / Nghỉ phép — Mobile App  
**Người phân tích:** Tùng Lý  
**Project:** VnPay — HRM .NET 8

---

## Hiện trạng (Triệu chứng)

- App hiển thị DS ngày nghỉ: **2 đơn** (đúng)
- Ấn vào chi tiết 1 đơn bất kỳ: **màn hình trống, không có data**
- Testcase user: `hangnt13@vnpay.vn / C6enOup4k:qn`

## Nguyên nhân đã xác định

**Root Cause:** Cấu trúc API response KHÔNG đồng nhất giữa 2 màn hình:

| Màn hình | API Response Structure | Frontend xử lý |
|----------|----------------------|----------------|
| Đăng ký  | `Obj.Data.Data`      | ✅ Đúng (double-wrap) |
| Duyệt    | `Obj.Data.Data`      | ❌ Sai — chỉ đọc `Obj.Data` |

→ Frontend màn hình **Duyệt** thiếu điều kiện lấy `Obj.Data` → nhận được object wrapper (không phải array) → render trống.

---

## Kỹ thuật: Tại Sao Xuất Hiện Obj.Data.Data Sau .NET 8 Migration?

### Pattern 1 — Controller tự wrap + Global Filter wrap đôi

Khi migration .NET Framework → .NET 8, nhiều project bổ sung **Response Wrapper Middleware** hoặc **ActionFilter** để chuẩn hóa API response:

```csharp
// GlobalResponseFilter.cs — tự động wrap MỌI response
public void OnActionExecuted(ActionExecutedContext context) {
    if (context.Result is ObjectResult objectResult) {
        context.Result = new OkObjectResult(new ApiResponse {
            Data = objectResult.Value  // ← Wrap thêm 1 tầng
        });
    }
}
```

Nếu controller **đã tự wrap** `new ApiResponse { Data = data }` rồi, filter wrap thêm → thành `{ Data: { Data: data } }`.

```csharp
// Controller đã wrap:
return Ok(new ApiResponse { Data = data }); 
// Filter bọc thêm:
// → { "Data": { "Data": [...] } }  ← Obj.Data.Data
```

### Pattern 2 — Migration tool tạo ra lớp wrapper không nhất quán

Khi dùng migration tool tự động (VnPay dùng tool của Nguyễn Huỳnh Huy Hoàng), một số controller được chuyển đổi thêm lớp `ApiResponse<T>` wrapper, số khác thì không. Dẫn đến response structure không đồng nhất giữa các endpoint cùng module.

### Pattern 3 — System.Text.Json serialize strict hơn Newtonsoft.Json

| Serializer | Behavior | Kết quả |
|-----------|----------|---------|
| `Newtonsoft.Json` (.NET Framework) | Lenient, flatten một số trường | `Obj.Data = array` |
| `System.Text.Json` (.NET 8 default) | Strict — serialize đúng structure class | `Obj.Data.Data = array` nếu class có 2 tầng |

Khi class `ApiResult<T>` có property `Data` kiểu `ApiResult` → System.Text.Json serialize ra đúng 2 tầng, Newtonsoft có thể đã flatten.

---

## Flowchart Luồng Xảy Ra Bug

```
APP gọi API DS Ngày Nghỉ
        |
        v
API trả về: { Data: { Data: [...] } }   ← double-wrap
        |
        v
Frontend đọc Obj.Data.Data → hiển thị 2 đơn ✅
        |
User ấn vào chi tiết
        |
        v
API Duyệt trả về: { Data: { Data: {...} } }  ← cũng double-wrap
        |
        v
Frontend Duyệt đọc Obj.Data ← BUG ⚠️ (thiếu .Data nữa)
        |
        v
Obj.Data = object wrapper (không phải data)
        |
        v
Render trống ❌
```

---

## Cách Fix

### Fix Frontend (nhanh — ít rủi ro):
```javascript
// Handle cả 2 trường hợp single/double wrap:
const data = response.Data?.Data ?? response.Data;
```

### Fix Backend (chuẩn hóa — bền vững):
Đảm bảo tất cả endpoint cùng module trả về cùng cấu trúc:
```csharp
// Thống nhất — chọn 1 trong 2:
// Option A: Giữ double-wrap, sửa frontend
return Ok(new ApiResponse { Data = new { Data = leaveDetail } });

// Option B: Bỏ double-wrap ở cả 2 endpoint
return Ok(new ApiResponse { Data = leaveDetail });
```

---

## Bài Học / Prevention

1. **Sau .NET 8 migration**: Kiểm tra NGAY tất cả endpoint có Global Response Wrapper không — nếu có, tất cả controller không được tự wrap thêm.
2. **Code review checklist**: Khi thêm màn hình mới, đối chiếu cấu trúc response với màn hình đã có cùng module.
3. **Integration test**: Viết test kiểm tra `response.Data` vs `response.Data.Data` cho tất cả API public.
4. **QA**: Khi test mobile app sau migration, test luồng **list → detail** bắt buộc — đây là luồng dễ bị lỗi nhất do 2 API khác nhau.

---

## Pattern Phổ Biến Sau .NET 8 Migration tại VnPay

> ⚠️ **Cảnh báo**: Sau khi VnPay chuyển .NET Framework → .NET 8 (01/02–31/03/2025), các lỗi dạng này xuất hiện do:
> - Migration tool xử lý không đồng nhất giữa các controller
> - Thêm Global Response Filter mới trong .NET 8 pipeline
> - `System.Text.Json` serialize strict hơn làm lộ ra các double-wrap

Checklist kiểm tra khi gặp lỗi tương tự:
- [ ] API response có `Obj.Data.Data` hay `Obj.Data`?
- [ ] Có Global Response Wrapper Filter không?
- [ ] Controller có tự wrap response không?
- [ ] Frontend đang đọc đúng tầng data?

---

## Metadata

- **Tags:** `net8-migration`, `api-response`, `double-wrap`, `mobile-app`, `att`, `leave`, `vnpay`
- **Related:**
  - [[wiki/concepts/Net8-Migration]]
  - [[wiki/sources/Daily-2025-CursorAI-Net8]]
  - [[wiki/projects/VnPay-Project]]
- **Ticket:** vNPAY1538
- **Status:** Root cause identified — fix required on frontend (Duyệt screen)
