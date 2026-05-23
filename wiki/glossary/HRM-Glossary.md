---
description: "Từ điển thuật ngữ HRM: giải thích viết tắt, khái niệm BHXH, phân hệ, và thuật ngữ kỹ thuật dùng trong hệ thống wiki nội bộ HRM."
type: glossary
tags:
  - glossary
  - terminology
  - hrm
  - bao-hiem
  - viet-tat
  - llm-wiki
date-updated: 2026-05-10
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
---

# HRM Glossary — Từ Điển Thuật Ngữ & Viết Tắt

> Tra cứu nhanh mọi từ viết tắt và thuật ngữ domain trong hệ sinh thái HRM.  
> Sắp xếp theo nhóm chủ đề.

---

## Bảo hiểm (Insurance)

| Từ viết tắt | Từ đầy đủ | Giải thích |
|------------|-----------|-----------|
| **BHXH** | Bảo Hiểm Xã Hội | Social Insurance — bắt buộc, NLĐ đóng 8%, NSDLĐ 17.5% |
| **BHYT** | Bảo Hiểm Y Tế | Health Insurance — NLĐ 1.5%, NSDLĐ 3% |
| **BHTN** | Bảo Hiểm Thất Nghiệp | Unemployment Insurance — NLĐ 1%, NSDLĐ 1% |
| **BH** | Bảo Hiểm | Chỉ chung BHXH+BHYT+BHTN |
| **NLĐ** | Người Lao Động | Employee — người làm công ăn lương |
| **NSDLĐ** | Người Sử Dụng Lao Động | Employer — doanh nghiệp, đơn vị |
| **iBHXH** | — | Cổng khai báo BHXH điện tử của BHXH Việt Nam (baohiemxahoi.gov.vn) |
| **D02-TS** | Mẫu D02-TS | Biểu mẫu đăng ký tham gia / điều chỉnh BH — nộp hàng tháng |
| **D03a** | Mẫu D03a | Biểu mẫu hưởng BH: ốm đau, thai sản, tai nạn LĐ |
| **C70** | Bảng tổng hợp C70 | Bảng lương BH tháng: NLĐ + NSDLĐ → đối soát D02 |
| **TS24** | — | Phần mềm kê khai BHXH điện tử (Viettel) — một trong 3 lựa chọn bên cạnh VNPT và iBHXH trực tiếp |

### Nghiệp vụ phân tích BH — các case nghỉ việc

**nghỉ việc trong kỳ BH** — NV có `DateQuit` nằm trong chu kỳ tháng N (beginMonth → endMonth). Hệ thống dùng `isCheck14dayProfileQuitNextMonth` để quyết định báo nghỉ việc tháng N hay N+1.

| Case | Điều kiện | Kết quả |
|------|-----------|--------|
| Config OFF | DateQuit trong tháng N | 1 dòng: `IsQuit=true` tháng N — bất kể số ngày nghỉ |
| Config ON + nghỉ ≥14 ngày | Số ngày nghỉ trong chu kỳ ≥ 14 | 1 dòng: `IsQuit=true` tháng N |
| Config ON + nghỉ <14 ngày | Số ngày nghỉ trong chu kỳ < 14 | 2 dòng: tháng N đóng BH bình thường + tháng N+1 `IsQuit=true` |

> ⚠️ **Pitfall: thiếu WorkPeriodFormula trong chế độ công**
> `InsuranceServices` gọi `CalculateNumberOfDayByFormula` lấy công thức từ `Cat_GradeAttendance.WorkPeriodFormula`.
> Nếu chế độ công **chưa cấu hình công thức** (ví dụ `[D]-[SUN]-[SAT]`) → hàm trả về 0 → 0 < 14 → config ON kích hoạt 2 dòng → báo T+1.
> **Fix: cấu hình WorkPeriodFormula trong chế độ công. Đây là lỗi config, không phải bug code.**

---

