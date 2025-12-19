# Power BI Data Model Analysis - Pharma Logistics

## Extracted Data Model Structure

### File Type: Remote Semantic Model (Cloud-based)
- **Report Location**: C:\Users\Marc\Desktop\Pharma Logistics.pbix
- **Dataset ID**: eefd5468-adce-47ad-b5c5-864ffa0327fa
- **Connection Type**: Power BI Service (Remote Artifacts)
- **Data Source**: SQL Server 2019+ (PharmaLogistics Database)

---

## Core Tables & Columns

### 1. FACT TABLES

#### **Orders** (9,800+ records)
Primary transaction table for pharmaceutical orders.

**Columns:**
- `OrderID` (String) - Primary key
- `CustomerID` (String) - FK to Customers
- `ProductID` (String) - FK to Products
- `Quantity` (Integer) - Units ordered
- `TotalCost` (Double) - Total value (£)
- `WarehouseID` (String) - Fulfilling warehouse
- `Region` (String) - Geographic region
- `Status` (String) - Order status
- `Date` (DateTime) - Order date
- `DeliveryDate` (DateTime) - Actual delivery date
- `OnTime_Flag` (Integer) - 1 = on-time, 0 = late
- `InFull_Flag` (Integer) - 1 = in-full, 0 = partial
- `OTIF_Flag` (Integer) - 1 = on-time and in-full

**Refresh**: Daily | **Update Frequency**: Hourly

---

#### **Transportation** (9,800+ records, 1:1 with Orders)
Logistics and carrier details.

**Columns:**
- `OrderID` (String) - Primary key, FK to Orders
- `Carrier` (String) - Carrier name (7 carriers)
- `TransportCost` (Double) - Shipping cost (£)
- `DistanceKm` (Double) - Distance (km)
- `LeadTime` (Integer) - Delivery lead time (days)
- `ShipDate` (DateTime) - Shipment date
- `DeliveryDate` (DateTime) - Delivery date
- `Status` (String) - Transport status
- `Mode` (String) - Transport mode (Air/Sea/Land)

**Carriers**: CMA CGM Air Cargo, DB Schenker, DHL, FedEx, Kuehne+Nagel, Maersk, UPS HealthCare

**Refresh**: Real-time | **Update Frequency**: Real-time

---

#### **Inventory** (5,000+ records)
Warehouse stock levels and metrics.

**Columns:**
- `InventoryID` (String) - Primary key
- `WarehouseID` (String) - FK to Warehouses
- `ProductID` (String) - FK to Products
- `CurrentStock` (Integer) - Quantity on hand
- `MinStock` (Integer) - Minimum threshold
- `SafetyStock` (Integer) - Safety buffer
- `ReorderPoint` (Integer) - Reorder trigger
- `MaxStock` (Integer) - Maximum capacity
- `StockValue` (Double) - Current value (£)
- `InventoryHoldingCost` (Double) - Annual holding cost (£)

**Refresh**: Daily | **Update Frequency**: Daily

---

### 2. DIMENSION TABLES

#### **Customers** (200 unique)
Customer master data.

**Columns:**
- `CustomerID` (String) - Primary key
- `CustomerName` (String) - Official name
- `Type` (String) - Hospital, Pharmacy, Clinic
- `Country` (String) - Primary country
- `Region` (String) - Geographic region (4 regions)
- `Industry` (String) - Industry segment

---

#### **Products** (500 products)
Product master data.

**Columns:**
- `ProductID` (String) - Primary key
- `ProductName` (String) - Product name
- `Category` (String) - 6 categories:
  - Biologic
  - Cold Chain Supply
  - Consumable
  - Medical Device
  - Prescription Drug
  - Vaccine
- `UnitCost` (Double) - Cost per unit (£)
- `UnitPrice` (Double) - Selling price (£)
- `SupplierID` (String) - FK to Suppliers

---

#### **Warehouses** (44 worldwide)
Warehouse locations and capacities.

**Columns:**
- `WarehouseID` (String) - Primary key
- `WarehouseName` (String) - Official name
- `Location` (String) - City/Region
- `Country` (String) - Country
- `Capacity` (Integer) - Max units
- `MinStock_Warehouse` (Integer) - Min stock level
- `SafetyVolume_Warehouse` (Integer) - Safety stock
- `MaxVolume_Warehouse` (Integer) - Max volume
- `ReorderPoint_Warehouse` (Integer) - Reorder threshold

