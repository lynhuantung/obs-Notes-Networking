---
title: Cáº¥u hÃ¬nh WebSetting - SaaS - SE-Docs - Confluence
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=32901511
created: 2026-01-25
tags:
  - clippings
  - document
like: false
---
## 1\. Tá»”NG QUAN TÃ€I LIá»†U

## 1.1 GIá»šI THIá»†U

- Má»¥c tiÃªu cá»§a triá»ƒn khai SaaS (Pháº§n má»m dÆ°á»›i dáº¡ng Dá»‹ch vá»¥) theo kiáº¿n trÃºc multi tenant trÃªn Kubernetes (k8s) lÃ  cung cáº¥p linh hoáº¡t viá»‡c triá»ƒn khai cÃ¡c á»©ng dá»¥ng SaaS. Kubernetes cung cáº¥p cÃ¡c tÃ­nh nÄƒng nhÆ° tá»± phá»¥c há»“i, tá»± Ä‘á»™ng má»Ÿ rá»™ng vÃ  quáº£n lÃ½ tÃ i nguyÃªn Ä‘á»ƒ giÃºp cÃ¡c nhÃ  phÃ¡t triá»ƒn vÃ  quáº£n trá»‹ viÃªn cÃ³ thá»ƒ triá»ƒn khai vÃ  quáº£n lÃ½ cÃ¡c á»©ng dá»¥ng SaaS cá»§a há» má»™t cÃ¡ch hiá»‡u quáº£.

## 1.2 Má»¤C ÄÃCH TÃ€I LIá»†U

- GiÃºp IT cáº¥u hÃ¬nh webSetting.json trong SaaS

## 2\. HÆ¯á»šNG DáºªN CHI TIáº¾T

## 2.1 HRM.Presentation.Main

`"` **Identity\_ConnectionString** `": "[c](https://login.microsoftonline.com;https//login.live.com)huá»•i káº¿t ná»‘i Ä‘áº¿n identity server"`

**WebSettings.json**

```
{
  "ConnectionStrings": {
    "VnrConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=HRMPro11_SaaS;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"
  },
  "AppSettings": {
    "Hrm_Main_Web": "https://hrm-saas.vnresource.net:8081/",
    "Hrm_EmpPortal_Web": "https://hrm-saas.vnresource.net:8084/",
    "Hrm_Hre_Service": "https://hrm-saas.vnresource.net:8082/",
    "Hrm_Sys_Service": "https://hrm-saas.vnresource.net:8083/",
    "UserName": "123",
    "Password": "202cb962ac59075b964b07152d234b70",
    "UserLoginName": "hanh.nguyen",
    "UserId": "98697a85-dee0-49eb-8ae7-8dcca846b0ec",
    "AllowAnonymousRequest": true,
    "AllowOrigin": "https://login.microsoftonline.com;https://login.live.com;https://hrm-saas.vnresource.net:8089/;https://hrm-saas.vnresource.net:8084/;https://hrm-saas.vnresource.net:8086/;",
    "ModeProfilerLog": "ALL",
    "LogFolders": "HRM.Presentation.WindowsService\\Log",
    "IsLdapSignIn": false,
    "LdapSignInSource": "@north.icbv.com",
    "Format_Decimal_Number": 2,
    "Format_Decimal_Money": 2,
    "reCaptchaPublicKey": "6LcNnxYUAAAAAG6Peqwo8CqqNUlFuhcvnNOa8DoA",
    "reCaptchaPrivateKey": "6LcNnxYUAAAAACBmFDyw2_c25GAb6QW3KIsgGJF8",
    "IsEncryptData": true,
    "HRM_CAN_MEALRECORD_SCANMULTI_CONFIG": 15,
    "HRM_LAU_LAUNDRYRECORD_SCANMULTI_CONFIG": 15,
    "HRM_SYS_USERSETTING_THEME": "VnResourceDefault",
    "HRM_SYS_USERSETTING_LANGUAGE": "VietNam",
    "HRM_CAN_MEALRECORD_EATEND_CONFIG": "2014-05-01 06:30:00.000000",
    "Identity_ConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=VNR_Identity;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"

  },
  "RedisConfiguration": {
    "UseRedisServer": false,
    "UseRedisSyncData": true,
    "TimeExpireToken": 60,
    "RedisConnection": "127.0.0.1:6379,syncTimeout=60000,responseTimeout=60000,connectTimeout=10000,allowAdmin=true,password=7Ri7zcOPdPG4thsgyncp7Q==",
    "RedisPrefixKeyName": "App-HRM11-SAAS"
  },
  "K8sSettings": {},
  "MinioConfigurations": {
    "Enable": true,
    "MinioEndpoint": "103.42.56.16:9500",
    "AccessKey": "minioadmin",
    "SecretKey": "minioadmin",
    "Secure": false,
    "LinkView": "https://hrm-saas.vnresource.net:8090"
  },
  "AzureConfigurations": {}
}
```

  

