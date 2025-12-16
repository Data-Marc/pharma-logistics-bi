# Pharma Logistics - KPI Documentation

Comprehensive key performance indicators (KPIs) for the pharmaceutical logistics supply chain dashboard. All KPIs are tracked across 4 dashboards: **OVERVIEW** (📊), **PERFORMANCE** (📈), **WAREHOUSES** (🏭), and **FINANCIAL** (💰).

---

## 📦 Key Transport KPIs

*Metrics tracking order fulfillment, carrier performance, and logistics operations.*

| KPI Name | Description | Scope |
| :--- | :--- | :--- |
| **OTIF %** | On-Time In-Full Delivery Rate | 🌍 Global |
| **On-Time Delivery %** | Percentage of orders delivered on schedule | 🚚 Logistics |
| **In-Full %** | Complete order fulfillment rate without shortages | 📦 Fulfillment |
| **Lead Time (Days)** | Average days from order placement to delivery | 🚚 Logistics |
| **Perfect Order %** | Orders on-time, in-full, accurately delivered | 🎯 Quality |
| **Performance by Carrier** | Lead Time, Cost per KM, Efficiency Stars, Total Logistics Cost | 📊 Analysis |
| **Cost per KM** | Transport efficiency metric per kilometer | 💰 Financial |
| **CO2 Emissions** | Environmental footprint per KM, per 100km, avg per order, total | 🌱 ESG |
| **Delivery Accuracy %** | Zero receiving discrepancies rate | ✅ Quality |
| **Total Orders** | Volume of orders processed YoY | 📈 Volume |
| **Back Orders** | Volume of unfulfilled orders | 📉 Risk |
| **Performance by Region** | OTIF %, In-Full %, On-Time Delivery %, Perfect Order % by Region | 🗺️ Regional |

---

## 🏭 Key Warehouse KPIs

*Metrics for inventory management, stock levels, warehouse operations, and storage efficiency.*

| KPI Name | Description | Scope |
| :--- | :--- | :--- |
| **Warehouse Utilization %** | Capacity usage across 44 warehouse locations | 📊 Efficiency |
| **Days on Hand (DOH)** | Stock duration analysis with risk assessment (RED/YELLOW/GREEN) | 📉 Risk |
| **Current Stock Levels** | Real-time units by warehouse | 📦 Inventory |
| **Total Inventory Value** | GBP valuation of stock | 💰 Financial |
| **Min Stock Level** | Average reorder point across warehouses | 🔔 Planning |
| **Max Volume Capacity** | Storage limit by warehouse | 📏 Capacity |
| **Inventory Turns** | COGS / Average Inventory Value | 🔄 Efficiency |
| **Inventory Accuracy %** | Physical count validation rate | ✅ Quality |
| **Orders per Warehouse** | Throughput metric by location | 📊 Volume |
| **Total Outbound** | Shipment volume from warehouses | 📤 Logistics |
| **Dead Stock %** | Non-moving inventory percentage | 📉 Risk |
| **Expiry Risk (Units)** | Products expiring soon (quantity) | ⏰ Risk Mgmt |
| **Expiry Risk (GBP)** | Financial impact of expiry risk | 💸 Financial |
| **Stock-out Financial Impact** | GBP loss from stockouts | ⚠️ Opportunity Cost |
| **Overstock Carrying Cost** | GBP cost of excess inventory | 💰 Financial |
| **Inventory Holding Cost** | Annual GBP cost of inventory storage | 🏦 Working Capital |
| **Inventory-to-Revenue Ratio** | Balance between stock investment and sales | 📊 Analysis |
| **Health Stock Status** | Visual gauge (0-100%) with risk indicators | 📈 KPI |

---

## ⚙️ Key Performance KPIs

*Metrics tracking operational efficiency, quality compliance, and forecast accuracy.*

| KPI Name | Description | Focus Area |
| :--- | :--- | :--- |
| **Supply Chain Efficiency Score** | Composite metric (0-100%) measuring overall efficiency | ⚡ Operations |
| **Cold Chain Compliance %** | Temperature-controlled shipments percentage | ❄️ Quality Assurance |
| **Traceability %** | Serial number tracked orders | 📍 Tracking |
| **Regulatory Compliance Score** | Compliance audit score (0-100%) | ⚖️ Compliance |
| **Return Rate %** | Products returned vs total orders | ↩️ Reverse Logistics |
| **Return Financial Impact** | GBP cost of returns | 💵 P&L Impact |
| **Return Reason Analysis** | Breakdown by Damage/Defect/Expired/Other | 📊 Root Cause |
| **Return Processing Time** | Average days to process returns | ⏱️ Agility |
| **Forecast Accuracy %** | Demand prediction accuracy | 📊 Demand Planning |
| **MAPE** | Mean Absolute Percentage Error (Forecast accuracy) | 📈 Planning |
| **Forecast Bias** | Over/Under estimation tendency | 📊 Planning |
| **Daily Demand (90-day)** | Average with trend analysis | 📉 Trending |
| **Cost-Efficiency Analysis** | Carrier benchmarking by region | 💰 Optimization |
| **Forecast vs Actual Variance** | Weekly comparison with deviation analysis | 📊 Variance |
| **Temperature Excursions** | Count and severity of thermal incidents | 🚨 Risk Mgmt |
| **Excursion Resolution Time** | Average hours to resolve thermal incidents | ⏱️ Agility |

