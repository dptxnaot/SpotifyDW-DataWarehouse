# 🎵 Spotify Data Warehouse 2023

A data warehouse project built on **Spotify 2023** music data using dimensional modeling, ETL pipeline, and OLAP cube analysis.

---

## 📌 Overview

This project designs and implements a full data warehouse solution for analyzing Spotify 2023 music trends, including top-streamed artists, track popularity, and platform distribution — built entirely on the Microsoft BI stack.

---

## 🛠️ Technologies

| Layer | Tool |
|---|---|
| Database | SQL Server 2019 |
| Query Language | T-SQL |
| ETL Pipeline | SSIS (SQL Server Integration Services) |
| OLAP Cube | SSAS Multidimensional |
| MDX Queries | SQL Server Management Studio (SSMS) |
| IDE | Visual Studio 2022 |
| Version Control | Git / GitHub |

---

## 🏗️ Architecture

```
CSV Source Data
      │
      ▼
 SSIS ETL Package  ──►  SQL Server 2019 (Star Schema)
                              │
                    ┌─────────┴──────────┐
                 Fact Table        Dimension Tables
                              │
                              ▼
                   SSAS Multidimensional Cube
                              │
                              ▼
                       MDX Queries / Reports
```

---

## 📐 Star Schema Design

- **Fact Table:** FactStream — stores streaming metrics per track
- **Dimension Tables:**
  - DimTrack — track name, release info
  - DimArtist — artist name, origin
  - DimDate — release date hierarchy
  - DimPlatform — Spotify, Apple Music, Deezer
  - DimKey — musical key and mode

---

## 📁 Project Structure

```
SpotifyDW-DataWarehouse/
├── Data/               # Source CSV files
├── Database/           # SQL scripts (CREATE TABLE, INSERT)
├── SpotifyETL/         # SSIS ETL Package (.sln)
├── SpotifyCube/        # SSAS Multidimensional Project (.sln)
├── Docs/               # Report and documentation
└── README.md
```

---

## 🚀 How to Run

**Step 1 — Restore Database**
```sql
-- Restore SpotifyDW.bak into SQL Server 2019
RESTORE DATABASE SpotifyDW FROM DISK = 'SpotifyDW.bak'
```

**Step 2 — Run ETL**
```
1. Open SpotifyETL/SpotifyETL.sln in Visual Studio 2022
2. Update Connection String to your SQL Server instance
3. Press F5 to execute the SSIS package
```

**Step 3 — Deploy OLAP Cube**
```
1. Open SpotifyCube/SpotifyCube.sln in Visual Studio 2022
2. Right-click project → Deploy
```

**Step 4 — Query with MDX**
```
1. Open SSMS → Connect to Analysis Services
2. New MDX Query
3. Run analysis queries against the cube
```

---

## 📊 Sample MDX Query

```mdx
-- Top 5 Artists by Total Streams
SELECT
  TopCount(
    [DimArtist].[ArtistName].[ArtistName].Members,
    5,
    [Measures].[TotalStreams]
  ) ON COLUMNS,
  [Measures].[TotalStreams] ON ROWS
FROM [SpotifyCube]
```

---

## 👤 Author

**dptxnaot** — Data Science Student @ HUIT (Ho Chi Minh City University of Industry and Trade)

- 🔗 GitHub: [github.com/dptxnaot](https://github.com/dptxnaot)
