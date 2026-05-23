# FAQ D02 – Tại sao không có dữ liệu trong báo cáo

---

## 🔴 Quy tắc hỏi ngược khi nhận báo lỗi D02

Khi user báo "D02 không lên dữ liệu" mà **chưa đủ thông tin**, hỏi lại đủ 5 câu sau trước khi debug:

| # | Câu hỏi | Mục đích |
|---|---|---|
| 1 | **Loại báo cáo nào?** | D02 TS / D02 V2 / iBHXH tăng-giảm-điều chỉnh / VietTel / VNPT |
| 2 | **Nhân viên nào?** (mã NV hoặc tên) | Kiểm tra có item trong DB không |
| 3 | **Tháng nào? Kỳ mấy?** | Xác định đúng `DateMonth` + `Perior` |
| 4 | **Mong muốn thấy gì?** (tăng / giảm / loại TM,DC...) | Xác định đúng filter loại đang tìm |
| 5 | **Gần đây có sửa thiết lập bảo hiểm không?** | `Ins_TypeD02` (IsIIns/IsVIns), cấu hình kỳ, chu kỳ tăng lao động |

> Câu 5 quan trọng: sửa `Ins_TypeD02` bật/tắt loại, đổi ngày chu kỳ (`PeriodInsuranceDayPreMonth`...) đều ảnh hưởng trực tiếp đến việc sinh và hiển thị D02.

---

> ⚠️ **Hỏi trước: loại báo cáo nào?**  
> D02 TS | D02 V2 | iBHXH (tăng / giảm / điều chỉnh) | VietTel | VNPT  
> → Mỗi loại có bảng nguồn và điều kiện lọc khác nhau.

> Nguồn: `Ins_InsuranceD02Services.cs` – HRM12-GIT  
> Ngày: 2026-05-02

---

## Checklist chung (áp dụng cho tất cả loại)

### Bước 1 – Đã phân tích D02 chưa?
- [ ] Vào màn hình **Phân tích D02**, chọn đúng tháng, nhấn **Phân tích**
- [ ] Kiểm tra bảng `Ins_ReportD02` (D02 TS) hoặc `Ins_ReportD02V2` (D02 V2 / iBHXH / VietTel / VNPT) có bản ghi với `DateMonth` đúng tháng không

```sql
-- D02 TS
SELECT * FROM Ins_ReportD02 WHERE YEAR(DateMonth) = 2026 AND MONTH(DateMonth) = 4

-- D02 V2 / iBHXH / VietTel / VNPT
SELECT * FROM Ins_ReportD02V2 WHERE YEAR(DateMonth) = 2026 AND MONTH(DateMonth) = 4
```

### Bước 2 – Có item sau phân tích không?
```sql
-- D02 TS
SELECT COUNT(*) FROM Ins_ReportD02Item WHERE ReportD02ID = '<ID>'

-- D02 V2 / iBHXH / VietTel / VNPT
SELECT COUNT(*) FROM Ins_ReportD02ItemV2 WHERE ReportD02ID = '<ID>'
```
→ Nếu = 0: lỗi ở **khâu phân tích** (xem phần phân tích từng loại bên dưới)  
→ Nếu > 0 mà lưới vẫn trống: lỗi ở **khâu filter khi search**

### Bước 3 – Kiểm tra NV có trong `hrm_ins_sp_get_ProfileDataAll` không
- [ ] NV có đang hoạt động không (`DateQuit` null hoặc > tháng cần xem)
- [ ] NV có `IsSocialInsurance = true` trên hợp đồng không

---

## Checklist theo từng loại báo cáo

---

### 1. D02 TS (`SearchD02TS_32635252`)

**Nguồn:** `Ins_ReportD02` → `Ins_ReportD02Item`

