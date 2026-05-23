---
description: "Spreading Activation Theory: kích hoạt lan truyền kiến thức qua mạng wiki, tìm pattern bug tương tự và kết nối liên ngành — 35 câu hỏi theo 7 nhóm."
type: source
code: s11st
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "SAT"
  - "spreading-activation"
  - "knowledge-network"
  - "creativity"
  - "zettelkasten"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/11-SAT-LanTruyenKichHoat.md
related:
  - "[[wiki/concepts/PhuongPhapLuan-Debug]]"
  - "[[wiki/concepts/PKM-Methods]]"
  - "[[wiki/sources/PhuongPhapLuan-Debug]]"
---

# Lan truyền kích hoạt — Spreading Activation Theory (SAT)

## Tóm tắt

SAT xuất phát từ khoa học nhận thức: khi một nút kiến thức được kích hoạt, nó **lan truyền năng lượng** sang các nút liên quan trong mạng lưới. Ứng dụng: khi đọc tài liệu hoặc gặp bug — để ý tưởng lan sang wiki để tìm pattern tương tự, kết nối liên ngành, sinh ghi chú mới. SAT là **lý thuyết nhận thức đằng sau Zettelkasten**. Tài liệu gồm 35 câu hỏi theo 7 nhóm.

## Key Takeaways

- **Cơ chế**: Kích hoạt 1 nút → lan truyền sang nút liên quan → phát hiện kết nối bất ngờ
- **35 câu hỏi** theo 7 nhóm: Gợi liên tưởng → Khơi gợi ghi chú mới → Kết nối liên ngành → Graph thinking → Sáng tạo tổ hợp → Câu hỏi mở → Hướng dài hạn
- **SAT + Zettelkasten**: Zettelkasten = mạng nút ghi chú nguyên tử; SAT = cơ chế kích hoạt lan truyền khi tìm kiếm trong mạng đó
- **Khi dùng**: Tìm pattern bug tương tự trong lịch sử, mở rộng wiki, tìm kết nối liên ngành bất ngờ
- **Giới hạn**: Dễ "lạc trôi" nếu không có mục tiêu rõ; cần wiki đủ lớn để có nhiều nút kích hoạt

## Trích dẫn quan trọng

> Khi đọc một tài liệu — thay vì dừng lại ở đó, hãy để ý tưởng **lan truyền** sang các nút kiến thức liên quan trong wiki.

## Ứng dụng debug nhanh

```
Bug hiện tại
  → Kích hoạt → Bug tương tự đã gặp?
  → Kích hoạt → Module nào có cùng behavior?
  → Kích hoạt → Deploy nào gần đây liên quan?
  → Kích hoạt → Pattern trong nhật ký hệ thống?
```

**3 câu hỏi SAT khi debug:**
1. "Bug này gợi tôi nhớ bug nào trước đây?"
2. "Pattern này giống lỗi nào trong domain khác (BH, lương, chấm công)?"
3. "Nếu tag bug này, tag nào phù hợp? Tìm wiki theo tag đó?"

## Mối quan hệ với Zettelkasten

| Yếu tố | Zettelkasten | SAT |
|--------|-------------|-----|
| Vai trò | Mạng lưới nút ghi chú nguyên tử | Cơ chế kích hoạt lan truyền |
| Hoạt động | Lưu trữ + liên kết | Tìm kiếm + mở rộng |
| Kết quả | Mạng tri thức bền vững | Insight bất ngờ từ kết nối |

## Liên kết

- [[wiki/concepts/PhuongPhapLuan-Debug]] — Hệ 9 phương pháp tổng hợp
- [[wiki/concepts/PKM-Methods]] — Zettelkasten, Second Brain, PARA
- [[wiki/sources/PhuongPhapLuan-Debug]] — 6 phương pháp core
- [[wiki/sources/Nhat-ky-van-de-he-thong]] — Nhật ký lỗi hệ thống (nút SAT kích hoạt khi debug)
- [[wiki/sources/Nhat-ky-van-de-nghiep-vu]] — Nhật ký lỗi nghiệp vụ (nút SAT kích hoạt khi debug)
