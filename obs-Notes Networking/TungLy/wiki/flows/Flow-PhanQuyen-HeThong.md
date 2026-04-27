---
type: flow
domain: system
tags:
  - sys
  - permission
  - rbac
  - flow
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/architecture/HRM-SysDB-Schema]]"
  - "[[wiki/sources/Sys-TaiLieuPhanQuyen-02]]"
  - "[[wiki/sources/Sys-TaiLieuHeThong-01]]"
---

# Flow: Phân Quyền Hệ Thống HRM

Quy trình phân quyền đầy đủ trong HRM Pro 8 — từ tạo nhóm quyền đến gán user.

---

## Luồng tổng quan — 2 loại phân quyền

```mermaid
flowchart TD
    Start([Admin vào HRM]) --> TypeQ{Loại phân quyền?}

    TypeQ -- "Phân quyền\nchức năng" --> FuncPath[Phân quyền màn hình / nút / tab]
    TypeQ -- "Phân quyền\ndữ liệu" --> DataPath[Phân quyền phòng ban / nơi làm việc]

    FuncPath --> Step1[1. Vào Hệ thống > Nhóm quyền]
    Step1 --> Step2[2. Tạo mới nhóm quyền]
    Step2 --> Step3[3. Tìm tên resource\nController_Action / IDButton / TabID]
    Step3 --> ResExist{Resource có\ntrong danh sách?}
    ResExist -- Có --> Step4[4. Tick quyền\nView/Create/Edit/Delete/Export...]
    ResExist -- Không --> RegRes[Vào DS Tất cả tài nguyên\n→ import/refresh\nYêu cầu: superadmin]
    RegRes --> Step4
    Step4 --> Step5[5. Lưu nhóm quyền]
    Step5 --> Step6[6. Vào Hệ thống > Người dùng]
    Step6 --> Step7[7. Gán nhóm quyền cho user]
    Step7 --> Done([Hoàn tất])

    DataPath --> D1[Vào màn hình Người dùng]
    D1 --> D2[Mở user cần phân quyền]
    D2 --> D3[Cấu hình phạm vi dữ liệu:\nPhòng ban / Nơi làm việc\nLoại NV / Loại hợp đồng...]
    D3 --> Done
```

---

## Luồng phân quyền chức năng — Chi tiết

```mermaid
flowchart LR
    G[Sys_Group\nNhóm quyền] -->|gán Resource + PrivilegeNumber| GP[Sys_GroupPermission2]
    GP -->|ResourceID| R[Sys_Resource\nController_Action]
    G -->|GroupID| U[User được gán nhóm]
    U -->|kiểm tra runtime| Check{Check Permission?}
    Check -- "Có quyền" --> Allow[Hiển thị menu/nút/tab]
    Check -- "Không quyền" --> Deny[Ẩn / vô hiệu hóa]
```

---

## Quy tắc đặt tên Resource

| Loại | Pattern | Ví dụ |
|------|---------|-------|
| Màn hình | `Controller_Action` | `Cat_Bank_index` |
| Nút | `Controller_Action_IDButton` | `Cat_DayOff_Index_btnAnalyzeCompensateHoliday` |
| Tab | ID HTML của tab | `InfoContactDetail` |

---

## PrivilegeNumber — Bitwise 8 quyền

| Bit | Quyền |
|-----|-------|
| 1 | View (Xem) |
| 2 | Create (Tạo mới) |
| 4 | Edit (Sửa) |
| 8 | Delete (Xóa) |
| 16 | Export |
| 32 | Import |
| 64 | Create Template |
| 128 | Change Column |

---

## Liên kết

- [[wiki/architecture/HRM-SysDB-Schema]] — Schema Sys_Group, Sys_GroupPermission2, Sys_Resource
- [[wiki/sources/Sys-TaiLieuPhanQuyen-02]] — Tài liệu đào tạo phân quyền
- [[wiki/sources/Sys-TaiLieuHeThong-01]] — Tài liệu hệ thống gốc
- [[wiki/sources/LTG-SYS-Meetings-2024]] — Ví dụ thực tế: store Get_Data_Permission_New
