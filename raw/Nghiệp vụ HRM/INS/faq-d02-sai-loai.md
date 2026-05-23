# FAQ D02 – Báo sai loại (TM, TD, ON, DC, CD, TN, TT, AD)

> ⚠️ **Khi nhận câu hỏi về D02, hỏi trước: loại báo cáo nào?**
> D02 TS | D02 V2 | **iBHXH** (tăng/giảm/điều chỉnh) | VietTel | VNPT
> → Mỗi loại dùng hàm Search và nguồn dữ liệu khác nhau dù cùng bảng `Ins_ReportD02ItemV2`.

> Nguồn: phân tích `Ins_InsuranceD02Services.cs` – HRM12-GIT  
> Ngày: 2026-05-02  
> Đối tượng: Nghiệp vụ / kế toán BHXH

---

## Bảng mapping loại D02 (iBHXH)

| Trạng thái nội bộ (Status) | Loại iBHXH hiển thị | Ý nghĩa |
|---|---|---|
| E_TANG_LD | **TM** | Tăng mới lao động (vào mới, quay lại sau tạm hoãn) |
| E_TANG_LD_CHANGE_INSPLACE | **TD** | Tăng do chuyển nơi đóng BHXH |
| E_TANG_LD_CHANGE_LEGALENTITY | **TD** | Tăng do chuyển pháp nhân |
| E_TANG_TS | **ON** | Tăng thai sản |
| E_TANG_BENH | **ON** | Tăng ốm đau |
| E_TANG_LEAVE_14WORKINGDAYS | **ON** | Tăng nghỉ ≥ 14 ngày làm việc |
| E_TANG_LUONG | **DC** | Tăng điều chỉnh lương |
| E_TANG_LUONG_TS | **DC** | Tăng điều chỉnh lương thai sản |
| E_TANG_LUONG_CHANGEJOBNAME | **DC** | Tăng lương kèm đổi chức danh |
| E_DieuChinhTang | **AD** | Điều chỉnh tăng (thủ công) |
| E_TANG_BHYT | **TT** | Tăng BHYT |
| E_TANG_BHTN | **TN** | Tăng BHTN |
| E_CHANGEJOBNAME | **CD** | Thay đổi chức danh (lương không đổi) |
| E_GIAM_LUONG | **DC** | Giảm điều chỉnh lương |
| E_GIAM_LUONG_CHANGEJOBNAME | **DC** | Giảm lương kèm đổi chức danh |
| E_DieuChinhGiam | **SB** | Điều chỉnh giảm (thủ công) |
| E_GIAM_BENH | **OF_1** | Giảm ốm đau |
| E_GIAM_LDDIE / E_GIAM_LDRETIREMENT | **GH** | Giảm do tử vong / nghỉ hưu |

---

## FAQ

### 1. Tại sao nhân viên hiển thị loại TM nhưng thực ra phải là TD?

**Nguyên nhân:** NV chuyển nơi đóng BHXH (đổi đơn vị đóng) nhưng hệ thống lại ghi `E_TANG_LD` thay vì `E_TANG_LD_CHANGE_INSPLACE`.

**Điều kiện để hệ thống chọn TD thay vì TM:**
- Trường `SocialInsPlaceID` của NV phải **khác** so với tháng trước (inFirst vs inNow).
- Nếu trường này không được cập nhật đúng trên hồ sơ bảo hiểm, hệ thống rơi vào nhánh `E_TANG_LD` → ra loại TM.

**Kiểm tra:** So sánh `SocialInsPlaceID` trong `Ins_ProfileInsuranceMonthly` của 2 tháng liên tiếp.

---

### 2. Tại sao nhân viên hiển thị TM nhưng phải là DC (điều chỉnh lương)?

**Nguyên nhân:** NV vừa có hợp đồng BHXH mới **trong chu kỳ tăng lao động** (từ 16/[N-1] đến 15/[N]) nên hệ thống ưu tiên xét `E_TANG_LD` → TM trước. Logic tăng lương (DC) chỉ được xét **sau** khi không rơi vào các trường hợp ưu tiên cao hơn.

**Điều kiện hệ thống ưu tiên TM:**
- Có hợp đồng BHXH đầu tiên (`contractSocials` – lấy hợp đồng sớm nhất) nằm trong khoảng `dateFromIncreaseLabor` → `dateToIncreaseLabor`.
- `isPriorityIncrease = true` → bỏ qua toàn bộ các check khác (lương, chức danh...).

**Kiểm tra:** Xem `DateStart` của hợp đồng BHXH đầu tiên của NV. Nếu nằm trong chu kỳ đang phân tích thì đúng là TM.

