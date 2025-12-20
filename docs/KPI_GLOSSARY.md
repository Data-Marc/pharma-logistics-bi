# KPI Glossary - Calculation Methods

Complete reference guide for all 61 KPIs with calculation methodologies and formulas.

## Notes :

- All calculations follow industry-standard methodologies independent of system implementation
- Pharmaceutical-specific considerations are embedded in target thresholds
- Formulas can be aggregated by region, product category, carrier, or customer segment
- Historical trends should be tracked month-over-month and year-over-year

---

##  Transport & Logistics KPIs (12)

### OTIF % (On-Time In-Full Delivery Rate)
**Calculation Method:**
```
OTIF % = (Orders On-time ∩ In-full) ÷ Total Orders × 100%
```
**Example:** 950 ÷ 1,000 × 100% = 95% OTIF

---

### Lead Time
**Calculation Method:**
```
Lead Time = Σ(Delivery Date - Order Date) ÷ Number of Orders
```
**Example:** 500 days ÷ 100 orders = 5 days average

---

### Cost per KM
**Calculation Method:**
```
Cost per KM = Total Transport Cost (£) ÷ Total KM Traveled
```
**Example:** £50,000 ÷ 100,000 km = £0.50/km

---

### CO2 Emissions
**Calculation Method:**
```
CO2 per KM = Total CO2 Emissions (kg) ÷ Total KM Traveled
```
**Example:** 50,000 kg ÷ 100,000 km = 0.5 kg/km

---

### On-Time %
**Calculation Method:**
```
On-Time % = (Deliveries on schedule) ÷ Total Deliveries × 100%
```
**Example:** 950 ÷ 1,000 × 100% = 95%

---

### In-Full %
**Calculation Method:**
```
In-Full % = (Complete Orders) ÷ Total Orders × 100%
```
**Example:** 980 ÷ 1,000 × 100% = 98%

---

### Shipment Count
**Calculation Method:**
```
Shipment Count = Number of active shipments in transit
```
**Example:** 500 shipments currently in logistics network

---

### Average Transit Time
**Calculation Method:**
```
Average Transit Time = Σ(Transit Days) ÷ Number of Shipments
```
**Example:** 1,000 days ÷ 200 shipments = 5 days average

---

### Carrier Performance Score
**Calculation Method:**
```
Carrier Score (0-100%) = Weighted average of:
  - OTIF (40% weight)
  - Damage Rate (30% weight)
  - Compliance (30% weight)
```
**Example:** (95% × 0.4) + (98% × 0.3) + (99% × 0.3) = 96.7%

---

### Damage Rate %
**Calculation Method:**
```
Damage Rate % = (Damaged Shipments) ÷ Total Shipments × 100%
```
**Example:** 20 ÷ 1,000 × 100% = 2%

---

### First-Mile Cost
**Calculation Method:**
```
First-Mile Cost = Freight + Fuel + Labor + Vehicle Depreciation
```
**Example:** £300/shipment average

---

### Last-Mile Cost
**Calculation Method:**
```
Last-Mile Cost = Freight + Fuel + Labor + Vehicle Depreciation
```
**Example:** £500/shipment average

---

##  Warehouse & Inventory KPIs (14)

### Days on Hand (DOH)
**Calculation Method:**
```
DOH = (Average Inventory Value ÷ Daily COGS) × Number of Days
  OR
DOH = 365 ÷ Inventory Turnover Ratio
```
**Example:** £500,000 ÷ £5,000 × Number of Days = 100 days

---

### Inventory Turnover
**Calculation Method:**
```
Inventory Turnover = Cost of Goods Sold ÷ Average Inventory Value
```
**Example:** £10M ÷ £1M = 10 turns/year

---

### Expiry Risk (£)
**Calculation Method:**
```
Expiry Risk = Σ(Units at Risk × Unit Cost)
  where (Expiry Date - Today) ≤ 90 days
```
**Example:** 500 units × £50 = £25,000 expiry risk

---

