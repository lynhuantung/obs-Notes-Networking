---
aliases: 
date: 2024-11-05
tags:
  - daily
---


## Call api from source
https://ba.vnresource.net:1018/api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_EmployeeList&Param=

```
curl --location 'https://ba.vnresource.net:1018/api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_EmployeeList&Param=' \
--header 'accept: application/json' \
--header 'Authorization: Bearer R05XK-zZsLqbn1LPrl0_NTC8oxfA_XEtE4BhVgWb1vXi42Aj-0AByD-SjKXCy4-JpLfvLA34bxVLH7bcwIZvK2ZHTk_6y2jfOifvSbcplPmFTvCES5Oo7tW7sIxwGym6gqaTV4Nd4Buyyx4XCUpyKHFOGnf2dT0K3NzPMjKg9CFjd3mDKGAiWb8sIsmvH7jVzb9Es9W7mk1QuMOJcw-JPBsmaHwzVjiDXPo2MDyTbGFJkUEw1eSYTyUAKGrNp3N0x1kZtTnJ-B5o5q_B8kEqDKWEoUoZO8cSb6N04LVzxZM'
```

- Link  API BA: https://ba.vnresource.net:1018


### Phân trang khi gọi api
---
- Xử lý api phân trang  theo pageSize, pageIndex
- [[TungLy/Area/Data-WareHouse/ELT - Airbyte/Paging-builder]]

### Gia hạn token cho API
- Cho phép cấu hình thời gian hết hạn token từ webSetting của api service