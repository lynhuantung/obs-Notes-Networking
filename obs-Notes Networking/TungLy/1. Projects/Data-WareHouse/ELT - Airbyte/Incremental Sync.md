---
aliases: 
date: 2024-11-15
tags:
  - daily
---

### **API yêu cầu những gì?**

1. **Tham số truyền vào API**:
    
    - API phải hỗ trợ bộ lọc theo `Cursor Field` để chỉ trả về dữ liệu cần thiết. Ví dụ:
        - Tham số: `updated_after`
        - Kiểu: `timestamp`
        - Cách truyền: `GET /api/data?updated_after=2024-11-14T12:00:00Z`
2. **Yêu cầu về dữ liệu trả về (JSON)**:
    
    - Dữ liệu trả về cần có:
        - **Cursor Field**: Trường chứa giá trị `dateupdate` hoặc timestamp tương tự, dùng để xác định dữ liệu mới.
        - **ID hoặc Primary Key**: Để phân biệt các bản ghi (ví dụ: `id`).
        - Các dữ liệu khác mà bạn cần đồng bộ (ví dụ: `name`, `status`,...).

```json
[
    {
        "id": 1,
        "name": "John Doe",
        "status": "active",
        "dateupdate": "2024-11-14T12:30:00Z"
    },
    {
        "id": 2,
        "name": "Jane Doe",
        "status": "inactive",
        "dateupdate": "2024-11-14T12:45:00Z"
    }
]

```

