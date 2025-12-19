# DAX Measures - Performance Page KPIs

## Overview

This document contains 8 new DAX measures for the Pharma Logistics BI dashboard Performance page. These measures will enhance quality, compliance, and operational tracking.

**Target Location**: Power BI Semantic Model (_Measures table)
**Refresh Schedule**: Daily (with some real-time elements)

---

## Implementation Guide

### Copy & Paste Instructions:

1. Open Power BI Desktop
2. Go to **Data** tab → **Semantic Model**
3. Find the **_Measures** table
4. Click **New Measure** button
5. Copy each DAX formula below
6. Paste into the formula bar
7. Press **Enter**
8. Save and publish

---

## 8 New KPI Measures

### 1. Perfect Order %

**Category**: Performance & Quality  
**Visibility**: Public  
**Format**: Percentage (0-100)

```dax
Perfect Order % = 
DIVIDE(
    SUMPRODUCT(
        (Orders[OnTime_Flag] = 1) *
        (Orders[InFull_Flag] = 1)
    ),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Description**: Percentage of orders that were delivered on-time and in full (composite OTIF)  
**Ideal Target**: > 95%  
**Drill-downs**: By Carrier, Region, Warehouse, Product Category

---

### 2. Cold Chain Compliance %

**Category**: Quality & Compliance  
**Visibility**: Public  
**Format**: Percentage (0-100)

```dax
Cold Chain Compliance % =
DIVIDE(
    SUMPRODUCT(
        (Products[Category] = "Cold Chain Supply") *
        (Transportation[TempCompliant] = 1)
    ),
    COUNTX(
        FILTER(
            CROSSJOIN(Orders, Transportation),
            Products[Category] = "Cold Chain Supply"
        ),
        Orders[OrderID]
    ),
    0
) * 100
```

**Alternative (if TempCompliant flag unavailable)**:

```dax
Cold Chain Compliance % =
DIVIDE(
    SUMPRODUCT(
        (Products[Category] = "Cold Chain Supply") *
        (Transportation[MinTemp] >= Transportation[SetMinTemp]) *
        (Transportation[MaxTemp] <= Transportation[SetMaxTemp])
    ),
    COUNTX(
        FILTER(
            CROSSJOIN(Orders, Transportation),
            Products[Category] = "Cold Chain Supply"
        ),
        Orders[OrderID]
    ),
    0
) * 100
```

**Description**: Percentage of temperature-sensitive (Cold Chain) shipments maintaining proper temperature conditions  
**Ideal Target**: > 99%  
**Critical**: Regulatory requirement for pharmaceutical cold chain

---

### 3. Temperature Excursions (Count)

**Category**: Quality & Compliance  
**Visibility**: Public  
**Format**: Integer (count)

```dax
Temperature Excursions =
SUMPRODUCT(
    (Transportation[MinTemp] < Transportation[SetMinTemp]) +
    (Transportation[MaxTemp] > Transportation[SetMaxTemp])
)
```

**Alternative (simpler)**:

```dax
Temperature Excursions =
COUNTX(
    FILTER(
        Transportation,
        Transportation[MinTemp] < Transportation[SetMinTemp] OR
        Transportation[MaxTemp] > Transportation[SetMaxTemp]
    ),
    Transportation[OrderID]
)
```

**Description**: Count of shipments where temperature fell outside acceptable range  
**Ideal Target**: 0 excursions  
**Tracking**: Cumulative month-to-date and YTD

---

### 4. Carrier Performance Score

**Category**: Vendor Management  
**Visibility**: Public  
**Format**: Percentage (0-100)

```dax
Carrier Performance Score =
DIVIDE(
    -- 40% weight: On-Time In-Full %
    (SUMPRODUCT(
        (Transportation[Carrier] = SELECTEDVALUE(DIM_Carrier[Carrier])) *
        (Orders[OTIF_Flag] = 1)
    ) / 
    COUNTX(
        FILTER(Transportation, Transportation[Carrier] = SELECTEDVALUE(DIM_Carrier[Carrier])),
        Transportation[OrderID]
    ) * 0.40) +
    
    -- 30% weight: Cost Efficiency (lower cost = higher score)
    ((100 - AVERAGE(
        FILTER(
            Transportation,
            Transportation[Carrier] = SELECTEDVALUE(DIM_Carrier[Carrier])
        )[TransportCost] / [DistanceKm]
    )) * 0.30) +
    
    -- 30% weight: On-Time Delivery %
    (SUMPRODUCT(
        (Transportation[Carrier] = SELECTEDVALUE(DIM_Carrier[Carrier])) *
        (Orders[OnTime_Flag] = 1)
    ) / 
    COUNTX(
        FILTER(Transportation, Transportation[Carrier] = SELECTEDVALUE(DIM_Carrier[Carrier])),
        Transportation[OrderID]
    ) * 0.30),
    1,
    0
)
```

**Simplified Version** (if composite calc too complex):

```dax
Carrier Performance Score =
(
    [OTIF %] * 0.40 +
    ([On-Time %] * 0.30) +
    (100 - (AVERAGE(Transportation[TransportCost] / Transportation[DistanceKm]) * 0.01) * 0.30)
)
```

**Description**: Composite score (0-100) for each carrier based on OTIF%, On-Time%, and cost efficiency  
**Components**:
- 40% On-Time In-Full performance
- 30% Cost per kilometer efficiency
- 30% On-Time delivery reliability

**Ideal Target**: > 90  
**Benchmarking**: Shows top vs. bottom performers by carrier

---

### 5. Order Accuracy %

**Category**: Quality & Operations  
**Visibility**: Public  
**Format**: Percentage (0-100)

```dax
Order Accuracy % =
DIVIDE(
    SUMPRODUCT(
        (Orders[CorrectItems_Flag] = 1) *
        (Orders[CorrectQuantity_Flag] = 1) *
        (Orders[Status] = "Delivered")
    ),
    COUNTX(
        FILTER(Orders, Orders[Status] = "Delivered"),
        Orders[OrderID]
    ),
    0
) * 100
```

**Alternative (if separate columns unavailable)**:

```dax
Order Accuracy % =
DIVIDE(
    COUNTX(
        FILTER(
            Orders,
            Orders[Quantity_Shipped] = Orders[Quantity_Ordered] AND
            Orders[Status] = "Delivered"
        ),
        Orders[OrderID]
    ),
    COUNTX(
        FILTER(Orders, Orders[Status] = "Delivered"),
        Orders[OrderID]
    ),
    0
) * 100
```

**Description**: Percentage of delivered orders with correct items and exact quantities  
**Ideal Target**: > 98%  
**Formula Logic**:
- Only count delivered orders in denominator
- Numerator: Orders where items and quantities match shipped vs. ordered

---

### 6. Damage Rate %

**Category**: Quality & Compliance  
**Visibility**: Public  
**Format**: Percentage (0-100)

```dax
Damage Rate % =
DIVIDE(
    COUNTX(
        FILTER(
            Orders,
            Orders[Damaged_Flag] = 1 AND
            Orders[Status] = "Delivered"
        ),
        Orders[OrderID]
    ),
    COUNTX(
        FILTER(Orders, Orders[Status] = "Delivered"),
        Orders[OrderID]
    ),
    0
) * 100
```

**Description**: Percentage of delivered orders that arrived with product damage  
**Ideal Target**: < 2%  
**Business Impact**: Direct revenue loss and customer satisfaction impact

---

### 7. Return Rate %

**Category**: Customer Satisfaction  
**Visibility**: Public  
**Format**: Percentage (0-100)

```dax
Return Rate % =
DIVIDE(
    COUNTX(
        FILTER(Orders, Orders[Status] = "Returned"),
        Orders[OrderID]
    ),
    COUNTX(
        FILTER(Orders, Orders[Status] = "Delivered"),
        Orders[OrderID]
    ),
    0
) * 100
```

**Enhanced Version** (with return reasons):

```dax
Return Rate % =
VAR TotalDelivered = COUNTX(FILTER(Orders, Orders[Status] = "Delivered"), Orders[OrderID])
VAR TotalReturned = COUNTX(FILTER(Orders, Orders[Status] = "Returned"), Orders[OrderID])
RETURN
DIVIDE(TotalReturned, TotalDelivered, 0) * 100
```

**Description**: Percentage of delivered orders that customers returned  
**Ideal Target**: < 1%  
**Tracking**: By return reason (damage, wrong product, quality issue, customer request, etc.)

---

### 8. SLA Achievement %

**Category**: Customer Commitment  
**Visibility**: Public  
**Format**: Percentage (0-100)

```dax
SLA Achievement % =
DIVIDE(
    SUMPRODUCT(
        (Orders[DeliveryDate] <= Orders[SLA_DeliveryDate]) *
        (Orders[InFull_Flag] = 1) *
        (Orders[Status] IN {"Delivered", "Completed"})
    ),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Alternative** (Time-based SLA only):

```dax
SLA Achievement % =
DIVIDE(
    COUNTX(
        FILTER(
            Orders,
            Orders[DeliveryDate] <= Orders[SLA_DeliveryDate] AND
            Orders[Status] = "Delivered"
        ),
        Orders[OrderID]
    ),
    COUNTX(FILTER(Orders, Orders[Status] = "Delivered"), Orders[OrderID]),
    0
) * 100
```

**Description**: Percentage of orders meeting customer Service Level Agreement (SLA) - both on-time delivery and in-full quantity  
**Ideal Target**: > 97%  
**Scoring**: Only counts if BOTH delivery date AND in-full conditions are met

---

## Implementation Checklist

### Pre-Implementation

- [ ] Verify all required columns exist in Power BI model:
  - `OnTime_Flag`, `InFull_Flag` in Orders
  - `OTIF_Flag` in Orders
  - `Damaged_Flag` in Orders or separate QualityMetrics table
  - `CorrectItems_Flag`, `CorrectQuantity_Flag` in Orders
  - `SLA_DeliveryDate` in Orders
  - `TempCompliant` or temp columns in Transportation
  - `MinTemp`, `MaxTemp`, `SetMinTemp`, `SetMaxTemp` in Transportation

- [ ] Confirm table relationships are active:
  - Orders → Customers (N:1)
  - Orders → Products (N:1)
  - Orders → Transportation (1:1)
  - Transportation → DIM_Carrier (N:1)

- [ ] Back up current .pbix file

### Post-Implementation

- [ ] Test each measure with sample data
- [ ] Verify formatting (percentages display 0-100)
- [ ] Create visuals:
  - KPI Cards for top 4 measures (Perfect Order %, Cold Chain %, SLA %, Damage Rate %)
  - Gauge charts for performance scores
  - Line charts for trend analysis
  - Carrier scorecards for Carrier Performance Score

- [ ] Add to Performance page layout
- [ ] Apply professional color scheme (#0078D4, #FF8C00, #107C10, #CC2927)
- [ ] Publish to Power BI Service
- [ ] Update documentation

### Testing Queries

After creating measures, run these validation queries:

```dax
-- Check measure ranges
Perfect Order % should be 0-100
Cold Chain Compliance % should be 0-100
Temperature Excursions should be >= 0
Carrier Performance Score should be 0-100

-- Validate data integrity
SUMX(Carriers, [Carrier Performance Score]) -- Should sum reasonably
MAXX(Dates, [SLA Achievement %]) -- Should find max month
```

---

## Troubleshooting

### Common Issues & Solutions

| Issue | Cause | Solution |
|:---|:---|:---|
| Measure returns blank | Missing columns in data | Add required columns to SQL Server source |
| Measure = 100% always | Incorrect filter logic | Review FILTER() conditions |
| Performance slow | Inefficient DAX | Use SUMPRODUCT vs. COUNTX when appropriate |
| Wrong results by Region | Missing ALLEXCEPT() | Add context modifiers if needed |

---

## Performance Optimization Tips

1. **Use SUMPRODUCT** for simple flag calculations (faster than nested FILTER + COUNTX)
2. **Avoid CROSSJOIN** in large tables - use filtered relationships instead
3. **Cache complex calculations** - consider creating calculated columns for frequently used combinations
4. **Index key columns** in SQL Server (OrderID, CarrierID, WarehouseID, ProductID)

---

## Documentation Updates

After implementing these measures, update:

1. **KPIs.md**: Add 8 new measures to Performance & Quality and Vendor Management sections
2. **DATABASE_SCHEMA.md**: Document required new columns
3. **DATA_DICTIONARY.md**: Add measure definitions with formulas
4. **README.md**: Update Performance page description

---

## Version History

| Version | Date | Changes |
|:---|:---|:---|
| 1.0 | Dec 2025 | Initial 8 measures for Performance page |

---

**Next Steps**: Implement measures, create visuals, and test with actual data