| Điều kiện filter | Kiểm tra |
|---|---|
| Tháng (`DateMonth`) | Đúng tháng/năm chưa |
| Kỳ (`cutOfDuration`) | D02 TS dùng kỳ `GETTEMP`, không chọn kỳ tự do |
| Phòng ban (`OrgIds`) | NV có thuộc phòng ban đang chọn không |
| Mã NV (`codeEmps`) | Nhập đúng mã chưa |
| Nơi đóng BH (`SocialInsPlaceID`) | Filter có đang bật không, NV có đúng nơi đóng không |
| Nơi làm việc (`WorkPlaceID`) | NV có đúng nơi làm việc không |
| Đã nộp BHXH (`IsSubmitted`) | Nếu chọn "Đã nộp" → kiểm tra `Ins_ReportD02Item.IsSubmitted` |

**Nguyên nhân phổ biến nhất:**
- Chưa phân tích → không có `Ins_ReportD02` tháng đó
- NV bị lọc ra khỏi phòng ban đang chọn

---

### 2. D02 V2 (`SearchD02TSV2_48088057`)

**Nguồn:** `Ins_ReportD02V2` → `Ins_ReportD02ItemV2`

| Điều kiện filter | Kiểm tra |
|---|---|
| Tháng (`DateMonth`) | Đúng tháng/năm chưa |
| **Kỳ (`Perior`)** | ⚠️ D02 V2 lọc theo `Perior` (kỳ 1/2/3...) — **phải chọn đúng kỳ** |
| Phòng ban / mã NV | Như D02 TS |
| Ngày vào làm (`DateHireFrom/To`) | D02 V2 có filter thêm theo ngày vào làm |
| Ngày nghỉ việc (`DateQuitFrom/To`) | D02 V2 có filter thêm theo ngày nghỉ |
| Nơi đóng BH / Nơi làm việc | Như D02 TS |
| Đã nộp BHXH | Như D02 TS |

**Nguyên nhân phổ biến nhất:**
- Chọn sai **kỳ** (Perior) — phân tích kỳ 1 nhưng search kỳ 2
- Filter ngày vào làm / ngày nghỉ lọc mất NV

---

### 3. iBHXH Tăng (`SearchiBHXHTangD02TS_91221015`)

**Nguồn:** `Ins_ReportD02V2` → `Ins_ReportD02ItemV2`  
**Filter loại:** `Ins_TypeD02.IsIIns = true` AND `CommentCode` contains "tang" (hoặc = "E_CHANGEJOBNAME")

| Điều kiện filter | Kiểm tra |
|---|---|
| Tháng / kỳ | `period = -1` → lấy tất cả kỳ của tháng đó; nếu chọn kỳ cụ thể → phải khớp |
| **Loại D02 bật iBHXH** | ⚠️ `Ins_TypeD02.IsIIns = true` — nếu loại tăng không được bật → không hiển thị |
| **DisplayCode filter** | Nếu chọn filter loại TM/DC/... → `Ins_TypeD02.DisplayCode` phải khớp |
| Phòng ban / mã NV | Như trên |
| Quận huyện BH (`SocialInsDistrictID`) | iBHXH có thêm filter quận huyện |
| Chế độ BH (`InsuranceGradeID`) | iBHXH có filter theo chế độ BH |
| Công ty (`CompanyID`) | iBHXH có filter theo công ty |
| Đã nộp BHXH | Như trên |

**Nguyên nhân phổ biến nhất:**
- `Ins_TypeD02.IsIIns` của loại đó chưa được bật → CommentCode không vào `commentCode` list → bị lọc ra hết
- Chọn filter **DisplayCode** (TM/DC...) nhưng loại đó không có trong `Ins_TypeD02`

```sql
-- Kiểm tra các loại D02 đang được bật iBHXH tăng
SELECT CommentCode, DisplayCode, StatusName, IsIIns
FROM Ins_TypeD02
WHERE IsIIns = 1 AND (CommentCode LIKE '%tang%' OR CommentCode = 'E_CHANGEJOBNAME')
```

---

### 4. iBHXH Giảm (`SearchiBHXHGiamD02TS_45192334`)