## 2.2 HRM.Presentation.EmpPortal

`"` **Identity\_ConnectionString** `": "[c](https://login.microsoftonline.com;https//login.live.com)huá»•i káº¿t ná»‘i Ä‘áº¿n identity server"`

  

## 2.3 HRM.Presentation.Hr.Service

`"` **Identity\_ConnectionString** `": "[c](https://login.microsoftonline.com;https//login.live.com)huá»•i káº¿t ná»‘i Ä‘áº¿n identity server"`

**WebSettings.json**

```
{
  "ConnectionStrings": {
    "VnrConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=HRMPro11_SaaS;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"
  },
  "AppSettings": {
    "IsEncryptData": true,
    "ModeProfilerLog": "ALL",
    "AllowAnonymousRequest": true,
    "AllowOrigin": "https://hrm-saas.vnresource.net:8081;https://hrm-saas.vnresource.net:8084",
    "Identity_ConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=VNR_Identity;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"
  },
  "K8sSettings": {},
  "MinioConfigurations": {
    "Enable": true,
    "MinioEndpoint": "103.42.56.16:9500",
    "AccessKey": "minioadmin",
    "SecretKey": "minioadmin",
    "Secure": false,
    "LinkView": "https://hrm-saas.vnresource.net:8090"
  },
  "AzureConfigurations": {}
}
```

  

## 2.4 HRM.Presentation.HrmSystem.Service

`"` **Identity\_ConnectionString** `": "[c](https://login.microsoftonline.com;https//login.live.com)huá»•i káº¿t ná»‘i Ä‘áº¿n identity server"`

**WebSettings.json**

```
{
  "ConnectionStrings": {
    "VnrConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=HRMPro11_SaaS;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"
  },
  "AppSettings": {
    "Hrm_Hre_Service": "https://hrm-saas.vnresource.net:8082/",
    "IsEncryptData": true,
    "ModeProfilerLog": "ALL",
    "AllowAnonymousRequest": true,
    "AllowOrigin": "https://hrm-saas.vnresource.net:8081;https://hrm-saas.vnresource.net:8084",
     "Identity_ConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=VNR_Identity;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"
  },
  "K8sSettings": {},
  "MinioConfigurations": {
    "Enable": true,
    "MinioEndpoint": "103.42.56.16:9500",
    "AccessKey": "minioadmin",
    "SecretKey": "minioadmin",
    "Secure": false,
    "LinkView": "https://hrm-saas.vnresource.net:8090"
  },
  "AzureConfigurations": {}
}
```

  

## 2.5 HRM.Presentation.WindowsService

`"` **Identity\_ConnectionString** `": "[c](https://login.microsoftonline.com;https//login.live.com)huá»•i káº¿t ná»‘i Ä‘áº¿n identity server"`

`"` **IsMultitenant** `": cáº¥u hÃ¬nh giÃºp nháº­n biáº¿t Ä‘Ã¢y lÃ  multi tenant`

`Â "` **TenantCode** `": cáº¥u hÃ¬nh nÃ y giÃºp biáº¿t tenant code cá»¥ thá»ƒ (khÃ´ng cáº§n cáº¥u hÃ¬nh cá»¥ thá»ƒ 1 tenant, há»‡ thá»‘ng tá»± Ä‘á»™ng thiáº¿t láº­p)`

**WebSettings.json**

```
{
  "ConnectionStrings": {
    "VnrConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=HRMPro11_SaaS;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"
  },
  "AppSettings": {
    "Hrm_Main_Web": "https://hrm-saas.vnresource.net:8081/",
    "Hrm_Hre_Service": "https://hrm-saas.vnresource.net:8082/",
    "Hrm_Sys_Service": "https://hrm-saas.vnresource.net:8083/",    
    "IsWindowService": true,
    "IsMultitenant": true,
    "Identity_ConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=VNR_Identity;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;",
    "TenantCode" : ""    
  }
}
```

  

## 2.6 HRM.SC.Service.Api

**WebSettings.json**

