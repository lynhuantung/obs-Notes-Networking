---
Mã: Untitled
aliases:
date: 2026-02-06
tags:
Project: "[[Dự án VnPay]]"
---
# Nộp hồ sơ bảo hiểm
## Validate mẫu 600
```sql


SELECT
    hp.ID,
    hp.CodeEmp,
    hp.ProfileName,

    /* =========================
       1. Mapping & cơ bản
       ========================= */
    hp.MappingMisaID,
    CASE WHEN hp.MappingMisaID IS NULL THEN 1 ELSE 0 END AS Err_MappingMisaID,

    hp.DateOfBirth,
    CASE WHEN hp.DateOfBirth IS NULL THEN 1 ELSE 0 END AS Err_DateOfBirth,

    hp.Gender,
    CASE WHEN hp.Gender IS NULL THEN 1 ELSE 0 END AS Err_Gender,

    /* =========================
       2. CCCD / CMND / Passport (NV)
       ========================= */
    hp.IDNo,
    hp.IDCard,
    hp.PassportNo,
    CASE 
        WHEN hp.IDNo IS NULL 
         AND hp.IDCard IS NULL 
         AND hp.PassportNo IS NULL
        THEN 1 ELSE 0 
    END AS Err_EmployeeIdentity,

    /* =========================
       3. Nơi cấp giấy tờ
       ========================= */
    cpro.CodeIns   AS PlaceOfIssueCode,
    cpro2.Code     AS IDCardIssuePlaceCode,
    cpro3.Code     AS PassportIssuePlaceCode,
    CASE 
        WHEN cpro.CodeIns IS NULL
         AND cpro2.Code IS NULL
         AND cpro3.Code IS NULL
        THEN 1 ELSE 0
    END AS Err_IssuePlace,

    /* =========================
       4. Ngày cấp
       ========================= */
    hp.IDDateOfIssue,
    hp.IDCardDateOfIssue,
    hp.PassportDateOfIssue,
    CASE 
        WHEN hp.IDDateOfIssue IS NULL
         AND hp.IDCardDateOfIssue IS NULL
         AND hp.PassportDateOfIssue IS NULL
        THEN 1 ELSE 0
    END AS Err_IssueDate,

    /* =========================
       5. BHXH
       ========================= */
    hp.SocialInsNo,
    CASE WHEN hp.SocialInsNo IS NULL THEN 1 ELSE 0 END AS Err_SocialInsNo,

    /* =========================
       6. Địa chỉ THƯỜNG TRÚ
       ========================= */
    hp.PAddress,
    cpro4.CodeIns AS PProvinceCode,
    cd.CodeIns    AS PDistrictCode,
    cv.CodeIns    AS PWardCode,
    CASE 
        WHEN hp.PAddress IS NULL
          OR cpro4.CodeIns IS NULL
          OR cd.CodeIns IS NULL
          OR cv.CodeIns IS NULL
        THEN 1 ELSE 0
    END AS Err_PermanentAddress,

    /* =========================
       7. Địa chỉ TẠM TRÚ
       ========================= */
    hp.TAddress,
    cpro5.CodeIns AS TProvinceCode,
    cd2.CodeIns   AS TDistrictCode,
    cv2.CodeIns   AS TWardCode,
    CASE 
        WHEN hp.TAddress IS NULL
          OR cpro5.CodeIns IS NULL
          OR cd2.CodeIns IS NULL
          OR cv2.CodeIns IS NULL
        THEN 1 ELSE 0
    END AS Err_TemporaryAddress,

    /* =========================
       8. Chủ hộ (Hộ gia đình)
       ========================= */
    hhi.RelativeName AS HouseholdName,
    COALESCE(hhi.IDNo, hhi.PassportNo, hhi.IdentificationNo) AS HouseholdIdentity,
    cpro7.CodeIns AS HouseholdProvinceCode,
    cd3.CodeIns   AS HouseholdDistrictCode,
    cv3.CodeIns   AS HouseholdWardCode,
    CASE 
        WHEN hhi.RelativeName IS NULL
          OR (hhi.IDNo IS NULL AND hhi.PassportNo IS NULL AND hhi.IdentificationNo IS NULL)
          OR cpro7.CodeIns IS NULL
          OR cd3.CodeIns IS NULL
          OR cv3.CodeIns IS NULL
        THEN 1 ELSE 0
    END AS Err_Household,

    /* =========================
       9. Nơi đăng ký KCB
       ========================= */
    chtp.HealthTreatmentCode,
    chtp.HealthTreatmentName,
    chtp.HealthTreatmentProvinceCode,
    CASE 
        WHEN chtp.HealthTreatmentCode IS NULL
          OR chtp.HealthTreatmentName IS NULL
          OR chtp.HealthTreatmentProvinceCode IS NULL
        THEN 1 ELSE 0
    END AS Err_HealthTreatment

FROM Hre_Profile hp
LEFT JOIN Hre_ProfileMoreInfo hpmi 
       ON hpmi.ID = hp.ProfileMoreInfoID 
      AND hpmi.IsDelete IS NULL

-- nơi cấp giấy tờ
LEFT JOIN Cat_Province cpro 
       ON cpro.ID = hp.PlaceOfIssueID 
      AND cpro.IsDelete IS NULL
LEFT JOIN Cat_IDCardIssuePlace cpro2 
       ON cpro2.ID = hpmi.IDCardIssuePlaceID 
      AND cpro2.IsDelete IS NULL
LEFT JOIN Cat_PassportIssuePlace cpro3 
       ON cpro3.ID = hpmi.PassportPlaceNewID 
      AND cpro3.IsDelete IS NULL

-- thường trú
LEFT JOIN Cat_Province cpro4 
       ON cpro4.ID = hp.PProvinceID 
      AND cpro4.IsDelete IS NULL
LEFT JOIN Cat_District cd 
       ON cd.ID = hp.PDistrictID 
      AND cd.IsDelete IS NULL
LEFT JOIN Cat_Village cv 
       ON cv.ID = hp.VillageID 
      AND cv.IsDelete IS NULL

-- tạm trú
LEFT JOIN Cat_Province cpro5 
       ON cpro5.ID = hp.TProvinceID 
      AND cpro5.IsDelete IS NULL
LEFT JOIN Cat_District cd2 
       ON cd2.ID = hp.TDistrictID 
      AND cd2.IsDelete IS NULL
LEFT JOIN Cat_Village cv2 
       ON cv2.ID = hp.TAVillageID 
      AND cv2.IsDelete IS NULL

-- chủ hộ
LEFT JOIN Hre_HouseholdInfo hhi
       ON hhi.ProfileID = hp.ID
      AND hhi.IsDelete IS NULL
      AND hhi.HouseholdTypeID = (
            SELECT TOP 1 ID
            FROM Cat_RelativeType
            WHERE IsDelete IS NULL
              AND Relative = 'E_HOUSEHOLDER'
      )
LEFT JOIN Cat_Province cpro7 
       ON cpro7.ID = hhi.ProvinceBirthCertificateID 
      AND cpro7.IsDelete IS NULL
LEFT JOIN Cat_District cd3 
       ON cd3.ID = hhi.DistrictBirthCertificateID 
      AND cd3.IsDelete IS NULL
LEFT JOIN Cat_Village cv3 
       ON cv3.ID = hhi.VillageBirthCertificateID 
      AND cv3.IsDelete IS NULL

-- nơi KCB
LEFT JOIN Cat_HealthTreatmentPlace chtp
       ON chtp.ID = hp.HealthTreatmentPlaceID
      AND chtp.IsDelete IS NULL

WHERE hp.IsDelete IS NULL
  AND hp.CodeEmp = '04021';

```