---

#### **DIM_Carrier** (7 carriers)
Carrier/logistics provider master.

**Columns:**
- `Carrier` (String) - Primary key / Carrier name
- `CarrierCode` (String) - Short code
- `ServiceType` (String) - Service level
- `ColdChainCapable` (String) - Y/N for cold chain

---

#### **Date** (Time Dimension, 1,825+ records)
Time dimension for all date fields.

**Columns:**
- `Date` (DateTime) - Full date
- `DateKey` (Integer) - Date key
- `MonthShort` (String) - Month abbreviation
- `Quarter` (String) - Q1-Q4
- `Year` (Integer) - 4-digit year
- `WeekNumber` (Integer) - Week of year

**Coverage**: 5 years of dates

---

### 3. SUPPORTING TABLES

#### **Suppliers**
Supplier master data.

**Columns:**
- `SupplierID` (String) - Primary key
- `SupplierName` (String) - Company name
- `Country` (String) - Supplier country
- `Region` (String) - Operating region

---

#### **Regions** (4 regions)
Geographic region reference.

- Africa
- Americas
- Asia
- Europe

---

## Key Relationships

| From Table | To Table | Cardinality | Join Column |
|:---|:---|:---:|:---|
| Orders | Customers | N:1 | CustomerID |
| Orders | Products | N:1 | ProductID |
| Orders | Warehouses | N:1 | WarehouseID |
| Orders | Date | N:1 | Date |
| Transportation | Carriers | N:1 | Carrier |
| Transportation | Date | N:1 | ShipDate/DeliveryDate |
| Inventory | Products | N:1 | ProductID |
| Inventory | Warehouses | N:1 | WarehouseID |
| Inventory | Date | N:1 | Date |
| Products | Suppliers | N:1 | SupplierID |
| Warehouses | Regions | N:1 | Region |
| Customers | Regions | N:1 | Region |

---

## Existing Measures (Referenced in Visuals)

From visual analysis, the following measures exist and are referenced as `_Measures.MeasureName`:

- `Back Order Volume`
- `Lead Transport (days)`
- `Lead Time (days)`
- `OTIF %` (On-Time In-Full %)
- `Total Orders`
- `In Full`
- `Revenue`
- `COGS`
- `Gross Margin %`
- `Transport Cost`
- `CO2 per KM`
- `CO2 per 100KM`
- `On-Time %`

---

## 8 Missing KPIs for Performance Page

These measures need to be created based on the existing data:

### 1. Perfect Order %
**Definition**: Percentage of orders that are on-time, in-full, undamaged, and correct

