---
type: concept
tags:
  - root-cause-analysis
  - 4M
  - quality-management
  - troubleshooting
  - HRM
  - INS
  - nhật-bản
  - ishikawa
date-updated: 2026-04-26
related:
  - "[[wiki/concepts/HRM-modules]]"
  - "[[wiki/projects/INS]]"
aliases:
  - Truy Nguyên Nhân
  - 4M Analysis
  - Root Cause Analysis Nhật Bản
---

# Phương Pháp Truy Nguyên Nhân (Nhật Bản) — 4M Analysis

> **Mục đích**: Khi lỗi xảy ra trong hệ thống HRM/INS, tài liệu này là **kim chỉ nam** để truy nguyên nhân gốc rễ theo phương pháp Nhật Bản — dựa vào bộ phận liên quan ảnh hưởng đến lỗi, loại trục trặc, quy trình định vị lỗi và khung 4M.

![[Pasted image 20260426183020.png]]

---

## 1. Nền Tảng Lý Thuyết

### 1.1 Nguồn Gốc
Phương pháp **4M Root Cause Analysis** (Phân tích nguyên nhân gốc rễ 4M) xuất phát từ **Toyota Production System (TPS)** và triết lý **Kaizen** của Nhật Bản. Công cụ trực quan hóa đi kèm là **Biểu đồ Xương Cá (Fishbone / Ishikawa Diagram)** do **Tiến sĩ Kaoru Ishikawa** phát triển thập niên 1960.

### 1.2 Khung 4M

| Chữ M | Tiếng Anh | Tiếng Việt | Ví dụ lỗi trong HRM/INS |
|-------|-----------|------------|--------------------------|
| **M1** | **Man** | Con người | Nhập liệu sai, thiếu kỹ năng vận hành, cấu hình nhầm |
| **M2** | **Machine** | Máy móc / Hệ thống | Server lỗi, timeout, bug code, database crash |
| **M3** | **Material** | Dữ liệu / Nguyên liệu đầu vào | Dữ liệu master sai, file import lỗi, thiếu tham số |
| **M4** | **Method** | Phương pháp / Quy trình | Quy trình nghiệp vụ sai, SOP lỗi thời, thiếu bước kiểm tra |

> **Mở rộng**: Một số tổ chức dùng **5M** (thêm Measurement — Đo lường) hoặc **6M** (thêm Environment — Môi trường/Hạ tầng).

---

## 2. Biểu Đồ Xương Cá (Fishbone Diagram)

```
           Man                 Machine
         (Con người)          (Hệ thống)
            \                   /
             \                 /
              \               /
               ──────────────────────→ [LỖI / VẤN ĐỀ]
              /               \
             /                 \
            /                   \
        Material              Method
      (Dữ liệu đầu vào)     (Quy trình)
```

---

## 3. Quy Trình Truy Nguyên Nhân (Step-by-Step)

```mermaid
flowchart TD
    A([🚨 LỖI XẢY RA]) --> B[Bước 1: Mô tả rõ ràng vấn đề\nAi - Cái gì - Khi nào - Ở đâu - Bao nhiêu lần]
    
    B --> C[Bước 2: Xác định bộ phận\nliên quan ảnh hưởng đến lỗi]
    
    C --> D{Phân loại\nloại trục trặc}
    
    D --> D1[📋 Lỗi quy trình\nMethod]
    D --> D2[👤 Lỗi con người\nMan]
    D --> D3[⚙️ Lỗi hệ thống\nMachine]
    D --> D4[🗄️ Lỗi dữ liệu\nMaterial]
    
    D1 & D2 & D3 & D4 --> E[Bước 3: Vẽ Fishbone Diagram\nLiệt kê nguyên nhân theo 4M]
    
    E --> F[Bước 4: Áp dụng 5 Whys\nHỏi Tại sao? 5 lần liên tiếp]
    
    F --> G{Đã tìm ra\ngốc rễ?}
    
    G -->|Chưa| F
    G -->|Rồi| H[Bước 5: Xác nhận\nRoot Cause]
    
    H --> I[Bước 6: Đưa ra CAPA\nHành động khắc phục & phòng ngừa]
    
    I --> J[Bước 7: Xác minh &\nChuẩn hóa quy trình]
    
    J --> K([✅ ĐÃ GIẢI QUYẾT])
    
    style A fill:#ff4444,color:#fff
    style K fill:#44bb44,color:#fff
    style H fill:#ffaa00,color:#fff
```

---

## 4. Phân Tích 4M Chi Tiết Cho HRM/INS

### 4.1 M1 — Man (Con Người)

**Câu hỏi kiểm tra:**
- [ ] Người dùng có được đào tạo đúng nghiệp vụ không?
- [ ] Có phải thao tác nhập liệu sai không?
- [ ] Cấu hình hệ thống có được thực hiện đúng người có quyền không?
- [ ] Có sự thay đổi nhân sự phụ trách gần đây không?
- [ ] Có thao tác nào được thực hiện vội vàng/thiếu kiểm tra không?

