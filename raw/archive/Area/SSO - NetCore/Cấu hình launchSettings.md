---
aliases: 
date: 2025-02-03
tags:
  - "#Area"
  - "#sso"
  - "#dotnet-core"
  - "#upgrade"
Related:
  - "[[Identity]]"
---
Cấu hình dotnet core tại:
- HRM.Presentation.Hr.ServiceCore\Properties\launchSettings.json
```json
{
  "profiles": {
    "HRM.Presentation.Hr.ServiceCore": {
      "commandName": "Project",
      "launchBrowser": true,
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development",
        "ProxyTo": "http://localhost:4777"
      },
      "dotnetRunMessages": true,
      "applicationUrl": "https://localhost:7243;http://localhost:5243"
    },
    "IIS Express": {
      "commandName": "IISExpress",
      "launchBrowser": true,
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development",
        "ProxyTo": "http://localhost:4777"
      }
    },
    "IIS": {
      "commandName": "IIS",
      "workingDirectory": "C:\\Code\\HRM9GIT-NET8\\Main\\Source\\Presentation\\HRM.Presentation.Hr.ServiceCore",
      "launchUrl": "https://tl-saas-hr.vnrlocal.com",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  },
  "$schema": "https://json.schemastore.org/launchsettings.json",
  "iisSettings": {
    "windowsAuthentication": false,
    "anonymousAuthentication": true,
    "iis": {
      "applicationUrl": "https://tl-saas-hr.vnrlocal.com",
      "sslPort": 0
    },
    "iisExpress": {
      "applicationUrl": "http://localhost:50736/",
      "sslPort": 44385
    }
  }
}
```
Trong đó: 
- **workingDirectory** là đường dẫn thư mục chứa source (vd: C:\\Code\\HRM9GIT-NET8\\Main\\Source\\Presentation\\HRM.Presentation.Hr.ServiceCore)
- **launchUrl** là url IIS (vd: https://tl-saas-hr.vnrlocal.com)
