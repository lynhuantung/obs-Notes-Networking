---
Mã: 
tags:
  - "#model"
---
# CatBankDemoModel

Model hiển thị dữ liệu trong lưới.

```csharp
    public class CatBankModel : BaseViewModel
    {
        [DisplayName(ConstantDisplay.HRM_Category_Bank_BankName)]
        public string BankName { get; set; }
        [DisplayName(ConstantDisplay.HRM_Category_Bank_BankCode)]
        public string BankCode { get; set; }
        [DisplayName(ConstantDisplay.HRM_Category_Bank_Notes)]
        public string Notes { get; set; }
        [DisplayName(ConstantDisplay.HRM_Category_Bank_CompBankCode)]
        public string CompBankCode { get; set; }
        public string GroupBank { get; set; }
        [DisplayName(ConstantDisplay.HRM_Category_Bank_IsInactive)]
        public bool? IsInactive { get; set; }
        [DisplayName(ConstantDisplay.HRM_Category_Bank_ImagePath)]
        public string ImagePath { get; set; }
        [DisplayName(ConstantDisplay.HRM_Category_Bank_IsPayrollPayment)]
        public bool? IsPayrollPayment { get; set; }
        public bool IsExport { get; set; }
        public string ValueFields { get; set; }
        
        public partial class FieldNames
        {
            public const string ID = "ID";
            public const string BankName = "BankName";
            public const string BankCode = "BankCode";
            public const string Notes = "Notes";
            public const string DateCreate = "DateCreate";
            public const string DateUpdate = "DateUpdate";
            public const string GroupBank = "GroupBank";
            public const string IsInactive = "IsInactive";
        }
    }

```
### Nguồn dữ liệu
- Nhận từ API: [[Cat_BankController]]
- Sử dụng trong View: [[0 - Index.cshtml]]
