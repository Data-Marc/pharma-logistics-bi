# ðŸ“Š PHARMA LOGISTICS - Power BI Dashboard

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/releases)
![Status](https://img.shields.io/badge/Status-Proprietary%20-red)

---

## ðŸŽ¯ Overview

**Pharma Logistics BI** is a comprehensive pharmaceutical supply chain management dashboard built with Power BI. It provides real-time visibility into orders, transportation, inventory, quality compliance, and financial performance across multiple regions and logistics providers.

Designed for **supply chain managers, logistics coordinators, and financial analysts** to monitor KPIs, identify bottlenecks, and optimize pharmaceutical distribution operations.

### ðŸŒŸ Key Highlights
- ðŸ“Š **6 interactive dashboards** with drill-down capabilities
- ðŸ“ˆ **180+ DAX measures** for advanced analytics
- ðŸŒ **Regional analysis** : Africa, Americas, Asia, Europe (50+ countries)
- ðŸšš **Carrier benchmarking** : 7 major logistics providers (CMA, DB, DHL, FedEx, KN, Maersk, UPS)
- ðŸ’° **Financial tracking** : Revenue, COGS, margins, profitability analysis
- â„ï¸ **Cold chain monitoring** : Temperature compliance & excursion tracking
- ðŸ“¦ **Warehouse optimization** : Inventory health, Days on Hand (DOH), stock level analysis
- ðŸŒ± **Sustainability metrics** : CO2 tracking per KM, per order, total carbon footprint

---

## ðŸ“‘ Dashboard Pages

### ðŸ  **Overview** - Global Performance Dashboard

Main landing page with real-time KPIs and operational snapshot.

**Featured KPIs (6 Cards):**
- Total Orders (with YoY trend)
- OTIF % (On-Time In-Full Delivery)
- Lead Time (Days)
- In-Full % (Delivery completion rate)
- On-Time Delivery % (Punctuality)
- Back Orders (Volume)

**Key Visualizations:**
- **Performance by Carrier** : Pie chart showing order distribution across 7 carriers
- **Cost Breakdown by Category** : Stacked column chart (Freight, Cold Chain, Medical, Vaccine, Other)
- **Delivery Performance Status** : Stacked bar (Delivered/Pending/Returned/Cancelled)
- **Regional Revenue** : Horizontal bar chart by region with Â£ amounts (Africa, Americas, Asia, Europe)
- **Financial Summary** : Combo chart showing costs vs revenue trend across months

**Dynamic Filters:**
- Year-Month slider (2021-2025)
- Region multi-select (4 regions)
- Country multi-select (50+ countries)
- Transport Mode filter (Air/Sea/Land)
- Carrier dropdown (7 providers)
- Supplier Country selector

---

### ðŸ“ˆ **Performance** - Supply Chain Analytics

Detailed operational metrics with regional and carrier drill-down capabilities.

**Performance Matrices:**

**Matrix 1: Performance by Region**
- Rows: Region (Africa, Americas, Asia, Europe) - expandable to countries
- Columns: OTIF %, In-Full %, On-Time Delivery %, Perfect Order %
- Data validation by OTIF calculations
- Highlighting for performance thresholds

**Matrix 2: Performance by Carrier**
- Rows: Carrier â†’ Regional drill-down capability
- Columns: Lead Time MTD/YTD, Cost per KM, Total Logistics Cost, Efficiency Stars (â˜…â˜…â˜…/â˜…â˜…â˜†/â˜…â˜†â˜†)
- Benchmarking across carriers
- Cost-efficiency analysis

**Trend Analysis:**
- **Revenue vs COGS Line Chart** : Dual-axis visualization showing monthly trends (Jan-Dec)
  - Primary Axis: Revenue (Â£25M-Â£35M)
  - Secondary Axis: COGS (Â£12M-Â£18M)
  - Color coding: Blue (Revenue) vs Red (COGS)
  
- **COGS MTP vs YTD Combo Chart** : Month-to-date vs year-to-date comparison
  - Columns: COGS MTP (Blue #0074D9)
  - Line 1: COGS YTD (Red #FF4136)
  - Line 2: Inventory Holding Cost MTP (Orange #FFB347)
  - By Region: Africa, Americas, Asia, Europe

**Key Performance Indicators (22 Measures):**
- Perfect Order % : Orders on-time, in-full, and accurately delivered
- Supply Chain Efficiency Score : Composite metric (0-100%)
- Delivery Accuracy % : Zero receiving discrepancies
- Cold Chain Compliance % : Temperature-controlled shipments
- Order Fill Rate % : Orders fulfilled without backorders
- Average Lead Time : Days from order to delivery
- OTIF % : On-time and in-full delivery rate
- In-Full % : Complete order fulfillment rate
- On-Time Delivery % : Punctual arrivals
- CO2 Emissions : Per KM, per 100km, avg per order, total

**Use Cases:**
- Identify underperforming regions/carriers
- Benchmark carrier efficiency for negotiations
- Track month-over-month performance trends
- Monitor sustainability metrics and carbon footprint
- Drill-down into specific regions/carriers for root cause analysis

---

### ðŸ’° **Financial** - Profitability & Economics

Supply chain financial analysis with regional breakdown and carrier benchmarking.

**Supply Chain Economics Matrix by Region:**

| Metric | Value Range | Format | Target |
|--------|-------------|--------|--------|
| Revenue | Â£85M - Â£96M | Currency (Â£) | Growing |
| COGS | Â£43M - Â£48M | Currency (Â£) | Stable |
| Gross Margin % | 45-52% | Percentage | > 50% |
| Total Logistics Cost | Â£3.3M - Â£9.9M | Currency (Â£) | < Â£5M |
| Logistics Cost % | 2.9-4.2% | Percentage | < 5% |
| Net Contribution | Â£31M - Â£46M | Currency (Â£) | Maximize |
| Efficiency Score | 45-97% | Percentage (â˜… rating) | > 85% |

**Logistics Efficiency Matrix by Carrier:**

| Metric | Range | Unit | Description |
|--------|-------|------|-------------|
| Orders Volume | 2,000-3,000 | # shipments | Per carrier throughput |
| Cost per KM | Â£0.20-Â£0.30 | Â£/km | Transport efficiency |
| Cost per Order | Â£700-Â£2,000 | Â£ | Transaction cost |
| Total Logistics Cost | Varies | Â£ | Transport + inventory |
| Revenue Associated | Â£8M-Â£87M | Â£ | Orders value per carrier |
| Efficiency Stars | â˜…â˜…â˜…/â˜…â˜…â˜†/â˜…â˜†â˜† | Rating | Performance rating |

**Economic KPIs (46 Measures Across Financial Table):**

Financial Metrics:
- Revenue (Total, MTP, YTD, Previous Month, Previous Year)
- COGS (Total, MTP, YTD, Previous Month, Previous Year)
- Gross Margin % (Profitability ratio)
- Total Logistics Cost (Transport + Inventory holding)
- Net Contribution (Bottom line profit)
- Cost per KM (Transport efficiency)
- Efficiency Score (%) (1 - Logistics/Revenue Ã— 100)
- Logistics Cost % (Overhead ratio)
- Inventory Holding Cost MTP (Monthly accrual)
- Inventory Holding Cost YTD (Year-to-date accrual)

Performance vs Target:
- Revenue Target vs Actual
- COGS Budget vs Actual
- Logistics Cost Budget vs Actual
- Margin Achievement %
- Efficiency Score Trend

Regional Breakdown:
- Revenue by Region (4 regions)
- COGS by Region
- Logistics Cost by Region
- Margin % by Region
- Growth Rate % (YoY)

**Use Cases:**
- Monitor regional profitability and identify margin opportunities
- Benchmark carrier cost efficiency for negotiations and optimizations
- Track month-over-month financial performance and variance analysis
- Identify cost optimization opportunities across logistics functions
- Analyze revenue impact of carrier selection
- Monitor budget compliance and forecast accuracy

---

### ðŸ“¦ **Warehouses** - Inventory Optimization

Comprehensive warehouse management with stock health monitoring and risk assessment.

**Health Stock Status (Volumes & Units):**
- Visual gauge showing % of optimal stock (0-100%)
- Risk indicators: â–² (Healthy/Green), â—† (Balanced/Yellow), â–¼ (Low/Red)
- 15 warehouse locations tracked globally
- Real-time stock position

**Days on Hand Analysis (90-day window):**
- DOH by warehouse with color-coded thresholds
- Risk Assessment Levels:
  - ðŸ”´ Understock : < 30 days (stockout risk)
  - ðŸŸ¡ Balanced : 30-40 days (optimal)
  - ðŸŸ¢ Healthy : > 40 days (buffer available)
- Demand-based projections
- Trend analysis

**Warehouse KPIs (32 Measures):**

Inventory Position:
- Min Stock Level (average across warehouses)
- Safety Volume (buffer inventory quantity)
- Max Volume Capacity (storage limit by warehouse)
- Reorder Point (trigger level for ordering)
- Current Stock Levels (real-time units by warehouse)
- Total Inventory Value (Â£)

Warehouse Operations:
- Orders per Warehouse (throughput metric)
- Warehouse Utilization % (capacity used)
- Inventory Turns (COGS / Avg Inventory Value)
- Inventory Accuracy % (Physical count validation)
- Daily Demand (90-day average)
- Total Outbound (shipment volume)

Risk Metrics:
- Expiry Risk (Units) (products expiring soon - 30/60/90 days)
- Expiry Risk (Â£) (financial impact of expiring stock)
- Risk Category : Low/Balanced/Healthy/Overstock
- Stock-out Financial Impact (Â£)
- Overstock Carrying Cost (Â£)
- Inventory Holding Cost (annual Â£)
- Dead Stock % (non-moving inventory)
- Inventory-to-Revenue Ratio

**Use Cases:**
- Optimize stock levels by warehouse to minimize carrying costs
- Prevent stockouts and lost sales situations
- Monitor inventory aging and expiry risk
- Maximize warehouse space utilization
- Reduce inventory holding costs
- Plan warehouse capacity needs

---

### âœ… **Quality** - Compliance & Temperature Control

Quality assurance and cold chain compliance monitoring for pharmaceutical products.

**Quality KPIs (20 Measures):**

Compliance Metrics:
- Cold Chain Compliance % (Temperature-controlled shipments)
- Delivery Accuracy % (Zero receiving discrepancies)
- Traceability % (Serial number tracked orders)
- Regulatory Compliance Score (0-100%)

Returns & Quality:
- Return Rate (%) (Products returned / total orders)
- Return Financial Impact (Â£) (Cost of returns)
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

**Temperature Excursion Tracking:**
- Events detected and logged in real-time
- Severity levels classification (Low/Medium/High)
- Product impact assessment per excursion
- Root cause analysis and prevention measures
- Documentation for regulatory compliance

**Use Cases:**
- Maintain pharmaceutical regulatory compliance (GxP)
- Identify quality issues early for prevention
- Track product recalls and communicate with stakeholders
- Monitor forecast accuracy for inventory planning
- Ensure cold chain integrity throughout supply chain

---

### ðŸ”® **Forecast** - Demand Planning

Demand forecasting and accuracy analysis for inventory optimization.

**Forecast Metrics:**
- Forecast Accuracy (%) : Predicted vs Actual demand alignment
- MAPE (Mean Absolute Percentage Error) : Industry-standard forecast error rate
- Forecast Bias : Under/over forecasting tendency
- Actual vs Forecast : Weekly comparison with variance analysis

**Data Tracked:**
- Weekly Forecast Data : ForecastQty, ActualQty, Error tracking
- Daily Demand (90-day average) : Trend analysis and seasonality
- Lead Time Forecasts : Supplier and carrier lead time predictions
- Demand Volatility Index : Coefficient of variation

**Use Cases:**
- Improve demand planning accuracy
- Optimize safety stock levels
- Reduce forecast errors
- Plan inventory levels based on predicted demand
- Identify seasonal patterns and trends

---

## ðŸ—ï¸ Architecture & Data Model

### Technology Stack

| Component | Technology | Version |
|-----------|-----------|---------|
| **BI Platform** | Power BI Desktop | Latest (Premium License) |
| **Data Engine** | Analysis Services | Tabular Model |
| **Database** | SQL Server | 2019+ (SQLEXPRESS) |
| **Query Language** | DAX (Data Analysis Expressions) | Latest |
| **Scripting** | Power Query M Language | Latest |
| **Data Model** | Star Schema | 29 tables, 20 relationships |
| **Measures** | DAX Calculations | 180+ KPIs |

### Data Model Overview

```
CORE FACT TABLES:
â”œâ”€â”€ ORDERS (Fact) â†’ 20+ relationships
â”‚   â”œâ”€â”€ â†’ CUSTOMERS
â”‚   â”œâ”€â”€ â†’ PRODUCTS
â”‚   â”œâ”€â”€ â†’ WAREHOUSES
â”‚   â”œâ”€â”€ â†’ DATE
â”‚   â””â”€â”€ â†’ SUPPLIERS (via Products)
â”‚
â”œâ”€â”€ TRANSPORTATION (Fact)
â”‚   â”œâ”€â”€ â†’ ORDERS
â”‚   â”œâ”€â”€ â†’ DIM_CARRIER
â”‚   â””â”€â”€ â†’ DATE
â”‚
â”œâ”€â”€ INVENTORY (Fact)
â”‚   â”œâ”€â”€ â†’ WAREHOUSES
â”‚   â”œâ”€â”€ â†’ PRODUCTS
â”‚   â””â”€â”€ â†’ DATE
â”‚
â”œâ”€â”€ RETURNS (Fact)
â”‚   â”œâ”€â”€ â†’ ORDERS
â”‚   â”œâ”€â”€ â†’ PRODUCTS
â”‚   â””â”€â”€ â†’ DATE
â”‚
â””â”€â”€ TEMPERATURE_EXCURSIONS (Fact)
    â”œâ”€â”€ â†’ TRANSPORTATION
    â”œâ”€â”€ â†’ PRODUCTS
    â””â”€â”€ â†’ DATE

DIMENSION TABLES:
â”œâ”€â”€ DATE (365+ days)
â”œâ”€â”€ CUSTOMERS
â”œâ”€â”€ PRODUCTS
â”œâ”€â”€ WAREHOUSES
â”œâ”€â”€ SUPPLIERS
â”œâ”€â”€ DIM_CARRIER
â””â”€â”€ COUNTRIES

MEASURE TABLES (Non-Summarizable):
â”œâ”€â”€ Overview Measures (12 KPIs)
â”œâ”€â”€ Performance Measures (22 KPIs)
â”œâ”€â”€ Financial Measures (46 KPIs)
â”œâ”€â”€ Quality Measures (20 KPIs)
â”œâ”€â”€ Warehouses Measures (32 KPIs)
â””â”€â”€ CO2 Measures (15 KPIs)
```

### Star Schema Details

**Fact Tables (5):**
- Orders : 50,000+ transaction records
- Transportation : 15,000+ shipment records
- Inventory : 8,000+ daily position records
- Returns : 2,000+ return records
- Temperature Excursions : 500+ event records

**Dimension Tables (7):**
- Date : Complete calendar (2021-2025)
- Customers : 200+ pharmaceutical distributors
- Products : 300+ pharmaceutical products
- Warehouses : 15 distribution centers
- Suppliers : 100+ pharmaceutical manufacturers
- DIM_Carrier : 7 logistics providers
- Countries : 50+ nations

**Relationships (20):**
- All marked as "Active" for auto-propagation
- Filter direction: One-to-Many
- Cross-filtering: Both (for performance analysis)
- USERELATIONSHIP() for multi-path analysis

---

## âœ¨ Key Features

âœ… **Time Intelligence**
- MTD (Month-To-Date), YTD (Year-To-Date)
- Previous Month (PM), Previous Year (PY) comparisons
- Custom date range filtering with slicer
- Rolling 90-day calculations

âœ… **Regional Drill-Down**
- 4 regions : Africa, Americas, Asia, Europe
- Country-level granularity (50+ countries)
- Regional performance benchmarking
- Comparative analysis across regions

âœ… **Carrier Benchmarking**
- 7 carriers : CMA, DB, DHL, FedEx, KN, Maersk, UPS
- Cost per KM, Lead time, Compliance tracking
- Performance vs Target comparisons
- Cost efficiency ranking

âœ… **Financial Analysis**
- Revenue, COGS, Gross Margin %
- Net Contribution, Efficiency Score
- Cost breakdown by category and region
- Budget vs Actual variance analysis

âœ… **Environmental Metrics**
- CO2 tracking per KM, per 100km, per order, total
- Carbon footprint dashboard
- Sustainability KPI monitoring
- Green logistics benchmarking

âœ… **Quality & Compliance**
- Cold chain compliance monitoring (%)
- Delivery accuracy tracking (%)
- Temperature excursion alerts
- Returns & refunds analysis
- Regulatory compliance score

âœ… **Warehouse Optimization**
- Stock health status (Health %, DOH)
- Inventory turns & accuracy (%)
- Risk indicators â–² â—† â–¼
- Expiry risk warnings (30/60/90 days)
- Capacity utilization tracking

âœ… **Visual Indicators**
- Stars (â­â­â­ / â­â­â˜† / â­â˜†â˜†) for ratings
- Triangles (â–² Green / â—† Yellow / â–¼ Red) for status
- Color-coded KPI cards with trend arrows
- Conditional formatting for performance

âœ… **Interactive Controls**
- 10+ dynamic slicers and filters
- Drill-down capabilities (Region â†’ Country)
- Cross-filtering between visuals
- Bookmark navigation between pages
- Year-Month slider for time selection

---

## ðŸš€ Quick Start

### Prerequisites
- **Power BI Desktop** (Latest version, Premium preferred)
- **SQL Server 2019+** with PharmaLogistics database
- **RAM**: 2GB minimum, 4GB+ recommended for smooth performance
- **Disk Space**: 1.5GB for Power BI file and dependencies

### Installation Steps

1. **Clone this repository**
   ```bash
   git clone https://github.com/Data-Marc/pharma-logistics-bi.git
   cd pharma-logistics-bi
   ```

2. **Download Power BI File**
   - Get `Pharma Logistics.pbix` from GitHub releases or main branch
   - Place in your local projects folder

3. **Open in Power BI Desktop**
   ```
   File â†’ Open â†’ Select Pharma Logistics.pbix
   ```

4. **Configure SQL Server Connection**
   - When prompted, enter connection details:
   ```
   Server: localhost\SQLEXPRESS (or your server name)
   Database: PharmaLogistics
   Authentication: Windows Integrated (or SQL credentials)
   ```

5. **Refresh Data**
   ```
   Home â†’ Refresh (Ctrl + Shift + R)
   Wait for all 29 tables to refresh (15-20 seconds typical)
   ```

6. **Explore Dashboards**
   - **Overview** : Start here for global KPIs
   - **Performance** : Regional and carrier analysis
   - **Financial** : Profitability metrics by region/carrier
   - **Warehouses** : Inventory health and DOH analysis
   - **Quality** : Compliance and returns tracking
   - **Forecast** : Demand planning accuracy

**See [SETUP_GUIDE.md](docs/SETUP_GUIDE.md) for detailed installation, troubleshooting, and advanced configuration.**

---

## ðŸ“š Documentation

Complete documentation suite in English:

| Document | Purpose | Audience |
|----------|---------|----------|
| **[README.md](README.md)** | This file - project overview & features | Everyone |
| **[SETUP_GUIDE.md](docs/SETUP_GUIDE.md)** | Installation, configuration, troubleshooting | Admins, New users |
| **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** | Technical design, data model, DAX patterns, optimization tips | Developers, Advanced users |
| **[DATA_DICTIONARY.md](docs/DATA_DICTIONARY.md)** | Complete data reference, all 180+ measures, KPI definitions | Analysts, Developers |
| **[CHANGELOG.md](CHANGELOG.md)** | Version history and release notes | Project managers |
| **[CONTRIBUTING.md](CONTRIBUTING.md)** | How to contribute improvements and extensions | Contributors |
| **[LICENSE](LICENSE)** | MIT License terms and conditions | Legal |

---

## ðŸ¤ Contributing

We welcome contributions! Whether bug fixes, feature requests, or documentation improvements.

**Steps:**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit with clear message (`git commit -m 'Add amazing feature'`)
5. Push to branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request with description

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

**Contribution Areas:**
- ðŸ› Bug fixes and error handling
- ðŸ“Š New visualizations or KPIs
- ðŸ“ Documentation improvements
- ðŸ” Performance optimizations
- ðŸŒ Localization to other languages
- ðŸ§ª Testing and validation scripts

---

## ðŸ“Š Sample Use Cases

### 1. **Supply Chain Manager**
Monitor regional performance, carrier efficiency, identify bottlenecks
- Dashboard: Overview â†’ Performance â†’ Financial
- Action: Compare carriers, identify underperformers, negotiate contracts

### 2. **Finance Controller**
Track costs, margins, profitability by region and carrier
- Dashboard: Financial (primary), Overview (KPIs)
- Action: Monitor budget compliance, analyze variance, forecast cash flow

### 3. **Warehouse Manager**
Monitor inventory health, optimize stock levels, reduce holding costs
- Dashboard: Warehouses (primary), Quality (returns analysis)
- Action: Adjust stock levels, manage expiry risk, improve efficiency

### 4. **Logistics Coordinator**
Track shipments, monitor on-time/in-full delivery, manage carriers
- Dashboard: Performance (primary), Overview (KPIs)
- Action: Route optimization, carrier alerts, exception management

### 5. **Quality Assurance**
Monitor cold chain compliance, track returns, analyze forecast accuracy
- Dashboard: Quality (primary), Forecast (forecasting)
- Action: Compliance reporting, root cause analysis, preventive measures

### 6. **Executive / C-Suite**
High-level business metrics, strategic trends, competitive position
- Dashboard: Overview (main KPIs), Financial (profitability)
- Action: Strategic planning, board reporting, investment decisions

---

## ðŸ› Known Issues & Roadmap

### Current Version (1.0.0) âœ…
- âœ… Full dashboard suite (6 pages, 20+ visuals)
- âœ… 180+ measures across 5 measure tables
- âœ… Multi-region analysis (4 regions, 50+ countries)
- âœ… Carrier benchmarking (7 providers)
- âœ… Financial analytics and profitability tracking
- âœ… Warehouse inventory optimization
- âœ… Quality compliance monitoring
- âœ… Demand forecasting
- âœ… Comprehensive documentation

### Planned Features (v1.1) ðŸš€
- [ ] Export to PDF automation with formatting
- [ ] Real-time data refresh via cloud gateway
- [ ] Mobile-optimized report layouts
- [ ] Advanced forecasting with ML algorithms
- [ ] Budget vs Actual tracking and variance analysis
- [ ] Predictive analytics for demand (Prophet/ARIMA)
- [ ] External API integration for real-time events
- [ ] Anomaly detection for KPI outliers
- [ ] Automated alerts for threshold violations

### Long-term Vision (v2.0+) ðŸŽ¯
- [ ] Power BI Service cloud deployment
- [ ] Governance framework and access controls
- [ ] Data certification and quality metrics
- [ ] Advanced AI features (Q&A, Key Influencers)
- [ ] Custom visuals for pharmaceutical industry
- [ ] Integration with ERP systems (SAP, Oracle)
- [ ] Supply chain simulation and scenario planning
- [ ] Blockchain traceability for product authenticity

---

## ðŸ“ž Support & Contact

**For Help:**
- ðŸ“– Check [SETUP_GUIDE.md](docs/SETUP_GUIDE.md) for common troubleshooting
- ðŸ› Open an GitHub issue for bugs or errors (with details/screenshots)
- ðŸ’¡ Suggest features in GitHub Discussions
- ðŸ“§ Contact project owner for urgent issues

**Common Issues:**
- Connection errors â†’ See SETUP_GUIDE Connection section
- Slow refresh â†’ See ARCHITECTURE Performance tuning
- Measure errors â†’ See DATA_DICTIONARY Formula details
- Visual issues â†’ Check Power BI desktop version is latest

---

## ðŸ“ˆ Project Metrics

| Metric | Value |
|--------|-------|
| Dashboard Pages | 6 |
| Visuals Count | 20+ |
| Measure Tables | 5 (Overview, Performance, Financial, Quality, Warehouses) |
| Total Measures | 180+ |
| Data Tables | 29 (5 fact, 7 dimension, 17 references) |
| Relationships | 20 (all active) |
| Report File Size | ~150MB |
| Data Volume | 75,000+ records across fact tables |
| Refresh Time | 15-20 seconds (typical) |
| Data Retention | 5 years (2021-2025) |
| Users Supported | 50+ concurrent |
| Regions Covered | 4 (Africa, Americas, Asia, Europe) |
| Countries Included | 50+ |
| Carriers Tracked | 7 |
| Languages | 1 (English) |

---

## ðŸŽ“ Learning Resources

**Power BI:**
- [Power BI Official Documentation](https://docs.microsoft.com/power-bi/)
- [DAX Function Reference](https://dax.guide/)
- [Power Query Documentation](https://learn.microsoft.com/power-query/)

**Pharmaceutical Supply Chain:**
- [WHO Guidelines on Cold Chain](https://www.who.int/teams/health-product-policy-and-standards)
- [GxP Compliance Framework](https://www.fda.gov/drugs)
- [Logistics Best Practices](https://www.apics.org/)

**Business Analytics:**
- [APICS Supply Chain Management](https://www.apics.org/learn/career-resources)
- [Financial Metrics Guide](https://www.investopedia.com)
- [KPI Definitions](https://www.performancemanagementpractice.com)

---

## ðŸ™ Acknowledgments

Built with focus on:
- Performance monitoring and continuous improvement
- Financial transparency and cost optimization
- Operational efficiency and resource utilization
- Quality compliance and pharmaceutical standards
- Data-driven decision making and analytics
- Professional documentation and maintainability

**Special Thanks:**
- SQL Server and Analysis Services teams
- Power BI community contributors
- Pharmaceutical logistics industry best practices

---

## ðŸ“„ License

This project is licensed under the **MIT License** - see [LICENSE](LICENSE) file for complete terms.

**Permission granted to:**
- âœ… Use commercially
- âœ… Modify and distribute
- âœ… Use privately
- âœ… Include in larger projects

**Requirements:**
- âš ï¸ Include license and copyright notice
- âš ï¸ No liability for authors

---

## ðŸš€ Getting Started Next Steps

1. **Download** the latest Power BI file from releases
2. **Follow** SETUP_GUIDE.md for installation
3. **Connect** to your SQL Server database
4. **Refresh** data and explore dashboards
5. **Customize** filters and KPIs for your organization
6. **Share** with your team and stakeholders
7. **Extend** with additional measures or visualizations

---

**Version** : 1.0.0  
**Last Updated** : December 2025  
**Author** : Marc James Samson (Data-Marc)  
**Status** : âœ… Production Ready - Fully Functional  
**License** : ðŸ“„ MIT  
**Repository** : https://github.com/Data-Marc/pharma-logistics-bi

---

## â­ Show Your Support

If you find this project useful for your pharmaceutical supply chain analytics:
- **â­ Star** this repository
- **ðŸ”” Watch** for updates
- **ðŸ“¤ Share** with your network
- **ðŸ’¬ Comment** with feedback
- **ðŸ› Report** issues you find
- **ðŸ¤ Contribute** improvements

**Thank you for using Pharma Logistics BI! Happy analyzing! ðŸ“Š**