**Ví dụ lỗi INS:**
- Nhân viên HR nhập sai mức lương làm căn cứ BHXH
- Cấu hình mức đóng BHYT bị sai do người mới chưa quen hệ thống
- Quên cập nhật thay đổi mức đóng khi có quyết định điều chỉnh

### 4.2 M2 — Machine (Hệ Thống / Máy Móc)

**Câu hỏi kiểm tra:**
- [ ] Server/database có vấn đề không?
- [ ] Có lỗi code/bug trong module INS không?
- [ ] Có timeout hay performance issue không?
- [ ] Phiên bản phần mềm có được cập nhật mới nhất không?
- [ ] Có conflict giữa các module không (Lương ↔ BHXH)?

**Ví dụ lỗi INS:**
- Bug tính sai BHXH khi có kỳ lương lẻ tháng
- Lỗi round số khi tính BHYT phần trăm
- Module INS không đồng bộ được với Payroll sau khi chạy lương

### 4.3 M3 — Material (Dữ Liệu Đầu Vào)

**Câu hỏi kiểm tra:**
- [ ] Dữ liệu master (danh mục BHXH, mức lương tối thiểu) có đúng không?
- [ ] File import/excel mẫu có đúng format không?
- [ ] Thông tin nhân viên (loại hợp đồng, mức lương, phụ cấp) có đầy đủ không?
- [ ] Tham số hệ thống (tỷ lệ đóng BHXH/BHYT/BHTN) có được cập nhật không?
- [ ] Dữ liệu từ module khác truyền sang có chính xác không?

**Ví dụ lỗi INS:**
- Quên cập nhật mức lương tối thiểu vùng trong hệ thống
- Tỷ lệ đóng BHXH năm mới chưa được cấu hình
- Nhân viên có hợp đồng đặc biệt (thời vụ, CTV) không được map đúng loại đóng BH

### 4.4 M4 — Method (Phương Pháp / Quy Trình)

**Câu hỏi kiểm tra:**
- [ ] Quy trình xử lý nghiệp vụ INS có đúng không?
- [ ] Thứ tự thực hiện các bước có đúng không?
- [ ] Có bước kiểm tra trung gian không?
- [ ] SOP/hướng dẫn có được cập nhật theo quy định mới không?
- [ ] Quy trình phê duyệt có đủ cấp ký không?

**Ví dụ lỗi INS:**
- Chạy INS trước khi chốt bảng lương → số liệu sai
- Không chạy phân bổ chi phí BH theo đúng thứ tự
- Thiếu bước xác nhận cuối tháng trước khi xuất hồ sơ nộp cơ quan

---

## 5. Kỹ Thuật 5 Whys — Đào Sâu Nguyên Nhân

**Ví dụ thực tế (Lỗi INS):**

```
🚨 Vấn đề: Số liệu BHXH trên hệ thống sai so với sổ BHXH

❓ Tại sao số liệu sai?
→ Vì mức lương làm căn cứ đóng BHXH bị tính thiếu

❓ Tại sao mức lương bị tính thiếu?
→ Vì phụ cấp chức vụ không được đưa vào căn cứ đóng

❓ Tại sao phụ cấp không được đưa vào?
→ Vì cấu hình mapping loại phụ cấp → BHXH chưa được thiết lập

❓ Tại sao chưa được thiết lập?
→ Vì khi triển khai ban đầu, nghiệp vụ BHXH chưa được confirm rõ

❓ Tại sao chưa confirm?
→ Vì không có checklist nghiệm thu riêng cho module INS ✅ ROOT CAUSE
```

**→ Hành động khắc phục:** Tạo checklist nghiệm thu chi tiết cho module INS, bao gồm kiểm tra mapping từng loại phụ cấp vào căn cứ đóng BHXH.

---

## 6. Ma Trận CAPA (Corrective & Preventive Action)

| Nguyên nhân gốc rễ | Hành động khắc phục (CA) | Hành động phòng ngừa (PA) | Người chịu trách nhiệm | Deadline |
|---|---|---|---|---|
| Mapping phụ cấp → BHXH thiếu | Fix cấu hình, re-run INS | Checklist nghiệm thu INS module | BA/Dev | Ngay lập tức |
| Tỷ lệ BHXH chưa cập nhật | Cập nhật parameter | Lịch nhắc nhở đầu năm/kỳ | HR Admin | Đầu năm |
| Bug tính sai kỳ lẻ tháng | Hotfix code | Unit test bổ sung | Dev | Sprint tiếp theo |
| Quy trình chưa rõ ràng | Cập nhật SOP | Đào tạo lại HR | PM/BA | 2 tuần |

---

## 7. Flowchart Định Vị Lỗi INS Theo Bộ Phận