### Dead Stock %
**Calculation Method:**
```
Dead Stock % = (Non-moving Inventory Value) ÷ Total Inventory Value × 100%
  where Last sale > 90 days ago
```
**Example:** £50,000 ÷ £1M × 100% = 5%

---

### Warehouse Capacity %
**Calculation Method:**
```
Capacity % = (Current Volume) ÷ Maximum Volume × 100%
```
**Example:** 750 m³ ÷ 1,000 m³ × 100% = 75%

---

### Stock Accuracy %
**Calculation Method:**
```
Accuracy % = (Accurate Items) ÷ Total Items Audited × 100%
```
**Example:** 950 ÷ 1,000 × 100% = 95%

---

### Shrinkage %
**Calculation Method:**
```
Shrinkage % = (Unaccounted Loss) ÷ Total Inventory × 100%
  Losses: Theft + Damage + Errors + Expiration
```
**Example:** £20,000 ÷ £1M × 100% = 2%

---

### Cycle Count Variance
**Calculation Method:**
```
Variance = Average absolute difference between physical count and system count
  for sampled locations
```
**Example:** Average variance of 3 units per location

---

### SKU Count
**Calculation Method:**
```
SKU Count = Total number of distinct product codes in inventory
```
**Example:** 2,500 different products tracked

---

### Slow-Moving SKU %
**Calculation Method:**
```
Slow-Moving % = (SKUs with <1 sale/month) ÷ Total SKUs × 100%
```
**Example:** 250 ÷ 2,500 × 100% = 10%

---

### Warehouse Cost per Unit
**Calculation Method:**
```
Cost per Unit = Total Warehouse Cost ÷ Total Units Processed
  = (Rent + Labor + Utilities + Equipment) ÷ Units
```
**Example:** £300,000 ÷ 50,000 = £6/unit

---

### Storage Location Utilization
**Calculation Method:**
```
Utilization % = (Occupied Locations) ÷ Total Locations × 100%
```
**Example:** 7,500 ÷ 10,000 × 100% = 75%

---

### Bin Level Accuracy
**Calculation Method:**
```
Accuracy % = (Correct Locations) ÷ Total Items Sampled × 100%
```
**Example:** 980 ÷ 1,000 × 100% = 98%

---

### Stock Obsolescence Rate
**Calculation Method:**
```
Obsolescence % = (Obsolete Inventory Value) ÷ Total Inventory × 100%
  Items: Expired + Unsaleable + Damaged Beyond Repair
```
**Example:** £30,000 ÷ £1M × 100% = 3%

---

## ⚙️ Performance & Quality KPIs (18)

### Cold Chain Compliance %
**Calculation Method:**
```
Compliance % = (Compliant Shipments) ÷ Total Cold-Chain Shipments × 100%
  where Min Temp ≤ Actual ≤ Max Temp
```
**Example:** 980 ÷ 1,000 × 100% = 98%

---

### MAPE (Mean Absolute Percentage Error)
**Calculation Method:**
```
MAPE = (1÷n) × Σ(|Actual - Forecast| ÷ Actual) × 100%
```
**Example:** |10| ÷ 90 × 100% = 11.1% error

---

### Temperature Excursions
**Calculation Method:**
```
Count = Incidents where Temp < Min OR Temp > Max
Severity = Duration (hours) × Deviation (°C)
```
**Example:** 2 incidents; Severity: 4 hours × 2°C = 8°C·hours

---

### Supply Chain Efficiency
**Calculation Method:**
```
Efficiency = (OTIF × 25%) + (Order Accuracy × 25%) 
           + (On-time % × 25%) + (Processing Time × 25%)
```
**Example:** (90% × 0.25) + (95% × 0.25) + (92% × 0.25) + (88% × 0.25) = 91.25%

---

### Regulatory Compliance Score
**Calculation Method:**
```
Score % = (Requirements Met) ÷ Total Requirements × 100%
  Based on: GxP + Documentation + Traceability + Cold Chain
```
**Example:** 145 ÷ 150 × 100% = 96.7%

---

