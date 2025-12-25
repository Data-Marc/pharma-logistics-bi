#﻿# Data Dictionary - Pharma Logistics BI

Complete reference for all tables, columns, and measures.

---


### Fact Tables:

### Orders
Primary transaction table for all pharmaceutical orders.

| Column               | Data Type   | Description                                                                                  |
|----------------------|-------------|----------------------------------------------------------------------------------------------|
| OrderID              | String      | Unique order identifier                                                                      |
| CustomerID           | String      | Foreign key to Customers table                                                               |
| ProductID            | String      | Foreign key to Products table                                                                |
| ShipDate             | DateTime    | Date the order was shipped                                                                   |
| Quantity             | Integer     | Order quantity (units)                                                                       |
| UnitPrice            | Decimal     | Price per unit at the time of order                                                          |
| TotalCost            | Decimal     | Total order value (£)                                                                        |
| WarehouseID          | String      | Warehouse that fulfilled the order                                                           |
| Region               | String      | Geographic region of the order                                                               |
| Status               | String      | Order status (e.g., Delivered, Returned, Pending)                                            |
| BatchNo              | String      | Batch number for traceability                                                                |
| ExpiryDate           | DateTime    | Expiry date of the product in the order                                                      |
| TemperatureRange     | String      | Required temperature range for the product                                                   |
| ColdChainRequired    | String      | Indicates if cold chain is required ("Yes"/"No")                                             |
| RequestedDeliveryDate| DateTime    | Date requested by the customer for delivery                                                  |
| DeliveryDate         | DateTime    | Actual delivery date                                                                         |
| DeliveredQuantity    | Integer     | Quantity actually delivered                                                                  |
| OnTime_Flag          | Integer     | 1 if delivered on time, 0 otherwise                                                          |
| InFull_Flag          | Integer     | 1 if delivered in full, 0 otherwise                                                          |
| OTIF_Flag            | Integer     | 1 if On Time In Full, 0 otherwise                                                            |
| DeliveryAccuracy     | Decimal     | Accuracy of delivery (e.g., % of correct items delivered)                                    |
| SerialTracked        | String      | Serial number tracking information                                                           |
| Mode                 | String      | Transport mode (e.g., Air, Road, Sea)                                                        |
| Date                 | DateTime    | Order date                                                                                   |

**Metrics**: ~9,800 records | 1:1 with Orders

---

### Transportation
Logistics and carrier details for each order.

| Column             | Data Type | Description                                                        |
|--------------------|-----------|--------------------------------------------------------------------|
| TransportID        | String    | Unique transport operation identifier                              |
| OrderID            | String    | Foreign key to Orders table                                        |
| Carrier            | String    | Name of the carrier or logistics provider                          |
| Mode               | String    | Transport mode (e.g., Air, Road, Sea)                              |
| DistanceKm         | Integer   | Distance traveled for the order (in kilometers)                    |
| TransportCost      | Decimal   | Cost of transportation for the order (in £)                        |
| CO2EmissionKg      | Decimal   | Estimated CO2 emissions for the transport (in kilograms)           |
| TemperatureControl | String    | Temperature setpoint for transport (e.g., "2–8°C", "15–25°C")      |
| DataLoggerUsed     | String    | Indicates if a data logger was used for temperature monitoring     |
| DamageFlag         | Integer   | 1 if shipment was damaged, 0 otherwise                             |
| LostFlag           | Integer   | 1 if shipment was lost, 0 otherwise                                |

**Metrics**: ~9,800 records | 1:1 with Orders

---

### Inventory
Warehouse inventory levels and metrics.

