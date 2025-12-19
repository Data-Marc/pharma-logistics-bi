# Performance Page Enhancement Plan

## Project Overview

**Objective**: Complete and professionalize the Pharma Logistics BI Performance page with 8 new KPI measures, professional color scheme, and optimized visual layout.

**Timeline**: 2-3 weeks  
**Complexity**: Medium  
**Team**: Data Marc (Implementation)

---

## Current State Analysis

### Existing Visuals (✓ Keep)

1. **KPI Cards** (Top Section):
   - Total Orders
   - OTIF %
   - Lead Time (days)
   - Lead Transport (days)
   - In Full %
   - Back Orders

2. **CO2 Tracking Section**:
   - CO2 per KM
   - CO2 per 100 KM
   - CO2 by Carrier

3. **Performance Analytics**:
   - Delivery Performance by Region (Map/Bar)
   - Time Delay Categories
   - Transit Duration Breakdown

### Quality Gaps

- ❌ No cold chain compliance tracking
- ❌ No temperature excursion monitoring
- ❌ No quality metrics (damage, accuracy)
- ❌ No carrier performance scoring
- ❌ No SLA tracking
- ❌ No return rate visibility

---

## Proposed Performance Page Layout

### NEW LAYOUT (Enhanced)

```
┌─────────────────────────────────────────────────────────────────────┐
│ FILTERS: [Region ▼] [Warehouse ▼] [Carrier ▼] [Product Category ▼] │
└─────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│ SECTION 1: KEY PERFORMANCE INDICATORS (Top Row)                      │
├──────────────────────────────────────────────────────────────────────┤
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌─────────┐ │
│  │ Perfect  │  │   OTIF   │  │Cold Chain│  │  Damage  │  │   SLA   │ │
│  │ Order %  │  │   %      │  │ Compl %  │  │  Rate %  │  │  Ach %  │ │
│  │   95.2   │  │   92.8   │  │  99.7    │  │   1.2    │  │  97.1   │ │
│  │  [↑ +3%] │  │  [↑ +2%] │  │  [↓ -1%] │  │  [↓ -5%] │  │ [↑ +1%] │ │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  └─────────┘ │
└──────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│ SECTION 2: QUALITY & COMPLIANCE                                      │
├──────────────────────────────────────────────────────────────────────┤
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────────┐ │
│  │Temperature       │  │Order Accuracy %  │  │   Return Rate %      │ │
│  │Excursions (YTD)  │  │      97.4        │  │       0.8            │ │
│  │       12         │  │   [↑ +0.3%]      │  │   [↓ -0.2%]          │ │
│  │                  │  │                  │  │                      │ │
│  │ [Line Chart]     │  │ [Gauge 0-100]    │  │ [Trend by Category]  │ │
│  └──────────────────┘  └──────────────────┘  └──────────────────────┘ │
└──────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│ SECTION 3: CARRIER PERFORMANCE (Middle Section)                      │
├──────────────────────────────────────────────────────────────────────┤
│   Carrier Performance Score (0-100)                                  │
│                                                                      │
│   ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌────────┐ │
│   │   DHL    │  │  FedEx   │  │ Maersk   │  │   UPS    │  │  DB    │ │
│   │          │  │          │  │          │  │          │  │Schenker│ │
│   │   88     │  │   85     │  │   82     │  │   91     │  │   79   │ │
│   │  ████    │  │  ███     │  │  ██      │  │  █████   │  │  █     │ │
│   └──────────┘  └──────────┘  └──────────┘  └──────────┘  └────────┘ │
│                                                                      │
│   Components: 40% OTIF | 30% Cost Efficiency | 30% Reliability     │
└──────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│ SECTION 4: PERFORMANCE TRENDS (Bottom Section)                       │
├──────────────────────────────────────────────────────────────────────┤
│  ┌───────────────────────────────┐  ┌──────────────────────────────┐ │
│  │ Perfect Order % Trend (30 Days)│  │ Performance by Region        │ │
│  │                               │  │                              │ │
│  │ 100%│                     *   │  │  Africa      ███ 92.1%      │ │
│  │  98%├──────────────────────*──│  │  Americas    ████ 94.3%     │ │
│  │  96%│ *───────*   *  *   *    │  │  Asia        ███ 88.7%      │ │
│  │  94%├─────────────────────────│  │  Europe      █████ 96.2%    │ │
│  │  92%│      * *   * *          │  │                              │ │
│  │    └───────────────────────────┘  └──────────────────────────────┘ │
└──────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│ SECTION 5: CO2 EMISSIONS (Optional - Can remain from current page)   │
├──────────────────────────────────────────────────────────────────────┤
│  ┌──────────────────────────────┐  ┌──────────────────────────────┐  │
│  │ CO2 per KM (Average)         │  │ Emissions by Carrier         │  │
│  │      2.34 kg/km              │  │ [Sorted bar chart]           │  │
│  │   [↓ -0.12 kg/km]            │  │                              │  │
│  └──────────────────────────────┘  └──────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────┘
```