```
{
    "ConnectionStrings":{
        "VnrConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=HRMPro11_SaaS;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"
    },
    "AppSettings": {
        "ModeProfilerLog": "ALL",
        "Hrm_NewPortal_Web": "https://hrm-saas.vnresource.net:8084",
        "Hrm_APICenter_Web": "https://hrm-saas.vnresource.net:8085",
         "Identity_ConnectionString": "Data Source=103.42.56.16,3968;Initial Catalog=VNR_Identity;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;MultipleActiveResultSets=True;App=EntityFramework;"
    },
    "BasicAuthenticationConfiguration": {
        "Enabled": false
    },
    "OwinJwtBearerServerConfiguration": {
        "Enabled": true,
        "Audiences": [
            {
                "ClientId": "01f52b24e32546ebb87dd5adac97ba37",
                "ClientSecret": "mHnOb9nbnhZfFp8ZeJO3HK5xOX6RvMKEdIGuaXoicD8"
            }
        ]
    },
    "OwinJwtBearerConfiguration": [
        {
            "Enabled": true,
            "Issuer": "https://hrm-saas.vnresource.net:8085",
            "Audience": "01f52b24e32546ebb87dd5adac97ba37",
            "Secret": "mHnOb9nbnhZfFp8ZeJO3HK5xOX6RvMKEdIGuaXoicD8"
        },
        {
            "Enabled": true,
            "IssuerType": "OPENID_CONNECT",
            "Issuer": "https://hrm-saas.vnresource.net:8086"
        }
    ],
    "NswagIdentityServerConfiguration": {
        "Clients": [
            {
                "Enabled": true,
                "Id": "IDS.QC",
                "Description": "QC-IDS",
                "Authority": "https://hrm-saas.vnresource.net:8086",
                "ClientId": "tl_api"
            }
        ]
    },
    "MinioConfigurations": {
        "Enable": true,
        "MinioEndpoint": "127.0.0.1:9000",
        "AccessKey": "minioadmin",
        "SecretKey": "minioadmin",
        "Secure": false,
        "LinkView": "https://hrm-saas.vnresource.net:8090"
    }
}
```

  

## 2.6 HRM.SC.Service.Identity

**AppSettings.json**

