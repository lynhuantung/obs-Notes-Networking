---
Mã: 
Path: C:\Code\HRM8-FrontEnd
tags:
  - "#learning"
---
Module `@insurance` và hướng dẫn bạn những file có thể và không thể can thiệp:

1. **Những file KHÔNG ĐƯỢC PHÉP sửa**:

- **Các file cấu hình gốc**:
  ```
  - tsconfig.spec.json
  - tsconfig.app.json
  - karma.conf.js
  - webpack.config.js
  - webpack.prod.config.js
  ```

- **Các components từ shared modules**:
  ```
  - /shared-components/*
  - /shared-core/*
  - /shared-module/*
  - /shared-resources/*
  ```

2. **Những file CÓ THỂ sửa** (trong thư mục `src/`):

Để xem cấu trúc chi tiết của thư mục src, tôi sẽ kiểm tra:

Ran tool
Dựa trên cấu trúc chuẩn của một module Angular, đây là những file bạn CÓ THỂ sửa:

```
src/
├── app/
│   ├── components/          # Components riêng của module insurance
│   │   ├── insurance-list/
│   │   ├── insurance-detail/
│   │   └── insurance-form/
│   │
│   ├── pages/              # Các trang của module
│   │   ├── dashboard/
│   │   ├── policy-management/
│   │   └── claims/
│   │
│   ├── services/           # Services riêng của module
│   │   ├── insurance.service.ts
│   │   └── claim.service.ts
│   │
│   ├── models/            # Models/Interfaces
│   │   ├── insurance.model.ts
│   │   └── claim.model.ts
│   │
│   ├── store/             # State management
│   │   ├── actions/
│   │   ├── reducers/
│   │   └── effects/
│   │
│   └── utils/             # Helper functions
│
└── assets/                # Assets riêng của module
    ├── images/
    └── i18n/
```

3. **Quy tắc khi sửa code**:

- **Components**:
  - Chỉ sửa các components trong `/components` và `/pages`
  - KHÔNG sửa các components được import từ shared modules

- **Services**:
  - Có thể tạo và sửa services trong `/services`
  - Có thể extend từ shared services nhưng KHÔNG sửa trực tiếp shared services

- **Models**:
  - Có thể thêm/sửa models trong `/models`
  - Có thể extend từ shared models

- **Store**:
  - Có thể thêm/sửa actions, reducers, effects trong `/store`
  - Phải tuân thủ cấu trúc NgRx có sẵn

4. **Best Practices**:

```typescript
// CÓ THỂ: Tạo component mới
@Component({
  selector: 'app-insurance-detail',
  templateUrl: './insurance-detail.component.html'
})
export class InsuranceDetailComponent {
  // Your code here
}

// CÓ THỂ: Extend từ shared service
@Injectable()
export class InsuranceService extends BaseService {
  // Your code here
}

// KHÔNG NÊN: Sửa shared components
@Component({
  selector: 'shared-data-table',  // KHÔNG sửa components này
  templateUrl: './data-table.component.html'
})
```

5. **Khi cần sửa shared components**:
- Tạo ticket yêu cầu thay đổi
- Thảo luận với team phụ trách shared modules
- Không tự ý sửa trực tiếp

6. **Cách override shared functionality**:
```typescript
// Thay vì sửa shared component, tạo component mới extend từ nó
@Component({
  selector: 'app-custom-table',
  templateUrl: './custom-table.component.html'
})
export class CustomTableComponent extends SharedTableComponent {
  // Override các methods cần thiết
}
```

Bạn có muốn tìm hiểu chi tiết về cách implement một tính năng cụ thể trong module insurance không? Tôi có thể hướng dẫn chi tiết hơn.
