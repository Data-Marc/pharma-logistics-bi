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
- Data Layer: Imported into SQL Server 2019+ for rigorous transformation and validation
- Upstream Processing: All data cleansing, enrichment, and quality validations are performed at the SQL layer before reaching Power BI. Following the principle: "Perform data transformations as far upstream (close to the source) as possible, and only downstream (in the report) when necessary" (Roche's Maxim). This ensures data integrity, maintains a single source of truth, and optimizes report performance.

- Standardized validation rules applied during ETL
- 13 data tables with 20 active relationships (star schema architecture)
- 302 calculated measures for consistent KPI definitions
This upstream-first approach guarantees data integrity across 75,000+ records spanning 4 regions, 44 countries, and 44 warehouses globally.
---

## DASHBOARD PAGES

📊 **OVERVIEW** - Global Performance Dashboard

📈 **PERFORMANCE** - Supply Chain Analytics

🏭 **WAREHOUSES** - Inventory Optimization

💰 **FINANCIAL** - Profitability & Economics

---

## KPI BY CATEGORY

### 📦 TRANSPORT KPIs
*Key performance indicators related to order fulfillment and carrier operations*

| KPI | Description | Page |
|-----|-------------|------|
| **OTIF %** | On-Time In-Full Delivery Rate | OVERVIEW, PERFORMANCE |
| **On-Time Delivery %** | Percentage of orders delivered on schedule | OVERVIEW, PERFORMANCE |
| **In-Full %** | Complete order fulfillment rate without shortages | OVERVIEW, PERFORMANCE |
| **Lead Time (Days)** | Average days from order placement to delivery | OVERVIEW, PERFORMANCE |
| **Perfect Order %** | Orders on-time, in-full, accurately delivered | PERFORMANCE |
| **Performance by Carrier** | Lead Time, Cost per KM, Efficiency Stars, Total Logistics Cost | PERFORMANCE |
| **Cost per KM** | Transport efficiency metric per kilometer | PERFORMANCE, FINANCIAL |
| **CO2 Emissions** | Environmental footprint per KM, per 100km, avg per order, total | PERFORMANCE |
| **Delivery Accuracy %** | Zero receiving discrepancies rate | PERFORMANCE, FINANCIAL |
| **Total Orders** | Volume of orders processed YoY | OVERVIEW |
| **Back Orders** | Volume of unfulfilled orders | OVERVIEW |
| **Performance by Region** | OTIF %, In-Full %, On-Time Delivery %, Perfect Order % by Region | PERFORMANCE |

### 🏭 WAREHOUSE KPIs
*Inventory management, stock levels, and warehouse operations*

| KPI | Description | Page |
|-----|-------------|------|
| **Warehouse Utilization %** | Capacity usage across 44 warehouse locations | WAREHOUSES |
| **Days on Hand (DOH)** | Stock duration analysis with risk assessment (RED/YELLOW/GREEN) | WAREHOUSES |
| **Current Stock Levels** | Real-time units by warehouse | WAREHOUSES |
| **Total Inventory Value** | GBP valuation of stock | WAREHOUSES, FINANCIAL |
| **Min Stock Level** | Average reorder point across warehouses | WAREHOUSES |
| **Max Volume Capacity** | Storage limit by warehouse | WAREHOUSES |
| **Inventory Turns** | COGS / Average Inventory Value | WAREHOUSES, FINANCIAL |
| **Inventory Accuracy %** | Physical count validation rate | WAREHOUSES |
| **Orders per Warehouse** | Throughput metric by location | WAREHOUSES |
| **Total Outbound** | Shipment volume from warehouses | WAREHOUSES |
| **Dead Stock %** | Non-moving inventory percentage | WAREHOUSES |
| **Expiry Risk (Units)** | Products expiring soon (quantity) | WAREHOUSES |
| **Expiry Risk (GBP)** | Financial impact of expiry risk | WAREHOUSES, FINANCIAL |
| **Stock-out Financial Impact** | GBP loss from stockouts | WAREHOUSES, FINANCIAL |
| **Overstock Carrying Cost** | GBP cost of excess inventory | WAREHOUSES, FINANCIAL |
| **Inventory Holding Cost** | Annual GBP cost of inventory storage | WAREHOUSES, FINANCIAL |
| **Inventory-to-Revenue Ratio** | Balance between stock investment and sales | WAREHOUSES, FINANCIAL |
| **Health Stock Status** | Visual gauge (0-100%) with risk indicators | WAREHOUSES |

### ⚙️ PERFORMANCE KPIs
*Supply chain efficiency, quality, and operational metrics*

| KPI | Description | Page |
|-----|-------------|------|
| **Supply Chain Efficiency Score** | Composite metric (0-100%) measuring overall efficiency | PERFORMANCE |
| **Cold Chain Compliance %** | Temperature-controlled shipments percentage | PERFORMANCE |
| **Traceability %** | Serial number tracked orders | PERFORMANCE |
| **Regulatory Compliance Score** | Compliance audit score (0-100%) | PERFORMANCE |
| **Return Rate (%)** | Products returned / total orders | PERFORMANCE |
| **Return Financial Impact** | GBP cost of returns | PERFORMANCE, FINANCIAL |
| **Return Reason Analysis** | Breakdown by Damage/Defect/Expired/Other | PERFORMANCE |
| **Return Processing Time** | Average days to process returns | PERFORMANCE |
| **Forecast Accuracy (%)** | Demand prediction accuracy | PERFORMANCE |
| **MAPE** | Mean Absolute Percentage Error (forecast metric) | PERFORMANCE |
| **Forecast Bias** | Over/Under estimation tendency | PERFORMANCE |
| **Daily Demand (90-day)** | Average with trend analysis | PERFORMANCE |
| **Cost-Efficiency Analysis** | Carrier benchmarking by region | PERFORMANCE |
| **Forecast vs Actual Variance** | Weekly comparison with deviation analysis | PERFORMANCE |
| **Temperature Excursions** | Count and severity tracking | PERFORMANCE |
| **Excursion Resolution Time** | Average hours to resolve thermal incidents | PERFORMANCE |

### 💰 FINANCIAL KPIs
*Revenue, profitability, costs, and economic performance*

| KPI | Description | Page |
|-----|-------------|------|
| **Revenue** | Total, MTP, YTD, Previous Month, Previous Year | FINANCIAL |
| **COGS** | Cost of Goods Sold (Total, MTP, YTD, Previous Month, Previous Year) | FINANCIAL |
| **Gross Margin %** | Profitability ratio (Revenue - COGS / Revenue) | FINANCIAL |
| **Total Logistics Cost** | Transport + Inventory holding combined | FINANCIAL |
| **Net Contribution** | Bottom line profit after all costs | FINANCIAL |
| **Logistics Cost %** | Overhead ratio relative to revenue | FINANCIAL |
| **Efficiency Score (%)** | Logistics cost-to-revenue efficiency metric | FINANCIAL |
| **Inventory Holding Cost MTP** | Monthly accrual cost | FINANCIAL, WAREHOUSES |
| **Inventory Holding Cost YTD** | Year-to-date accrual cost | FINANCIAL, WAREHOUSES |
| **Revenue vs COGS Trend** | Monthly dual-axis line chart analysis | FINANCIAL |
| **COGS MTP vs YTD** | Month-to-date vs year-to-date comparison by Region | FINANCIAL |
| **Cost Breakdown by Category** | Freight, Cold Chain, Medical, Vaccine, Other | FINANCIAL |
| **Regional Revenue** | Breakdown by Africa, Americas, Asia, Europe | FINANCIAL |
| **Delivery Performance Status** | Financial impact of Delivered/Pending/Returned/Cancelled | FINANCIAL |
| **Safety Volume** | Buffer inventory quantity in GBP | FINANCIAL, WAREHOUSES |
| **Reorder Point** | Trigger level for ordering (cost implications) | FINANCIAL, WAREHOUSES |

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
| Visuals Count | 20+ |
| Data Tables | 13 |
| Measure Tables | 5 |
| Total Measures | 302 |
| Relationships | 20 |
| Report File Size | ~150MB |
| Regions Covered | 4 |
| Countries Included | 44 |
| Warehouses Tracked | 44 |
| Carriers Tracked | 7 |
| Suppliers Tracked | 20 |
| Products Tracked | 31 |
| Transport Modes | 4 |
| Orders Tracked | 9,980 |
| Data Volume | 75,000+ records |
| Data Retention Period | 2023-2025 (3 years) |
| Refresh Time | 9-12 seconds |

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























