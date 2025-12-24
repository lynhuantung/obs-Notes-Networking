---
Mã: Test-tải
aliases:
date: 2025-12-22
time: 06:40
Week: "02"
tags:
  - daily
Project: "[[Dự án VnPay]]"
Liên kết:
---

![[Pasted image 20251222095728.png]]
Kết quả test tải dùng jmeter
![[Pasted image 20251222100045.png]]

![[Pasted image 20251222095931.png]]
Tài nguyên hiện tại
# Phân tích test tải

## 📊 Tổng quan test tải (nhìn 1 phát là hiểu)

- **Tổng request:** ~53.340
    
- **Throughput:** ~29 TPS (≈ 8 API × ~3–4 TPS / API)
    
- **Error rate:** **8.81%** → _khá cao_ ❗
    
- **Avg response:** ~3.4s
    
- **P90 / P95 / P99:** ~15s / ~30s / ~30s → _bị timeout hàng loạt_ ⏱️
    

👉 **Kết luận nhanh:**

> Hệ thống **chịu tải kém khi đồng thời**, nhiều API **chạm ngưỡng timeout 30s**, dẫn đến error tăng.

---

## 🔥 API có vấn đề nghiêm trọng (điểm nghẽn chính)

|API|Error %|Avg (ms)|Nhận định|
|---|---|---|---|
|`GetListDataWorkdayForProfile`|**17.41%**|~6.4s|Query nặng / DB bottleneck|
|`GetCutOffDurationByProfile`|**17.08%**|~6.2s|Gọi DB + logic|
|`TestPermissionWithSignature`|**16.57%**|~6.4s|**CPU-heavy (ký số)**|
|`GetConfigConfirmPasswordPayslip`|9.12%|~3.8s|Có thể cache được|

👉 Điểm chung:

- **P95/P99 đều = ~30s** → _request bị giữ tới timeout_
    
- Khi nghẽn → **thread pool đầy → domino effect**
    

---

## ✅ API chạy ổn (không phải thủ phạm)

- `Count_SysNotification`
    
- `GetListConfigHotline`
    
- `ShowHappyBirthDayGif`
    

⏱️ Avg < 100ms – Error gần 0 → **không cần đụng tới**

---

## 🧠 Chẩn đoán nhanh nguyên nhân

- ❌ **Không phải frontend** (vì median rất thấp, chỉ fail khi tải cao)
    
- ❌ **Không phải network**
    
- ✅ **CPU + DB là cổ chai chính**
    
    - Ký số (signature)
        
    - Permission
        
    - Query Workday / CutOff
        
- ⚠️ **Không có cơ chế degrade / fail fast**  
    → request bị giữ đủ 30s mới chết
    

---

## 🛠️ Hướng xử lý ngắn gọn (để đi họp)

1. **Cache bắt buộc**
    
    - Permission
        
    - Config / CutOff
        
    - Signature (cache theo user)
        
2. **Fail fast**
    
    - Timeout API: **3–5s**
        
    - Không giữ request 30s
        
3. **Tách tải Dashboard**
    
    - API nặng → load async / background
        
    - Ưu tiên API nhẹ trước
        
4. **Scale có điều kiện**
    
    - Scale **CPU cho service Identity / Permission**
        
    - Scale pod **≠ giải quyết logic chậm**
        

---

## 🎯 Kết luận 1 câu (rất quan trọng)

> **Hệ thống không sập vì số user, mà sập vì vài API nặng bị gọi đồng thời, không cache và không fail fast.**



**sơ đồ dashboard chịu tải** 


┌────────────┐
│  User x N       │   (500–2000 users)
└─────┬──────┘
      │
      ▼
┌──────────────────┐
│  Load Balancer        │
│ (Ingress / Nginx)     │
└─────┬────────────┘
      │
      ▼
┌─────────────────────────────┐
│        Frontend (Web)                   │
│  - Angular / SPA                         │
│  - Load dashboard async           │
│  - Timeout 3–5s                          │
└─────┬──────────────┬────────┘
      │                           │
      │                           │
      ▼                         ▼
┌──────────────┐   ┌────────────────────┐
│ API nhẹ            │   │ API nặng (critical)        │
│ (Config, GIF)    │   │ Permission, Workday   │
│ <100ms           │   │ CutOff, Signature        │
└─────┬────────┘   └─────┬──────────────┘
      │                               │
      ▼                             ▼
┌──────────────┐   ┌────────────────────┐
│ Redis Cache     │    │ Async / Background   │
│ (Hit 80–90%)   │     │ Worker / Queue         │
└──────────────┘   └─────┬──────────────┘
                          │
                          ▼
                  ┌──────────────┐
                  │   Database       │
                  │  (CPU-heavy)   │
                  └──────────────┘
