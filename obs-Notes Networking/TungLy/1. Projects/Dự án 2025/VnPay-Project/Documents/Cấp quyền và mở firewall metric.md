---
Mã:
aliases:
date: 2026-01-20
tags:
  - daily
Project: "[[Dự án VnPay]]"
---

netsh http add urlacl url=http://+:9090/metrics/ user="IIS AppPool\VNPAY_Main_2101"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Main" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9090

netsh http add urlacl url=http://+:9091/metrics/ user="IIS AppPool\VNPAY_HrService_2103"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Hr" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9091

netsh http add urlacl url=http://+:9092/metrics/ user="IIS AppPool\VNPAY_System_2104"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Sys" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9092

netsh http add urlacl url=http://+:9093/metrics/ user="IIS AppPool\VNPAY_Portal_2102"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Portal" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9093

netsh http add urlacl url=http://+:9094/metrics/ user="IIS AppPool\VNPAY_Iden_2106"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Ids4" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9094

netsh http add urlacl url=http://+:9095/metrics/ user="IIS AppPool\VNPAY_2105_Api"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics SC API" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9095

netsh http add urlacl url=http://+:9096/metrics/ user="IIS AppPool\VNPAY_2121_IntegrationApi"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Itg Api" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9096

netsh http add urlacl url=http://+:9097/metrics/ user="IIS AppPool\VNPAY_ChatApi_2124"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Chat Api" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9097

netsh http add urlacl url=http://+:9098/metrics/ user="IIS AppPool\VNPAY_SurveyApi_2123"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Survey Api" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9098