## Nhân sự & Lương (HR & Payroll)

| Từ viết tắt | Từ đầy đủ | Giải thích |
|------------|-----------|-----------|
| **HRM** | Human Resource Management | Phần mềm quản lý nhân sự — ở đây chỉ HRM |
| **HRM** | — | Tên sản phẩm HRM của VnResource / FIT Solutions |
| **KPI** | Key Performance Indicator | Chỉ số đo lường hiệu suất — dùng trong phân hệ Đánh giá |
| **OT** | Overtime | Làm thêm giờ ngoài giờ hành chính |
| **TNCN** | Thu Nhập Cá Nhân | Thuế Thu Nhập Cá Nhân (PIT — Personal Income Tax) |
| **Gross** | — | Lương trước khi trừ BH, thuế (lương trên hợp đồng) |
| **Net** | — | Lương thực nhận sau khi trừ tất cả |
| **PGD** | Phòng/Ban giao dịch | Đơn vị tổ chức cấp phòng ban |

---

## Dự án & Triển khai (Project)

| Từ viết tắt | Từ đầy đủ | Giải thích |
|------------|-----------|-----------|
| **SE** | Software Engineer | Kỹ sư phần mềm — phía VnResource triển khai |
| **BA** | Business Analyst | Phân tích nghiệp vụ — xác định yêu cầu |
| **QC** | Quality Control | Kiểm soát chất lượng — kiểm thử |
| **PM** | Project Manager | Quản lý dự án — phía VnResource hoặc KH |
| **KH** | Khách hàng | Customer — doanh nghiệp đang triển khai HRM |
| **UAT** | User Acceptance Testing | Kiểm thử nghiệm thu — khách hàng tự test |
| **Go-live** | — | Thời điểm hệ thống đưa vào sử dụng chính thức |
| **Hypercare** | — | Giai đoạn hỗ trợ chuyên sâu sau go-live (2–4 tuần) |
| **GAP** | GAP Analysis | Phân tích khoảng cách giữa yêu cầu KH và tính năng HRM |
| **BLĐ** | Ban Lãnh Đạo | Ban Giám đốc / Hội đồng quản trị phía KH |

---

## Giai đoạn triển khai (Phases)

| Phase | Tên | Nội dung chính |
|-------|-----|---------------|
| Phase 1 | Phân tích & Thiết kế | Kick-off, GAP analysis, xác nhận yêu cầu |
| Phase 2 | Phát triển & Cấu hình | Coding custom, cấu hình hệ thống, import data |
| Phase 3 | Đào tạo | Training key user và end user |
| Phase 4 | UAT | Khách hàng test, fix lỗi, re-test |
| Phase 5 | Go-live | Cutover, go-live, hypercare |

Xem chi tiết: [[wiki/concepts/Project-Phases]]

---

## Kỹ thuật HRM (Technical)

| Thuật ngữ | Giải thích |
|-----------|-----------|
| **CLR** | Common Language Runtime — cho phép chạy .NET code trong SQL Server |
| **VnrDecrypt** | Hàm CLR mã hóa/giải mã mật khẩu (SHA2-512) của VnResource |
| **IIS** | Internet Information Services — web server Windows |
| **App Pool** | Application Pool — môi trường chạy isolated cho từng site IIS |
| **IIS_IUSRS** | Group Windows dùng cho IIS worker process — cần phân quyền thư mục |
| **MAXDOP** | Max Degree of Parallelism — số CPU cores SQL Server dùng song song |
| **TRUSTWORTHY** | SQL Server DB property — cần ON để load CLR UNSAFE assembly |
| **Warmup** | Quá trình "khởi động" service sau restart — load cache, compile JIT |
| **Redis** | In-memory cache database — HRM dùng để cache quyền, warmup status |
| **Kubernetes (K8s)** | Hệ thống orchestration container — VnPay dùng |
| **Traefik** | Reverse proxy / load balancer — routing trong K8s của VnPay |
| **IDS4** | IdentityServer4 — framework OAuth2/OpenID Connect, SSO |
| **JWT** | JSON Web Token — format token xác thực stateless |
| **SSO** | Single Sign-On — đăng nhập 1 lần, dùng được nhiều hệ thống |
| **CORS** | Cross-Origin Resource Sharing — cơ chế bảo mật trình duyệt |
| **AllowOrigin** | Config key trong HRM — cho phép CORS từ domain cụ thể |
| **ConnectString** | Config key — chuỗi kết nối SQL Server |
| **Hrm_APICenter_Web** | Config key — URL API Center, cần để refresh permission cache |

