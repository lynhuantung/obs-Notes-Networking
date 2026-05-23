---
type: source
description: "Câu hỏi triển khai AVN: HRM có hỗ trợ LDAPS (LDAP over SSL) không, trạng thái đang chờ xác nhận từ team."
domain: system
tags:
  - ldap
  - ldaps
  - authentication
  - avn
  - deployment-question
  - pending
created: 2026-04-29
updated: 2026-04-29
source-file: raw/0. Daily/Issues_Logs/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua.md
related:
  - "[[wiki/projects/AVN-Project]]"
  - "[[wiki/sources/Sys-TaiLieuLDAP-03]]"
  - "[[wiki/flows/Flow-LDAP-Login]]"
---

# Source: AVN — Câu hỏi triển khai: HRM có hỗ trợ LDAPS chưa?

## Tóm tắt

Trong triển khai dự án AVN, user `trinh_ttt` không đăng nhập được phiếu lương (báo sai mật khẩu), nghi liên quan LDAP. IT phía khách hàng sau đó thông báo yêu cầu **chuyển từ LDAP sang LDAPS** vì lý do bảo mật. Câu hỏi phát sinh: **HRM hiện tại có sẵn hỗ trợ LDAPS chưa?** — chưa có kết luận tại thời điểm ghi nhận, đang ở giai đoạn raise task khảo sát và xin tài khoản test từ khách hàng.

## Key Takeaways

- **Trigger**: User `trinh_ttt` không vào được phiếu lương, báo sai mật khẩu → nghi do LDAP.
- **Yêu cầu khách hàng**: Không dùng LDAP nữa, chuyển sang LDAPS (LDAP over SSL, port 636) vì bảo mật.
- **Hiện trạng HRM**: Theo `Sys_LdapConfig`, field `ConnectionType` có giá trị `Standard LDAP` hoặc `LDAP+SSL` — cho thấy HRM **có thể đã có sẵn** option SSL/LDAPS ở tầng config, nhưng cần raise task kiểm tra thực tế code và test.
- **Action items cần thực hiện**:
  - Raise task nghiên cứu HRM có hỗ trợ LDAPS chưa.
  - Xin tài khoản test LDAPS từ IT phía khách hàng AVN.
  - Test thử LDAPS trên Ultra Server của khách hàng.
  - Tìm hiểu tài liệu LDAP/LDAPS.
- **Status**: Pending — chưa có kết luận kỹ thuật.

## Trích dẫn quan trọng

> IT bên AVN yêu cầu: "Do bảo mật nên yêu cầu không dùng LDAP nữa, giờ dùng LDAPS"

> Trả lời nội bộ: "Chưa biết, raise task mới check được. Có tài khoản nào check LDAPS không?"

> Theo `Sys_LdapConfig`: `ConnectionType` = Standard LDAP **hoặc** LDAP+SSL (= LDAPS)

## Liên kết

- [[wiki/projects/AVN-Project]] — Dự án AVN (trang project)
- [[wiki/sources/Sys-TaiLieuLDAP-03]] — Tài liệu gốc LDAP HRM, bảng Sys_LdapConfig
- [[wiki/flows/Flow-LDAP-Login]] — Workflow cấu hình và đăng nhập LDAP
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực tổng thể