**Nguồn:** `Ins_ReportD02V2` → `Ins_ReportD02ItemV2`  
**Filter loại:** `Ins_TypeD02.IsIIns = true` AND `CommentCode` contains "giam"

| Điều kiện filter | Kiểm tra |
|---|---|
| Loại D02 bật iBHXH | `Ins_TypeD02.IsIIns = true` AND `CommentCode` chứa "giam" |
| Các filter khác | Tương tự iBHXH Tăng |

```sql
SELECT CommentCode, DisplayCode, StatusName, IsIIns
FROM Ins_TypeD02
WHERE IsIIns = 1 AND CommentCode LIKE '%giam%'
```

---

### 5. VietTel (`SearchD02TS_Viettel_93330719` / `OnComputeD02_VIETTEL_46211086`)

**Nguồn:** `Ins_ReportD02V2` → `Ins_ReportD02ItemV2`  
**Filter loại:** `Ins_TypeD02.IsVIns = true`

| Điều kiện filter | Kiểm tra |
|---|---|
| **Loại D02 bật VietTel** | ⚠️ `Ins_TypeD02.IsVIns = true` — khác với iBHXH dùng `IsIIns` |
| Kỳ | Khớp với kỳ đã phân tích |
| Các filter khác | Tương tự |

**Nguyên nhân phổ biến nhất:**
- `Ins_TypeD02.IsVIns` chưa được bật cho các loại cần hiển thị

```sql
SELECT CommentCode, DisplayCode, IsVIns, IsIIns
FROM Ins_TypeD02
WHERE IsVIns = 1
```

---

### 6. VNPT (`SearchD02TS_VNPT_18010382`)

**Nguồn:** `Ins_ReportD02V2` → `Ins_ReportD02ItemV2`  
**Đặc điểm:** Giống D02 V2 nhưng **không group** dữ liệu

| Điều kiện filter | Kiểm tra |
|---|---|
| Tháng / kỳ | Như D02 V2 |
| Các filter | Tương tự D02 V2 |

---

## Sơ đồ chẩn đoán nhanh

```
Không có dữ liệu D02
│
├── Kiểm tra Ins_ReportD02 / Ins_ReportD02V2
│   └── Không có bản ghi tháng đó
│       → Chưa phân tích → Chạy phân tích lại
│
├── Có bản ghi header nhưng Ins_ReportD02Item(V2) = 0
│   → Phân tích không sinh ra item
│   → Kiểm tra: NV có chứng từ BH tháng đó không?
│              NV có thay đổi BH so với tháng trước không?
│              Loại D02 có được bật (IsIIns/IsVIns) không?
│
└── Có item trong DB nhưng lưới trống
    → Bị filter khi search
    ├── Sai kỳ (Perior) — D02 V2 / iBHXH
    ├── Sai phòng ban / mã NV
    ├── Filter nơi đóng BH / quận huyện BH lọc mất
    ├── Filter ngày vào làm / ngày nghỉ (D02 V2)
    ├── Filter DisplayCode loại TM/DC... không khớp
    └── Filter IsSubmitted lọc mất
```

---

## Query chẩn đoán tổng hợp

```sql
-- 1. Kiểm tra header D02 tháng cần xem
SELECT 'D02TS' AS Loai, ID, DateMonth, Perior FROM Ins_ReportD02
WHERE YEAR(DateMonth) = 2026 AND MONTH(DateMonth) = 4
UNION ALL
SELECT 'D02V2', ID, DateMonth, Perior FROM Ins_ReportD02V2
WHERE YEAR(DateMonth) = 2026 AND MONTH(DateMonth) = 4

-- 2. Đếm item theo loại trạng thái
SELECT Status, COUNT(*) AS SoLuong
FROM Ins_ReportD02ItemV2
WHERE ReportD02ID = '<ID>'
GROUP BY Status
ORDER BY SoLuong DESC

-- 3. Kiểm tra cấu hình Ins_TypeD02
SELECT CommentCode, DisplayCode, StatusName, IsIIns, IsVIns
FROM Ins_TypeD02
ORDER BY CommentCode
```