| Column              | Data Type | Description                                                                 |
|---------------------|-----------|-----------------------------------------------------------------------------|
| ProductID           | String    | Foreign key to Products table                                               |
| WarehouseID         | String    | Foreign key to Warehouses table                                             |
| StockDate           | DateTime  | Date of the inventory record                                                |
| LotNumber           | String    | Batch or lot number for traceability                                        |
| ExpiryDate          | DateTime  | Expiry date of the product in stock                                         |
| TemperatureRange    | String    | Required temperature range for storage (e.g., "2–8°C", "15–25°C")           |
| StockLevel          | Integer   | Current quantity in stock                                                   |
| ReorderPoint        | Integer   | Minimum stock level before reorder is triggered                             |
| SafetyStock         | Integer   | Safety buffer quantity to prevent stockouts                                 |
| DaysHeld            | Integer   | Number of days the product has been held in inventory                       |
| StockValue          | Decimal   | Current inventory value (£)                                                 |
| InventoryHoldingCost| Decimal   | Estimated holding cost for the inventory (£)                                |
| WarehouseName       | String    | Name of the warehouse                                                       |
| Country             | String    | Country where the warehouse is located                                      |
| MinStock_Inventory  | Integer   | Minimum stock level for this product in this warehouse                      |
| MaxStock_Inventory  | Integer   | Maximum stock level for this product in this warehouse                      |

**Metrics**: 1,368 records | Updated daily

---

## Dimension Tables

### Customers
Customer master data.



| Column          | Data Type | Description                                         |
|-----------------|-----------|-----------------------------------------------------|
| CustomerID      | String    | Unique customer identifier                          |
| CustomerName    | String    | Official customer name                              |
| Type            | String    | Customer type (e.g., Hospital, Pharmacy, Clinic)    |
| Country         | String    | Country of the customer                             |
| Region          | String    | Geographic region of the customer                   |
| Industry        | String    | Industry segment (e.g., Healthcare, Retail)         |
| CustomerSegment | String    | Customer segmentation/category (e.g., Key Account)  |

**Records**: 10,000 customers

---

### Products
Product master data.

| Column           | Data Type | Description                                              |
|------------------|-----------|----------------------------------------------------------|
| ProductID        | String    | Unique product code                                      |
| ProductName      | String    | Product name                                             |
| Category         | String    | Product category                                         |
| DosageForm       | String    | Dosage form (e.g., tablet, capsule, liquid)              |
| Strength         | String    | Product strength or concentration (e.g., 500mg, 10%)     |
| TemperatureRange | String    | Required temperature range for storage/transport         |
| SupplierID       | String    | Foreign key to Suppliers table                           |
| UnitCost         | Decimal   | Cost per unit (£)                                        |
| Weight           | Decimal   | Weight per unit (kg)                                     |
| Volume           | Decimal   | Volume per unit (liters or cm³)                          |
| SimulatedVolume  | Decimal   | Simulated volume (calculated)                            |

**Records**: 10,000 products

---

### Warehouses
Warehouse locations and capacities.

| Column                      | Data Type | Description                                                      |
|-----------------------------|-----------|------------------------------------------------------------------|
| WarehouseID                 | String    | Unique warehouse identifier                                      |
| WarehouseName               | String    | Official name of the warehouse                                   |
| Country                     | String    | Country where the warehouse is located                           |
| Region                      | String    | Geographic region of the warehouse                               |
| Capacity                    | Integer   | Maximum storage capacity (units)                                 |
| UtilizationRate             | Decimal   | Current utilization rate (%)                                     |
| MinStock_Warehouse          | Integer   | Minimum stock level for the warehouse                            |
| MaxStock_Warehouse          | Integer   | Maximum stock level for the warehouse                            |
| SafetyStock_Warehouse       | Integer   | Safety stock level for the warehouse                             |
| ReorderPoint_Warehouse      | Integer   | Reorder threshold for the warehouse                              |
| MinVolume_Warehouse         | Decimal   | Minimum volume threshold (m³ or liters)                          |
| MaxVolume_Warehouse         | Decimal   | Maximum volume threshold (m³ or liters)                          |
| SafetyVolume_Warehouse      | Decimal   | Safety volume threshold (m³ or liters)                           |
| ReorderPointVolume_Warehouse| Decimal   | Reorder point for volume (m³ or liters)                          |

