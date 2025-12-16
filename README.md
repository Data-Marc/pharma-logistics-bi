# PHARMA LOGISTICS - Power BI Dashboard

[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/releases)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.107.0-007ACC?logo=visualstudiocode)](https://code.visualstudio.com)
[![Excel](https://img.shields.io/badge/Excel-2511-217346?logo=microsoft-excel)](https://www.microsoft.com/excel)
[![Power Query](https://img.shields.io/badge/Power%20Query-2.149.1429.0-00A4EF?logo=power-bi)](https://powerquery.microsoft.com)


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

### OVERVIEW - Global Performance Dashboard

Main landing page with real-time KPIs and operational snapshot.

**Featured KPIs (6 Cards):**
- Total Orders (with YoY trend)
- OTIF % (On-Time In-Full Delivery)
- Lead Time (Days)
- In-Full % (Delivery completion rate)
- On-Time Delivery % (Punctuality)
- Back Orders (Volume)

**Key Visualizations:**
- Performance by Carrier: Pie chart showing order distribution across 7 carriers
- Cost Breakdown by Category: Stacked column chart (Freight, Cold Chain, Medical, Vaccine, Other)
- Delivery Performance Status: Stacked bar (Delivered/Pending/Returned/Cancelled)
- Regional Revenue: Horizontal bar chart by region with amounts (Africa, Americas, Asia, Europe)
- Financial Summary: Combo chart showing costs vs revenue trend across months

**Dynamic Filters:**
- Year-Month slider (2021-2025)
- Region multi-select (4 regions)
- Country multi-select (44 countries)
- Transport Mode filter (Air/Sea/Land)
- Carrier dropdown (7 providers)
- Supplier Country selector

---

### PERFORMANCE - Supply Chain Analytics

Detailed operational metrics with regional and carrier drill-down capabilities.

**Performance Matrices:**

**Matrix 1: Performance by Region**
- Rows: Region (Africa, Americas, Asia, Europe) - expandable to countries
- Columns: OTIF %, In-Full %, On-Time Delivery %, Perfect Order %
- Data validation by OTIF calculations
- Highlighting for performance thresholds

**Matrix 2: Performance by Carrier**
- Rows: Carrier with Regional drill-down capability
- Columns: Lead Time MTD/YTD, Cost per KM, Total Logistics Cost, Efficiency Stars
- Benchmarking across carriers
- Cost-efficiency analysis

**Trend Analysis:**
- Revenue vs COGS Line Chart: Dual-axis visualization showing monthly trends (Jan-Dec)
- COGS MTP vs YTD Combo Chart: Month-to-date vs year-to-date comparison by Region

**Key Performance Indicators (22 Measures):**
- Perfect Order %: Orders on-time, in-full, and accurately delivered
- Supply Chain Efficiency Score: Composite metric (0-100%)
- Delivery Accuracy %: Zero receiving discrepancies
- Cold Chain Compliance %: Temperature-controlled shipments
- Order Fill Rate %: Orders fulfilled without backorders
- Average Lead Time: Days from order to delivery
- OTIF %: On-time and in-full delivery rate
- In-Full %: Complete order fulfillment rate
- On-Time Delivery %: Punctual arrivals
- CO2 Emissions: Per KM, per 100km, avg per order, total

---

### FINANCIAL - Profitability & Economics

Supply chain financial analysis with regional breakdown and carrier benchmarking.

**Economic KPIs (46 Measures):**

Financial Metrics:
- Revenue (Total, MTP, YTD, Previous Month, Previous Year)
- COGS (Total, MTP, YTD, Previous Month, Previous Year)
- Gross Margin % (Profitability ratio)
- Total Logistics Cost (Transport + Inventory holding)
- Net Contribution (Bottom line profit)
- Cost per KM (Transport efficiency)
- Efficiency Score (%) 
- Logistics Cost % (Overhead ratio)
- Inventory Holding Cost MTP (Monthly accrual)
- Inventory Holding Cost YTD (Year-to-date accrual)

---

### WAREHOUSES - Inventory Optimization

Comprehensive warehouse management with stock health monitoring and risk assessment.

**Health Stock Status:**
- Visual gauge showing % of optimal stock (0-100%)
- Risk indicators: GREEN (Healthy), YELLOW (Balanced), RED (Low)
- 44 warehouse locations tracked globally
- Real-time stock position

**Days on Hand Analysis (90-day window):**
- DOH by warehouse with color-coded thresholds
- Risk Assessment Levels:
  - RED: Understock (< 30 days) - stockout risk
  - YELLOW: Balanced (30-40 days) - optimal
  - GREEN: Healthy (> 40 days) - buffer available
- Demand-based projections
- Trend analysis

**Warehouse KPIs (32 Measures):**

Inventory Position:
- Min Stock Level (average across warehouses)
- Safety Volume (buffer inventory quantity)
- Max Volume Capacity (storage limit by warehouse)
- Reorder Point (trigger level for ordering)
- Current Stock Levels (real-time units by warehouse)
- Total Inventory Value (GBP)

Warehouse Operations:
- Orders per Warehouse (throughput metric)
- Warehouse Utilization % (capacity used)
- Inventory Turns (COGS / Avg Inventory Value)
- Inventory Accuracy % (Physical count validation)
- Daily Demand (90-day average)
- Total Outbound (shipment volume)

Risk Metrics:
- Expiry Risk (Units) (products expiring soon)
- Expiry Risk (GBP) (financial impact)
- Risk Category: Low/Balanced/Healthy/Overstock
- Stock-out Financial Impact (GBP)
- Overstock Carrying Cost (GBP)
- Inventory Holding Cost (annual GBP)
- Dead Stock % (non-moving inventory)
- Inventory-to-Revenue Ratio

---

### QUALITY - Compliance & Temperature Control

Quality assurance and cold chain compliance monitoring for pharmaceutical products.

**Quality KPIs (20 Measures):**

Compliance Metrics:
- Cold Chain Compliance % (Temperature-controlled shipments)
- Delivery Accuracy % (Zero receiving discrepancies)
- Traceability % (Serial number tracked orders)
- Regulatory Compliance Score (0-100%)

Returns & Quality:
- Return Rate (%) (Products returned / total orders)
- Return Financial Impact (GBP) (Cost of returns)
- Return Reason Analysis (Damage/Defect/Expired/Other)
- Return Processing Time (Days)

Forecast & Demand:
- Forecast Accuracy (%) (Demand prediction accuracy)
- MAPE (Mean Absolute Percentage Error) (Forecast error metric)
- Forecast Bias (Over/Under estimation)
- Forecast vs Actual Variance

Quality Events:
- Temperature Excursions (Count)
- Excursion Severity (Low/Medium/High)
- Products Affected by Excursion
- Root Cause by Excursion Type
- Resolution Time (Hours)

---

### FORECAST - Demand Planning

Demand forecasting and accuracy analysis for inventory optimization.

**Forecast Metrics:**
- Forecast Accuracy (%): Predicted vs Actual demand alignment
- MAPE (Mean Absolute Percentage Error): Industry-standard forecast error rate
- Forecast Bias: Under/over forecasting tendency
- Actual vs Forecast: Weekly comparison with variance analysis

**Data Tracked:**
- Weekly Forecast Data: ForecastQty, ActualQty, Error tracking
- Daily Demand (90-day average): Trend analysis and seasonality
- Lead Time Forecasts: Supplier and carrier lead time predictions
- Demand Volatility Index: Coefficient of variation

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



## DOCUMENTATION

| Document | Purpose |
|----------|---------|
| README.md | Project overview and features |
| SETUP_GUIDE.md | Installation and configuration |
| ARCHITECTURE.md | Technical design and data model |
| DATA_DICTIONARY.md | Complete data reference |
| CHANGELOG.md | Version history |
| CONTRIBUTING.md | Contribution guidelines |
| LICENSE | Proprietary license terms |

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

For licensing inquiries:

Contact: https://www.linkedin.com/in/samson18/

---

**Version:** 1.0.0
**Last Updated:** December 2025
**Author:** Marc James Samson
**Status:** Production Ready
**License:** Proprietary and Confidential

---

For licensing inquiries and commercial use, please contact: https://www.linkedin.com/in/samson18/















