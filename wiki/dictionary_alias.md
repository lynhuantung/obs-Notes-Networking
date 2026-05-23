---
description: "Từ điển alias — gom biến thể về nút chuẩn để thuật toán đồ thị không bị phân mảnh. Mỗi key là từ chuẩn duy nhất, value là danh sách biến thể chấp nhận."
type: overview
date-updated: 2026-05-12
sources-ingested: 131
sources-domain-added: thau-ssi-session
tags:
  - dictionary_alias
  - "#dictionary"
---

# Dictionary Alias — Chuẩn hóa Thực thể Wiki

> Mục tiêu: khi nhập bất kỳ biến thể nào, hệ thống nhận ra đang nói về **thực thể chuẩn** duy nhất.  
> Dùng cho graph traversal, atlas search, và NLP normalization.

---

## JSON Alias Map

```json
{
  "Bảo Hiểm": [
    "BH", "bao hiem", "insurance", "baohiem",
    "BHXH", "BHYT", "BHTN",
    "bảo hiểm xã hội", "bảo hiểm y tế", "bảo hiểm thất nghiệp",
    "social insurance", "health insurance", "unemployment insurance",
    "INS", "phân hệ bảo hiểm"
  ],

  "Lương": [
    "PAY", "payroll", "luong", "tính lương", "tinh luong",
    "lương tháng", "bảng lương", "salary", "wage",
    "phân hệ lương", "SAL"
  ],

  "Nhân Sự": [
    "HR", "HR Core", "nhan su", "nhân viên", "nhan vien",
    "hồ sơ nhân viên", "ho so nhan vien", "human resource",
    "personnel", "phân hệ nhân sự", "HS"
  ],

  "Chấm Công": [
    "ATT", "attendance", "timekeeping", "cham cong",
    "chấm công", "tính công", "tinh cong",
    "ca làm việc", "ca lam viec", "phân hệ chấm công",
    "máy chấm công",
    "portal chấm công", "portal cham cong", 
    "bảng công", "bang cong", "tính công tháng",
    "chế độ công", "che do cong", "GradeCfg", "Cat_GradeCfg",
    "kỳ công", "ky cong", "cut off", "CutOffDuration",
    "đồng bộ chấm công", "khóa công", "sinh bảng công",
    "Att_AttendanceTable", "Att_AttendanceTableItem",
    "công chuẩn", "StdWorkDayCount", "công cộng", "công trừ",
    "đi trễ", "về sớm", "LateIn", "EarlyOut", "MissInOut",
    "quên chấm công", "dang ky quen cham cong",
    "chấm công GPS", "chấm công Wifi", "cham cong gps",
    "New_SaveTamScanLog", "Att_GetData",
    "DutyCode", "Cat_GradeAttendance", "GradeAttendance", "bậc chấm công",
    "RosterType", "IsBaseOnRoster", "AttendanceMethod",
    "công linh hoạt", "cong linh hoat", "công sản xuất", "cong san xuat",
    "công hành chính", "cong hanh chinh", "HC"
  ],

  "Nghỉ Không Lương": [
    "nghỉ không lương", "unpaid leave", "E_14_UNPAID",
    "TotalUnpaidLeaveDay", "không hưởng lương"
  ],

  "Nghỉ Ốm": [
    "nghỉ ốm", "sick leave", "nghỉ bệnh", "E_14_SICK",
    "SickDayTaken", "TotalSickLeaveDay"
  ],

  "Nghỉ Phép": [
    "nghi phep", "nghỉ phép năm", "phép năm", "annual leave",
    "đăng ký nghỉ", "dang ky nghi", "ngày nghỉ", "ngay nghi",
    "leave", "nghỉ luân phiên", "luân phiên", "luan phien",
    "Att_AnnualLeave", "Att_AnnualDetail",
    "phép còn lại", "phep con lai", "AnlDayAvailable", "AnlDayTaken",
    "nghỉ lễ", "holiday", "nghỉ bù", "compensatory off", "CO",
    "nghỉ cưới", "nghỉ đám tang", "nghỉ chế độ",
    "thai sản", "maternity leave",
    "FormulaAnnualLeave", "TotalDayAnnualLeaveOnYear",
    "thâm niên", "tham nien", "Seniority", "SeniorBonus",
    "AnlValueLastYear", "SurplusAnlLastYear", "phép năm ngoái",
    "InitAnlValue", "AnlMonthReset", "phép tháng",
    "portal đăng ký nghỉ", "portal nghi phep"
  ],

  "Loại Nghỉ": [
    "loai nghi", "loại nghỉ phép", "leave type",
    "E_ABILITYTILE_CODE", "ABILITYTILE", "mã loại nghỉ",
    "danh mục nghỉ", "nhóm nghỉ"
  ],

  "Điều Kiện Đăng Ký Nghỉ": [
    "dieu kien dang ky nghi", "điều kiện nghỉ", "condition leave",
    "công thức điều kiện", "cong thuc dieu kien",
    "E_DateStart", "E_DateCreate", "E_LeaveDay",
    "E_COMPANYCODE", "DATEDIF", "formula condition",
    "điều kiện đăng ký", "apply điều kiện"
  ],

  "Đánh Giá": [
    "EVA", "evaluation", "performance", "danh gia",
    "KPI", "đánh giá hiệu suất", "performance evaluation",
    "phân hệ đánh giá", "360", "đánh giá 360"
  ],

  "Nhân Tài": [
    "TAL", "talent", "talent management", "nhan tai",
    "đào tạo năng lực", "competency", "succession planning",
    "career path", "phân hệ nhân tài"
  ],

  "Tuyển Dụng": [
    "REC", "recruitment", "tuyen dung", "tuyển dụng",
    "phân hệ tuyển dụng"
  ],

  "Hệ Thống": [
    "SYS", "system", "he thong", "phân hệ hệ thống",
    "phân quyền", "phan quyen", "permission", "admin"
  ],

  "HRM": [
    "Human Resource Management", "phần mềm HRM",
    "VnResource HRM", "FIT HRM", "hệ thống HRM",
    "hrm system", "phần mềm nhân sự"
  ],

  "VnResource": [
    "VNR", "vnr", "Vn Resource",
    "công ty VnResource"
  ],

  "SQL Server": [
    "DB", "database", "MSSQL", "SQL", "cơ sở dữ liệu",
    "co so du lieu", "kho dữ liệu", "kho du lieu",
    "SSMS", "sql server", "sqlserver"
  ],

  "IIS": [
    "Internet Information Services", "web server", "iis",
    "app pool", "application pool", "IIS Pool"
  ],

  "Kubernetes": [
    "K8s", "k8s", "kubernetes", "container orchestration",
    "cluster", "pod", "deploy K8s", "triển khai K8s"
  ],

  "Redis": [
    "cache", "in-memory cache", "redis cache",
    "Redis Sentinel", "redis sentinel", "cache server"
  ],

  "IdentityServer4": [
    "IDS4", "Identity Server", "identity server 4",
    "oauth", "OAuth2", "OpenID Connect", "OIDC",
    "SSO server", "auth server"
  ],

  "SSO": [
    "Single Sign-On", "single sign on", "sso",
    "đăng nhập một lần", "dang nhap mot lan",
    "JWT SSO", "LDAP SSO", "ADFS SSO"
  ],

  "JWT": [
    "JSON Web Token", "token", "access token",
    "bearer token", "auth token", "jwt token"
  ],

  "LDAP": [
    "Active Directory", "AD", "ldap", "LDAPS",
    "ldaps", "active directory", "windows auth",
    "domain login", "đăng nhập AD"
  ],

  "D02-TS": [
    "D02", "mẫu D02", "D02TS", "d02-ts",
    "biểu mẫu D02", "tờ khai D02",
    "đăng ký tham gia BH", "khai báo BH"
  ],

  "C70": [
    "bảng C70", "c70", "bảng tổng hợp lương BH",
    "bang luong BH", "tổng hợp C70"
  ],

  "iBHXH": [
    "cổng BHXH", "portal BHXH", "ibhxh",
    "baohiemxahoi.gov.vn", "cổng điện tử BHXH",
    "khai báo điện tử BH"
  ],

  "MISA": [
    "misa", "phần mềm kế toán", "ke toan",
    "kế toán", "MISA Accounting", "tích hợp MISA"
  ],

  "UAT": [
    "User Acceptance Testing", "kiểm thử nghiệm thu",
    "test nghiệm thu", "nghiệm thu", "uat",
    "khách hàng test", "sign-off"
  ],

  "Go-live": [
    "golive", "go live", "go-live",
    "đưa vào sử dụng", "launch", "production launch",
    "chính thức vận hành"
  ],

  "Khách Hàng": [
    "KH", "customer", "client", "khach hang",
    "doanh nghiệp", "doanh nghiep", "enterprise"
  ],

  "SE": [
    "Software Engineer", "kỹ sư", "ky su",
    "developer", "dev", "lập trình viên", "lap trinh vien",
    "engineer"
  ],

  "BA": [
    "Business Analyst", "phân tích nghiệp vụ",
    "phan tich nghiep vu", "analyst", "business analyst"
  ],

  "QC": [
    "Quality Control", "kiểm thử", "kiem thu",
    "tester", "QA", "quality assurance", "test"
  ],

  "CLR": [
    "Common Language Runtime", "clr",
    ".NET CLR", "sql clr", "CLR function",
    "VnrDecrypt"
  ],

  "Docker": [
    "docker", "container", "image", "docker image",
    "dockerfile", "docker container", "containerization"
  ],

  "CI/CD": [
    "cicd", "ci_cd", "CI CD", "continuous integration",
    "continuous deployment", "pipeline", "build pipeline",
    "deploy pipeline", "GitLab CI", "github actions"
  ],

  "S3": [
    "AWS S3", "Amazon S3", "object storage",
    "s3 bucket", "cloud storage", "file storage S3"
  ],

  "NLĐ": [
    "Người Lao Động", "employee", "nhân viên",
    "nguoi lao dong", "lao động", "nhan vien",
    "Hre_Profile", "ProfileID", "hồ sơ nhân viên",
    "ho so nhan vien", "profile nhân viên"
  ],

  "NSDLĐ": [
    "Người Sử Dụng Lao Động", "employer", "doanh nghiệp",
    "nguoi su dung lao dong", "công ty", "cong ty"
  ],

  "OT": [
    "overtime", "làm thêm giờ", "lam them gio",
    "tăng ca", "tang ca", "ngoài giờ",
    "hệ số OT", "he so OT",
    "OT ngày thường", "OT cuối tuần", "OT ngày lễ",
    "OT ban đêm", "ca đêm OT",
    "Cat_OvertimeType", "OvertimeType", "OvertimeHours",
    "150%", "200%", "300%", "210%", "270%", "390%",
    "NormalOTTypeID", "WeekendOTTypeID", "HolidayOTTypeID",
    "NightNormalOTTypeID", "NightWeekendOTTypeID", "NightHolidayOTTypeID",
    "nghỉ bù OT", "nghi bu OT", "chuyển OT sang nghỉ bù",
    "IsFixedOT", "IsActualOT", "IsRosterOT", "IsFormulaOT",
    "OTPregnancyHours", "OT thai sản", "OT chồng giờ",
    "đăng ký OT", "dang ky OT", "phê duyệt OT", "portal OT"
  ],

  "TNCN": [
    "Thu Nhập Cá Nhân", "thuế TNCN", "thue TNCN",
    "PIT", "personal income tax", "thuế thu nhập"
  ],

  "Gross": [
    "lương gross", "luong gross", "lương hợp đồng",
    "before tax", "trước thuế", "gross salary"
  ],

  "Net": [
    "lương net", "luong net", "lương thực nhận",
    "take home", "after tax", "sau thuế", "net salary"
  ],

  "VnPay": [
    "vnpay", "VN Pay", "công ty VnPay",
    "khách hàng VnPay", "VNPay project"
  ],

  "Bitex": [
    "bitex", "Bitex-AKW", "AKW", "dự án Bitex",
    "khách hàng Bitex"
  ],

  "QuickPack": [
    "QPVN", "Quick Pack", "quickpack",
    "dự án QuickPack", "khách hàng QuickPack"
  ],

  "LTG": [
    "LTG Group", "ltg", "dự án LTG",
    "khách hàng LTG"
  ],

  "Traefik": [
    "traefik", "reverse proxy", "load balancer",
    "ingress controller", "API gateway"
  ],

  "Nginx": [
    "nginx", "NGINX", "reverse proxy nginx",
    "web server nginx", "nginx proxy", "nginx lb",
    "nginx load balancer", "nginx WAF"
  ],

  "Triển Khai": [
    "triển khai", "trien khai", "deployment", "deploy",
    "cài đặt hệ thống", "install", "installation",
    "go-live", "go live", "golive", "production launch",
    "đưa vào vận hành", "rollout", "release"
  ],

  "Giải Pháp": [
    "giải pháp", "giai phap", "solution", "technical solution",
    "đề xuất giải pháp", "proposal", "giải pháp kỹ thuật",
    "kiến trúc giải pháp", "solution architecture",
    "giải pháp đề xuất", "phương án", "phuong an"
  ],

  "Máy Trạm": [
    "máy trạm", "may tram", "workstation", "client machine",
    "PC người dùng", "máy tính người dùng", "desktop",
    "laptop", "end-user machine", "client PC",
    "máy tính làm việc"
  ],

  "Tích Hợp": [
    "tích hợp", "tich hop", "integration", "integrate",
    "tích hợp hệ thống", "system integration", "ESB integration",
    "API integration", "interface", "liên thông",
    "kết nối hệ thống", "ket noi he thong", "connect"
  ],

  "Hiệu Năng": [
    "hiệu năng", "hieu nang", "performance", "throughput",
    "hiệu suất", "response time", "latency", "độ trễ",
    "thời gian phản hồi", "tps", "TPS", "RPS",
    "concurrent users", "người dùng đồng thời",
    "benchmark", "load test", "stress test"
  ],

  "Khả Năng Mở Rộng": [
    "khả năng mở rộng", "kha nang mo rong", "scalability",
    "scale out", "scale up", "horizontal scaling", "vertical scaling",
    "mở rộng hệ thống", "nâng cấp", "nang cap",
    "expandable", "elastic", "auto scaling"
  ],

  "Mô Hình Mạng": [
    "mô hình mạng", "mo hinh mang", "network model",
    "network architecture", "kiến trúc mạng",
    "network topology", "DMZ", "network zone",
    "vùng mạng", "phân vùng mạng", "network segmentation"
  ],

  "Cân Bằng Tải": [
    "cân bằng tải", "can bang tai", "load balancing", "LB",
    "load balancer", "round robin", "least connection",
    "phân phối tải", "HA proxy", "HAProxy",
    "layer 4 LB", "layer 7 LB", "application LB"
  ],

  "High Availability": [
    "HA", "high availability", "tính sẵn sàng cao",
    "99.9%", "99.99%", "uptime", "SLA uptime",
    "AlwaysOn", "failover", "failback", "redundancy",
    "dự phòng", "du phong", "active passive", "active active",
    "cluster", "clustering", "không gián đoạn"
  ],

  "Disaster Recovery": [
    "DR", "disaster recovery", "phục hồi thảm họa",
    "khôi phục thảm họa", "RTO", "RPO",
    "backup site", "DR site", "secondary site",
    "site dự phòng", "site du phong",
    "business continuity", "BCP", "kế hoạch phục hồi"
  ],

  "Phần Mềm Bên Thứ Ba": [
    "bên thứ ba", "ben thu ba", "third-party", "third party",
    "3rd party", "phần mềm bên thứ 3", "công cụ bên thứ 3",
    "third-party software", "third-party tool",
    "vendor software", "phần mềm nhà cung cấp"
  ],

  "Tài Liệu Vận Hành": [
    "tài liệu vận hành", "tai lieu van hanh",
    "operational documentation", "operation manual",
    "hướng dẫn vận hành", "huong dan van hanh",
    "admin guide", "quản trị hệ thống",
    "system administration", "runbook", "operations runbook",
    "hướng dẫn quản trị", "deployment guide",
    "tài liệu triển khai", "tài liệu bàn giao"
  ],

  "Hệ Điều Hành": [
    "hệ điều hành", "he dieu hanh", "OS", "operating system",
    "Windows Server", "RHEL", "Red Hat", "Linux",
    "Ubuntu", "CentOS", "Windows Server 2019",
    "Windows Server 2022", "RHEL 9", "kernel"
  ],

  "Môi Trường": [
    "môi trường", "moi truong", "environment", "env",
    "DEV", "UAT", "PROD", "production", "staging",
    "development environment", "test environment",
    "môi trường phát triển", "môi trường kiểm thử",
    "môi trường sản xuất", "multi-environment"
  ],

  "Phần Cứng Máy Chủ": [
    "phần cứng", "phan cung", "hardware", "server hardware",
    "cấu hình máy chủ", "server spec", "hardware spec",
    "CPU", "RAM", "processor", "core", "memory",
    "SSD", "storage", "rack server", "blade server",
    "server sizing", "sizing", "tính toán cấu hình"
  ],

  "SLA": [
    "SLA", "service level agreement", "cam kết dịch vụ",
    "uptime SLA", "cloud SLA", "SLA tham chiếu",
    "availability SLA", "99.9%", "99.99%",
    "service commitment", "cam kết vận hành"
  ],

  "WAF": [
    "WAF", "Web Application Firewall", "tường lửa ứng dụng",
    "firewall", "ModSecurity", "application firewall",
    "OWASP", "web security", "XSS filter", "SQL injection filter"
  ],

  "Backup": [
    "sao lưu dữ liệu", "backup", "data backup",
    "full backup", "differential backup", "log backup",
    "incremental backup", "backup schedule",
    "backup strategy", "chiến lược sao lưu",
    "restore", "khôi phục dữ liệu", "recovery",
    "backup từ passive", "off-site backup"
  ],

  "Prometheus": [
    "prometheus", "monitoring", "giám sát",
    "metrics", "alert", "alerting", "grafana",
    "dashboard", "exporter", "node_exporter",
    "scrape", "time series", "TSDB"
  ],

  "Visual Studio": [
    "Visual Studio", "VS 2022", "VS2022",
    "IDE", "development tool", "công cụ phát triển",
    "Visual Studio 2022", "VS Code", "VSCode",
    "dotnet IDE", ".NET IDE"
  ],

  "JMeter": [
    "JMeter", "Apache JMeter", "load testing tool",
    "kiểm thử hiệu năng", "performance testing",
    "benchmark tool", "stress test tool",
    "10000 users", "concurrent test", "tải giả lập"
  ],

  "Kiểm Thử": [
    "kiểm thử", "kiem thu", "testing", "test",
    "SIT", "UAT", "integration test", "performance test",
    "smoke test", "regression test", "test case",
    "test plan", "kế hoạch kiểm thử", "nghiệm thu"
  ],

  "Tường Lửa": [
    "tường lửa", "tuong lua", "firewall",
    "network firewall", "hardware firewall",
    "fw rule", "firewall rule", "access control list", "ACL",
    "inbound rule", "outbound rule", "port rule"
  ],

  "Warmup": [
    "warmup", "warm up", "khởi động service",
    "khoi dong", "load cache", "JIT warmup",
    "IIS warmup"
  ],

  "HRM Mobile": [
    "mobile", "app mobile", "app chấm công", "hrm mobile",
    "HRM app", "mobile app", "ứng dụng chấm công",
    "ung dung cham cong", "chấm công điện thoại",
    "GPS attendance", "Wifi attendance",
    "New_SaveTamScanLog", "Att_GetData",
    "portal v3", "V3.0", "portal mobile"
  ],

  "Hre_Profile": [
    "Profile", "ProfileID", "Hre_Profile",
    "hồ sơ nhân viên", "ho so nhan vien",
    "bảng nhân viên", "bang nhan vien",
    "thông tin nhân viên", "thong tin nhan vien",
    "employee profile", "employee record",
    "NV", "nhân viên", "nhan vien"
  ],

  "Kỳ Lương": [
    "kỳ lương", "ky luong", "cut off", "cutoff",
    "CutOffDuration", "Att_CutOffDuration",
    "kỳ công", "ky cong", "kỳ tính công",
    "chốt công", "chot cong", "khóa công",
    "mid cut off", "IsMonthlyCutOff", "IsDurationCutOff",
    "IsMonthlyMidCutOff", "MidCutOffDay",
    "nửa tháng", "giữa tháng", "cuối tháng",
    "payroll period", "pay period"
  ]
}
```