### Return Rate %
**Calculation Method:**
```
Return % = (Units Returned) ÷ Total Units Shipped × 100%
```
**Example:** 50 ÷ 10,000 × 100% = 0.5%

---

### Forecast Bias
**Calculation Method:**
```
Bias = Average of (Actual - Forecast) for all periods
  Positive (+) = Over-forecast; Negative (-) = Under-forecast
```
**Example:** Average bias of +5 units (over-forecasting)

---

### Excursion Resolution Time
**Calculation Method:**
```
Resolution Time (hours) = Time from detection to corrective action
```
**Example:** Average 2 hours from alert to resolution

---

### Order Accuracy %
**Calculation Method:**
```
Accuracy % = (Correctly Picked & Packed Orders) ÷ Total Orders × 100%
```
**Example:** 995 ÷ 1,000 × 100% = 99.5%

---

### Processing Time
**Calculation Method:**
```
Processing Time (hours) = Time from order receipt to shipment
```
**Example:** Average 24 hours from order to dispatch

---

### System Uptime %
**Calculation Method:**
```
Uptime % = (Available hours - Downtime hours) / Available hours × 100
```
**Example:** 23.5 hours up / 24 hours = 97.9% uptime

---

### Perfect Order %
**Calculation Method:**
```
Perfect Order % = (Orders Meeting ALL 4 Criteria) ÷ Total Orders × 100%
  Criteria: 1) On-time AND 2) In-full AND 3) No Damage AND 4) Correct Items
```
**Example:** 920 ÷ 1,000 × 100% = 92%

---

### Exception Rate %
**Calculation Method:**
```
Exception % = (Orders Requiring Manual Intervention) ÷ Total Orders × 100%
  Exceptions: Address Issues + Missing Docs + Special Handling
```
**Example:** 30 ÷ 1,000 × 100% = 3%

---

### Quality Score
**Calculation Method:**
```
Quality = (Product Quality × 30%) + (Documentation × 30%) 
        + (Batch Integrity × 20%) + (Compliance × 20%)
```
**Example:** (95% × 0.3) + (92% × 0.3) + (98% × 0.2) + (96% × 0.2) = 95.1%

---

### Customer Satisfaction %
**Calculation Method:**
```
Satisfaction % = (Satisfied Customers) ÷ Total Surveyed × 100%
  Survey: Delivery Performance + Product Quality + Support
```
**Example:** 850 ÷ 1,000 × 100% = 85%

---

### SLA Achievement %
**Calculation Method:**
```
Achievement % = (Periods Meeting SLA) ÷ Total Periods × 100%
  SLAs: Delivery Time + Accuracy + Damage Rate + Response Time
```
**Example:** 48 ÷ 50 × 100% = 96%

---

### Batch Integrity %
**Calculation Method:**
```
Integrity % = (Batches Passing All Checks) ÷ Total Batches × 100%
  Checks: Sterility + Potency + Purity + Packaging Integrity
```
**Example:** 495 ÷ 500 × 100% = 99%

---

### Documentation Accuracy %
**Calculation Method:**
```
Accuracy % = (Correct Documents) ÷ Total Documents × 100%
  Docs: Shipping + Compliance + Temperature Logs + Customs
```
**Example:** 980 ÷ 1,000 × 100% = 98%

---

##  Financial & Revenue KPIs (17)

### Gross Margin %
**Calculation Method:**
```
Gross Margin % = ((Revenue - COGS) ÷ Revenue) × 100%
```
**Example:** ((£1M - £600K) ÷ £1M) × 100% = 40%

---

### Total Logistics Cost
**Calculation Method:**
```
Total Cost = Transport Cost + Warehouse Cost + Inventory Holding Cost
  = Freight + Fuel + Labor + Depreciation (Transport)
  + Rent + Labor + Utilities + Equipment (Warehouse)
  + Insurance + Interest + Shrinkage + Damage (Holding)
```
**Example:** £500K + £300K + £150K = £950K

---