**Records**: 44 warehouses

---

### DIM_Carrier
Carrier/logistics provider master.

| Column | Data Type | Description |
|--------|-----------|-------------|
| Carrier | String | Carrier name |
| CarrierCode | String | Short code |
| ServiceType | String | Service level |
| ColdChainCapable | String | Y/N cold chain |

**Records**: 7 carriers (CMA, DB, DHL, FedEx, KN, Maersk, UPS)

---

### Date
Time dimension table.

| Column | Data Type | Description |
|--------|-----------|-------------|
| Date | DateTime | Full date |
| DateKey | Integer | Date key for joining |
| MonthShort | String | Month abbreviation |
| Quarter | String | Q1-Q4 |
| Year | Integer | 4-digit year |
| WeekNumber | Integer | Week of year |

**Records**: 1,825+ (5 years of dates)

---

## Key Measures

### Revenue KPIs
- `Revenue` : Total revenue from orders (Â£)
- `Revenue MTP` : Month-to-date revenue
- `Revenue YTD` : Year-to-date revenue

### Cost KPIs
- `COGS` : Cost of Goods Sold
- `Total Logistics Cost` : Transport + Inventory holding
- `Cost per Order` : Average cost per transaction

### Performance KPIs
- `Perf_OTIF %` : On-Time In-Full percentage
- `Perf_On-Time Delivery %` : On-time delivery rate
- `Perf_In-Full %` : In-full delivery rate
- `Perf_Perfect Order %` : Perfect orders

### Financial KPIs
- `Gross Margin %` : (Revenue - COGS) / Revenue
- `Net Contribution` : Revenue - COGS - Logistics Cost
- `Efficiency Score` : (1 - Logistics Cost/Revenue) * 100

### Warehouse KPIs
- `Current Stock` : Units on hand
- `Days on Hand (90d)` : DOH based on 90-day demand
- `Inventory Turns` : COGS / Average Inventory Value

---

### Filters & Slicers

| Slicer | Values | Default |
|--------|--------|---------|
| Year | 2023-2025 | Current Year |
| Month | Jan-Dec | Current Month |
| Region | Africa, Americas, Asia, Europe | All |
| Country | 44 countries | All |
| Carrier | 7 carriers | All |
| Transport Mode | Air, Sea, Rail, Truck | All |
| Suppliers Countries | 7 Countries | All |
| Customers Countries | 44 Countries | All |

---

For technical questions, see **[ARCHITECTURE.md](./ARCHITECTURE.md)**

---

### LICENSE

This project is licensed under a **Proprietary and Confidential License**.
This project is NOT open-source and is offered for commercial licensing only.

For licensing inquiries: https://www.linkedin.com/in/samson18/

See [LICENSE](LICENSE) file for complete legal terms.

---

### SUPPORT

Please contact: https://www.linkedin.com/in/samson18/

---


**Version:** 1.0.0
**Last Updated:** December 2025
**Author:** Marc James Samson
**Status:** Production Ready
**License:** Proprietary and Confidential

---

<div align="center">

<a href="https://www.linkedin.com/in/samson18/" target="_blank" style="text-decoration: none;"><img src="./images/Linkedin 96 crop 10.png" width="39" height="39" style="vertical-align: middle;"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://youtu.be/FwUXnIbzaoo" target="_blank" style="text-decoration: none;"><img src="./images/Youtube 96 crop 10.png" width="39" height="39" style="vertical-align: middle;"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://marc-james-samson.notion.site/Portfolio-Marc-James-Samson-2a8e9aa7668d8060a208f8b13f609e7b" target="_blank" style="text-decoration: none;"><img src="./images/Notion 96 crop 10.png" width="39" height="39" style="vertical-align: middle;"/></a>

</div>
