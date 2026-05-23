![](Sys_TaiLieuPhanQuyen_02_image1.png)

<u>Document History</u>

|  **Date**  | **Revision** | **Description**      | **PIC**               |
|:----------:|:------------:|----------------------|:----------------------|
| 18/06/2017 |   8.0.1.0    | Tạo tài liệu đào tạo | Tung.Ly@VnResource.vn |
|            |              |                      |                       |

<u>Nội Dung - Content</u>

[1. Giới thiệu tài liệu – Document Introduction [2](#giới-thiệu-tài-liệu-document-introduction)](#giới-thiệu-tài-liệu-document-introduction)

[1.1 Mục đích tài liệu [2](#mục-đích-tài-liệu)](#mục-đích-tài-liệu)

[1.2 Từ viết tắt [2](#từ-viết-tắt)](#từ-viết-tắt)

[1.3 Ý nghĩa các hình vẽ [2](#ý-nghĩa-các-hình-vẽ)](#ý-nghĩa-các-hình-vẽ)

[1.4 Phân quyền [3](#phân-quyền)](#phân-quyền)

[1.4.1 Tổng quan [3](#tổng-quan)](#tổng-quan)

[1.4.2 Hướng dẫn phân nhóm quyền theo cách mới [3](#hướng-dẫn-phân-nhóm-quyền-theo-cách-mới)](#hướng-dẫn-phân-nhóm-quyền-theo-cách-mới)

[1.4.3 Hướng dẫn phân quyền (Người dùng thao tác) [4](#hướng-dẫn-phân-quyền-người-dùng-thao-tác)](#hướng-dẫn-phân-quyền-người-dùng-thao-tác)

# Giới thiệu tài liệu – Document Introduction

## Mục đích tài liệu

> Tài liệu này đào tạo nhân viên mới tiếp cận phân quyền.

## Từ viết tắt

| STT | Thuật ngữ/ Viết tắt | Ý nghĩa |
| --- | --- | --- |
|  | HRM Pro | Giải pháp phần mềm nhân sự VnResource |

## Ý nghĩa các hình vẽ

![](Sys_TaiLieuPhanQuyen_02_image2.emf)

##  ­Phân quyền

### Tổng quan

1.  Phân quyền dữ liệu

<!-- -->

1.  Phân quyền theo phòng ban

2.  Phân quyền theo nơi làm việc

<!-- -->

2.  Phân quyền chức năng

<!-- -->

1.  Màn hình

2.  Nút

3.  Tab

### Hướng dẫn phân nhóm quyền theo cách mới

1.  Phân quyền phân cấp theo người dùng

> ![](Sys_TaiLieuPhanQuyen_02_image3.png)

2.  Phân nhóm quyền cần 2 bước

> ![](Sys_TaiLieuPhanQuyen_02_image4.png)

3.  Ví dụ chi tiết về nhóm quyền

> ![](Sys_TaiLieuPhanQuyen_02_image5.png)

### Hướng dẫn phân quyền (Người dùng thao tác)

Bước 1 :Ta cần vào màn hình quản lý Nhóm quyền (Dashboard \> ALL \> HỆ THỐNG \> NHÓM QUYỀN)

![](Sys_TaiLieuPhanQuyen_02_image6.png)

<u>Màn hình nhóm quyền</u>

Bước 2: Chọn hành động (Tạo mới , Sửa hoặc Xóa nhóm quyền)

![](Sys_TaiLieuPhanQuyen_02_image7.png)

Bước 3: Ở đây ta chi tiết vào tạo mới 1 nhóm quyền

![](Sys_TaiLieuPhanQuyen_02_image8.png)

1)  Phân quyền cho màn hình

- Ví dụ khi phân quyền cho màn hình Cat_Bank/index thì ta cần tìm Tên quyền là Cat_Bank_index ( Tên controller_Action) và thực hiện phân các quyền như Xem,Tạo mới,Xóa,Sửa……..

> ![](Sys_TaiLieuPhanQuyen_02_image9.png)

2)  Phân quyền cho nút

- Ta cần tìm nút cần phân quyền bằng cách tìm theo Controller_Action_IDButton

> Ví dụ phân quyền cho nút Cat_DayOff_Index_btnAnalyzeCompensateHoliday

![](Sys_TaiLieuPhanQuyen_02_image10.png)

3)  Phân quyền cho tab

- Ví dụ ta phân quyền cho tab Hợp đồng bảo hiểm ở màn hình GeneralProfile/Index. Ta có id của tab hợp đồng bảo hiểm là InfoContactDetail

> ![](Sys_TaiLieuPhanQuyen_02_image11.png)

- Ta tìm kiếm tab Hợp đồng bảo hiểm bằng id InfoContactDetail của nó rồi thực hiện phân quyền

> ![](Sys_TaiLieuPhanQuyen_02_image12.png)
>
> ![](Sys_TaiLieuPhanQuyen_02_image13.png)

Khi đã tạo mới được nhóm quyền, ta cần phải xác định những người dùng nào được sử dụng quyền này bằng cách vào màn hình người dùng để thực hiện phân quyền. (Dashboard \> ALL \> HỆ THỐNG \> NGƯỜI DÙNG)

![](Sys_TaiLieuPhanQuyen_02_image14.png)

![](Sys_TaiLieuPhanQuyen_02_image15.png)

Ngoài ra nếu ta muốn phân quyền cho 1 màn hình, nút hoặc tab mới tạo chưa có trong danh sách tên quyền thì ta cần vào DS tất cả tài nguyên (Dashboard \> ALL \> HỆ THỐNG \> DANH SÁCH TẤT CẢ TÀI NGUYÊN) yêu cầu phải đăng nhập bằng supper admin

![](Sys_TaiLieuPhanQuyen_02_image16.png)

![](Sys_TaiLieuPhanQuyen_02_image17.png)

![](Sys_TaiLieuPhanQuyen_02_image18.png)

Sau ![](Sys_TaiLieuPhanQuyen_02_image19.png)

Sau khi hoàn tất các bước, ta có thể thấy Tên quyền TungTest nằm trong nhóm quyền TUNGTEST và có thể bắt đầu phân quyền cho quyền TungTest

![](Sys_TaiLieuPhanQuyen_02_image20.png)

## 
