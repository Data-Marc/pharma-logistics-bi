# Data Dictionary - Pharma Logistics BI

Complete reference for all tables, columns, and measures.

---

## <img src="../images/SQL 96 crop.png" width="35" height="35" alt="SQL Server" style="vertical-align:middle"/>&nbsp;&nbsp;&nbsp;Database Architecture

![SQL Server Database Schema](../images/SQL_Screenshot.png)

The system is built on a SQL Server database with **13 tables** providing comprehensive pharmaceutical supply chain tracking across orders, transportation, inventory, and quality compliance.

---

## Fact Tables

### Orders
Primary transaction table for all pharmaceutical orders.

| Column | Data Type | Description |
|--------|-----------|-------------|
| OrderID | String | Unique order identifier |
| CustomerID | String | Foreign key to Customers |
| ProductID | String | Foreign key to Products |
| Quantity | Integer | Order quantity (units) |
| TotalCost | Double | Total order value (Â£) |
| WarehouseID | String | Warehouse that fulfilled order |
| Region | String | Geographic region |
| Status | String | Order status |
| Date | DateTime | Order date |
| DeliveryDate | DateTime | Actual delivery date |
| OnTime_Flag | Integer | 1 if on-time, 0 otherwise |
| InFull_Flag | Integer | 1 if in-full, 0 otherwise |
| OTIF_Flag | Integer | 1 if OTIF, 0 otherwise |

**Metrics**: ~9,800 records | Updated daily

---

### Transportation
Logistics and carrier details for each order.

| Column | Data Type | Description |
|--------|-----------|-------------|
| OrderID | String | Foreign key to Orders |
| Carrier | String | Carrier name |
| TransportCost | Double | Cost of transportation (Â£) |
| DistanceKm | Double | Distance traveled (km) |
| LeadTime | Integer | Delivery lead time (days) |
| ShipDate | DateTime | Shipment date |
| DeliveryDate | DateTime | Delivery date |
| Status | String | Transport status |
| Mode | String | Transport mode (Air/Sea/Land) |

**Metrics**: ~9,800 records | 1:1 with Orders

---

### Inventory
Warehouse inventory levels and metrics.

| Column | Data Type | Description |
|--------|-----------|-------------|
| InventoryID | String | Unique identifier |
| WarehouseID | String | Warehouse location |
| ProductID | String | Product stored |
| CurrentStock | Integer | Current quantity on hand |
| MinStock | Integer | Minimum stock level |
| SafetyStock | Integer | Safety buffer quantity |
| ReorderPoint | Integer | Reorder trigger level |
| MaxStock | Integer | Maximum capacity |
| StockValue | Double | Current inventory value (Â£) |
| InventoryHoldingCost | Double | Annual holding cost (Â£) |

**Metrics**: ~5,000 records | Updated daily

---

## Dimension Tables

### Customers
Customer master data.

| Column | Data Type | Description |
|--------|-----------|-------------|
| CustomerID | String | Unique customer identifier |
| CustomerName | String | Official customer name |
| Type | String | Customer type (Hospital, Pharmacy, Clinic) |
| Country | String | Primary country |
| Region | String | Geographic region |
| Industry | String | Industry segment |

**Records**: ~200 unique customers

---

### Products
Product master data.

| Column | Data Type | Description |
|--------|-----------|-------------|
| ProductID | String | Unique product code |
| ProductName | String | Product name |
| Category | String | Product category |
| UnitCost | Double | Cost per unit (Â£) |
| UnitPrice | Double | Selling price (Â£) |
| SupplierID | String | Primary supplier |

**Records**: ~500 products

---

### Warehouses
Warehouse locations and capacities.

| Column | Data Type | Description |
|--------|-----------|-------------|
| WarehouseID | String | Warehouse code |
| WarehouseName | String | Official name |
| Location | String | City/Region |
| Country | String | Country |
| Capacity | Integer | Max units |
| MinStock_Warehouse | Integer | Min stock level |
| SafetyVolume_Warehouse | Integer | Safety stock |
| MaxVolume_Warehouse | Integer | Max volume |
| ReorderPoint_Warehouse | Integer | Reorder threshold |

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

## Filters & Slicers

| Slicer | Values | Default |
|--------|--------|---------|
| Year | 2023-2025 | Current Year |
| Month | Jan-Dec | Current Month |
| Region | Africa, Americas, Asia, Europe | All |
| Country | 50+ countries | All |
| Carrier | 7 carriers | All |
| Transport Mode | Air, Sea, Land | All |
| Warehouse | 44 warehouses | All |

---

**For technical questions, see ARCHITECTURE.md**

