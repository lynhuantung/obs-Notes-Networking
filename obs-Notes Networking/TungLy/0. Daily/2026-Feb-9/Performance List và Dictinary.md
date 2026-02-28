---
Mã:
aliases:
date: 2026-02-23
tags:
  - daily
Project:
---
![[Pasted image 20260223151956.png]]

**Ví dụ 1 – List (1000 lần)**  
List: mỗi lần tìm phải duyệt từng phần tử → **O(n)** → càng nhiều phần tử càng chậm.  
10.000 phần tử × 1000 lần → rất tốn CPU → **6469 ms**.

---

**Ví dụ 2 – ConcurrentDictionary (1000 lần)**  
Tìm theo hash → gần như **O(1)** → không phụ thuộc số lượng phần tử.  
1000 lần lookup chỉ khoảng **2 ms**.

---

**Ví dụ 3 – ConcurrentDictionary (100.000 lần)**  
Tăng số lần gọi lên 100 lần → thời gian tăng theo **số lần gọi**,  
không phải theo số lượng phần tử → **99 ms**.

---

👉 **Kết luận:** Lookup nhiều thì dùng Dictionary, không dùng List.