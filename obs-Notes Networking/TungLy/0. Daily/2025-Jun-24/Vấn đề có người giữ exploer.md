---
Mã: 25062412-01
aliases: 
date: 2025-06-12
time: 09:56
Week: "24"
tags:
  - daily
---

# xử lý stop và start explorer bằng file .bat
---
@echo off
taskkill /f /im explorer.exe
timeout /t 3
start explorer.exe