```
{
    "ViewIdentityUI": true,
    "Logging": {
        "LogLevel": {
            "Default": "Debug",
            "System": "Information",
            "Microsoft": "Information",
            "Microsoft.Hosting.Lifetime": "Information",
            "Microsoft.AspNetCore.Authentication": "Information"
        }
    },
    "Languages": [ "vi-VN", "en-US", "zh-CN" ],
    "ConnectionStrings": {
        "DefaultConnection": "Data Source=IdentityServer.db;",
        "HrmTenantIdentityConnection": "Data Source=103.42.56.16,3968;Initial Catalog=VNR_Identity;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;TrustServerCertificate=True;"
    },
    "AuthMicrosoftAccount": {
        "Enable": true,
        "DisplayName": "ÄÄƒng nháº­p báº±ng Microsoft" ,
        "ClientId": "95617df1-1cdb-4c18-a679-d6b3c4f81475",
        "ClientSecret": "FYi8Q~2kOeVA~fPqGRqi_~LucsG1V9wYP7XHpa2P" 
    },
    "TenantConfiguration": {
        "UserLoginSql": "tungly",
        "PasswordLoginSql": "Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=",
        "UserLogin": "admin",
        "Password": "202cb962ac59075b964b07152d234b70",
        "ClientId": "tenant_ui"
    },
    "AuthWsFederation": {
        "Enable": false,
        "DisplayName": "Local - ADFS",
        "MetadataAddress": "https://fs.dev.local/FederationMetadata/2007-06/FederationMetadata.xml"
    },
    "ServiceIdentityConfiguration": {
        "Clients": [
            {
                "ClientId": "api",
                "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
                "AllowedScopes": [ "api" ],
                "AllowedGrantTypes": [ "password", "client_credentials" ],
                "AllowOfflineAccess": true,
                "AlwaysIncludeUserClaimsInIdToken": true
            },
            {
                "ClientId": "tl_api",
                "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
                "AllowedScopes": [ "api" ],
                "RedirectUris": [ "https://hrm-saas.vnresource.net:8085/swagger/oauth2-redirect.html" ],
                "AllowedGrantTypes": [ "authorization_code" ],
                "AllowOfflineAccess": true,
                "AlwaysIncludeUserClaimsInIdToken": true,
                "RequireClientSecret": false,
                "AllowedCorsOrigins": [ "https://hrm-saas.vnresource.net:8085" ]
            },
            {
                "ClientId": "tl_main",
                "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
                "AllowedScopes": [ "openid", "profile", "api" ],
                "RedirectUris": [ "https://hrm-saas.vnresource.net:8081/Home/ExternalLoginRedirect/Provider-01" ],
                "FrontChannelLogoutUri": "https://hrm-saas.vnresource.net:8081/Home/ExternalLogoutFromIdp",
                "PostLogoutRedirectUris": [ "https://hrm-saas.vnresource.net:8081/Home/Login" ],
                "AllowedGrantTypes": [ "authorization_code" ],
                "AllowOfflineAccess": true,
                "AlwaysIncludeUserClaimsInIdToken": true,
                "RefreshTokenExpiration": "Sliding",
                "AllowedCorsOrigins": [ "https://hrm-saas.vnresource.net:8081" ]
            },
            {
                "ClientId": "tl_portal",
                "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
                "AllowedScopes": [ "openid", "profile", "api" ],
                "RedirectUris": [ "https://hrm-saas.vnresource.net:8084/Portal/ExternalLoginRedirect/Provider-01" ],
                "FrontChannelLogoutUri": "https://hrm-saas.vnresource.net:8084/Portal/ExternalLogoutFromIdp",
                "PostLogoutRedirectUris": [ "https://hrm-saas.vnresource.net:8084/Portal/Login" ],
                "AllowedGrantTypes": [ "authorization_code" ],
                "AllowOfflineAccess": true,
                "AlwaysIncludeUserClaimsInIdToken": true,
                "RefreshTokenExpiration": "Sliding",
                "AllowedCorsOrigins": [ "https://hrm-saas.vnresource.net:8084" ]
            },
            {
                "ClientId": "hrm10_portal_app",
                "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
                "AllowedScopes": [ "openid", "profile", "api" ],
                "RedirectUris": [ "portal4hrm:/Home" ],
                "AllowedGrantTypes": [ "authorization_code" ],
                "AllowOfflineAccess": true,
                "AlwaysIncludeUserClaimsInIdToken": true,
                "RefreshTokenExpiration": "Sliding"
            },
            {
                "ClientId": "tenant_ui",
                "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
                "AllowedScopes": [ "openid", "profile", "api" ],
                "RedirectUris": [ "https://hrm-saas.vnresource.net:8088/#/auth/redirect" ],
                "FrontChannelLogoutUri": "https://hrm-saas.vnresource.net:8088/#/auth/login",
                "PostLogoutRedirectUris": [ "https://hrm-saas.vnresource.net:8088/#/auth/login" ],
                "AllowedGrantTypes": [ "authorization_code", "password" ],
                "AllowOfflineAccess": true,
                "AlwaysIncludeUserClaimsInIdToken": true,
                "RefreshTokenExpiration": "Sliding",
                "RequireClientSecret": false,
                "AllowedCorsOrigins": [ "https://hrm-saas.vnresource.net:8088" ]
            },
            {
                "ClientId": "tenant_ui_2",
                "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
                "AllowedScopes": [ "openid", "profile", "api" ],
                "RedirectUris": [ "https://hrm-saas.vnresource.net:8089/#/auth/redirect" ],
                "FrontChannelLogoutUri": "https://hrm-saas.vnresource.net:8089/#/auth/login",
                "PostLogoutRedirectUris": [ "https://hrm-saas.vnresource.net:8089/#/auth/login" ],
                "AllowedGrantTypes": [ "authorization_code", "password" ],
                "AllowOfflineAccess": true,
                "AlwaysIncludeUserClaimsInIdToken": true,
                "RefreshTokenExpiration": "Sliding",
                "RequireClientSecret": false,
                "AllowedCorsOrigins": [ "https://hrm-saas.vnresource.net:8089" ]
            },
            {
                "ClientId": "hrm10_local_ui",
                "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
                "AllowedScopes": [ "openid", "profile", "api" ],
                "RedirectUris": [ "http://localhost:4200/#/auth/redirect" ],
                "FrontChannelLogoutUri": "http://localhost:4200",
                "PostLogoutRedirectUris": [ "http://localhost:4200/#/auth/login" ],
                "AllowedGrantTypes": [ "authorization_code" ],
                "AllowOfflineAccess": true,
                "AlwaysIncludeUserClaimsInIdToken": true,
                "RefreshTokenExpiration": "Sliding",
                "RequireClientSecret": false,
                "AllowedCorsOrigins": [ "http://localhost:4200" ]
            },
            {
              "ClientId": "chat-api",
              "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
              "AllowedScopes": [ "openid", "profile", "api" ],
              "RedirectUris": [ "https://hrm-saas.vnresource.net:8091/swagger/oauth2-redirect.html" ],
              "AllowedGrantTypes": [ "authorization_code" ],
              "AllowOfflineAccess": true,
              "AlwaysIncludeUserClaimsInIdToken": true,
              "RequireClientSecret": false,
              "AllowedCorsOrigins": [ "https://hrm-saas.vnresource.net:8091" ]
            },
            {
              "ClientId": "hrm10_chat_local",
              "ClientSecrets": [ { "Value": "K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=" } ],
              "AllowedScopes": [ "openid", "profile", "api" ],
              "RedirectUris": [ "https://hrm-saas.vnresource.net:8092/#/auth/redirect" ],
              "FrontChannelLogoutUri": "https://hrm-saas.vnresource.net:8092",
              "PostLogoutRedirectUris": [ "https://hrm-saas.vnresource.net:8092/#/auth/login" ],
              "AllowedGrantTypes": [ "authorization_code" ],
              "AllowOfflineAccess": true,
              "AlwaysIncludeUserClaimsInIdToken": true,
              "RefreshTokenExpiration": "Sliding",
              "RequireClientSecret": false,
              "AllowedCorsOrigins": [ "https://hrm-saas.vnresource.net:8092" ]
            }
        ]
    }
}
```

  

