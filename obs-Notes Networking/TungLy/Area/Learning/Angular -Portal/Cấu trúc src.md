---
Mã: 
Path: C:\Code\HRM8-FrontEnd
tags:
  - "#learning"
---
![[Pasted image 20250419092418.png]]
Cấu trúc thư mục @src của dự án Angular :

1. Các thư mục chính:

- app/:

	- Thư mục chứa mã nguồn chính của ứng dụng
	
	- Chứa các components, services, modules, và logic nghiệp vụ

- assets/:

	- Chứa các tài nguyên tĩnh như:
	
	- Images
	
	- Icons
	
	- Fonts
	
	- JSON files
	
	- i18n files (các file ngôn ngữ)

- environments/:

	- Chứa các file cấu hình cho từng môi trường
	
	- Thường có environment.ts (development)
	
	- Và environment.prod.ts (production)
	
	- setup-build/:
	
	- Chứa các scripts và cấu hình build
	
	- Các file cấu hình cho quá trình build và deploy

1. Các file quan trọng:

	- main.ts:
	
	- Entry point chính của ứng dụng
	
	- Khởi tạo Angular application
	
	- bootstrap.ts (5.7KB):
	
	- File khởi động ứng dụng
	
	- Cấu hình các module và providers chính
	
	- index.html:
	
	- Template HTML gốc của ứng dụng
	
	- Chứa các meta tags và scripts cần thiết
	
	- polyfills.ts:
	
	- Cung cấp các polyfills cho browser compatibility
	
	- Hỗ trợ các tính năng JavaScript mới trên trình duyệt cũ
	
	- global.scss:
	
	- File styles toàn cục
	
	- Định nghĩa các biến và mixins SCSS
	
	- Các styles được dùng chung trong toàn ứng dụng

1. Các file cấu hình:

	- tsconfig.app.json:
	
	- Cấu hình TypeScript cho ứng dụng
	
	- Extends từ tsconfig.json gốc
	
	- tsconfig.spec.json:
	
	- Cấu hình TypeScript cho testing
	
	- karma.conf.js:
	
	- Cấu hình cho Karma test runner
	
	- .browserslistrc:
	
	- Định nghĩa danh sách browsers được hỗ trợ
	
	- Ảnh hưởng đến việc generate polyfills

1. Testing và Development:

	- test.ts:
	
	- Entry point cho unit tests
	
	- Cấu hình testing environment
	
	- hmr.ts:
	
	- Cấu hình Hot Module Replacement
	
	- Hỗ trợ hot reload trong development

1. Type Definitions:

	- decl.d.ts:
	
	- Chứa các type declarations
	
	- Định nghĩa các module types

1. Cấu trúc khuyến nghị cho thư mục app/:

app/
├── core/                 # Singleton services và module một lần
├── shared/              # Shared components, directives, pipes
├── features/            # Các module tính năng
├── layouts/             # Layout components
├── models/              # Interfaces & models
├── services/            # Services
└── utils/               # Helper functions & utilities

