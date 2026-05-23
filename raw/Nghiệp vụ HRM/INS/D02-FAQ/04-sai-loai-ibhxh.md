# D02 FAQ – Báo sai loại iBHXH (TM, TD, ON, DC, CD, TN, TT, AD)

> Ngày: 2026-05-02  
> Nguồn: `Ins_InsuranceD02Services.cs` – hàm `GetD02ASCStatusesiBHXH`, `GetD02DESCStatusesiBHXH`

---

## Bảng mapping loại iBHXH

| Trạng thái nội bộ (Status) | Loại hiển thị | Ý nghĩa |
|---|---|---|
| E_TANG_LD | **TM** | Tăng mới lao động |
| E_TANG_LD_CHANGE_INSPLACE | **TD** | Tăng do chuyển nơi đóng BH |
| E_TANG_LD_CHANGE_LEGALENTITY | **TD** | Tăng do chuyển pháp nhân |
| E_TANG_TS | **ON** | Tăng thai sản |
| E_TANG_BENH | **ON** | Tăng ốm đau |
| E_TANG_LEAVE_14WORKINGDAYS | **ON** | Tăng nghỉ ≥ 14 ngày |
| E_TANG_LUONG | **DC** | Tăng điều chỉnh lương |
| E_TANG_LUONG_CHANGEJOBNAME | **DC** | Tăng lương kèm đổi chức danh |
| E_DieuChinhTang | **AD** | Điều chỉnh tăng thủ công |
| E_TANG_BHYT | **TT** | Tăng BHYT |
| E_TANG_BHTN | **TN** | Tăng BHTN |
| E_CHANGEJOBNAME | **CD** | Đổi chức danh (lương không đổi) |
| E_GIAM_LUONG | **DC** | Giảm điều chỉnh lương |
| E_GIAM_LUONG_CHANGEJOBNAME | **DC** | Giảm lương kèm đổi chức danh |
| E_DieuChinhGiam | **SB** | Điều chỉnh giảm thủ công |
| E_GIAM_BENH | **OF_1** | Giảm ốm đau |
| E_GIAM_LDDIE / E_GIAM_LDRETIREMENT | **GH** | Giảm tử vong / nghỉ hưu |

---

## FAQ – Các trường hợp sai loại thường gặp

### TM thay vì TD (chuyển nơi đóng BH)
**Nguyên nhân:** `SocialInsPlaceID` trên hồ sơ BH không thay đổi giữa tháng [N-1] và [N] → hệ thống không nhận ra là chuyển nơi.  
**Kiểm tra:**
```sql
SELECT ProfileID, MonthYear, SocialInsPlaceID
FROM Ins_ProfileInsuranceMonthly
WHERE ProfileID = '<ID>' ORDER BY MonthYear DESC
```

---

### TM thay vì DC (tăng lương)
**Nguyên nhân:** NV có hợp đồng BHXH **đầu tiên** nằm trong chu kỳ tăng lao động → `isPriorityIncrease = true` → bỏ qua toàn bộ check lương.  
**Logic:** TM ưu tiên cao hơn DC — nếu đủ điều kiện TM thì không sinh DC.  
**Kiểm tra:** `Hre_Contract.DateStart` có nằm trong `dateFromIncreaseLabor → dateToIncreaseLabor` không?

---

### Không có D02 dù NV quay lại sau tạm hoãn
**Nguyên nhân:** Tháng trước đã có item `E_TANG_LD` với `IsPayBack = true` → hệ thống bỏ qua (chỉ TM 1 lần).  
**Kiểm tra:**
```sql
SELECT ri.ProfileID, ri.Status, ri.IsPayBack, r.DateMonth
FROM Ins_ReportD02ItemV2 ri
JOIN Ins_ReportD02V2 r ON r.ID = ri.ReportD02ID
WHERE ri.ProfileID = '<ID>' AND ri.Status = 'E_TANG_LD' AND ri.IsPayBack = 1
ORDER BY r.DateMonth DESC
```

---

### DC thay vì CD (đổi chức danh)
**Nguyên nhân:** Lương có thay đổi kèm đổi chức danh → hệ thống ưu tiên `E_TANG_LUONG_CHANGEJOBNAME` (DC) thay vì `E_CHANGEJOBNAME` (CD).  
**Logic:** CD chỉ được dùng khi lương **không đổi**, chỉ đổi chức danh.

---

### ON thay vì TM
**Nguyên nhân:** NV đang thai sản (`IsPregnant = true`) hoặc ốm đau, được check trước TM ở một số luồng (VietTel, VNPT).  
**Với iBHXH chuẩn:** TM luôn ưu tiên nếu có hợp đồng mới trong chu kỳ.

---

## Điều kiện sinh D02 (tổng quát)

Hệ thống sinh D02 khi **hội đủ**:
1. Có `Ins_ProfileInsuranceMonthly` tháng [N] (inNow)
2. NV nằm trong danh sách được chọn phân tích
3. Rơi vào ít nhất 1 nhánh: tăng LĐ / tăng lương / giảm / điều chỉnh

**Không sinh D02 nếu:**
- Không có `inNow`
- Bị `continue` do tháng trước đã TM rồi
- Loại D02 không được bật (`IsIIns/IsVIns`)
