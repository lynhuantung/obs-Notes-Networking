---
Mã: "25104217-01"
aliases: 
date: "2025-10-17"
time: "14:00"
Week: "42"
tags:
  - daily
---
# Yêu cầu & tiêu chí kiểm thử (ca HC linh hoạt – linh hoạt 1 giờ)

## 1) Tóm tắt nghiệp vụ

- Ca hành chính: **08:00–17:00** (giả định nghỉ trưa **12:00–13:00** không tính công).
    
- Linh hoạt đầu ca: **tối đa 1 giờ** ⇒ **IN hợp lệ** nếu trong **[08:00, 09:00]**.
    
- **OUT hợp lệ** khi tổng giờ làm **đủ 8h** (NV thường) hoặc **7h** (NV chế độ) và **OUT nằm trong [17:00, 18:00]**.
    
- Nếu **IN nằm trong [08:00, 09:00]** nhưng **tổng giờ < ngưỡng (8h/7h)** ⇒ **xếp “về sớm”**.
    
- Khi tổng hợp công:
    
    1. **Ưu tiên xét IN hợp lệ trước** (khi **chưa có OUT**).
        
    2. Khi **đã có IN/OUT**, nếu **thiếu giờ** thì phần còn lại **kết luận “về sớm”** (NV thường: <8h, NV chế độ: <7h).
        

> Ghi chú kỹ thuật:
> 
> - **Giờ làm hiệu lực**: `effectiveIN = max(IN, 08:00)`, `effectiveOUT = min(OUT, 18:00)`.
>     
> - **Giờ làm thuần** = Thời lượng giữa `effectiveIN` và `effectiveOUT` **trừ giờ nghỉ trưa** nếu khoảng thời gian cắt qua 12:00–13:00.
>     
> - **OUT > 18:00**: phần vượt 18:00 ghi nhận riêng (OT), **không** dùng để hợp lệ ca.
>     
> - **IN < 08:00**: không coi là vào ca; phần trước 08:00 có thể tính OT đầu ca (nếu policy có), **không** dùng để hợp lệ ca.
>     
> - **IN > 09:00**: **không đạt IN linh hoạt** ⇒ **đi trễ** (không thỏa ca linh hoạt).
>     

## 2) Luồng xử lý đề xuất

1. **Xác định IN hợp lệ**
    
    - Lấy lần quẹt đầu tiên trong ngày thuộc **[08:00, 09:00]**.
        
    - Nếu lần đầu <08:00 ⇒ tạm giữ làm “early scan”, **effectiveIN = 08:00**.
        
    - Nếu tất cả >09:00 ⇒ **Late** (không thỏa linh hoạt).
        
2. **Chưa có OUT**
    
    - Nếu có **IN hợp lệ** ⇒ trạng thái tạm: **“Đang làm – chờ OUT”**.
        
    - Không IN hợp lệ ⇒ **Chưa hợp lệ ca**.
        
3. **Khi có OUT**
    
    - Tính `effectiveOUT = min(OUT, 18:00)`.
        
    - Tính **workingHours = duration(effectiveIN, effectiveOUT) – lunchBreakOverlap**.
        
    - Ngưỡng giờ: **8h** (thường) | **7h** (chế độ).
        
    - Nếu **IN ∈ [08:00,09:00]** và **workingHours < ngưỡng** ⇒ **Về sớm**.
        
    - Nếu **IN > 09:00** ⇒ **Đi trễ** (dù đủ giờ, vẫn gắn cờ “trễ”), đủ giờ thì **không về sớm**.
        
4. **Phân rã nghỉ trưa** (mặc định 12:00–13:00):
    
    - Nếu `effectiveIN < 12:00` **và** `effectiveOUT > 13:00` ⇒ trừ **1 giờ**.
        
    - Ngược lại **không trừ**.
        

## 3) Phân loại kết quả

- **ValidIN**: IN trong [08:00,09:00] **hoặc** IN trước 08:00 nhưng `effectiveIN=08:00`.
    
- **Late**: IN > 09:00.
    
- **EarlyLeave (Về sớm)**: ValidIN **và** giờ làm thuần **< ngưỡng (8h/7h)**.
    
- **OUT hợp lệ**: OUT trong [17:00,18:00] **hoặc** >18:00 (hợp lệ ca đến 18:00, phần >18:00 là OT).
    
- **Pending**: Có IN hợp lệ nhưng **chưa có OUT**.
    

## 4) Công thức tính nhanh

```
effectiveIN  = max(IN, 08:00)
effectiveOUT = min(OUT, 18:00)
rawHours     = max(0, effectiveOUT - effectiveIN)
lunchDeduct  = (effectiveIN < 12:00 && effectiveOUT > 13:00) ? 1h : 0h
workingHours = max(0, rawHours - lunchDeduct)

threshold = isSpecial ? 7h : 8h
EarlyLeave = (IN <= 09:00) && (workingHours < threshold)
Late       = (IN > 09:00)
```

## 5) Bộ test case (quan trọng)

