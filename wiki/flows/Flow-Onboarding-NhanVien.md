---
description: "Quy trình onboarding nhân viên mới trong HRM: tạo hồ sơ, hợp đồng, chấm công, khai báo BH, cấp tài khoản portal và phân quyền."
type: flow
tags:
  - onboarding
  - hrm
  - hr-process
  - nhan-su
  - go-live
date-updated: 2026-04-26
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/sources/VnPay-Goals-Scope-Resources]]"
---

# Flow — Quy Trình Onboarding Nhân Viên Mới (Trong HRM)

## Bối cảnh

Onboarding nhân viên mới trong HRM là quy trình tạo đầy đủ dữ liệu cho một nhân viên từ lúc họ chính thức làm việc đến khi có thể truy cập hệ thống (Portal), được chấm công, nhận lương tháng đầu, và được khai báo Bảo hiểm. Người thực hiện: HR Admin. Hệ thống: HRM — Phân hệ Nhân sự.

## Mermaid Flow

```mermaid
flowchart TD
    A[Tao ho so nhan vien: Ho ten CCCD ngan hang ma BHXH]
    B[Thiet lap hop dong lao dong: Loai HD luong phu cap muc dong BH]
    C[Phan cong co cau to chuc: Phong ban Manager Org chart]
    D[Cau hinh cham cong: Ca lam viec dang ky van tay]
    E[Khai bao Bao hiem: Tao ban ghi BH InsuranceMonthJoin]
    BH{Da co ma BHXH cu?}
    E2[Ghi ma BHXH tu don vi cu]
    E1[De trong: BHXH cap ma moi sau khi nop D02]
    F[Cap tai khoan Portal: username email welcome doi mat khau]
    SSO{He thong co SSO?}
    F2[Them vao AD/LDAP va Sync Identity Server]
    G[Thiet lap phan quyen: NV / Leader / HR Admin / Manager]
    H[Kiem tra hoan tat: Login BH email quyen]

    A --> B --> C --> D --> E
    E --> BH
    BH -- Có --> E2 --> F
    BH -- Chưa có --> E1 --> F
    F --> SSO
    SSO -- Có --> F2 --> G
    SSO -- Không --> G
    G --> H

    style A fill:#4A90D9,color:#fff,stroke:#2c6fad
    style E fill:#7B68EE,color:#fff,stroke:#5548c8
    style BH fill:#E8A838,color:#fff,stroke:#b07a1a
    style SSO fill:#E8A838,color:#fff,stroke:#b07a1a
    style F fill:#5BA85A,color:#fff,stroke:#3d7a3c
    style G fill:#5BA85A,color:#fff,stroke:#3d7a3c
    style H fill:#27AE60,color:#fff,stroke:#1a7a43
```

## Diễn giải từng bước

### Bước 1 — Tạo hồ sơ nhân viên

**HR Admin nhập các thông tin**:

| Nhóm thông tin | Fields |
|---------------|--------|
| Thông tin cá nhân | Họ tên, ngày sinh, giới tính, CCCD/CMND, địa chỉ |
| Thông tin liên hệ | Email, SĐT, địa chỉ liên hệ |
| Thông tin nhân sự | Mã NV, ngày vào làm, vị trí, cấp bậc |
| Thông tin ngân hàng | Số TK, tên ngân hàng (để nhận lương) |
| Thông tin BH | Mã số BHXH (nếu đã có từ đơn vị cũ) |

**Quan trọng**: Mã số BHXH phải chính xác — sai sẽ bị từ chối khi khai báo iBHXH

---

### Bước 2 — Thiết lập hợp đồng lao động

- Loại hợp đồng: thử việc / xác định thời hạn / không xác định thời hạn
- Ngày bắt đầu, ngày kết thúc (nếu có)
- Mức lương cơ bản + hệ số
- Phụ cấp cố định (nếu có)
- Mức lương đóng BH (có thể khác mức lương thực nhận)

---

### Bước 3 — Phân công vào cơ cấu tổ chức

- Chọn Phòng ban / Bộ phận / Team
- Chọn cấp quản lý trực tiếp (Manager)
- Chọn vị trí trong org chart