---

## 💰 Key Financial KPIs

*Economic indicators measuring profitability, cost-to-serve, and inventory value.*

| KPI Name | Description | Business Impact |
| :--- | :--- | :--- |
| **Revenue** | Total, MTP, YTD, Previous Month, Previous Year | 💵 Top Line |
| **COGS** | Cost of Goods Sold (Total, MTP, YTD, Previous Month, Previous Year) | 🧾 Accounting |
| **Gross Margin %** | Profitability ratio `(Revenue - COGS) / Revenue` | 💰 Profitability |
| **Total Logistics Cost** | Transport + Inventory holding combined | 📉 Cost Control |
| **Net Contribution** | Bottom line profit after all costs | 💵 P&L Health |
| **Logistics Cost %** | Logistics overhead relative to revenue | ⚡ Efficiency |
| **Efficiency Score (%)** | Logistics cost-to-revenue efficiency metric | 📊 KPI |
| **Inventory Holding Cost MTP** | Monthly accrual cost | 💸 Working Capital |
| **Inventory Holding Cost YTD** | Year-to-date accrual cost | 🏦 Accrual |
| **Revenue vs COGS Trend** | Monthly dual-axis line chart analysis | 📈 Trending |
| **COGS MTP vs YTD** | Month-to-date vs year-to-date comparison by Region | 📊 Analysis |
| **Cost Breakdown by Category** | Freight, Cold Chain, Medical, Vaccine, Other | 📋 Distribution |
| **Regional Revenue** | Breakdown by Africa, Americas, Asia, Europe | 🗺️ Geographic |
| **Delivery Performance Status** | Financial impact of Delivered/Pending/Returned/Cancelled | ✅ Status |
| **Safety Volume** | Buffer inventory quantity in GBP | 🛡️ Risk Mgmt |
| **Reorder Point** | Trigger level for ordering (cost implications) | 🔔 Planning |

---

## KPI Distribution by Dashboard

### 📊 OVERVIEW Dashboard
Primary KPIs for executive visibility and high-level performance monitoring:
- **OTIF %**, **On-Time Delivery %**, **In-Full %**, **Total Orders**, **Back Orders**
- **Revenue**, **COGS**, **Gross Margin %**
- **Performance by Region**

### 📈 PERFORMANCE Dashboard
Supply chain analytics and operational efficiency tracking:
- **Lead Time (Days)**, **Perfect Order %**, **Performance by Carrier**
- **Cost per KM**, **CO2 Emissions**, **Delivery Accuracy %**
- **Cold Chain Compliance %**, **Return Rate %**, **Forecast Accuracy %**
- **MAPE**, **Forecast Bias**, **Temperature Excursions**

### 🏭 WAREHOUSES Dashboard
Inventory and warehouse operations:
- **Warehouse Utilization %**, **Days on Hand (DOH)**, **Current Stock Levels**
- **Total Inventory Value**, **Inventory Turns**, **Dead Stock %**
- **Expiry Risk (Units)**, **Expiry Risk (GBP)**, **Health Stock Status**
- **Inventory Holding Cost**, **Inventory-to-Revenue Ratio**

### 💰 FINANCIAL Dashboard
Profitability and cost analysis:
- **Revenue**, **COGS**, **Gross Margin %**, **Net Contribution**
- **Total Logistics Cost**, **Logistics Cost %**, **Efficiency Score**
- **Cost Breakdown by Category**, **Regional Revenue**
- **Delivery Performance Status**, **Reorder Point**, **Safety Volume**

---

## KPI Measurement & Governance

**Calculation Method:** All KPIs are calculated using DAX measures (302 total measures) defined in the Power BI data model.

**Data Frequency:** Real-time updated calculations from SQL Server 2019+ source tables.

**Refresh Cycle:** Automated refresh every 9-12 seconds for optimal data timeliness.

**Quality Assurance:** All KPIs validated at SQL layer using constraints, relationships, and data quality checks before reaching Power BI.

**Target Audience:** 
- Supply Chain Managers
- Logistics Coordinators
- Financial Analysts
- Executive Leadership

---

## Related Documentation

- [Main README](../README.md) - Project overview and architecture
- [CHANGELOG](../CHANGELOG.md) - Version history and updates
- [CONTRIBUTING](../CONTRIBUTING.md) - Contribution guidelines
- [LICENSE](../LICENSE) - Proprietary licensing terms