|#|IN|OUT|Loại NV|Kỳ vọng chính|effectiveIN–OUT|Giờ thuần|Cờ/Kết luận|
|---|---|---|---|---|---|---|---|
|1|08:00|17:00|Thường|Đủ công chuẩn|08:00–17:00|8h (9h-1h trưa)|ValidIN, OUT hợp lệ, **Đủ 8h**|
|2|08:30|17:30|Thường|Đủ công chuẩn|08:30–17:30|8h (9h-1h)|ValidIN, OUT hợp lệ, **Đủ 8h**|
|3|08:45|17:10|Thường|**Thiếu giờ → về sớm**|08:45–17:10|7h25 (8h25-1h)|ValidIN, **EarlyLeave**|
|4|08:59|16:59|Thường|**Thiếu 1 phút** vẫn về sớm|08:59–16:59|7h (8h-1h)|ValidIN, **EarlyLeave**|
|5|07:50|17:00|Thường|Đủ công; 07:50 không tính trước 08:00|**08:00–17:00**|8h|ValidIN (theo 08:00), Đủ 8h|
|6|09:01|18:00|Thường|Đi trễ; giờ làm đủ|09:01–18:00|7h59 (8h59-1h)|**Late**, đủ giờ (không EarlyLeave)|
|7|09:30|18:30|Thường|Đi trễ; giờ tính đến 18:00|09:30–18:00|7h30 (8h30-1h)|**Late**, **Thiếu giờ** (không EarlyLeave vì IN>09:00)|
|8|08:10|18:30|Thường|Đủ công, phần >18:00 là OT|08:10–18:00|8h50 (9h50-1h)|ValidIN, **Đủ 8h**, có **OT**|
|9|08:10|16:30|Thường|Về sớm|08:10–16:30|7h20 (8h20-1h)|ValidIN, **EarlyLeave**|
|10|08:10|17:00|**Chế độ**|Đủ 7h ⇒ đủ công|08:10–17:00|7h50 (8h50-1h)|ValidIN, **Đủ 7h**|
|11|08:40|15:40|**Chế độ**|6h (7h-1h) ⇒ thiếu ⇒ về sớm|08:40–15:40|6h|ValidIN, **EarlyLeave (theo 7h)**|
|12|08:20|—|Thường|Chưa OUT, IN hợp lệ|—|—|**Pending**, ValidIN|
|13|10:00|—|Thường|Không thỏa linh hoạt, trễ|—|—|**Late**, Pending OUT|
|14|12:30|18:00|Thường|Đi trễ; không cắt trưa|12:30–18:00|5h30|**Late**, Thiếu giờ|
|15|08:10|12:00|Thường|Tính trước trưa; không đủ ⇒ về sớm|08:10–12:00|3h50|ValidIN, **EarlyLeave**|
|16|13:00|18:00|Thường|Không qua trưa; thiếu giờ|13:00–18:00|5h|**Late** (IN>09:00), Thiếu giờ|

> Bạn có thể bổ sung thêm case đặc thù: nhiều lần IN/OUT, OUT < IN (dữ liệu lỗi), OUT ngoài [17:00,18:00], chỉ có OUT không có IN, v.v… để test robust.

## 6) Pseudo-code (C#)

```csharp
TimeSpan START = TimeSpan.FromHours(8);
TimeSpan END   = TimeSpan.FromHours(18);
TimeSpan LUNCH_START = TimeSpan.FromHours(12);
TimeSpan LUNCH_END   = TimeSpan.FromHours(13);

bool IsSpecial; // NV chế độ (7h)
double threshold = IsSpecial ? 7.0 : 8.0;

DateTime? inScan = FindFirstInScan(day);   // chọn lần IN đầu trong ngày
DateTime? outScan = FindLastOutScan(day);  // chọn lần OUT cuối trong ngày

var result = new AttendanceResult();

if (inScan == null)
{
    result.Status = "No IN"; return result;
}

// IN validity
var inTime = inScan.Value.TimeOfDay;
bool validFlexIn = inTime <= TimeSpan.FromHours(9);
bool late = inTime > TimeSpan.FromHours(9);

DateTime effectiveIn = inScan.Value.Date.Add(
    inTime < START ? START : inTime
);
result.ValidIN = validFlexIn || inTime < START;
result.Late = late;

if (outScan == null)
{
    result.Pending = result.ValidIN;
    return result; // chờ OUT
}

var outTime = outScan.Value.TimeOfDay;
DateTime effectiveOut = outScan.Value.Date.Add(outTime > END ? END : outTime);

// Giờ làm thuần
double raw = Math.Max(0, (effectiveOut - effectiveIn).TotalHours);
bool crossesLunch = (effectiveIn.TimeOfDay < LUNCH_START) && (effectiveOut.TimeOfDay > LUNCH_END);
double workingHours = Math.Max(0, raw - (crossesLunch ? 1.0 : 0.0));

result.WorkingHours = workingHours;
result.OTHours = Math.Max(0, (outScan.Value - outScan.Value.Date.Add(END)).TotalHours); // nếu OUT > 18:00

bool earlyLeave = ( (inTime <= TimeSpan.FromHours(9)) && (workingHours + 1e-9 < threshold) );
result.EarlyLeave = earlyLeave;

result.MeetThreshold = workingHours + 1e-9 >= threshold; // epsilon tránh sai số
result.Status = late ? "Late" :
               earlyLeave ? "EarlyLeave" :
               result.MeetThreshold ? "OK" :
               "InsufficientHours";

return result;
```

