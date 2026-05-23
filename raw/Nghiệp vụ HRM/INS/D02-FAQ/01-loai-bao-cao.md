# D02 FAQ – Tổng quan 6 loại báo cáo D02

> Ngày: 2026-05-02  
> Nguồn: `Ins_InsuranceD02Services.cs`

---

## So sánh 6 loại

| Loại | Hàm Search | Bảng header | Bảng item | Kỳ (Perior) | Filter loại |
|---|---|---|---|---|---|
| D02 TS | `SearchD02TS_32635252` | `Ins_ReportD02` | `Ins_ReportD02Item` | Kỳ `GETTEMP` cố định | Không filter loại |
| D02 V2 | `SearchD02TSV2_48088057` | `Ins_ReportD02V2` | `Ins_ReportD02ItemV2` | **Chọn kỳ 1/2/3...** | Không filter loại |
| iBHXH Tăng | `SearchiBHXHTangD02TS_91221015` | `Ins_ReportD02V2` | `Ins_ReportD02ItemV2` | `-1` = tất cả kỳ | `IsIIns=true` + CommentCode chứa "tang" |
| iBHXH Giảm | `SearchiBHXHGiamD02TS_45192334` | `Ins_ReportD02V2` | `Ins_ReportD02ItemV2` | `-1` = tất cả kỳ | `IsIIns=true` + CommentCode chứa "giam" |
| VietTel | `SearchD02TS_Viettel_93330719` | `Ins_ReportD02V2` | `Ins_ReportD02ItemV2` | Chọn kỳ | `IsVIns=true` |
| VNPT | `SearchD02TS_VNPT_18010382` | `Ins_ReportD02V2` | `Ins_ReportD02ItemV2` | Chọn kỳ | Như D02 V2, không group |

---

## Điểm khác biệt quan trọng

### D02 TS vs D02 V2
- D02 TS: bảng riêng `Ins_ReportD02` / `Ins_ReportD02Item` — kỳ cố định
- D02 V2: bảng `Ins_ReportD02V2` / `Ins_ReportD02ItemV2` — **phải chọn đúng kỳ**

### iBHXH vs VietTel
- iBHXH: `Ins_TypeD02.IsIIns = true`
- VietTel: `Ins_TypeD02.IsVIns = true`
- Hai flag độc lập — bật loại cho iBHXH không tự động bật cho VietTel

### iBHXH Tăng vs Giảm
- Tăng: filter `CommentCode` chứa "tang" hoặc = "E_CHANGEJOBNAME"
- Giảm: filter `CommentCode` chứa "giam"
- Điều chỉnh: cả tăng lẫn giảm gộp lại

---

## Kiểm tra cấu hình loại D02

```sql
SELECT CommentCode, DisplayCode, StatusName, IsIIns, IsVIns
FROM Ins_TypeD02
ORDER BY CommentCode
```
