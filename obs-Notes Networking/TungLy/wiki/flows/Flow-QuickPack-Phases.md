---
type: flow
tags:
  - quickpack
  - qpvn
  - phases
  - golive
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/projects/QuickPack-Project]]"
  - "[[wiki/sources/QuickPack-Project-Overview]]"
  - "[[wiki/flows/Flow-Bitex-Phases]]"
  - "[[wiki/flows/Flow-UAT-Process]]"
---

# Flow: Các giai đoạn dự án QuickPack QPVN

> Nguồn: [[wiki/sources/QuickPack-Project-Overview]] | So sánh: [[wiki/flows/Flow-Bitex-Phases]]

## Sơ đồ tổng quan 6 giai đoạn

```mermaid
flowchart TD
    G0["Giai đoạn 0\n.NET Framework → .NET Core\nT4/2025"] --> G1

    G1["Giai đoạn 1\nKhảo sát & chốt SRS\n06–07/2025"] --> G2

    G2["Giai đoạn 2\nXây dựng hệ thống\n15/07–30/09/2025"] --> G3

    G3["Giai đoạn 3\nĐào tạo\nT8–T11/2025"] --> G4

    G4["Giai đoạn 4\nUAT (3 đợt)\nT9–20/11/2025"] --> G5

    G5["Giai đoạn 5\nGo-live\n01/12/2025 ⭐"] --> G6

    G6["Giai đoạn 6\nProject Acceptance\n01–02/2026"]
```

## Sơ đồ Build — 2 đợt song song

```mermaid
flowchart LR
    subgraph D1["Đợt 1 (15/07–30/08)"]
        HRE["HRE\nHồ sơ nhân sự"]
        ATT["ATT\nChấm công"]
        REC["REC\nTuyển dụng ⚠️"]
        UNI["UNI\nĐồng phục 🔴"]
    end

    subgraph D2["Đợt 2 (15/08–30/09)"]
        INS["INS\nBảo hiểm ✅"]
        SAL["SAL\nLương 🔴"]
        TRA["TRA\nĐào tạo 🔴"]
        EVA["EVA\nĐánh giá ✅"]
    end

    D1 --> UAT1["UAT Đợt 1\nT9/2025"]
    D2 --> UAT2["UAT Đợt 2\nT10/2025"]
    UAT1 --> UATALL["UAT Tổng hợp\n01–20/11/2025"]
    UAT2 --> UATALL
    UATALL --> GOLIVE["GO-LIVE\n01/12/2025 ⭐"]
```

> 🔴 = GAP rất phức tạp | ⚠️ = GAP phức tạp | ✅ = Không GAP

## Luồng Build Management

```mermaid
sequenceDiagram
    participant SE
    participant Hai as Nguyễn Ngọc Hải
    participant QC as Lê Thị Kim Tuyền

    SE->>Hai: Raise yêu cầu build
    Hai->>Hai: Build Main (~1 tiếng)
    SE->>SE: Upload my-app (portal)
    QC->>QC: Test trên link test
    QC-->>SE: Feedback bug
```

## Milestone

| Ngày | Milestone | Phụ trách |
|------|-----------|-----------|
| 29/07/2025 | Hoàn tất SRS | VnResource |
| 30/08/2025 | Hoàn tất Build Đợt 1 | VnResource |
| 29/09/2025 | Hoàn tất Training sơ bộ | Tùng.Ly |
| 30/09/2025 | Hoàn tất Build Đợt 2 | VnResource |
| 20/11/2025 | Hoàn tất UAT Tổng hợp | QPVN |
| **01/12/2025** | **Official Golive ⭐** | VnResource & QPVN |
| 01/2026 | Project Acceptance | VnResource |
