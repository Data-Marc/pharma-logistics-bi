# PHARMA LOGISTICS - Power BI Dashboard

[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/releases)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)

---

## OVERVIEW

**Pharma Logistics BI** is a comprehensive pharmaceutical supply chain management dashboard built with Power BI. It provides real-time visibility into orders, transportation, inventory, quality compliance, and financial performance across multiple regions and logistics providers.

Designed for supply chain managers, logistics coordinators, and financial analysts to monitor KPIs, identify bottlenecks, and optimize pharmaceutical distribution operations.

### KEY HIGHLIGHTS

- 4 interactive dashboards with drill-down capabilities
- 180+ DAX measures for advanced analytics
- Regional analysis: Africa, Americas, Asia, Europe (44 countries)
- Carrier benchmarking: 7 major logistics providers (CMA, DB, DHL, FedEx, KN, Maersk, UPS)
- Financial tracking: Revenue, COGS, margins, profitability analysis
- Cold chain monitoring: Temperature compliance and excursion tracking
- Warehouse optimization: Inventory health, Days on Hand (DOH), stock level analysis
- Sustainability metrics: CO2 tracking per KM, per order, total carbon footprint

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

**Supply Chain Economics Matrix by Region:**

| Metric | Value Range | Format | Target |
|--------|-------------|--------|--------|
| Revenue | GBP 85M - 96M | Currency | Growing |
| COGS | GBP 43M - 48M | Currency | Stable |
| Gross Margin % | 45-52% | Percentage | > 50% |
| Total Logistics Cost | GBP 3.3M - 9.9M | Currency | < GBP 5M |
| Logistics Cost % | 2.9-4.2% | Percentage | < 5% |
| Net Contribution | GBP 31M - 46M | Currency | Maximize |
| Efficiency Score | 45-97% | Percentage | > 85% |

**Logistics Efficiency Matrix by Carrier:**

| Metric | Range | Unit | Description |
|--------|-------|------|-------------|
| Orders Volume | 2,000-3,000 | # shipments | Per carrier throughput |
| Cost per KM | GBP 0.20-0.30 | GBP/km | Transport efficiency |
| Cost per Order | GBP 700-2,000 | GBP | Transaction cost |
| Total Logistics Cost | Varies | GBP | Transport + inventory |
| Revenue Associated | GBP 8M-87M | GBP | Orders value per carrier |
| Efficiency Stars | Rating | Stars | Performance rating |

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
| BI Platform | Power BI Desktop | Latest (Premium License) |
| Data Engine | Analysis Services | Tabular Model |
| Database | SQL Server | 2019+ (SQLEXPRESS) |
| Query Language | DAX | Latest |
| Data Model | Star Schema | 29 tables, 20 relationships |
| Measures | DAX Calculations | 180+ KPIs |

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

## KEY FEATURES

- Time Intelligence: MTD, YTD, Previous Month/Year comparisons
- Regional Drill-Down: 4 regions, 44 countries
- Carrier Benchmarking: 7 logistics providers
- Financial Analysis: Revenue, COGS, margins, profitability
- Environmental Metrics: CO2 tracking and sustainability
- Quality & Compliance: Cold chain, delivery accuracy, returns
- Warehouse Optimization: Stock health, DOH, inventory turns
- Visual Indicators: Stars and triangles for status
- Interactive Controls: 10+ dynamic slicers and filters

---

## PROJECT METRICS

| Metric | Value |
|--------|-------|
| **MODEL ARCHITECTURE** | |
| Dashboard Pages | 4 |
| Visuals Count | 20+ |
| Data Tables | 13 |
| Measure Tables | 5 |
| Total Measures | 302 |
| Relationships | 20 |
| **GEOGRAPHIC & BUSINESS COVERAGE** | |
| Regions Covered | 4 |
| Countries Included | 44 |
| Warehouses Tracked | 44 |
| Carriers Tracked | 7 |
| Suppliers Tracked | 20 |
| Products Tracked | 31 |
| Transport Modes | 4 |
| **DATA VOLUME & ENTITIES** | |
| Orders Tracked | 9,980 |
| Data Volume | 75,000+ records |
| Data Retention Period | 2023-2025 |
| **PERFORMANCE & FILE METRICS** | |
| Report File Size | ~150MB |
| Refresh Time | 9-12 seconds |
| Data Retention | 3 years (2023-2025) |
| Regions Covered | 4 |
| Countries Included | 50+ |
| Carriers Tracked | 7 |

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