### Net Contribution
**Calculation Method:**
```
Net Contribution = Revenue - COGS - Total Logistics Cost - Overhead
```
**Example:** £1M - £600K - £950K - £50K = -£600K (loss)

---

### Logistics Cost %
**Calculation Method:**
```
Logistics Cost % = (Total Logistics Cost) ÷ Revenue × 100%
```
**Example:** £950K ÷ £12M × 100% = 7.9%

---

### Inventory Holding Cost
**Calculation Method:**
```
Annual Holding Cost = Average Inventory Value × Holding Cost Rate
  Rate = (Rent + Labor + Insurance + Shrinkage) ÷ Average Inventory
```
**Example:** £1M × 25% = £250K/year

---

### Stock-out Impact
**Calculation Method:**
```
Impact = Lost Sales Revenue from Stock-outs
        = Demand During Stock-out × Lost Profit Margin
```
**Example:** 100 units × £200 margin = £20K lost

---

### Cost of Goods Sold
**Calculation Method:**
```
COGS = Beginning Inventory + Purchases - Ending Inventory
  OR
COGS = Product Cost × Units Sold
```
**Example:** £10M COGS for period

---

### Expiry Loss (£)
**Calculation Method:**
```
Loss = Σ(Units Expired × Unit Cost)
```
**Example:** 200 units × £50 = £10K expiry loss

---

### Revenue per Order
**Calculation Method:**
```
Revenue per Order = Total Revenue ÷ Number of Orders
```
**Example:** £1M ÷ 5,000 orders = £200/order

---

### Order Value Growth %
**Calculation Method:**
```
Growth % = ((Current Year Average - Prior Year Average) ÷ Prior Year Average) × 100%
```
**Example:** ((£220 - £200) ÷ £200) × 100% = 10%

---

### Transportation Cost %
**Calculation Method:**
```
Transport % = (Total Transport Cost) ÷ Total Revenue × 100%
```
**Example:** £1.2M ÷ £12M × 100% = 10%

---

### Warehouse Cost per Unit
**Calculation Method:**
```
Cost per Unit (£) = Total Warehouse Operating Cost / Total Units
```
**Example:** £600K / 100,000 units = £6 per unit

---

### Fulfillment Cost per Order
**Calculation Method:**
```
Cost per Order = (Picking + Packing + Shipping Labor + Materials) ÷ Orders
```
**Example:** £1.2M ÷ 5,000 orders = £240/order

---

### Inventory Carrying Cost %
**Calculation Method:**
```
Carrying Cost % = (Annual Holding Cost) ÷ Average Inventory Value × 100%
```
**Example:** £250K ÷ £1M × 100% = 25%/year

---

### Revenue Realization %
**Calculation Method:**
```
Realization % = (Actual Revenue) ÷ Forecasted Revenue × 100%
```
**Example:** £11.5M ÷ £12M × 100% = 95.8%

---

### Margin Trend %
**Calculation Method:**
```
Trend % = ((Current Margin - Prior Margin) ÷ Prior Margin) × 100%
```
**Example:** ((39% - 40%) ÷ 40%) × 100% = -2.5% (declining)

---

### Break-Even Point (Units)
**Calculation Method:**
```
Break-Even Units = Fixed Costs ÷ (Price per Unit - Variable Cost per Unit)
```
**Example:** £100K ÷ (£200 - £120) = 1,250 units

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

<a href="https://www.linkedin.com/in/samson18/" target="_blank" style="text-decoration: none;"><img src="./images/Linkedin 96 crop 4.png" width="39" height="39" style="vertical-align: middle;"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://youtu.be/FwUXnIbzaoo" target="_blank" style="text-decoration: none;"><img src="./images/Youtube 96 crop 4.png" width="39" height="39" style="vertical-align: middle;"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://marc-james-samson.notion.site/Portfolio-Marc-James-Samson-2a8e9aa7668d8060a208f8b13f609e7b" target="_blank" style="text-decoration: none;"><img src="./images/Notion 96 crop 7 .png" width="39" height="39" style="vertical-align: middle;"/></a>

</div>
