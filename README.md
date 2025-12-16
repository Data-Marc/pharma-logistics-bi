# PHARMA LOGISTICS - Power BI Dashboard


[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/releases)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![Power Query](https://img.shields.io/badge/Power%20Query-2.149.1429.0-00A4EF?logo=power-bi)](https://powerquery.microsoft.com)
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
- 13 data tables with 20 active relationships (star schema architecture)
- 302 calculated measures for consistent KPI definitions
This upstream-first approach guarantees data integrity across 75,000+ records spanning 4 regions, 44 countries, and 44 warehouses globally.
---

### Architecture Diagram

```
┌─────────────────┐         ┌──────────────────────────┐         ┌──────────────┐         ┌──────────┐
│   Raw Data      │         │   SQL Server 2019+       │         │   Power BI   │         │  Users   │
│                 │────────▶│   (ETL & Validation)     │────────▶│  Desktop     │────────▶│          │
│ • ERP Systems   │         │                          │         │  & Service   │         │ Analysts │
│ • APIs          │         │ • Constraints            │         │              │         │ Managers │
│ • Databases     │         │ • Relationships          │         │ 4 Dashboards │         │          │
│ • Files         │         │ • Data Quality Checks    │         │ 302 Measures │         │          │
└─────────────────┘         └──────────────────────────┘         └──────────────┘         └──────────┘
```

---

## DASHBOARD PAGES

📊 **OVERVIEW** - Global Performance Dashboard

<img src="docs/images/overview.png" width="700" alt="OVERVIEW Dashboard Preview">

---

📈 **PERFORMANCE** - Supply Chain Analytics

<img src="docs/images/warehouses.png" width="700" alt="WAREHOUSES Dashboard Preview">

---

🏭 **WAREHOUSES** - Inventory Optimization

<img src="docs/images/performance.png" width="700" alt="PERFORMANCE Dashboard Preview">

---

💰 **FINANCIAL** - Profitability & Economics

<img src="docs/images/financial.png" width="700" alt="FINANCIAL Dashboard Preview">

---

## KPI BY CATEGORY

### Quick KPI Overview

The dashboard tracks **61 key performance indicators (KPIs)** organized across 4 business categories. See [docs/KPIs.md](docs/KPIs.md) for complete descriptions and calculations.

### 📦 Key Transport KPIs
| KPI Name | Description | Scope |
| :--- | :--- | :--- |
| **OTIF %** | On-Time In-Full Delivery Rate | 🌍 Global |
| **Lead Time** | Average days from order to delivery | 🚚 Logistics |
| **Cost per KM** | Transport efficiency metric | 💰 Financial |
| **CO2 Emissions** | Environmental footprint per KM | 🌱 ESG |

### 🏭 Key Warehouse KPIs
| KPI Name | Description | Scope |
| :--- | :--- | :--- |
| **Days on Hand (DOH)** | Stock duration analysis | 📉 Risk |
| **Inventory Turns** | COGS / Average Inventory Value | 🔄 Efficiency |
| **Expiry Risk (GBP)** | Financial impact of expiring stock | 💰 Financial |
| **Dead Stock %** | Non-moving inventory percentage | 📉 Risk |

### ⚙️ Key Performance KPIs
*Metrics tracking operational efficiency, quality compliance, and forecast accuracy.*

| KPI Name | Description | Focus Area |
| :--- | :--- | :--- |
| **Cold Chain Compliance %** | Temperature-controlled shipments percentage | ❄️ Quality Assurance |
| **MAPE** | Mean Absolute Percentage Error (Forecast accuracy) | 📊 Demand Planning |
| **Temperature Excursions** | Count and severity of thermal incidents | 🚨 Risk Mgmt |
| **Supply Chain Efficiency** | Composite score (0-100%) of overall operations | ⚡ Operations |
| **Regulatory Score** | Compliance audit score (0-100%) | ⚖️ Compliance |
| **Return Rate %** | Products returned vs total orders | ↩️ Reverse Logistics |
| **Forecast Bias** | Over/Under estimation tendency | 📈 Planning |
| **Excursion Resolution Time** | Average hours to resolve thermal incidents | ⏱️ Agility |

### 💰 Key Financial KPIs
*Economic indicators measuring profitability, cost-to-serve, and inventory value.*

| KPI Name | Description | Business Impact |
| :--- | :--- | :--- |
| **Gross Margin %** | Profitability ratio `(Rev - COGS) / Rev` | 💰 Profitability |
| **Total Logistics Cost** | Transport + Inventory holding combined | 📉 Cost Control |
| **Net Contribution** | Bottom line profit after all costs | 💵 P&L Health |
| **Logistics Cost %** | Logistics overhead relative to revenue | ⚡ Efficiency |
| **Inventory Holding Cost** | Annual cost of storage & capital tied up | 🏦 Working Capital |
| **Stock-out Impact** | Estimated revenue loss from stockouts | ⚠️ Opportunity Cost |
| **Cost of Goods Sold** | Total COGS (MTP, YTD, YoY) | 🧾 Accounting |
| **Expiry Risk (GBP)** | Financial value of at-risk inventory | 🗑️ Waste Mgmt |

**📊 Full KPI Documentation:** See [docs/KPIs.md](docs/KPIs.md) for detailed descriptions, calculation methods, and dashboard assignments.

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



## PROJECT METRICS

| Metric | Value |
|--------|-------|
| Dashboard Pages | 4 |
| Visuals Count | 20+ (stacked/overlaid, equivalent to 9-10 pages) |
| Data Tables | 13 |
| Measure Tables | 5 |
| Total Measures | 302 |
| Total Values | 822 |
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

## LICENSE

This project is licensed under a **Proprietary and Confidential License**.
This software is NOT open-source and is offered for commercial licensing only.

For licensing inquiries: https://www.linkedin.com/in/samson18/

See LICENSE file for complete legal terms.

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