**Tác động**: Phân công sai dẫn đến sai phân quyền xem báo cáo, sai người duyệt nghỉ phép

---

### Bước 4 — Cấu hình chấm công

- Chọn ca làm việc (ca hành chính / ca xoay / ca đêm)
- Đăng ký mã thẻ / vân tay / face ID vào máy chấm công
- Thiết lập rule chấm công đặc biệt (nếu có — ví dụ VnPay "1 đầu IN")

Xem rule VnPay: [[wiki/sources/H-VnPay-Att-17042025]]

---

### Bước 5 — Khai báo Bảo hiểm

- Tạo bản ghi BH từ ngày vào làm chính thức
- Điền: loại BH (BHXH + BHYT + BHTN thường gói chung)
- Mức lương đóng BH
- Nếu nhân viên có **BH từ đơn vị cũ**: cần thủ tục chuyển sổ BH

Tháng vào làm → `InsuranceMonthJoin` xác định tham gia đủ tháng hay không.
Xem: [[wiki/sources/INS-InsuranceMonthJoin]]

---

### Bước 6 — Cấp tài khoản truy cập

**Employee Portal**:
- Tạo tài khoản login Portal (username thường = mã NV hoặc email)
- Gửi email welcome + link đổi mật khẩu lần đầu

**SSO (nếu có)**:
- Add vào Active Directory / LDAP (phía IT KH thực hiện)
- Sync sang Identity Server của HRM
- Xem cấu hình SSO: [[wiki/concepts/HRM-Security-Config]]

---

### Bước 7 — Thiết lập phân quyền hệ thống

**Phân quyền theo vai trò**:

| Vai trò | Quyền cơ bản |
|---------|-------------|
| Nhân viên | Xem hồ sơ bản thân, xem lương, xin nghỉ phép, chấm công |
| Team Leader | + Duyệt nghỉ phép nhóm, xem chấm công nhóm |
| HR Admin | + Quản lý toàn bộ nhân viên, chạy lương |
| Manager | + Xem báo cáo phòng ban, duyệt đề xuất |

**Cảnh báo**: Phân quyền dư thừa (over-permission) là vi phạm bảo mật — review định kỳ

---

### Bước 8 — Kiểm tra & Xác nhận hoàn tất

Checklist cuối:
- [ ] NV login được Portal
- [ ] Hồ sơ hiển thị đúng (tên, phòng ban, chức vụ)
- [ ] Ca làm việc đã hiển thị
- [ ] Bản ghi BH đã tạo (kiểm tra trong module BH)
- [ ] NV nhận được email thông báo
- [ ] Phân quyền đúng vai trò

---

## Trường hợp đặc biệt

### Nhân viên chưa có mã số BHXH

- Xảy ra khi NV làm việc lần đầu tiên
- HRM vẫn tạo hồ sơ, để trống mã BHXH
- Sau khi đăng ký BHXH lần đầu → cập nhật mã vào hồ sơ
- Khai báo D02 ghi "Tham gia mới" — BHXH cấp mã số mới

### Nhân viên chuyển từ đơn vị khác

- Cần **sổ BHXH** từ đơn vị cũ
- HRM ghi mã BHXH đã có
- Khai báo iBHXH: "Tham gia từ đơn vị khác chuyển đến"
- BHXH xác nhận quá trình đóng tiếp tục

### Nhân viên nước ngoài

- Không có BHXH Việt Nam (theo quy định hiện hành đối với một số quốc tịch)
- Tạo hồ sơ bình thường, bỏ trống BH hoặc theo chính sách KH

## Liên kết liên quan

- [[wiki/concepts/HRM-Modules]] — Phân hệ Nhân sự & BH
- [[wiki/concepts/HRM-Security-Config]] — Cấu hình SSO / phân quyền
- [[wiki/sources/INS-InsuranceMonthJoin]] — Logic tham gia BH tháng đầu
- [[wiki/flows/Flow-TinhLuong-Monthly]] — Tháng đầu NV sẽ vào flow tính lương
- [[wiki/flows/Flow-KhaiBaoiBHXH]] — Khai báo BH tháng đầu tiên