---

## Compound Patterns

Các cụm từ ghép cần join trước khi tokenize — **dài/cụ thể nhất ưu tiên trước**.
Format: `["phrase", "token"]` — phrase dùng dấu cách, token dùng underscore.
Tháng số dùng special key `"tháng_N"` (tự động map tháng 1-12).

```json
[
  ["nghỉ không lương",    "nghỉ_không_lương"],
  ["nghỉ 14 ngày",        "nghỉ_14_ngày"],
  ["đóng bảo hiểm",      "đóng_bảo_hiểm"],
  ["sinh bảng công",     "sinh_bảng_công"],
  ["khóa bảng công",     "khóa_bảng_công"],
  ["phân hệ lương",      "phân_hệ_lương"],
  ["stored procedure",   "stored_procedure"],
  ["ca làm việc",        "ca_làm_việc"],
  ["phòng ban kế toán",  "phòng_ban_kế_toán"],
  ["phòng kế toán",      "phòng_kế_toán"],
  ["bộ phận kế toán",    "bộ_phận_kế_toán"],
  ["nghỉ việc",          "nghỉ_việc"],
  ["phân tích",          "phân_tích"],
  ["trạng thái",         "trạng_thái"],
  ["chấm công",          "chấm_công"],
  ["nhân viên",          "nhân_viên"],
  ["hợp đồng",           "hợp_đồng"],
  ["tiền lương",         "tiền_lương"],
  ["mức lương",          "mức_lương"],
  ["ngày công",          "ngày_công"],
  ["bảo hiểm",           "bảo_hiểm"],
  ["nghỉ phép",          "nghỉ_phép"],
  ["tăng ca",            "tăng_ca"],
  ["tính lương",         "tính_lương"],
  ["quyết toán",         "quyết_toán"],
  ["thuế tncn",          "thuế_tncn"],
  ["ngày nghỉ",          "ngày_nghỉ"],
  ["hiển thị",           "hiển_thị"],
  ["màn hình",           "màn_hình"],
  ["điều kiện",          "điều_kiện"],
  ["tài khoản",          "tài_khoản"],
  ["phòng ban",          "phòng_ban"],
  ["báo cáo",            "báo_cáo"],
  ["sự cố",              "sự_cố"],
  ["kiểm tra",           "kiểm_tra"],
  ["nghỉ lễ",            "nghỉ_lễ"],
  ["nghỉ bù",            "nghỉ_bù"],
  ["nghỉ ốm",            "nghỉ_ốm"],
  ["phân quyền",         "phân_quyền"],
  ["cấu hình",           "cấu_hình"],
  ["nguyên nhân",        "nguyên_nhân"],
  ["xử lý",              "xử_lý"],
  ["thống kê",           "thống_kê"],
  ["đăng ký",            "đăng_ký"],
  ["tính công",          "tính_công"],
  ["bảng công",          "bảng_công"],

  ["kết nối",            "kết_nối"],
  ["máy chủ",            "máy_chủ"],
  ["thiết bị",           "thiết_bị"],
  ["lưu trữ",            "lưu_trữ"],
  ["sao lưu",            "sao_lưu"],
  ["dữ liệu",            "dữ_liệu"],
  ["cáp quang",          "cáp_quang"],
  ["tốc độ",             "tốc_độ"],
  ["tối thiểu",          "tối_thiểu"],
  ["tối đa",             "tối_đa"],
  ["hạ tầng",            "hạ_tầng"],
  ["máy tính",           "máy_tính"],
  ["mạng nội bộ",        "mạng_nội_bộ"],
  ["đường truyền",       "đường_truyền"],
  ["băng thông",         "băng_thông"],
  ["tường lửa",          "tường_lửa"],
  ["địa chỉ",            "địa_chỉ"],
  ["phần mềm",           "phần_mềm"],
  ["phần cứng",          "phần_cứng"],
  ["hệ thống",           "hệ_thống"],
  ["ổ cứng",             "ổ_cứng"],
  ["bộ nhớ",             "bộ_nhớ"],
  ["vi xử lý",           "vi_xử_lý"],
  ["nguồn điện",         "nguồn_điện"],
  ["trung tâm",          "trung_tâm"],
  ["dịch vụ",            "dịch_vụ"],
  ["bảo mật",            "bảo_mật"],
  ["sao chép",           "sao_chép"],
  ["khôi phục",          "khôi_phục"],
  ["chia sẻ",            "chia_sẻ"],
  ["giao thức",          "giao_thức"],
  ["card mạng",          "card_mạng"],
  ["switch mạng",        "switch_mạng"],
  ["máy chủ ảo",         "máy_chủ_ảo"],
  ["ảo hóa",             "ảo_hóa"],

  ["máy trạm",           "máy_trạm"],
  ["triển khai giải pháp", "triển_khai_giải_pháp"],
  ["giải pháp kỹ thuật", "giải_pháp_kỹ_thuật"],
  ["giải pháp đề xuất",  "giải_pháp_đề_xuất"],
  ["phần mềm bên thứ ba", "phần_mềm_bên_thứ_ba"],
  ["công cụ bên thứ ba", "công_cụ_bên_thứ_ba"],
  ["bên thứ ba",         "bên_thứ_ba"],
  ["bên thứ 3",          "bên_thứ_ba"],
  ["tài liệu vận hành",  "tài_liệu_vận_hành"],
  ["hướng dẫn vận hành", "hướng_dẫn_vận_hành"],
  ["hướng dẫn quản trị", "hướng_dẫn_quản_trị"],
  ["tài liệu triển khai","tài_liệu_triển_khai"],
  ["tài liệu bàn giao",  "tài_liệu_bàn_giao"],
  ["hệ điều hành",       "hệ_điều_hành"],
  ["phần cứng máy chủ",  "phần_cứng_máy_chủ"],
  ["cấu hình phần cứng", "cấu_hình_phần_cứng"],
  ["mô hình mạng",       "mô_hình_mạng"],
  ["cân bằng tải",       "cân_bằng_tải"],
  ["high availability",  "high_availability"],
  ["disaster recovery",  "disaster_recovery"],
  ["khả năng mở rộng",   "khả_năng_mở_rộng"],
  ["hiệu năng hệ thống", "hiệu_năng_hệ_thống"],
  ["sao lưu dữ liệu",    "sao_lưu_dữ_liệu"],
  ["chiến lược sao lưu", "chiến_lược_sao_lưu"],
  ["môi trường triển khai","môi_trường_triển_khai"],
  ["tích hợp hệ thống",  "tích_hợp_hệ_thống"],
  ["kiểm thử hiệu năng", "kiểm_thử_hiệu_năng"],
  ["tường lửa ứng dụng", "tường_lửa_ứng_dụng"],
  ["web application firewall", "WAF"],
  ["phân vùng mạng",     "phân_vùng_mạng"],
  ["trung tâm dữ liệu",  "trung_tâm_dữ_liệu"],
  ["dịch vụ đám mây",    "dịch_vụ_đám_mây"],
  ["đám mây",            "đám_mây"],
  ["cloud computing",    "cloud_computing"],
  ["máy chủ ứng dụng",   "máy_chủ_ứng_dụng"],
  ["máy chủ cơ sở dữ liệu", "máy_chủ_cơ_sở_dữ_liệu"],
  ["máy chủ proxy",      "máy_chủ_proxy"],
  ["quản trị hệ thống",  "quản_trị_hệ_thống"],
  ["nhà thầu",           "nhà_thầu"],
  ["hồ sơ thầu",         "hồ_sơ_thầu"],
  ["yêu cầu kỹ thuật",   "yêu_cầu_kỹ_thuật"],
  ["yêu cầu phi chức năng","yêu_cầu_phi_chức_năng"],
  ["cổng kết nối",       "cổng_kết_nối"],
  ["người dùng cuối",    "người_dùng_cuối"],
  ["người dùng đồng thời","người_dùng_đồng_thời"],
  ["thời gian phản hồi", "thời_gian_phản_hồi"],
  ["cam kết dịch vụ",    "cam_kết_dịch_vụ"],
  ["phân tích hiệu năng","phân_tích_hiệu_năng"],
  ["kiến trúc hệ thống", "kiến_trúc_hệ_thống"],
  ["kiến trúc 3 lớp",    "kiến_trúc_3_lớp"],
  ["lưu trữ dữ liệu",    "lưu_trữ_dữ_liệu"],
  ["khả năng dự phòng",  "khả_năng_dự_phòng"],
  ["bản vá lỗi",         "bản_vá_lỗi"],
  ["cập nhật hệ thống",  "cập_nhật_hệ_thống"],

  ["cung cấp",            "cung_cấp"],
  ["sơ đồ",              "sơ_đồ"],
  ["luồng xử lý",        "luồng_xử_lý"],
  ["luồng dữ liệu",      "luồng_dữ_liệu"],
  ["quy trình",          "quy_trình"],
  ["mô hình",            "mô_hình"]
]
```

