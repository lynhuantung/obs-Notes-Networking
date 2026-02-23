---
Mã: 
tags:
  - "#model"
---
# CatBankDemoSearchModel

Model tìm kiếm, dùng khi nhấn nút "Tìm kiếm".

```csharp
    public class CatBankSearchModel
    {
        [DisplayName(ConstantDisplay.HRM_Category_Bank_BankName)]
        public string BankName { get; set; }
        [DisplayName(ConstantDisplay.HRM_Category_Bank_BankCode)]
        public string BankCode { get; set; }
        [DisplayName(ConstantDisplay.HRM_Category_Bank_IsInactive)]
        public bool? IsInactive { get; set; }
        public bool IsExport { get; set; }
        public string ValueFields { get; set; }
    }
```

### Gửi dữ liệu
- AJAX call → [[Cat_BankController]]
- Input từ [[0 - Index.cshtml]]
