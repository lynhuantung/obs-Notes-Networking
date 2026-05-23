---
name: 11-wiki-atlas-rebuild
description: Rebuild obsidian_atlas.json bằng cách quét toàn bộ vault .md, rồi reload MCP atlas.
version: "1.0.0"
triggers:
  - "/11-wiki-atlas-rebuild"
  - "rebuild atlas"
  - "regenerate atlas"
  - "atlas lỗi"
  - "atlas cũ"
---

# 11-wiki-atlas-rebuild

> Quét toàn bộ vault → rebuild `obsidian_atlas.json` → reload MCP atlas

---

## 🚀 CÁCH SỬ DỤNG

```
/wiki-atlas-rebuild
/wiki-atlas-rebuild --vault <path> --output <path>
```

Mặc định (không cần tham số):
- **vault**: `C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base`
- **output**: `C:\Code\HRM-AGENT-AI\Tools\obsidian_atlas.json`

---

## 🛠️ QUY TRÌNH THỰC THI

1. **Chạy rebuild script**:
   ```powershell
   node ~/.claude/skills/11-wiki-atlas-rebuild/rebuild.js
   ```
   Hoặc với custom path:
   ```powershell
   node ~/.claude/skills/11-wiki-atlas-rebuild/rebuild.js --vault "D:\my-vault" --output "D:\atlas.json"
   ```

2. **Reload MCP atlas** (bắt buộc sau khi rebuild):
   - Gọi `wiki_atlas_reload` MCP tool để load file JSON mới vào memory

3. **Báo cáo kết quả**:
   - Tổng số nodes
   - Nodes có links vs orphans
   - Xác nhận reload thành công

---

## 📌 GHI CHÚ

- Script **không xóa** atlas cũ — ghi đè trực tiếp
- Nếu vault path có dấu cách → dùng dấu ngoặc kép
- Chạy lại bất cứ khi nào thêm/xóa/đổi tên file wiki