**DAX Formula Placeholder**:
```dax
Perfect Order % = 
DIVIDE(
    SUMX(Orders, Orders[OnTime_Flag] * Orders[InFull_Flag] * (1 - Damaged_Flag) * (1 - Wrong_Items_Flag)),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Note**: Requires `Damaged_Flag` and `Wrong_Items_Flag` columns or separate quality tracking table

---

### 2. Cold Chain Compliance %
**Definition**: Percentage of temperature-sensitive orders that maintained proper conditions

**DAX Formula Placeholder**:
```dax
Cold Chain Compliance % =
DIVIDE(
    COUNTX(
        FILTER(Transportation, 
            Transportation[Category] = "Cold Chain Supply" && 
            Transportation[TempViolation] = 0
        ),
        Transportation[OrderID]
    ),
    COUNTX(
        FILTER(Transportation, Transportation[Category] = "Cold Chain Supply"),
        Transportation[OrderID]
    ),
    0
) * 100
```

**Note**: Requires `TempViolation` column in Transportation table

---

### 3. Temperature Excursions
**Definition**: Count of shipments where temperature fell outside acceptable range

**DAX Formula Placeholder**:
```dax
Temperature Excursions =
SUMX(
    FILTER(Transportation, 
        Transportation[MinTemp] < Transportation[SetMinTemp] OR
        Transportation[MaxTemp] > Transportation[SetMaxTemp]
    ),
    1
)
```

**Note**: Requires `MinTemp`, `MaxTemp`, `SetMinTemp`, `SetMaxTemp` columns

---

### 4. Carrier Performance Score
**Definition**: Composite score (0-100) for each carrier based on OTIF%, Cost Efficiency, and Reliability

**DAX Formula Placeholder**:
```dax
Carrier Performance Score =
DIVIDE(
    (SUMX(FILTER(Orders, Orders[OTIF_Flag] = 1), 1) * 0.4) +  -- 40% weight OTIF
    ((100 - AVERAGE(Transportation[CostPerKm])) * 0.3) +         -- 30% weight cost efficiency
    (SUMX(FILTER(Orders, Orders[Status] = "Delivered"), 1) * 0.3),-- 30% weight reliability
    COUNTA(Transportation[OrderID]),
    0
)
```

---

### 5. Order Accuracy %
**Definition**: Percentage of orders with correct items and quantities

**DAX Formula Placeholder**:
```dax
Order Accuracy % =
DIVIDE(
    SUMX(
        FILTER(Orders, Orders[Wrong_Items_Flag] = 0 && Orders[Quantity_Match_Flag] = 1),
        1
    ),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Note**: Requires `Wrong_Items_Flag` and `Quantity_Match_Flag` columns

---

### 6. Damage Rate %
**Definition**: Percentage of delivered orders with product damage

**DAX Formula Placeholder**:
```dax
Damage Rate % =
DIVIDE(
    SUMX(FILTER(Orders, Orders[Damaged_Flag] = 1), 1),
    SUMX(FILTER(Orders, Orders[Status] = "Delivered"), 1),
    0
) * 100
```

**Note**: Requires `Damaged_Flag` column

---

### 7. Return Rate %
**Definition**: Percentage of delivered orders that were returned

**DAX Formula Placeholder**:
```dax
Return Rate % =
DIVIDE(
    SUMX(FILTER(Orders, Orders[Status] = "Returned"), 1),
    SUMX(FILTER(Orders, Orders[Status] = "Delivered"), 1),
    0
) * 100
```

---

### 8. SLA Achievement %
**Definition**: Percentage of orders meeting customer Service Level Agreements

**DAX Formula Placeholder**:
```dax
SLA Achievement % =
DIVIDE(
    SUMX(
        FILTER(Orders,
            Orders[DeliveryDate] <= Orders[SLA_DeliveryDate] &&
            Orders[InFull_Flag] = 1
        ),
        1
    ),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Note**: Requires `SLA_DeliveryDate` column in Orders table

---

## Data Gaps Identified

⚠️ **Missing Columns in Current Model** (Required for complete KPI set):

1. **Quality Flags**:
   - `Damaged_Flag` - Items received damaged
   - `Wrong_Items_Flag` - Wrong items sent
   - `Quantity_Match_Flag` - Quantity verification

2. **Cold Chain Monitoring**:
   - `MinTemp` - Minimum temperature during transit
   - `MaxTemp` - Maximum temperature during transit
   - `SetMinTemp` - Acceptable minimum temp
   - `SetMaxTemp` - Acceptable maximum temp
   - `TempViolation` - Boolean flag for violations

3. **SLA Tracking**:
   - `SLA_DeliveryDate` - Promised delivery date per SLA

4. **Return Tracking**:
   - Enhanced `Status` field or separate Returns table with reason codes

---

## Recommendations

### Immediate Actions

1. **Update Orders Table** to include:
   - Quality control flags (damaged, wrong items)
   - SLA target delivery dates
   - Return status tracking

2. **Update Transportation Table** to include:
   - Temperature monitoring columns (min, max, set points)
   - Temperature violation indicators

3. **Verify Existing Columns**:
   - Confirm all date columns are DateTime format
   - Ensure foreign key relationships are active
   - Validate column naming conventions

### Medium-term (2-4 weeks)

1. Create separate `QualityMetrics` table if data volume justifies it
2. Implement `ColdChainEvents` table for detailed temperature tracking
3. Add `CarrierSLA` table for per-carrier service agreements

### DAX Measure Creation

Once the missing columns are added, create measures with:
- Proper CALCULATE() contexts for slicing by Region, Warehouse, Carrier
- Time intelligence for YoY and MoM comparisons
- Quick measure patterns for performance optimization

---

## Files to Update

1. **DATABASE_SCHEMA.md** - Add new columns and tables
2. **DATA_DICTIONARY.md** - Document new fields and measures
3. **Power BI Model** - Add calculated columns/measures

**Last Updated**: December 2025
**Model Complexity**: 13 tables | 20+ relationships | 202 measures (existing) + 8 new

