---
title: Hướng dẫn sử dụng HRM Pro - Multi Tenant - SE-Docs - Confluence
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=32901426
created: 2026-01-25
tags:
  - document
like: false
---
## Giới thiệu tài liệu – Document Introduction

## Mục đích tài liệu

- Mục tiêu của triển khai SaaS (Phần mềm dưới dạng Dịch vụ) theo kiến trúc multi tenant. Multi tenant là một kiến trúc phần mềm cho phép nhiều khách hàng (tenant) sử dụng cùng một ứng dụng mà không gây xung đột dữ liệu hay tác động đến nhau..

## Từ viết tắt

  

| **STT** | **Thuật ngữ/ Viết tắt** | **Ý nghĩa** |
| --- | --- | --- |
| 1. | HRM Pro | Giải pháp phần mềm nhân sự VnResource |
| 2 | SaaS | triển khai SaaS (Phần mềm dưới dạng Dịch vụ) |
| 3 | Multi tenant | Multi tenant là một kiến trúc phần mềm cho phép nhiều khách hàng (tenant) sử dụng cùng một ứng dụng mà không gây xung đột dữ liệu hay tác động đến nhau. |
| 4 | Storage | Trong ứng dụng HRM, việc tải tập tin và kết xuất tập tin sẽ tiến hành đưa lên storage. Các storage tùy chọn như: Azure cloud, Amzon cloud, MinIO |
| 5 | Redis | Hệ thống cache |
| 6 | Jobs | Tính năng giúp tự động hóa việc thực thi một tác vụ theo lịch trình |

  

## Multi Tenant

- Kiến trúc Multitenant là một kiến trúc phần mềm cho phép nhiều khách hàng (tenant) sử dụng cùng một ứng dụng, nhưng vẫn giữ được sự độc lập giữa các khách hàng.

## Kiến trúc multi tenant

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddav1058cc5fce7f66cb722a8e85c352feac.png?version=1&modificationDate=1724644997881&api=v2)  
  

| **Diễn giải quy trình multi tenant** |  |  |
| --- | --- | --- |
| **Bước thực hiện** | **Người thực hiện** | **Mô tả chi tiết** |
| **Bước 1: Người dùng tiến hành đăng nhập (1)** | Người dùng tenant A | ● Người dùng tiến hành đăng nhập với tên đăng nhập và mật khẩu. |
| **Bước 2: Identity server xác thực tài khoản (1)** | Identity server | ● Identity server tiến hành xác thực tài khoản với tên - đăng nhập và mật khẩu ở bước 1.   ● Kiểm tra thông tin đăng nhập thuộc về tenant nào thông qua kết nối cơ sở dữ liệu của ứng dụng quản lý tenant. |
| **Bước 3: Lấy thông tin tenantCode (2)** | Identity server | ● Trả về thông tin tenant như: tenantCode |
| **Bước 4: Identity server trả về thông tin token (2)** | Identity server | ● Trả về thông tin token bao gồm thông tin tenantCode |
| **Bước 5: Load balancing (3)** | HRM System | ● Load balancing sẽ điều hướng tới server phù hợp   ● Ứng dụng HRM sẽ tiến hành lấy thông tin cơ sở dữ liệu tương ứng với tenantCode nhận về lần đầu. Những lần tiếp theo, HRM sẽ chủ động kết nối với cơ sở dữ liệu phù hợp với tenantCode |
| **Bước 6: trả về thông tin tenant (3)** | HRM System | ● Ứng dụng HRM nhận thông tin tenant như: chuổi kết nối database, thông tin tenantCode |
| **Bước 7: kết nối CSDL phù hợp (3)** | HRM System | ● Sau khi nhận chuổi kết nối, ứng dụng HRM kết nối với cơ sở dữ liệu phù hợp với tenantCode   ● Trong ứng dụng HRM, việc tải tập tin và kết xuất tập tin sẽ tiến hành đưa lên storage. Các storage tùy chọn như: Azure cloud, Amzon cloud, MinIO.   ● Rediscache dùng để cache dữ liệu theo từng tenant.   ● Jobs dùng để chạy những chức năng theo lịch. |

## Khách hàng đăng ký tài khoản

