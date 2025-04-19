---
Mã: 
Path: C:\Code\HRM8-FrontEnd
tags:
  - "#learning"
---


Phân tích kiến trúc source code của dự án dựa trên package.json và các thông tin có sẵn.

Đây là một dự án Angular với tên "vnrportal" (version 3.3.0). Hãy cùng phân tích các điểm chính:

1. Kiến trúc Micro Frontend:

- Dự án sử dụng Module Federation (@angular-architects/module-federation) cho phép chia nhỏ ứng dụng thành nhiều micro frontend

- Có nhiều ứng dụng con (micro apps) như:

	- Portal chính (vnrportal)
	
	- Insurance (Bảo hiểm)
	
	- Attendance (Chấm công)
	
	- Human Resources (Nhân sự)
	
	- Salary (Lương)
	
	- Recruitment (Tuyển dụng)
	
	- Canteen (Căn tin)
	
	- Training (Đào tạo)
	
	- Tenant Management (Quản lý tenant)
	
	- Tenant Portal (Portal cho tenant)

1. Tech Stack chính:

	- Framework: Angular 15.2.5
	
	- State Management: NgRx (@ngrx/store, @ngrx/effects)
	
	- UI Components:
	
	- Kendo UI (@progress/kendo-)
	
	- Ng-Zorro Antd
	
	- Angular Material
	
	- Bootstrap 4
	
	- Internationalization: @ngx-translate
	
	- Authentication: angular-oauth2-oidc (OAuth2/OpenID Connect)

1. Các tính năng đặc biệt:

	- Hỗ trợ đa ngôn ngữ
	
	- Tích hợp với Firebase
	
	- Có khả năng xử lý form phức tạp (survey-core, survey-analytics)
	
	- Hỗ trợ export PDF, Excel
	
	- Tích hợp SignalR cho real-time communication
	
	- Có khả năng làm việc với charts và biểu đồ (Highcharts, ApexCharts)

1. Development Features:

	- Hot Module Replacement (HMR) support
	
	- Code quality tools:
	
	- ESLint
	
	- Prettier
	
	- Stylelint
	
	- Memory optimization (--max_old_space_size=6144/8192)
	
	- Bundle analysis support

1. Build & Deployment:

	- Có nhiều môi trường: dev, demo, production
	
	- Hỗ trợ build riêng cho từng micro app
	
	- Có tích hợp với CI/CD (thông qua các script build khác nhau)

1. Kiến trúc Module:

Dự án được chia thành nhiều module độc lập:

- Core module (vnr-module)

- Survey module (vnr-survey)

- Các module nghiệp vụ theo từng micro app

1. Security & Performance:

- Tích hợp OAuth2/OIDC cho authentication

- Sử dụng IndexedDB cho client-side storage

- Lazy loading thông qua Module Federation

- Bundle optimization và code splitting

1. Dependencies Management:

- Sử dụng Yarn làm package manager

- Có private registry cho các module nội bộ (vnr-module, vnr-survey)

- Có các script để quản lý việc cài đặt/update các module

Đây là một ứng dụng enterprise-level với kiến trúc micro frontend phức tạp, được thiết kế để xử lý các nghiệp vụ HR (Human Resource Management) với nhiều module con khác nhau. Kiến trúc này cho phép các team có thể làm việc độc lập trên từng module và dễ dàng mở rộng trong tương lai.



