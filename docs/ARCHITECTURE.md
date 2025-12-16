# Technical Architecture - Pharma Logistics BI

---

## System Overview

```
┌─────────────────────────────────────────────────────────┐
│                    Power BI Desktop                     │
│  (Data Model, Measures, Visualizations, Interactions)  │
└──────────────────┬──────────────────────────────────────┘
                   │
         Analysis Services
         (Tabular Model)
                   │
┌──────────────────┴──────────────────────────────────────┐
│                   SQL Server                            │
│            (PharmaLogistics Database)                   │
│         (Fact & Dimension Tables)                       │
└─────────────────────────────────────────────────────────┘
```

---

## Data Model Architecture

### Star Schema Design

**Center: Fact Tables**
- `Orders` (Primary fact table)
- `Transportation` (Secondary fact)
- `Inventory` (Inventory analysis)
- `Returns` (Quality tracking)
- `TemperatureExcursions` (Cold chain)

**Rays: Dimension Tables**
- `Date` (Time dimension - 20 columns)
- `Customers` (Customer master)
- `Products` (Product master)
- `Suppliers` (Supplier master)
- `Warehouses` (Location master)
- `DIM_Carrier` (Carrier master)

### Key Tables Detail

#### Orders (Fact Table)
- **Columns**: 24
- **Rows**: ~9,000-10,000
- **Updates**: Daily refresh
- **Primary Key**: OrderID

#### Transportation (Fact Table)
- **Columns**: 11
- **Rows**: ~9,000-10,000
- **Updates**: Daily
- **Primary Key**: OrderID + Mode

#### Date (Dimension Table)
- **Columns**: 20
- **Rows**: 1,825+ (5 years)
- **Updates**: Static
- **Primary Key**: Date

---

## DAX Architecture

### Measure Organization

**180+ Measures across 5 tables**

- **Overview** : 91 measures
- **Performance** : 13 measures
- **Quality** : 20 measures
- **Financial** : 46 measures
- **Warehouses** : 32 measures

### Key DAX Patterns

#### Time Intelligence
```dax
[Measure MTP] = CALCULATE([Base Measure], 
    DATESBETWEEN('Date'[Date], 
    DATE(YEAR(TODAY()), MONTH(TODAY()), 1), TODAY()))
```

#### Regional Filtering
```dax
[Regional Measure] = CALCULATE([Base Measure],
    USERELATIONSHIP('Orders'[Region], 'v_LeadTime_Orders'[Region]))
```

---

## Data Flow & Refresh

```
SQL Server Database
        ↓
  [Daily Refresh]
        ↓
Analysis Services
(Tabular Model)
        ↓
Power BI Desktop
(Memory Cache)
        ↓
Dashboard Visualization
```

---

## Technologies

| Component | Technology | Version |
|-----------|-----------|---------|
| BI Platform | Power BI Desktop | 2.131+ |
| Data Engine | Analysis Services | 2019+ |
| Database | SQL Server | 2019/2022 |
| Query Language | DAX | Latest |
| Schema | Star Schema | Normalized |

---

**For detailed technical questions, see CONTRIBUTING.md**
