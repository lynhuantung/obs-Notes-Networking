# D02 FAQ – Không có dữ liệu (theo từng loại báo cáo)

> Ngày: 2026-05-02  
> Nguồn: `Ins_InsuranceD02Services.cs`  
> Xem trước: `02-khong-co-du-lieu-chung.md`

---

## 1. D02 TS

**Điều kiện sinh item:** NV phải có thay đổi BH so với tháng trước trong chu kỳ tăng lao động (16/[N-1] → 15/[N]).

- [ ] Có bản ghi `Ins_ReportD02` tháng đó chưa?
- [ ] NV có `Ins_ProfileInsuranceMonthly` tháng [N] và [N-1] không?
- [ ] Lương / phụ cấp đóng BH có thay đổi không?
- [ ] NV có hợp đồng BHXH mới trong chu kỳ không?

---

## 2. D02 V2

**Điều kiện sinh item:** Giống D02 TS, nguồn bảng `Ins_ReportD02V2`.

- [ ] Có bản ghi `Ins_ReportD02V2` đúng tháng + đúng **kỳ** không?
- [ ] Kỳ phân tích và kỳ search có khớp không?

```sql
SELECT ID, DateMonth, Perior FROM Ins_ReportD02V2
WHERE YEAR(DateMonth) = <nam> AND MONTH(DateMonth) = <thang>
```

---

## 3. iBHXH Tăng

**Điều kiện filter loại:** `Ins_TypeD02.IsIIns = true` AND CommentCode chứa "tang" hoặc = "E_CHANGEJOBNAME"

- [ ] Bảng `Ins_TypeD02` có bật `IsIIns = true` cho loại cần xem không?
- [ ] `period = -1` (lấy tất cả kỳ) hay đang chọn kỳ cụ thể?
- [ ] Nếu có filter DisplayCode (TM/DC...) — loại đó có tồn tại trong `Ins_TypeD02` không?
- [ ] Gần đây có tắt loại nào trong `Ins_TypeD02` không?

```sql
-- Loại nào đang bật cho iBHXH tăng
SELECT CommentCode, DisplayCode, IsIIns
FROM Ins_TypeD02
WHERE IsIIns = 1 AND (CommentCode LIKE '%tang%' OR CommentCode = 'E_CHANGEJOBNAME')
```

---

## 4. iBHXH Giảm

**Điều kiện filter loại:** `Ins_TypeD02.IsIIns = true` AND CommentCode chứa "giam"

- [ ] Như iBHXH Tăng, kiểm tra `IsIIns = true` cho loại giảm
- [ ] NV có nghỉ việc / giảm lương trong chu kỳ giảm (16/[N-1] → 15/[N]) không?

```sql
SELECT CommentCode, DisplayCode, IsIIns
FROM Ins_TypeD02
WHERE IsIIns = 1 AND CommentCode LIKE '%giam%'
```

---

## 5. VietTel

**Điều kiện filter loại:** `Ins_TypeD02.IsVIns = true`

- [ ] **`IsVIns`** — khác với iBHXH dùng `IsIIns`, phải kiểm tra đúng cột
- [ ] Gần đây có sửa `Ins_TypeD02` không?
- [ ] Kỳ phân tích và kỳ search có khớp không?

```sql
SELECT CommentCode, DisplayCode, IsVIns
FROM Ins_TypeD02
WHERE IsVIns = 1
```

---

## 6. VNPT

- [ ] Giống D02 V2 — kiểm tra kỳ trước
- [ ] VNPT không group dữ liệu — nếu NV có nhiều dòng thì mỗi dòng hiển thị riêng

---

## Kiểm tra thiết lập bảo hiểm ảnh hưởng phân tích

```sql
-- Chu kỳ tăng lao động (ảnh hưởng điều kiện sinh TM)
-- Xem trong Sys_AttOvertimePermitConfig
SELECT ConfigKey, Value
FROM Sys_AttOvertimePermitConfig
WHERE ConfigKey LIKE '%PeriodInsurance%' OR ConfigKey LIKE '%Insurance%Day%'
```

> Nếu gần đây sửa ngày chu kỳ → **phân tích lại** toàn bộ tháng đó mới có hiệu lực.