---

## Intent Patterns

Từ khóa nhận diện intent — chỉnh tại đây, không cần sửa code.

```json
{
  "fix-bug":  ["bug", "lỗi", "fix", "sửa", "không chạy", "không hoạt động", "fail", "error", "crash", "báo lỗi"],
  "refactor": ["refactor", "tái cấu trúc", "clean", "cải thiện", "tối ưu", "optimize", "rename", "restructure"],
  "feature":  ["thêm", "modify", "tính năng", "feature", "implement", "build", "phát triển", "extend"],
  "config":   ["cấu hình", "sys_allSetting", "config", "setting", "cài đặt", "deploy", "môi trường", "environment", "iis", "server"],
  "query":    ["truy vấn", "query", "báo cáo", "report", "thống kê", "tìm", "lấy", "danh sách", "liệt kê", "xem"]
}
```

---

## Stopwords

Danh sách từ bị loại khỏi graph — **không hardcode trong code**, sửa tại đây để có hiệu lực ngay.

```json
{
  "vi_function": [
    "khi", "thì", "là", "mà", "bị", "cho", "và", "hoặc", "có", "không",
    "các", "những", "của", "để", "với", "trong", "trên", "dưới", "về",
    "như", "sao", "làm", "phải", "được", "tới", "từ", "lúc", "nào", "này",
    "kia", "đã", "đang", "sẽ", "rồi", "vậy", "thế", "nếu", "cần",
    "muốn", "xem", "tại", "vì", "do", "ra", "vào", "lên", "xuống", "qua",
    "nhưng", "vẫn", "thay", "mong", "cũng", "hay", "lại", "nên",
    "chỉ", "tuy", "dù", "theo", "còn", "đây", "đó", "hơn", "hết", "luôn",
    "bằng", "sau", "trước", "đến", "giữa"
  ],
  "vi_noise_standalone": [
    "ghi", "nhận", "lưu", "báo", "gửi", "nhập", "xuất", "đọc", "viết",
    "tạo", "xóa", "sửa", "thêm", "bỏ", "chạy", "dừng", "mở", "đóng",
    "lấy", "trả", "hiện", "ẩn", "tìm", "xét", "duyệt", "tra",
    "loại", "trừ", "ngoài", "sai", "đúng", "tốt", "xấu", "cũ",
    "nghỉ", "phép", "công", "việc",
    "cung", "cấp", "sơ", "đồ", "hỏi", "giới", "thiệu", "mô", "tả"
  ],
  "en_noise": [
    "the", "and", "for", "with", "from", "that", "this", "are", "was",
    "not", "but", "out", "has", "have", "been", "all", "its",
    "get", "set", "run", "log", "null", "true", "false", "check"
  ]
}
```

