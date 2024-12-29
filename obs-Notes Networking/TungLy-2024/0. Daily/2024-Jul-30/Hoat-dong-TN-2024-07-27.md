---
aliases: 
date: 2024-07-27
tags:
  - daily
---

- Làm tài liệu confluence (1 tiếng)
	- LDAP : [LDAP - SE-Docs - Confluence (vnresource.net)](https://confluence.vnresource.net:18001/display/SED/LDAP)
	- Check list bảo mật : [Performance CheckList - SE-Docs - Confluence (vnresource.net)](https://confluence.vnresource.net:18001/display/SED/Performance+CheckList)
	- 
- 

### Vấn đề thầy Vinh (2 tiếng)
- SuperAdmin : sau khi đăng nhập, màn hình nv đang làm việc, bấm tìm kiếm không có dữ liệu
	- WebSetting: 
		-  "UserLoginName": "luan.nguyen",
		- "UserId": "B51F17DF-7DF2-4DA6-8D00-6038D92F126F",
	- Nguyên nhân: user luan.nguyen chưa phân quyền
	- Giải pháp: vào màn hình người dùng, chọn user luan.nguyen, 
	- Nguyên nhân gốc: cấu hình redis sai, nếu không dùng redis thì phải set false. 			
```
 "RedisConfiguration": {
		    "UseRedisServer": false,
		    "TimeExpireToken": 60
		  }
```
- Giải pháp: cài đặt redis: [Setup Redis | VnR Docs (vnresource.net)](https://docs.vnresource.net/vi/se-docs/Security/redis_setup)
## Hỗ trợ team Sơn chạy window service (30 phút)







[^1]: Link Confluence: [SE-Docs - SE-Docs - Confluence (vnresource.net)](https://confluence.vnresource.net:18001/display/SED/SE-Docs)