---

## Tên Hệ thống & Sản phẩm

| Tên | Giải thích |
|-----|-----------|
| **HRM** | Sản phẩm HRM của công ty (VnResource / FIT Solutions) |
| **VnResource** | Tên công ty phát triển / triển khai HRM |
| **MISA** | Phần mềm kế toán — tích hợp với HRM để xuất dữ liệu lương, BH |
| **iBHXH** | Cổng khai báo BHXH điện tử Nhà nước |
| **TS24 / VNPT** | Phần mềm kê khai BHXH thứ 3 (trung gian giữa HRM và iBHXH) |
| **Active Directory (AD)** | Hệ thống quản lý tài khoản Windows — KH lớn thường có |
| **AWS S3** | Amazon Simple Storage Service — HRM dùng lưu artifacts deploy |
| **Event Viewer** | Tool Windows xem logs hệ thống và ứng dụng |
| **SSMS** | SQL Server Management Studio — tool quản lý SQL Server |
| **Log Request** | Tính năng HRM ghi log request HTTP — dùng để debug |

---

## Mã lỗi & Trạng thái

| Mã | Nơi xuất hiện | Ý nghĩa |
|----|--------------|---------|
| **500** | HTTP | Internal Server Error — lỗi code phía server |
| **403** | HTTP | Forbidden — không có quyền truy cập |
| **403.14** | IIS | Directory listing bị tắt + không có default document |
| **404** | HTTP | Not Found — URL không tồn tại |
| **405** | HTTP | Method Not Allowed — sai HTTP method (GET vs POST) |
| **OutOfMemory** | IIS | App Pool hết memory → recycle pool |

---

## Chấm Công — ATT (Attendance)

