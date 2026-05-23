# D02 FAQ – Không có dữ liệu (checklist chung)

> Ngày: 2026-05-02  
> Áp dụng: tất cả loại D02

---

## Sơ đồ chẩn đoán

```
Không có dữ liệu D02
│
├── [A] Header không có trong DB
│       → Chưa phân tích → Chạy phân tích lại
│
├── [B] Header có, Item = 0
│       → Phân tích không sinh ra item
│       → Xem file 03-khong-co-du-lieu-theo-loai.md
│
└── [C] Item có trong DB, lưới vẫn trống
        → Bị filter khi search
        → Checklist filter bên dưới
```

---

## [A] Kiểm tra đã phân tích chưa

```sql
-- D02 TS
SELECT ID, DateMonth, Perior FROM Ins_ReportD02
WHERE YEAR(DateMonth) = <nam> AND MONTH(DateMonth) = <thang>

-- D02 V2 / iBHXH / VietTel / VNPT
SELECT ID, DateMonth, Perior FROM Ins_ReportD02V2
WHERE YEAR(DateMonth) = <nam> AND MONTH(DateMonth) = <thang>
```

Nếu không có bản ghi → **chưa phân tích**, chạy lại phân tích D02.

---

## [B] Kiểm tra số item sau phân tích

```sql
-- D02 TS
SELECT Status, COUNT(*) FROM Ins_ReportD02Item
WHERE ReportD02ID = '<ID>'
GROUP BY Status

-- D02 V2 / iBHXH / VietTel / VNPT
SELECT Status, COUNT(*) FROM Ins_ReportD02ItemV2
WHERE ReportD02ID = '<ID>'
GROUP BY Status
```

Nếu = 0 → lỗi khâu phân tích → xem `03-khong-co-du-lieu-theo-loai.md`

---

## [C] Checklist filter khi search

| Filter | Kiểm tra | Áp dụng |
|---|---|---|
| Phòng ban | NV có thuộc phòng ban đang chọn không | Tất cả |
| Mã NV | Nhập đúng mã chưa, mã có dấu cách thừa không | Tất cả |
| **Kỳ (Perior)** | Phân tích kỳ 1 nhưng search kỳ 2 → trống | D02 V2, VietTel, VNPT |
| Nơi đóng BH | NV có đúng `SocialInsPlaceID` không | Tất cả |
| Quận huyện BH | `SocialInsDistrictID` trên item có khớp không | iBHXH |
| Nơi làm việc | `WorkPlaceID` trên item có khớp không | Tất cả |
| Công ty | `CompanyID` trên item có khớp không | iBHXH |
| Chế độ BH | `InsuranceGradeID` filter có đúng không | iBHXH |
| Ngày vào làm | `DateHireFrom/To` lọc mất NV | D02 V2 |
| Ngày nghỉ | `DateQuitFrom/To` lọc mất NV | D02 V2 |
| Đã nộp BHXH | `IsSubmitted` filter đang bật gì | Tất cả |
| DisplayCode | Chọn filter TM/DC... nhưng loại không có trong `Ins_TypeD02` | iBHXH |

---

## Kiểm tra NV có trong nguồn dữ liệu không

```sql
-- NV có active không
SELECT ID, CodeEmp, ProfileName, DateQuit
FROM Hre_Profile
WHERE CodeEmp = '<ma_nv>'

-- NV có chứng từ BH tháng đó không
SELECT ProfileID, MonthYear, SalaryInsurance, IsSocialInsurance
FROM Ins_ProfileInsuranceMonthly
WHERE ProfileID = '<ProfileID>'
ORDER BY MonthYear DESC
```
