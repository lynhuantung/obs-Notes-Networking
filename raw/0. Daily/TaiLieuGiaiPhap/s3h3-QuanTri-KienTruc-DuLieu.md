---
tags: [tailieu-giaiphap, metadata, data-governance]
date: 2026-04-30
section: "§3.6.2 Quản trị kiến trúc"
---

← [[s3h2-PhanMem-SaaS-Cloud]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Liên quan:** [[s3h4-ERD-Logic-DoiTuongLoi]]

## 3. Nguyên tắc quản trị kiến trúc dữ liệu dùng chung 📐

3.6.2 Nhà cung cấp Phần mềm hỗ trợ cung cấp mapping giữa trường màn hình, báo cáo và trường trong CSDL/API.

Phần mềm (Vnresource) hỗ trợ cung cấp tài liệu **mapping giữa các trường dữ liệu trên màn hình nghiệp vụ, báo cáo và các trường dữ liệu tương ứng trong CSDL/API**, nhằm phục vụ công tác tích hợp hệ thống, khai thác dữ liệu và xây dựng **data catalog** trong kiến trúc quản trị dữ liệu tập trung của đơn vị.

Tài liệu mapping bao gồm các thông tin như:

- tên trường hiển thị trên màn hình nghiệp vụ

- tên trường trong báo cáo

- tên trường tương ứng trong CSDL hoặc API

- kiểu dữ liệu

- mô tả ý nghĩa nghiệp vụ của trường dữ liệu

- phạm vi sử dụng trong các phân hệ liên quan (nếu áp dụng)

Bên cạnh đó, hệ thống hỗ trợ cung cấp mapping đối với các nhóm dữ liệu phục vụ tích hợp với **Data Platform, ESB hoặc các hệ thống liên thông**, giúp đảm bảo tính nhất quán trong quá trình khai thác dữ liệu giữa tầng ứng dụng, tầng báo cáo và tầng tích hợp.

Với các khả năng trên, nhà cung cấp cam kết hỗ trợ cung cấp **mapping giữa trường màn hình, báo cáo và trường trong CSDL/API**, phục vụ hiệu quả cho công tác quản trị dữ liệu, tích hợp hệ thống và triển khai kiến trúc dữ liệu dùng chung.

**3.6.3 Nhà cung cấp Phần mềm phải cam kết cập nhật tài liệu khi có thay đổi version, và cho phép Data Platform sử dụng để đồng bộ với Data Catalog.**

[Phần mềm (Vnresource) cam kết cập nhật tài liệu khi có thay đổi version và các thay đổi liên quan đến cấu trúc dữ liệu/API; đồng thời cho phép PTSC/Data Platform sử dụng các tài liệu này để phục vụ đồng bộ, tích hợp và quản lý Data Catalog.]{.mark}

**[3.6.4 Nhà cung cấp phải cung cấp mô hình dữ liệu (ERD/Data Model) phục vụ tích hợp cho các đối tượng/bảng trong phạm vi tích hợp, tối thiểu gồm: entities/đối tượng dữ liệu, thuộc tính chính, PK/FK, cardinality/relationship, ràng buộc dữ liệu; kèm data dictionary (ý nghĩa trường, kiểu dữ liệu, nullability, code list nếu có). Sau đó, NCC bổ sung các phương án đồng bộ dữ liệu, tích hợp từ các phần mềm.]{.mark}**

[Trường hợp phần mềm SaaS không cung cấp physical schema, phải cung cấp ERD logic và API schema/Data Dictionary tương đương.]{.mark}

[Nhà  cam kết cung cấp đầy đủ mô hình dữ liệu (ERD/Data Model) phục vụ tích hợp cho các đối tượng trong phạm vi tích hợp của Phần mềm VnResource (HRM), bao gồm ERD logic, Data Dictionary và API Schema, đảm bảo đáp ứng yêu cầu tích hợp với ESB, Data Platform, MDM trong kiến trúc CNTT tổng thể của đơn vị.]{.mark}