| Thuật ngữ | Viết tắt / Field | Giải thích |
|-----------|-----------------|------------|
| **Chế độ công** | GradeCfg | Bộ quy tắc tính công áp dụng cho nhóm NV: loại giờ làm, OT, nghỉ phép, BH. Lưu tại bảng `Cat_GradeCfg`. |
| **Ca làm việc** | Shift / Cat_Shift | Khung giờ vào/ra xác định giờ chuẩn. Ví dụ: HC 08:00–17:00, Ca1 06:00–14:00, Ca2 14:00–22:00. |
| **Bảng công** | Att_AttendanceTable | Bảng tổng hợp công theo tháng của từng nhân viên (ngày công, OT, phép, đi trễ…). |
| **Bảng công chi tiết** | Att_AttendanceTableItem | Chi tiết chấm công từng ngày: giờ in/out, loại nghỉ, OT, đi trễ/về sớm. |
| **Công chuẩn** | StdWorkDayCount | Số ngày làm việc chuẩn của kỳ lương — mốc đối chiếu để tính lương, thiếu công, phụ cấp chuyên cần. |
| **Công cộng** | — | Phần công được cộng vào tổng: ngày đi làm thực tế + nghỉ hưởng lương (phép, lễ, cưới…). |
| **Công trừ** | — | Phần làm giảm công: đi trễ/về sớm, nghỉ không lương, vi phạm. |
| **Đi trễ / Về sớm** | LateIn / EarlyOut | Vi phạm giờ làm. Hệ thống ghi nhận phút trễ/sớm, có thể trừ công hoặc ghi nhận KPI. |
| **Nghỉ bù** | Compensatory Off | Ngày nghỉ phát sinh từ các ngày OT không nhận tiền, chuyển thành ngày nghỉ. Hệ số do công ty quy định. |
| **Phép năm** | Annual Leave / Att_AnnualLeave | Số ngày phép năm của NV. Lưu tại `Att_AnnualLeave` (tổng hợp năm) và `Att_AnnualDetail` (chi tiết tháng). |
| **Kỳ lương / Kỳ công** | CutOffDuration | Khoảng thời gian tính công (tháng, nửa tháng…). Tham chiếu `Att_CutOffDuration`. |
| **Quên chấm công** | MissInOut | Trường hợp NV không chấm công đúng giờ; có thể đăng ký điều chỉnh qua portal. Field: `CountMissInOut`. |
| **Chấm công GPS/Wifi** | — | Phương thức chấm công trên mobile dùng vị trí GPS hoặc mạng Wifi nội bộ. API: `Att_GetData/New_SaveTamScanLog`. |
| **Ca đêm** | NightShift | Giờ làm ban đêm (22:00–06:00). Tính thêm phụ cấp ca đêm. Field: `NightShiftHours`. |
| **Tính công** | — | Quy trình 8 bước tổng hợp chấm công → sinh bảng công → chuyển tính lương. |
| **Đồng bộ chấm công** | — | Bước 1 trong quy trình tính công: lấy dữ liệu từ máy chấm công về hệ thống. |
| **Khóa công** | — | Bước 7 — HR khóa bảng công sau phê duyệt, chuẩn bị chuyển dữ liệu sang tính lương. |
| **Công hành chính** | HC | Chế độ làm việc 8h/ngày, thứ 2–6. Ca HC: 08:00–17:00. |
| **Công ca kíp** | — | Chế độ làm việc theo ca luân phiên (ca 1, ca 2, ca đêm). |
| **Phụ cấp chuyên cần** | — | Khoản thưởng/phụ cấp dựa trên số ngày đi làm đủ công. Bị ảnh hưởng nếu thiếu công. |

### Hệ số tăng ca (OT Rates)

| Loại OT | Hệ số | Ghi chú |
|---------|-------|--------|
| Ngày thường | 150% | OT ban ngày, ngày làm việc thường |
| Ngày nghỉ (chủ nhật) | 200% | |
| Ngày lễ | 300% + 100% | 300% lương + 100% ngày lễ |
| Đêm – ngày thường | 210% | |
| Đêm – ngày nghỉ | 270% | |
| Đêm – ngày lễ | 390% + 100% | |

### Bảng DB phân hệ ATT

| Bảng | Mô tả |
|------|-------|
| `Cat_GradeCfg` | Chế độ công / bậc lương — cấu hình cách tính OT, nghỉ phép, BH cho từng nhóm |
| `Cat_Shift` | Ca làm việc — khung giờ chuẩn |
| `Cat_OvertimeType` | Loại OT — hệ số và loại tăng ca |
| `Cat_LeaveDayType` | Loại nghỉ — phép năm, nghỉ lễ, nghỉ bệnh… |
| `Att_AnnualLeave` | Phép năm tổng hợp theo năm của NV |
| `Att_AnnualDetail` | Chi tiết phép năm theo tháng |
| `Att_AttendanceTable` | Bảng công tổng hợp tháng |
| `Att_AttendanceTableItem` | Bảng công chi tiết từng ngày |
| `Cat_GradeAttendance` | Bậc chấm công |
| `Att_CutOffDuration` | Kỳ chốt công |

---

## Phân hệ HRM (Modules)

