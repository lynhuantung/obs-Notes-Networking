---
description: "Luồng phân quyền HRM: tạo nhóm quyền chức năng (bitwise RBAC) và phân quyền dữ liệu theo phòng ban, gán user vào nhóm."
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

## Bối cảnh

Quy trình phân quyền đầy đủ trong HRM Pro 8 — từ tạo nhóm quyền đến gán user. Có 2 loại phân quyền độc lập: **phân quyền chức năng** (màn hình / nút / tab theo RBAC) và **phân quyền dữ liệu** (phòng ban / nơi làm việc). Hệ thống dùng bitwise 8 bit để mã hóa các quyền View/Create/Edit/Delete/Export/Import.

## Mermaid Flow

### Luồng tổng quan — 2 loại phân quyền

```mermaid
flowchart TD
    Start([Admin vào HRM]) --> TypeQ{Loại phân quyền?}

    TypeQ -- Phân quyền chức năng --> FuncPath[Phân quyền màn hình / nút / tab]
    TypeQ -- Phân quyền dữ liệu --> DataPath[Phân quyền phòng ban / nơi làm việc]

    FuncPath --> Step1[Vao He thong: Nhom quyen]
    Step1 --> Step2[Tao moi nhom quyen]
    Step2 --> Step3[Tim ten resource: Controller_Action / IDButton / TabID]
    Step3 --> ResExist{Resource co trong danh sach?}
    ResExist -- Co --> Step4[Tick quyen: View/Create/Edit/Delete/Export]
    ResExist -- Khong --> RegRes[Vao DS Tat ca tai nguyen: import/refresh - can superadmin]
    RegRes --> Step4
    Step4 --> Step5[Luu nhom quyen]
    Step5 --> Step6[Vao He thong: Nguoi dung]
    Step6 --> Step7[Gan nhom quyen cho user]
    Step7 --> Done([Hoan tat])

    DataPath --> D1[Vao man hinh Nguoi dung]
    D1 --> D2[Mo user can phan quyen]
    D2 --> D3[Cau hinh pham vi: Phong ban / Noi lam viec / Loai NV]
    D3 --> Done
```

### Luồng phân quyền chức năng — Chi tiết

```mermaid
flowchart LR
    G[Sys_Group: Nhom quyen] -->|gan Resource + PrivilegeNumber| GP[Sys_GroupPermission2]
    GP -->|ResourceID| R[Sys_Resource: Controller_Action]
    G -->|GroupID| U[User duoc gan nhom]
    U -->|kiem tra runtime| Check{Check Permission?}
    Check -- Co quyen --> Allow[Hien thi menu / nut / tab]
    Check -- Khong quyen --> Deny[An / vo hieu hoa]
```

## Diễn giải từng bước

### Phân quyền chức năng

**Bước 1–2**: Vào Hệ thống > Nhóm quyền → Tạo mới nhóm quyền (đặt tên theo vai trò, vd: "HR Admin", "Manager Phòng Kỹ Thuật").

**Bước 3**: Tìm tên resource theo pattern:

| Loại | Pattern | Ví dụ |
|------|---------|-------|
| Màn hình | `Controller_Action` | `Cat_Bank_index` |
| Nút | `Controller_Action_IDButton` | `Cat_DayOff_Index_btnAnalyzeCompensateHoliday` |
| Tab | ID HTML của tab | `InfoContactDetail` |

**Bước 4**: Tick quyền theo bitwise — PrivilegeNumber là tổng bit:

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

**Bước 5–7**: Lưu nhóm quyền → Vào Hệ thống > Người dùng → Gán nhóm quyền cho user.

> Nếu resource chưa có trong danh sách → superadmin vào "DS Tất cả tài nguyên" → import/refresh để đăng ký resource mới.

---

### Phân quyền dữ liệu

Vào màn hình Người dùng → mở user cần phân quyền → cấu hình phạm vi:
- Phòng ban / Nơi làm việc
- Loại nhân viên / Loại hợp đồng

Phân quyền dữ liệu xác định **user thấy dữ liệu của ai**, độc lập với phân quyền chức năng.

## Liên kết

- [[wiki/architecture/HRM-SysDB-Schema]] — Schema Sys_Group, Sys_GroupPermission2, Sys_Resource
- [[wiki/sources/Sys-TaiLieuPhanQuyen-02]] — Tài liệu đào tạo phân quyền
- [[wiki/sources/Sys-TaiLieuHeThong-01]] — Tài liệu hệ thống gốc
- [[wiki/sources/LTG-SYS-Meetings-2024]] — Ví dụ thực tế: store Get_Data_Permission_New
