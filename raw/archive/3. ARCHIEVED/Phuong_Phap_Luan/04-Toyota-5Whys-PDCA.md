---
type: source
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "toyota"
  - "5-whys"
  - "pdca"
  - "genchi-genbutsu"
  - "root-cause"
  - "kaizen"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/04-Toyota-5Whys-PDCA.md
related:
  - "[[wiki/concepts/Kaizen-Methodology]]"
  - "[[wiki/sources/INS-FishBone-Analysis]]"
  - "[[wiki/sources/INS-TruyNguyenNhan]]"
  - "[[wiki/sources/INS-Troubleshooting-5Why]]"
---

# Phương pháp Toyota — 5 Whys · PDCA · Genchi Genbutsu

> **Nhóm**: Phương pháp luận Debug  
> **Phù hợp**: Lỗi có nhiều yếu tố phụ thuộc, cần cải tiến quy trình, lỗi môi trường/config

---

## Ba công cụ chính của Toyota Production System

---

## Công cụ 1: 5 Whys — Truy nguyên nhân gốc rễ

### Nguyên tắc
> Hỏi "Tại sao?" liên tiếp đến khi chạm nguyên nhân có thể **hành động được** — không phải chỉ triệu chứng.

**Mục tiêu**: Tìm lý do tại sao lỗi **có thể tồn tại ngay từ đầu**, không chỉ lỗi đó làm gì.

### Ví dụ thực tế — Hệ thống treo

```
(1) Tại sao hệ thống bị treo?
    → Do tràn bộ nhớ ở module X.

(2) Tại sao tràn bộ nhớ ở module X?
    → Do vòng lặp vô tận khi xử lý dữ liệu đầu vào rỗng.

(3) Tại sao có dữ liệu đầu vào rỗng?
    → Do API phía trước không kiểm tra tính hợp lệ.

(4) Tại sao API không kiểm tra dữ liệu?
    → Do thiếu ràng buộc trong tài liệu đặc tả ban đầu.

(5) Tại sao thiếu đặc tả?
    → Do quy trình đánh giá yêu cầu chưa bao hàm edge cases.
```

> **Sửa ở cấp độ (5)** — quy trình đánh giá yêu cầu — ngăn chặn hàng loạt lỗi tương tự.
> Chỉ thêm `if (data != null)` ở cấp (2) = sửa triệu chứng, không giải quyết gốc rễ.

### Lưu ý áp dụng
- **5 chỉ mang tính biểu tượng** — hỏi đến khi nào thấy nguyên nhân "hành động được" thì dừng
- **Tránh đổ lỗi cá nhân** — tập trung vào hệ thống, quy trình, thiết kế
- **Nhóm đa chức năng** — mời người từ nhiều góc độ tham gia

### Các bước chuẩn
1. Nêu vấn đề rõ ràng, cụ thể
2. Hỏi "Tại sao?" với câu trả lời trước
3. Lặp ≥5 lần đến khi đạt nguyên nhân gốc
4. Ghi chép và xác minh giải pháp

---

## Công cụ 2: PDCA — Cải tiến liên tục

### Chu trình

```
Plan → Do → Check → Act → [lặp lại]
```

| Bước | Trong debug |
|------|------------|
| **Plan** | Lập kế hoạch test và phương án fix |
| **Do** | Triển khai kiểm tra nguyên nhân |
| **Check** | Đánh giá kết quả test |
| **Act** | Fix và deploy cải tiến |

> Nếu fix chưa triệt để → quay lại lặp PDCA với dữ liệu mới (tinh thần Kaizen).

**Đặc biệt phù hợp**: Lỗi lặp lại nhiều lần, cần quy trình cải tiến bền vững (không phải chỉ fix một lần).

---

## Công cụ 3: Genchi Genbutsu — Đến hiện trường

### Nguyên tắc
> "Go and see" — đến nơi phát sinh vấn đề để quan sát trực tiếp thay vì dựa vào báo cáo gián tiếp.

> "Để hiểu vấn đề, hãy xác nhận thực tế và phân tích nguyên nhân gốc tại chỗ." — Toyota

### Gemba trong phần mềm
**Gemba** = nơi mã nguồn đang thực thi:
- Server đang chạy
- Log thô chưa qua xử lý
- Thiết bị / trình duyệt của người dùng cuối

### Hành động thực tế
- SSH vào server, xem log gốc thay vì chỉ nhìn dashboard
- Chạy debug tại máy thực thi, không chỉ qua remote monitoring
- Database query trực tiếp, không qua layer báo cáo

> Dashboard giám sát đôi khi tạo **bức tranh giả tạo**, che lấp manh mối quan trọng nhất của lỗi.

---

## Ví dụ tổng hợp Toyota

**Tình huống**: Service xử lý ảnh bị timeout không thường xuyên.

```
5 Whys:
(1) Timeout? → Queue xử lý quá dài
(2) Queue dài? → Server xuất file chậm
(3) Chậm? → Thiếu GPU (device missing)
(4) Thiếu GPU? → Config deployment sai
(5) Config sai? → Dùng image cũ trong deployment script

→ Root cause: deployment script lỗi — không phải lỗi code logic
```

**PDCA áp dụng:**
- Plan: kế hoạch fix deployment script + test trên staging
- Do: fix script, deploy lên staging
- Check: kiểm tra GPU được nhận diện đúng
- Act: deploy production, monitor 24h

**Genchi Genbutsu:**
- SSH vào pod đang chạy
- `nvidia-smi` xem trạng thái GPU thực tế
- Thay vì chỉ tin báo cáo cloud metrics

---

## Ưu / Nhược điểm

| Ưu điểm | Nhược điểm |
|---------|-----------|
| Đơn giản, dễ hiểu | Dễ dừng quá sớm (chưa đủ 5 lần) |
| Thúc đẩy đào sâu, tránh sửa triệu chứng | Dễ lạc vào phân tích quá hẹp |
| PDCA tạo cải tiến bền vững | Cồng kềnh với lỗi nhỏ đơn giản |
| Genchi tránh dự đoán nhầm | Cloud/distributed khó "xuống hiện trường" |

---

## Liên kết
- [[wiki/concepts/Kaizen-Methodology]] — Nền tảng triết học Kaizen
- [[wiki/sources/INS-FishBone-Analysis]] — FishBone 4M + 5 Whys thực tế HRM BH
- [[wiki/sources/INS-TruyNguyenNhan]] — RCA 4M Kaizen thực tế HRM
- [[wiki/sources/INS-Troubleshooting-5Why]] — 5-Why RCA: Tên CV, Số Tiền BH, C70A
- `03-DaVinci-QuanSatHeThong.md` — Kết hợp mô hình hóa trước khi hỏi 5 Whys