| Phân hệ | Tên tiếng Anh | Viết tắt thường dùng |
|---------|--------------|---------------------|
| Nhân sự | HR Core | HR |
| Lương | Payroll | PAY |
| Bảo hiểm | Insurance | INS |
| Chấm công | Attendance / Timekeeping | ATT |
| Đánh giá | Performance Evaluation | EVA |
| Nhân tài | Talent Management | TAL |
| Tuyển dụng | Recruitment | REC |

Xem chi tiết: [[wiki/concepts/HRM-Modules]]

---

## LLM Wiki — Thuật ngữ hệ thống wiki này

| Thuật ngữ | Giải thích |
|-----------|-----------|
| **Ingest** | Đọc file nguồn trong `raw/` → tóm tắt → tạo/cập nhật các trang wiki liên quan. Một lần ingest có thể chạm 5–15 trang. |
| **Query** | Đặt câu hỏi → LLM đọc `wiki/index.md` → tìm trang liên quan → trả lời có citation `[[wiki/...]]`. |
| **Lint** | Kiểm tra sức khỏe toàn bộ wiki: orphan pages, dead links, mâu thuẫn, thiếu cross-link, nội dung cũ. |
| **Research** | Nghiên cứu chuyên sâu một chủ đề — đọc cả wiki lẫn raw, xuất báo cáo lưu vào `wiki/synthesis/`. |
| **Source** | Trang tóm tắt một file đã ingest — lưu tại `wiki/sources/<tên>.md`. Là "bản ghi nhận" file đã được xử lý. |
| **Synthesis** | Trang phân tích tổng hợp, bài học, so sánh — lưu tại `wiki/synthesis/`. Tạo khi query/research có insight mới. |
| **Orphan page** | Trang wiki không có trang nào khác link đến (không có inbound link). Phát hiện khi lint. |
| **Ghost page** | Trang có trong `wiki/log.md` nhưng không có file trên disk. |
| **Cross-link** | Liên kết Obsidian `[[wiki/path/to/page]]` giữa các trang wiki với nhau. |
| **Frontmatter** | Phần YAML đầu mỗi trang wiki (giữa `---`): `type`, `tags`, `created`, `updated`, `related`. |
| **Raw** | Thư mục `raw/` — tài liệu nguồn gốc, immutable. LLM chỉ đọc, không bao giờ sửa. |
| **Wiki root** | Thư mục `wiki/` — nơi LLM viết và duy trì. |
| **domain** | Trường frontmatter phân loại nội dung: `ins` (Bảo hiểm), `payroll` (Lương), `attendance` (Chấm công), `system` (Kỹ thuật SYS). |
| **Flow** | Trang `wiki/flows/` — mô tả thứ tự bước, ai làm gì, rẽ nhánh điều kiện. Dùng Mermaid `flowchart` hoặc `sequenceDiagram`. |
| **Architecture** | Trang `wiki/architecture/` — mô tả component, kết nối tĩnh, layer hệ thống. Dùng Mermaid `flowchart + subgraph`. |
| **Analyze (GitNexus)** | Lệnh `npx gitnexus analyze` — lập chỉ mục code để GitNexus hiểu cấu trúc codebase. |
| **wiki/index.md** | Trang LUÔN đọc đầu tiên — danh mục toàn bộ wiki, dùng để tìm trang liên quan. |
| **wiki/log.md** | Append-only log — ghi lại mọi hoạt động ingest/query/lint theo thời gian. Không sửa entry cũ. |
| **wiki/overview.md** | Tổng quan domain + trạng thái wiki: số sources, pages, gaps, to-do. |

---

## Liên kết liên quan

- [[wiki/concepts/HRM-Modules]] — Tổng quan 6 phân hệ chính
- [[wiki/architecture/HRM-System-Architecture]] — Kiến trúc 13 services
- [[wiki/concepts/Project-Phases]] — Các giai đoạn triển khai
- [[wiki/concepts/HRM-IIS-Troubleshooting]] — Lỗi IIS và mã lỗi
- [[wiki/concepts/HRM-SQL-Troubleshooting]] — Lỗi SQL Server
