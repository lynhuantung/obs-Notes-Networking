---
Mã:
aliases:
date: 2026-01-18
tags:
  - daily
---
# Mô tả tổng quan

Tài liệu này tổng hợp và mô tả ngắn gọn các site/service trong hệ thống HRM (Link PE – môi trường UAT), được trình bày để hiểu nhanh vai trò của từng thành phần.
Mỗi phần thể hiện rõ mục đích sử dụng, nhóm người dùng, phạm vi truy cập và vai trò trong kiến trúc tổng thể, giúp thuận tiện cho việc onboarding, trao đổi kỹ thuật, phân tích luồng xử lý, kiểm tra bảo mật và vận hành hệ thống.

# 📊 Bảng tổng hợp các Site / Service

| STT | Service / Module         | Domain (UAT)                                                                      | Mục đích / Chức năng                                                                       | Người dùng chính       | Ghi chú                                   |
| --: | ------------------------ | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------------- | ----------------------------------------- |
|   1 | **Portal**               | [https://vnpay-empportal.vnresource.net](https://vnpay-empportal.vnresource.net/) | Cổng thông tin dành cho nhân viên: xem hồ sơ, bảng công, lương, nghỉ phép, phúc lợi…       | Nhân viên              | Giao diện cá nhân**Client → Server**      |
|   2 | **Main**                 | [https://vnpay-main.vnresource.net](https://vnpay-main.vnresource.net/)           | Trang quản trị HRM: hồ sơ, tuyển dụng, đào tạo, báo cáo nhân sự                            | HR, Quản lý            | Web quản lý chính**Client → Server**      |
|   3 | **HR API**               | [https://vnpay-hr.vnresource.net](https://vnpay-hr.vnresource.net/)               | Xử lý nghiệp vụ nhân sự: hồ sơ, công, lương                                                | Portal, Main           | API nghiệp vụ**Client → Server**          |
|   4 | **SYS API**              | [https://vnpay-sys.vnresource.net](https://vnpay-sys.vnresource.net/)             | Quản lý bảo mật, phân quyền, tài khoản, cấu hình hệ thống                                  | Nội bộ hệ thống        | Liên quan security**Client → Server**     |
|   5 | **API Core (Internal)**  | [https://vnpay-apiv3.vnresource.net](https://vnpay-apiv3.vnresource.net/)         | API lõi nội bộ, chủ yếu phục vụ Portal                                                     | Portal                 | Không mở cho bên thứ 3**Client → Server** |
|   6 | **Integration API**      | [https://vnpay-itgapi.vnresource.net](https://vnpay-itgapi.vnresource.net/)       | API tích hợp đối tác (TS24, MISA, Viettel, VnPay…)                                         | Đối tác ngoài          | Trao đổi dữ liệu**Server → Server**       |
|   7 | **Identity (IDS4)**      | [https://vnpay-ids4.vnresource.net](https://vnpay-ids4.vnresource.net/)           | Xác thực SSO, OAuth2, OpenID Connect, cấp token                                            | Toàn hệ thống          | Identity Server**Client → Server**        |
|   8 | **News**                 | [https://vnpay-news.vnresource.net](https://vnpay-news.vnresource.net/)           | Trang tin tức nội bộ (WordPress) tích hợp SSO với HRM                                      | Nhân viên, HR          | Đăng nhập 1 lần (SSO)**Client → Server**  |
|   9 | **Survey API**           | [https://vnpay-apiSurvey.vnresource.net](https://vnpay-apisurvey.vnresource.net/) | Hệ thống khảo sát nội bộ                                                                   | Nhân viên, HR, Quản lý | Source & DB độc lập**Client → Server**    |
|  10 | **Chat API**             | [https://vnpay-chat.vnresource.net](https://vnpay-chat.vnresource.net/)           | Dịch vụ chat nội bộ                                                                        | Nhân viên              | Chạy cùng Portal**Client → Server**       |
|  11 | **Chat FE**              | [https://vnpay-chatfe.vnresource.net](https://vnpay-chatfe.vnresource.net/)       | Giao diện chat nhúng vào Portal                                                            | Nhân viên              | Frontend chat**Client → Server**          |
|  12 | **Windows Service Core** | [https://vnpay-ws.vnresource.net](https://vnpay-ws.vnresource.net/)               | Service nền: job định kỳ (phút/giờ/ngày/tháng), sync dữ liệu, gửi mail, xử lý công – lương | Hệ thống               | Background Service                        |
|  13 | **Traefik Dashboard**    | [https://vnpay-traefik.vnresource.net](https://vnpay-traefik.vnresource.net/)     | Giám sát router, service, middleware, TLS                                                  | IT / DevOps            | Reverse proxy & Load Balancer UI          |
# 🧩 Link PE – HRM System (UAT) | Card View

---

## 🟦 Portal – Employee Portal

**🌐 Domain:**
[https://vnpay-empportal.vnresource.net](https://vnpay-empportal.vnresource.net)

**🎯 Mục đích:**
Cổng thông tin dành cho **nhân viên**, cho phép:

* Xem hồ sơ cá nhân
* Bảng công – lương
* Nghỉ phép, phúc lợi

**👤 Người dùng:**
Nhân viên

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
Giao diện cá nhân, entry point chính của người dùng cuối.

---

## 🟦 Main – HRM Management

**🌐 Domain:**
[https://vnpay-main.vnresource.net](https://vnpay-main.vnresource.net)

**🎯 Mục đích:**
Trang **quản trị HRM**, bao gồm:

* Quản lý hồ sơ
* Tuyển dụng
* Đào tạo
* Báo cáo nhân sự

**👤 Người dùng:**
HR, Quản lý

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
Web quản lý trung tâm của hệ thống HRM.

---

## 🟦 HR API – Business HR Layer

**🌐 Domain:**
[https://vnpay-hr.vnresource.net](https://vnpay-hr.vnresource.net)

**🎯 Mục đích:**
Xử lý **nghiệp vụ nhân sự**:

* Hồ sơ
* Công
* Lương

**👤 Người dùng:**
Portal, Main

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
API nghiệp vụ cốt lõi của HRM.

---

## 🟦 SYS API – Security & System

**🌐 Domain:**
[https://vnpay-sys.vnresource.net](https://vnpay-sys.vnresource.net)

**🎯 Mục đích:**
Quản lý:

* Bảo mật
* Phân quyền
* Tài khoản
* Cấu hình hệ thống

**👤 Người dùng:**
Nội bộ hệ thống

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
Liên quan trực tiếp đến **security & permission**.

---

## 🟦 API Core (Internal)

**🌐 Domain:**
[https://vnpay-apiv3.vnresource.net](https://vnpay-apiv3.vnresource.net)

**🎯 Mục đích:**
API lõi **nội bộ**, chủ yếu phục vụ Portal.

**👤 Người dùng:**
Portal

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
❗ Không mở cho bên thứ ba.

---

## 🟦 Integration API – External Systems

**🌐 Domain:**
[https://vnpay-itgapi.vnresource.net](https://vnpay-itgapi.vnresource.net)

**🎯 Mục đích:**
API tích hợp với hệ thống bên ngoài:

* TS24
* MISA
* Viettel
* VnPay

**👤 Người dùng:**
Đối tác ngoài

**🔁 Kiểu giao tiếp:**
Server → Server

**📝 Ghi chú:**
Trao đổi dữ liệu, không dành cho người dùng cuối.

---

## 🟦 Identity – SSO & Token Service

**🌐 Domain:**
[https://vnpay-ids4.vnresource.net](https://vnpay-ids4.vnresource.net)

**🎯 Mục đích:**

* Xác thực người dùng
* SSO
* OAuth2 / OpenID Connect
* Cấp token

**👤 Người dùng:**
Toàn bộ hệ thống

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
Identity Server trung tâm (IDS4).

---

## 🟦 News – Internal CMS

**🌐 Domain:**
[https://vnpay-news.vnresource.net](https://vnpay-news.vnresource.net)

**🎯 Mục đích:**
Trang tin tức nội bộ (WordPress).

**👤 Người dùng:**
Nhân viên, HR

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
Tích hợp **SSO** với HRM (đăng nhập một lần).

---

## 🟦 Survey API – Internal Survey

**🌐 Domain:**
[https://vnpay-apiSurvey.vnresource.net](https://vnpay-apiSurvey.vnresource.net)

**🎯 Mục đích:**
Hệ thống khảo sát nội bộ.

**👤 Người dùng:**
Nhân viên, HR, Quản lý

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
Source riêng – Database riêng – tích hợp HRM.

---

## 🟦 Chat API – Messaging Service

**🌐 Domain:**
[https://vnpay-chat.vnresource.net](https://vnpay-chat.vnresource.net)

**🎯 Mục đích:**
Dịch vụ chat nội bộ.

**👤 Người dùng:**
Nhân viên

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
Backend cho chat trên Portal.

---

## 🟦 Chat FE – Chat Frontend

**🌐 Domain:**
[https://vnpay-chatfe.vnresource.net](https://vnpay-chatfe.vnresource.net)

**🎯 Mục đích:**
Giao diện chat nhúng vào Portal.

**👤 Người dùng:**
Nhân viên

**🔁 Kiểu giao tiếp:**
Client → Server

**📝 Ghi chú:**
Frontend chat, chạy trong Portal.

---

## 🟦 Windows Service Core – Background Jobs

**🌐 Domain:**
[https://vnpay-ws.vnresource.net](https://vnpay-ws.vnresource.net)

**🎯 Mục đích:**
Chạy ngầm các tác vụ định kỳ:

* Đồng bộ dữ liệu
* Gửi email
* Xử lý công – lương

**👤 Người dùng:**
Hệ thống

**📝 Ghi chú:**
Service nền, không có UI.

---

## 🟦 Traefik Dashboard – Infrastructure

**🌐 Domain:**
[https://vnpay-traefik.vnresource.net](https://vnpay-traefik.vnresource.net)

**🎯 Mục đích:**
Giám sát:

* Router
* Service
* Middleware
* TLS

**👤 Người dùng:**
IT / DevOps

**📝 Ghi chú:**
Reverse proxy & load balancing UI.

---

### 📌 Gợi ý dùng trong Obsidian

* Mỗi card = 1 **atomic note** (Zettelkasten-friendly)
* Note tổng này làm **MoC – HRM Architecture**
* Dễ link sang:

```md
[[Identity – Token Flow]]
[[Integration API – Data Mapping]]
[[Traefik – Routing Strategy]]
```

Nếu bạn muốn, mình có thể:

* Chuyển mỗi card thành **callout dạng `> [!info]`**
* Tạo **template card** để sau này thêm service mới
* Vẽ **system flow / sequence diagram** từ các card này
