---
aliases: 
date: 2024-08-13
tags:
  - daily
---
Chuẩn bị báo cáo tháng
Làm tài liệu **Confluence**
Check log nhật ký người dùng Murata

### Check lỗi VDSC (1 tiếng)
> [!Check lỗi phần tử bảo hiểm INS_14DAYS_LEAVEDAYTYPE_COUNT] 
> [https://hrm.vdsc.com.vn/#/Hrm_Main_Web/Ins_AnalyzeInsurance/Index](https://hrm.vdsc.com.vn/#/Hrm_Main_Web/Ins_AnalyzeInsurance/Index)  
> **Hiện trạng** : Phần tử INS_14DAYS_LEAVEDAYTYPE_COUNT lấy dữ liệu count chưa đúng.
> **Thông tin** :
> 01325 - Tháng 7 đợt 7  
> phần tử INS_14DAYS_LEAVEDAYTYPE_COUNT_NOPAY : 7  
> INS_14DAYS_LEAVEDAYTYPE_COUNT_ABS: 7    
> mong muốn INS_14DAYS_LEAVEDAYTYPE_COUNT_NOPAY : 4  
> INS_14DAYS_LEAVEDAYTYPE_COUNT_ABS : 0 
> 
> **Nguyên nhân**: chưa reset biến `leavedayTypeCount`
> ![[Pasted image 20240813104558.png]]

### Check ldap cho FIT (2 tiếng)
