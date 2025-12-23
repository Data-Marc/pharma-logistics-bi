# PHARMA LOGISTICS - Power BI Dashboard
#### By [Marc James Samson](https://www.linkedin.com/in/samson18/)

---

[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/blob/main/README.md)
[![Power BI](https://img.shields.io/badge/Power%20BI-2.149.1429.0-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![Power Query](https://img.shields.io/badge/Power%20Query-2.149.1429.0-00A4EF?logo=power-bi)](https://powerquery.microsoft.com)
[![DAX Studio](https://img.shields.io/badge/DAX%20Studio-3.2.1-0078D4?logo=visualstudio)](https://daxstudio.org)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.107.0-007ACC?logo=visualstudiocode)](https://code.visualstudio.com)
[![Excel](https://img.shields.io/badge/Excel-2511-217346?logo=microsoft-excel)](https://www.microsoft.com/excel)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)


---

## OVERVIEW

**Pharma Logistics BI** is a comprehensive pharmaceutical supply chain management dashboard built with Power BI. It provides real-time visibility into orders, transportation, inventory, quality compliance, and financial performance across multiple regions and logistics providers.

Designed for supply chain managers, logistics coordinators, and financial analysts to monitor KPIs, identify bottlenecks, and optimize pharmaceutical distribution operations.

### DATA FOUNDATION & GOVERNANCE

This project demonstrates enterprise-grade data engineering practices applied to pharmaceutical supply chain analytics:

**Dataset Engineering:**

- Source: Entire dataset designed and architected from scratch following industry best practices
- Data Layer: Imported into SQL Server 2019+ for rigorous transformation and validation using constraints and relationships
- Upstream Processing: All data cleansing, enrichment, and quality validations are performed at the SQL layer before reaching Power BI. Following the principle: "Perform data transformations as far upstream (close to the source) as possible, and only downstream (in the report) when necessary" (Roche's Maxim). This ensures data integrity, maintains a single source of truth, and optimizes report performance.

- Standardized validation rules applied during ETL
- **13 data tables with 20 relationships** (star schema architecture)
- 202 calculated measures for consistent KPI definitions

This upstream-first approach guarantees data integrity across 822,000+ records spanning 4 regions, 44 countries, 44 warehouses, and 2,535 customers globally.

---

## Architecture Diagram

```mermaid
graph LR
    subgraph "Source"
    A["Raw Data<br/>• ERP Systems<br/>• APIs<br/>• Flat Files"]
    end
    
    subgraph "Engineering"
    B["SQL Server 2019+<br/>• Data Quality<br/>• ETL & Validation<br/>• Staging/DW"]
    end
    
    subgraph "Analytics"
    C["Power BI<br/>• Star Schema 13 Tables<br/>• 20 Relationships<br/>• DAX Logic 202 Measures"]
    end
    
    subgraph "Business"
    D["Users<br/>• Analysts<br/>• Managers<br/>• Supply Chain Teams"]
    end

    A --> B
    B --> C
    C --> D
    
    style A fill:#e8f4f8,stroke:#0066cc,stroke-width:2px,color:#000
    style B fill:#ffe8cc,stroke:#ff6600,stroke-width:2px,color:#000
    style C fill:#ffd700,stroke:#ff8c00,stroke-width:2px,color:#000
    style D fill:#87ceeb,stroke:#0066cc,stroke-width:2px,color:#000
```

---

## <img src="./docs/images/SQL 96 crop.png" width="35" height="35" alt="SQL Server" style="vertical-align:middle"/>&nbsp;&nbsp;&nbsp;Database Architecture

  <img src="./docs/images/SQL_Screenshot.png" width="900" alt="SQL Server Database Schema">

The system is built on a SQL Server 2019+ database with **13 tables**, where all data cleansing, transformations, business calculations, referential integrity constraints, and relationship definitions are enforced at the data layer. This upstream-first architecture ensures data consistency, eliminates redundant processing in the analytics layer, and optimizes overall performance.

[DATABASE_SCHEMA](docs/DATABASE_SCHEMA.md) | [Data Dictionary](docs/DATA_DICTIONARY.md)

---

###  <img src="./docs/images/Power Query icon.png" width="35" height="35" alt="Power Query" style="vertical-align:middle"/>&nbsp;&nbsp;&nbsp;Power Query

<img src="./docs/images/PowerQuery.png" width="900" alt="Power Query Interface">

---

###  <img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>&nbsp;&nbsp;&nbsp;Database Schema Diagram

<img src="docs/images/Relations%20Table.png" width="900" alt="Relations Table">

The above diagram illustrates the complete data model with all entity relationships, including Orders, Transportation, Inventory, Warehouses, Carriers, Products, and Returns.

---

## DASHBOARD PAGES

<img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>&nbsp;&nbsp;&nbsp;**OVERVIEW** - Global Performance Dashboard

<img src="docs/images/Overview_Video_2.gif" width="900" alt="OVERVIEW Dashboard Preview">

---

<img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>&nbsp;&nbsp;&nbsp;**PERFORMANCE** - Supply Chain Analytics

<img src="docs/images/warehouses.png" width="900" alt="WAREHOUSES Dashboard Preview">

---

<img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>&nbsp;&nbsp;&nbsp;**WAREHOUSES** - Inventory Optimization

<img src="docs/images/Warehouses_Video_5.gif" width="900" alt="Warehouses Inventory Optimization">

---

<img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>&nbsp;&nbsp;&nbsp;**FINANCIAL** - Profitability & Economics

<img src="docs/images/Financial_Video_1.gif" width="900" alt="FINANCIAL Dashboard Preview">

---

## KPI BY CATEGORY

### Quick KPI Overview

### Key Transport KPIs
*Metrics tracking transportation efficiency, logistics performance, and operational sustainability.*

| KPI Name | Description | Scope |
| :--- | :--- | :--- |
| **OTIF %** | On-Time In-Full Delivery Rate | 🌍 Global |
| **Lead Time** | Average days from order to delivery | 🚚 Logistics |
| **Cost per KM** | Transport efficiency metric | 💰 Financial |
| **CO2 Emissions** | Environmental footprint per KM | 🌱 ESG |

### Key Warehouse KPIs
*Metrics analyzing inventory optimization, stock management, and warehouse productivity.*

| KPI Name | Description | Scope |
| :--- | :--- | :--- |
| **Days on Hand (DOH)** | Stock duration analysis | 📉 Risk |
| **Inventory Turns** | COGS / Average Inventory Value | 🔄 Efficiency |
| **Expiry Risk (GBP)** | Financial impact of expiring stock | 💰 Financial |
| **Dead Stock %** | Non-moving inventory percentage | 📉 Risk |

### Key Performance KPIs
*Metrics tracking operational efficiency, quality compliance, and forecast accuracy.*

| KPI Name | Description | Focus Area |
| :--- | :--- | :--- |
| **Cold Chain Compliance %** | Temperature-controlled shipments percentage | ❄️ Quality Assurance |
| **MAPE** | Mean Absolute Percentage Error (Forecast accuracy) | 📊 Demand Planning |
| **Temperature Excursions** | Count and severity of thermal incidents | ⚠️ Risk Mgmt |
| **Supply Chain Efficiency** | Composite score (0-100%) of overall operations | ⚙️ Operations |
| **Regulatory Score** | Compliance audit score (0-100%) | ✅ Compliance |
| **Return Rate %** | Products returned vs total orders | 🔄 Reverse Logistics |
| **Forecast Bias** | Over/Under estimation tendency | 📈 Planning |
| **Excursion Resolution Time** | Average hours to resolve thermal incidents | ⚡ Agility |

### Key Financial KPIs
*Economic indicators measuring profitability, cost-to-serve, and inventory value.*

| KPI Name | Description | Business Impact |
| :--- | :--- | :--- |
| **Gross Margin %** | Profitability ratio `(Rev - COGS) / Rev` | 📈 Profitability |
| **Total Logistics Cost** | Transport + Inventory holding combined | 💸 Cost Control |
| **Net Contribution** | Bottom line profit after all costs | 💰 P&L Health |
| **Logistics Cost %** | Logistics overhead relative to revenue | 📊 Efficiency |
| **Inventory Holding Cost** | Annual cost of storage & capital tied up | 💼 Working Capital |
| **Stock-out Impact** | Estimated revenue loss from stockouts | 🎯 Opportunity Cost |
| **Cost of Goods Sold** | Total COGS (MTP, YTD, YoY) | 📋 Accounting |
| **Expiry Risk (GBP)** | Financial value of at-risk inventory | ♻️ Waste Mgmt |

Full KPI Documentation of 61 KPIs: See [docs/KPIs.md](docs/KPIs.md) to view the complete list of proposed KPIs.

---

## PROJECT METRICS

| Metric | Value |
|--------|-------|
| Dashboard Pages | 4 |
| Visuals Count | 20+ (stacked/overlaid, equivalent to 9-10 pages) |
| Data Tables | 13 |
| Measure Tables | 5 |
| Total Measures | 202 |
| Relationships | 20 |
| Report File Size | ~150MB |
| Regions Covered | 4 |
| Countries Included | 44 |
| Warehouses Tracked | 44 |
| Carriers Tracked | 7 |
| Suppliers Tracked | 20 |
| Products Tracked | 31 |
| Categories of Products | 6 |
| Transport Modes | 4 |
| Orders Tracked | 9,980 |
| Customers Tracked | 2,535 |
| Temperature Excursions | 2 |
| Data Volume | 822,000+ records |
| Data Retention Period | 2023-2025 (3 years) |
| Refresh Time | 16-20 seconds |

---

## DOCUMENTATION

###  Project Documentation

| Document | Description |
| :--- | :--- |
| [ Architecture Guide](docs/ARCHITECTURE.md) | System architecture, data flow, and technology decisions |
| **[ Database Schema](docs/DATABASE_SCHEMA.md)** | **Data model, entity relationships, and database structure** |
| [ KPIs Documentation](docs/KPIs.md) | Complete KPI definitions, calculations, and business logic |
| [ Data Dictionary](docs/DATA_DICTIONARY.md) | Detailed field descriptions and data mapping |

---

## TECHNOLOGY STACK

| Component | Technology | Version |
|-----------|-----------|---------|
| BI Platform | Power BI Desktop | 2.149.1429.0 |
| Data Transformation | Power Query | 2.149.1429.0 |
| Analysis & Optimization | DAX Studio | 3.2.1 |
| IDE | Visual Studio Code | 1.107.0 |
| Spreadsheet | Microsoft Excel | 2511 |
| Database | SQL Server | 2019+ (SQLEXPRESS) |
| Database Management | SQL Server Management Studio | 21.6.17 |

---

## LICENSE

This project is licensed under a **Proprietary and Confidential License**.
This project is NOT open-source and is offered for commercial licensing only.

For licensing inquiries: https://www.linkedin.com/in/samson18/

See [LICENSE](LICENSE) file for complete legal terms.

---

## SUPPORT

Please contact: https://www.linkedin.com/in/samson18/

---


**Version:** 1.0.0
**Last Updated:** December 2025
**Author:** Marc James Samson
**Status:** Production Ready
**License:** Proprietary and Confidential

---

<div align="center">

<a href="https://www.linkedin.com/in/samson18/" target="_blank" style="text-decoration: none;"><img src="./docs/images/Linkedin 96 crop 10.png" width="39" height="39" style="vertical-align: middle;"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://youtu.be/FwUXnIbzaoo" target="_blank" style="text-decoration: none;"><img src="./docs/images/Youtube 96 crop 10.png" width="39" height="39" style="vertical-align: middle;"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://marc-james-samson.notion.site/Portfolio-Marc-James-Samson-2a8e9aa7668d8060a208f8b13f609e7b" target="_blank" style="text-decoration: none;"><img src="./docs/images/Notion 96 crop 10.png" width="39" height="39" style="vertical-align: middle;"/></a>

</div>