---

## Color Scheme (Standardized)

### Professional Palette

| Metric Type | Color | Hex | Usage |
|:---|:---|:---|:---|
| **Positive KPI** | Blue | #0078D4 | OTIF %, Perfect Order %, SLA Achievement % |
| **Warning/Risk** | Orange | #FF8C00 | Damage Rate %, Return Rate %, Temperature Excursions |
| **Compliance** | Green | #107C10 | Cold Chain Compliance %, Order Accuracy % |
| **Critical Issue** | Red | #CC2927 | Performance alerts, SLA failures |
| **Neutral/Trend** | Yellow | #FFB81C | Secondary metrics, averages |
| **Background** | Light Gray | #F5F5F5 | Card backgrounds |
| **Text** | Dark Gray | #333333 | Primary text |

### Application Rules

1. **KPI Cards**: Blue background (#0078D4) for positive metrics
2. **Warning Metrics**: Orange/Red based on threshold
3. **Trend Lines**: Blue for improving, Red for declining
4. **Gauge Charts**: Green (0-80%), Yellow (80-95%), Red (95-100%)
5. **Carrier Badges**: Color by quartile performance

---

## Visual Specifications

### 1. Perfect Order % Card

- **Visual Type**: KPI Card / Number with sparkline
- **Format**: 0.0 decimal places, % symbol
- **Size**: 180×120 pixels
- **Color**: #0078D4 (Blue)
- **Target**: 95%+
- **Trend**: Show vs. previous month

---

### 2. Cold Chain Compliance % Card

- **Visual Type**: KPI Card with icon
- **Format**: 0.0%, with thermometer icon
- **Size**: 180×120 pixels
- **Color**: #107C10 (Green)
- **Target**: 99%+
- **Alert**: Show if <99%

---

### 3. Temperature Excursions Chart

- **Visual Type**: Line/Area chart with markers
- **Axis**: X = Date (daily), Y = Count
- **Period**: Last 30 days
- **Color**: #FF8C00 (Orange) for line, #FFB81C lighter area
- **Target**: Zero excursions
- **Drill**: By Region, Warehouse, Carrier

---

### 4. Carrier Performance Score Gauge

- **Visual Type**: 7 Gauge charts (one per carrier)
- **Scale**: 0-100
- **Colors**: 
  - Green: 85-100
  - Yellow: 70-85
  - Red: <70
- **Size**: 140×140 pixels each
- **Callout**: Show actual score (e.g., "88")
- **Sorting**: By descending score

---

### 5. Order Accuracy % Gauge

- **Visual Type**: Gauge chart
- **Scale**: 95-100%
- **Color**: Green (#107C10)
- **Target**: 98%+
- **Detail Row**: Show by product category

---

### 6. Return Rate % Line Chart

- **Visual Type**: Line chart with data points
- **Axis**: X = Week, Y = Return %
- **Period**: 12 weeks
- **Color**: #FF8C00 (Orange) for main line
- **Target Line**: 1% (as benchmark)
- **Comparison**: Compare 2 regions/carriers

---

### 7. SLA Achievement % Card

- **Visual Type**: KPI Card with comparison
- **Format**: 0.0%, show vs. target
- **Size**: 180×120 pixels
- **Color**: Blue (#0078D4)
- **Target**: 97%+
- **Breakdown**: By region table below

---

### 8. Damage Rate % Trend

- **Visual Type**: Clustered column chart
- **Axis**: X = Month, Y = Damage %
- **Period**: 12 months
- **Color**: Red (#CC2927) for bars
- **Drill**: By product category
- **Target**: <2%

---

## Implementation Phases

### Phase 1: Foundation (Week 1-2)

1. **Add Required Columns** to SQL Server:
   - `Damaged_Flag` (Orders table)
   - `CorrectItems_Flag`, `CorrectQuantity_Flag` (Orders)
   - `SLA_DeliveryDate` (Orders)
   - `MinTemp`, `MaxTemp`, `SetMinTemp`, `SetMaxTemp` (Transportation)
   - `TempCompliant` or `TempViolation` (Transportation)

2. **Update Power BI Model**:
   - Refresh data source connection
   - Create calculated columns if needed
   - Verify relationships

3. **Create DAX Measures**:
   - Perfect Order %
   - Cold Chain Compliance %
   - Temperature Excursions
   - Carrier Performance Score

### Phase 2: Visual Design (Week 2-3)

1. **Create New Visuals**:
   - KPI cards (5 visuals)
   - Gauge charts (4 visuals)
   - Trend charts (3 visuals)
   - Scorecards (1 visual)

2. **Apply Color Scheme**:
   - Update existing visuals to match palette
   - Ensure consistency across page

3. **Add Interactivity**:
   - Connect slicers to new visuals
   - Enable cross-filtering
   - Add drill-through actions

### Phase 3: Testing & Optimization (Week 3)

1. **Data Validation**:
   - Verify measure calculations
   - Compare against source data
   - Test edge cases

2. **Performance Tuning**:
   - Optimize DAX formulas
   - Check query performance
   - Reduce refresh time if needed

3. **User Testing**:
   - Review with Marc
   - Gather feedback
   - Make adjustments

### Phase 4: Publication (End of Week 3)

1. **Final Review**:
   - Verify all measures working
   - Check visual formatting
   - Update documentation

2. **Publish to Power BI Service**:
   - Deploy updated .pbix
   - Configure refresh schedule
   - Set up alerts/bookmarks

3. **Documentation**:
   - Update KPIs.md
   - Update DATA_DICTIONARY.md
   - Create user guide

---

## Risk Mitigation

| Risk | Impact | Mitigation |
|:---|:---|:---|
| Missing data columns | High | Prioritize adding columns early in Phase 1 |
| DAX formula errors | High | Test each measure independently |
| Performance degradation | Medium | Profile queries, optimize iteratively |
| User adoption | Low | Create visuals that tell clear story |

---

## Success Criteria

✅ **Technical**:
- All 8 measures calculate correctly
- Performance page loads <3 seconds
- All visuals responsive to slicers
- Zero error messages in model

✅ **Business**:
- Cold Chain Compliance tracked and visible
- Carrier performance ranked and actionable
- Quality metrics aligned with KPIs.md definitions
- SLA achievement clearly reported

✅ **User Experience**:
- Clear, professional appearance
- Intuitive navigation/drill-down
- Consistent color scheme
- Mobile-friendly (if applicable)

---

## Dependencies

### Data Requirements

- SQL Server must have quality flag columns
- Transportation table must include temperature data
- Orders table must include SLA delivery dates
- Date dimension properly configured for time intelligence

### System Requirements

- Power BI Desktop 2024.12 or later
- Power BI Premium (for refresh schedule) or Power BI Pro
- Active SQL Server connection

---

## Team & Responsibilities

| Role | Responsibility | Timeline |
|:---|:---|:---|
| Data Marc | Implementation, DAX, visuals, testing | Weeks 1-3 |
| Data Governance (External) | Validate data columns, approve schema changes | Week 1 |
| Power BI Admin (External) | Deploy to service, configure refresh | Week 3 |

---

## Sign-Off

**Project Manager**: Marc James Samson  
**Status**: 📋 Ready for Implementation  
**Last Updated**: December 2025

---

## Appendix: Useful DAX Patterns

### Pattern 1: Safe Division

```dax
DIVIDE(Numerator, Denominator, 0)
```

### Pattern 2: Flag-based Calculation

```dax
SUMPRODUCT(
    (Table[Flag1] = 1) *
    (Table[Flag2] = 1) *
    Table[Amount]
)
```

### Pattern 3: Percentage Format

```dax
Measure := ... * 100  -- Multiply by 100
-- Format in visual: Percentage, 1 decimal place
```

### Pattern 4: YoY Comparison

```dax
CurrentYearValue / 
CALCULATE(Measure, DATEADD(Dates[Date], -1, YEAR)) - 1
```

### Pattern 5: Conditional Color

```dax
IF([Measure] > 0.95, 0, IF([Measure] > 0.85, 1, 2))
-- 0 = Green, 1 = Yellow, 2 = Red
```

---