```mermaid
flowchart LR
    subgraph INPUT ["📥 ĐẦU VÀO (Material)"]
        I1[Cấu hình tham số\nBHXH/BHYT/BHTN]
        I2[Dữ liệu nhân viên\n& hợp đồng]
        I3[Bảng lương\n& phụ cấp]
    end
    
    subgraph PROCESS ["⚙️ XỬ LÝ (Machine + Method)"]
        P1[Module INS\nTính toán BH]
        P2[Mapping lương\n→ căn cứ đóng]
        P3[Tính số tiền\nđóng các quỹ]
        P4[Xuất hồ sơ\nnộp cơ quan]
    end
    
    subgraph HUMAN ["👤 CON NGƯỜI (Man)"]
        H1[HR Admin\nCấu hình & vận hành]
        H2[Kế toán\nKiểm tra số liệu]
        H3[BA/Dev\nHỗ trợ kỹ thuật]
    end
    
    subgraph OUTPUT ["📤 ĐẦU RA"]
        O1[Hồ sơ BHXH\nchính xác]
        O2[Danh sách\nkê khai BH]
    end
    
    INPUT --> PROCESS
    HUMAN --> PROCESS
    PROCESS --> OUTPUT
    
    style INPUT fill:#ddeeff
    style PROCESS fill:#fff3cd
    style HUMAN fill:#d4edda
    style OUTPUT fill:#f8d7da
```

---

## 8. Checklist Truy Nguyên Nhân Nhanh (Khi Lỗi Xảy Ra)

### Bước 1 — Thu thập thông tin (5 phút)
- [ ] Lỗi gì? (mô tả cụ thể)
- [ ] Lần đầu hay lặp lại?
- [ ] Bao nhiêu nhân viên/bản ghi bị ảnh hưởng?
- [ ] Xảy ra sau thay đổi gì? (cập nhật hệ thống, thay đổi dữ liệu, thay đổi quy trình?)

### Bước 2 — Kiểm tra nhanh 4M (15 phút)
- [ ] **Man**: Ai thực hiện? Đúng quy trình chưa?
- [ ] **Machine**: Hệ thống có lỗi kỹ thuật không? Log lỗi là gì?
- [ ] **Material**: Dữ liệu đầu vào có đúng không? Tham số cấu hình?
- [ ] **Method**: Thứ tự thực hiện có đúng không?

### Bước 3 — Xác định hypothesis (10 phút)
- [ ] Chỉ ra 1-3 nguyên nhân có khả năng cao nhất
- [ ] Xếp thứ tự ưu tiên theo xác suất

### Bước 4 — Kiểm chứng (30 phút)
- [ ] Test từng hypothesis
- [ ] Reproduce lỗi để xác nhận

### Bước 5 — Fix & Document
- [ ] Giải quyết nguyên nhân gốc rễ
- [ ] Ghi lại vào ticket/log
- [ ] Cập nhật SOP nếu cần

---

## 9. Phân Loại Lỗi Theo Mức Độ Ưu Tiên (Priority Matrix)

```mermaid
quadrantChart
    title Ma Trận Ưu Tiên Xử Lý Lỗi
    x-axis Tần suất thấp --> Tần suất cao
    y-axis Ảnh hưởng nhỏ --> Ảnh hưởng lớn
    quadrant-1 Ưu tiên cao nhất - Xử lý ngay
    quadrant-2 Quan trọng - Lên kế hoạch
    quadrant-3 Theo dõi - Xử lý khi có thời gian
    quadrant-4 Giảm thiểu - Tự động hóa
    Lỗi số BHXH sai: [0.8, 0.9]
    Lỗi xuất file kê khai: [0.6, 0.8]
    Lỗi hiển thị UI: [0.4, 0.2]
    Chậm load report: [0.7, 0.3]
    Lỗi mapping phụ cấp: [0.5, 0.85]
```

---

## 10. Bài Học & Lưu Ý Quan Trọng

> **Nguyên tắc vàng**: Đừng xử lý triệu chứng — hãy tìm **nguyên nhân gốc rễ**. Một lỗi được fix đúng cách không bao giờ tái phát.

### Các Sai Lầm Thường Gặp Khi Truy Nguyên Nhân
1. **Dừng lại quá sớm** — tìm được nguyên nhân đầu tiên đã cho là xong
2. **Blame game** — đổ lỗi cho con người thay vì tìm lỗi hệ thống/quy trình
3. **Không reproduce được** — fix mà không hiểu rõ cơ chế lỗi
4. **Không document** — lỗi tương tự sẽ tái phát sau vài tháng
5. **Không phòng ngừa** — chỉ khắc phục mà không ngăn chặn tái phát

### Nguyên Tắc Nhật Bản Cần Nhớ
- **Genchi Genbutsu (現地現物)**: Đến tận nơi xảy ra lỗi, xem trực tiếp
- **5 Whys (なぜなぜ分析)**: Hỏi tại sao ít nhất 5 lần
- **Kaizen (改善)**: Mỗi lần fix là cơ hội cải tiến quy trình
- **Poka-Yoke (ポカヨケ)**: Thiết kế để không thể mắc lỗi đó lần nữa

---

## 11. Tham Chiếu & Liên Kết

- **Áp dụng cho**: Module INS (Bảo hiểm xã hội, Y tế, Thất nghiệp) trong hệ thống HRM
- **Kết hợp với**: PDCA Cycle, A3 Report, 8D Problem Solving
- **Tiêu chuẩn liên quan**: ISO 9001, IATF 16949, Toyota Production System

---

*Ghi chú được tạo từ hình ảnh phương pháp Truy Nguyên Nhân của Nhật Bản (4M Analysis) — 2026-04-26*