## 2.7 HRM.Service.TenantManagement.Api

**WebSettings.json**

```
{
    "Logging": {
        "LogLevel": {
            "Default": "Information",
            "Microsoft.AspNetCore": "Warning"
        }
    },
    "AllowedHosts": "*",
    "ConnectionStrings": {        
        "DefaultConnection": "Data Source=103.42.56.16,3968;Initial Catalog=VNR_TenantManagement_Test;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;TrustServerCertificate=True;",
        "HrmTenantIdentityConnection": "Data Source=103.42.56.16,3968;Initial Catalog=VNR_Identity;Persist Security Info=True;User ID=tungly;Password=Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=;TrustServerCertificate=True;"
    },
    "TenantEmailConfiguration": {
        "TenantPortalUrl": "https://hrm-saas.vnresource.net:8089",
        "MainUrl": "https://hrm-saas.vnresource.net:8081",
        "PortalUrl": "https://hrm-saas.vnresource.net:8084",
        "EBMUrl": "https://hrm-saas.vnresource.net:8087",
        "LMSUrl": "https://hrm-saas.vnresource.net:8087",
        "ContactPhoneNumber": "0914 004 800",
        "ContactEmail": "Contact@VnResource.vn",
        "ContactUrl": "https://vnresource.vn",
        "ActivateUrl": "https://hrm-saas.vnresource.net:8089/#/public/tenant-public/activation/activation-successful/{TenantId}",
        "TenantSupportEmail": "vnr.saas@gmail.com",
        "TenantViewDetailsUrl": "https://hrm-saas.vnresource.net:8088/#/tenant-management/management"
    },
    "RestoreDbConfiguration": {
        "ServerName": "103.42.56.16,3968",
        "DatabaseName": "master",
        "UserLogin": "tungly",
        "Password": "Dotak7X6oeqgw7lea47uU23ooMQK7LSum5MbVlcoaYY=",
        "BaseRestoreDbName": "HRMPro11",
        "BackupDirectory": "E:\\raw\archive\\",
        "BackupFileName": "hrm_vnresource_tungly_20231113_v1.bak"
    },
    "MongoDbConfiguration": {
      "ServerName": "localhost",
      "Port": "3030",
      "UserLogin": "saas.admin",
      "Password": "RWw7rtP9enTjQLKRdITVNoVN0zPP2P8Ck1G3tQ1ibqk="
    },
    "AuthenticationConfiguration": {
        "ApiName": "VnR Tenant Management",
        "ApiBaseUrl": "",
        "IdentityServerBaseUrl": "https://hrm-saas.vnresource.net:8086",
        "OidcSwaggerUIClientId": "hrm10_tenant",
        "OidcApiName": "api",
        "AdministrationRole": "vnr-tenant-admin",
        "RequireHttpsMetadata": true
    },
    "CorsConfiguration": {
        "CorsAllowAnyOrigin": true,
        "CorsAllowOrigins": [ "https://localhost:4200", "https://hrm-saas.vnresource.net:8088", "https://hrm-saas.vnresource.net:8084", "https://hrm-saas.vnresource.net:8089" ]
    },
    "SmtpClientOptions": {
        "Host": "smtp.gmail.com",
        "Port": "587",
        "UserName": "systems.alarm@vnresource.org",
        "Password": "Vnr@@123",
        "EnableSsl": true
    }
}
```