- Doanh nghiệp truy cập vào link đăng ký tài khoản:\[ | [https://hrm-saas.vnresource.net:8088/#/public/tenant-public/tenant-register](https://hrm-saas.vnresource.net:8088/#/public/tenant-public/tenant-register)\] {+} [https://hrm-saas.vnresource.net:8089/#/public/tenant-public/tenant-register+](https://hrm-saas.vnresource.net:8089/#/public/tenant-public/tenant-register+)
- Nhập các thông tin doanh nghiệp và chọn đăng ký

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddavfd474e4994c2ef6c55c0e9b8574b0955.png?version=1&modificationDate=1724644997891&api=v2)

- Sau khi đăng ký thành công, VnR sẽ nhận email đăng ký thành công. Thông tin email support của VnR như sau (User:[vnr.saas@gmail.com](https://confluence.vnresource.net:18001/pages/),Password: Asd@1234)
- Email thông báo đăng ký thành công như sau ![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddav2901ffc5152925ba0d6f9a79a00de029.png?version=1&modificationDate=1724644997901&api=v2)

  

## Quản lý hệ thống multi tenant

Vào chức năng quản lý tenant của VnResource để tiến hành xác nhận tài khoản người dùng

## Bước 1: VnR vào link quản lý tenant:\[ |https://hrm-saas.vnresource.net:8088/\]{+}https://hrm-saas.vnresource.net:8088/+

## Bước 2: VnR đăng nhập vào hệ thống với tài khoản: admin/123

## Bước 3: VnR vào menu quản lý công ty và chọn công ty cần xác nhận

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddav57051994b296df991689f2e38daa9c0a.png?version=1&modificationDate=1724644997910&api=v2)

## Bước 4: Khách hàng vào địa chỉ email (khi đăng ký) và tiến hành kích hoạt tài khoản

### Bước 4.1: khách hàng sau khi chọn kích hoạt, hệ thống sẽ điều hướng đến trang kích hoạt

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddav35c68f1b836a27b9b2aabe495a11e5e9.png?version=1&modificationDate=1724644997919&api=v2)

### Bước 4.2: Khách hàng tạo mật khẩu

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddavc39176d6734c5049d92107c737e0e57a.png?version=1&modificationDate=1724644997927&api=v2)

### Bước 4.3: Khởi tạo một cơ sơ dữ liệu tương ứng với khách hàng vừa tạo

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddav54a940a2c05095bc6a661e4b903e118d.png?version=1&modificationDate=1724644997936&api=v2)

#### Ghi nhận thông tin cơ sở dữ liệu vào hệ thống quản lý tenant

#### Trong cơ sở dữ liệu HRM vừa tạo, hệ thống sẽ tạo một người dùng với tên đăng nhập là email của người đăng ký tài khoản

## Bước 5: khách hàng nhận thêm một email báo hệ thống đã tạo thành công và thông tin trang HRM

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddave6dea49309f9f18e91347f7b49a4b676.png?version=1&modificationDate=1724644997945&api=v2)

## Khách hàng đăng nhập hệ thống

- Sau khi nhận email kích hoạt thành công, trong đó có đường link đến phần mềm quản lý nhân sự HRM Pro, người dùng tiến hành đăng nhập vào hệ thống HRM với tên đăng nhập là email người dùng.

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddav3664509e684d1b870cdb57374b83d789.png?version=1&modificationDate=1724644997955&api=v2)

## Khách hàng sử dụng phần mềm HRM Pro

- Sau khi đăng nhập thành công, hệ thống sẽ vào trang danh sách ứng dụng quản lý HRM Pro. Khách hàng chọn HRM Pro để vào giao diện phần mềm quản lý nhân sự

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddav46d1cef55976872b77adab2ec2776000.png?version=1&modificationDate=1724644997965&api=v2)

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddav576eb84c92e5c4cbd39bd48db4ac0fbf.png?version=1&modificationDate=1724644997974&api=v2)

![](https://confluence.vnresource.net:18001/download/attachments/32901426/worddavf8f0a4907137a2f35ad6bcb6820a22a6.png?version=1&modificationDate=1724644997986&api=v2)