---

### 3. Tại sao nhân viên quay lại sau tạm hoãn lại không có D02 (bị bỏ qua)?

**Nguyên nhân:** Tháng trước đã có D02 trạng thái `E_TANG_LD` (IsPayBack = true) rồi → hệ thống `continue` (bỏ qua) để không TM lại lần nữa.

> **Code logic:** *"Nếu tháng trước có rồi thì tháng sau không được TM nữa – chỉ TM một lần – trường hợp đặc thù 162065"*

**Kiểm tra:** Query `Ins_ReportD02Item` tháng trước, lọc `ProfileID = NV`, `Status = 'E_TANG_LD'`, `IsPayBack = true`. Nếu có → đây là nguyên nhân.

---

### 4. Tại sao NV không có D02 dù lương thay đổi?

Các điều kiện cần hội đủ để sinh D02 loại DC:
1. `inFirst != null` và `inNow != null` (có dữ liệu 2 tháng).
2. `insuranceSalaryFirst != 0 && insuranceSalaryNow != 0`.
3. `insuranceSalaryFirst != insuranceSalaryNow` hoặc `insuranceAmountFirst != insuranceAmountNow`.
4. `isPriorityIncrease == false` (không đang ưu tiên tăng mới LĐ).
5. `inNow.IsDecreaseWorkingDays != true`.

Nếu thiếu bất kỳ điều kiện nào, hệ thống không sinh dòng DC.

---

### 5. Tại sao nhân viên hiển thị ON thay vì TM?

**Nguyên nhân:** NV đang trong trạng thái thai sản (`IsPregnant = true`) hoặc ốm đau (`lstInsSick` có dữ liệu), và trạng thái tương ứng (`E_TANG_TS`, `E_TANG_BENH`) được check **trước** khi check TM ở một số luồng (VietTel, VNPT).

**Lưu ý:** Với luồng iBHXH chuẩn, TM (`E_TANG_LD`) luôn được ưu tiên nếu có hợp đồng mới trong chu kỳ.

---

### 6. Khi nào D02 mới sinh ra (điều kiện sinh D02)?

Hệ thống sinh D02 khi:
- Có ít nhất 1 dòng `Ins_ProfileInsuranceMonthly` (inNow) trong tháng phân tích.
- NV nằm trong danh sách `insuranceProfileIds` được chọn phân tích.
- Rơi vào ít nhất 1 trong các nhánh: tăng LĐ / tăng lương / giảm / điều chỉnh.

Không sinh D02 nếu:
- Không có dữ liệu `inNow` (NV không có chứng từ BH tháng đó).
- Bị `continue` do tháng trước đã có (quy tắc TM 1 lần).
- Loại D02 không nằm trong danh sách `Ins_TypeD02` được bật (`IsIIns = true` hoặc `IsVIns = true`).

---

### 7. Cách kiểm tra nhanh khi nhận báo sai loại D02

```sql
-- 1. Xem trạng thái nội bộ của NV tháng đó
SELECT ri.ProfileID, ri.Status, ri.IBHXHCode, ri.IsPayBack, r.DateMonth
FROM Ins_ReportD02Item ri
JOIN Ins_ReportD02 r ON r.ID = ri.ReportD02ID
WHERE ri.ProfileID = '<ProfileID>'
ORDER BY r.DateMonth DESC

-- 2. Kiểm tra hợp đồng BHXH đầu tiên của NV
SELECT TOP 1 ProfileID, DateStart, ContractTypeName
FROM Ins_Contract
WHERE ProfileID = '<ProfileID>'
  AND IsSocialInsurance = 1
ORDER BY DateStart ASC

-- 3. Kiểm tra dữ liệu BH 2 tháng
SELECT ProfileID, MonthYear, SocialInsPlaceID, IsPregnant, IsDecreaseWorkingDays
FROM Ins_ProfileInsuranceMonthly
WHERE ProfileID = '<ProfileID>'
ORDER BY MonthYear DESC
```

---

## Ghi chú kỹ thuật

- File xử lý chính: `HRM.Business.Insurance.Domain/Ins_InsuranceD02Services.cs`
- Mapping loại iBHXH nằm tại hàm `GetD02ASCStatusesiBHXH()`, `GetD02DESCStatusesiBHXH()`, `GetD02DieuChinhStatusesiBHXH()`
- Loại D02 hiển thị phụ thuộc loại D02 được bật trong `Ins_TypeD02` (cấu hình theo từng đơn vị: `IsIIns`, `IsVIns`)
