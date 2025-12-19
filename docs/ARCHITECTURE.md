# Architecture Overview

## System Architecture

The Pharma Logistics BI solution follows a modern three-tier data architecture connecting operational data sources to business analytics dashboards.

```mermaid
graph LR
    A["SQL Server 2019+<br/>PharmaLogistics Database"] -->|Daily Refresh| B["Analysis Services<br/>Tabular Model<br/>SemanticModel"]
    B -->|Data Binding| C["Power BI Desktop<br/>Report Model"]
    C -->|Live Connection| D["Power BI Dashboard<br/>4 Dashboard Pages"]
    
    style A fill:#1f77b4,stroke:#333,stroke-width:2px,color:#fff
    style B fill:#ff7f0e,stroke:#333,stroke-width:2px,color:#fff
    style C fill:#2ca02c,stroke:#333,stroke-width:2px,color:#fff
    style D fill:#d62728,stroke:#333,stroke-width:2px,color:#fff
```

## Data Flow & Refresh Cycle

```mermaid
graph TB
    A["SQL Server Database<br/>- 822,000+ Records<br/>- 13 Data Tables"] -->|Extract| B["ETL Process"]
    B -->|Transform & Load| C["Analysis Services<br/>Tabular Model"]
    C -->|Refresh Daily| D["Semantic Model Cache"]
    D -->|Power BI Query| E["Report Visualizations"]
    E -->|Render| F["End-User Dashboard"]
    
    G["Refresh Schedule: Daily"] -.-> B
    
    style A fill:#1f77b4,stroke:#333,stroke-width:2px,color:#fff
    style B fill:#ff7f0e,stroke:#333,stroke-width:2px,color:#fff
    style C fill:#ff7f0e,stroke:#333,stroke-width:2px,color:#fff
    style D fill:#2ca02c,stroke:#333,stroke-width:2px,color:#fff
    style E fill:#d62728,stroke:#333,stroke-width:2px,color:#fff
    style F fill:#9467bd,stroke:#333,stroke-width:2px,color:#fff
    style G fill:#8c564b,stroke:#333,stroke-width:2px,color:#fff
```

## Component Details

### Data Source Layer

**SQL Server 2019+** (PharmaLogistics Database)
- Primary operational database
- Contains 13 fact and dimension tables
- 822,000+ records across 4 regions
- Data coverage: 44 countries, 44 warehouses
- Supports real-time queries and scheduled refreshes

**Key Tables:**
- `Shipments` - Transportation records
- `Warehouse_Movements` - Inventory operations
- `Regions` - Geographic dimensions
- `Products` - Pharmaceutical product catalog
- `Customers` - Distribution network nodes

### Semantic Layer

**Analysis Services Tabular Model** (SemanticModel)
- Purpose: Data aggregation and business logic
- Model Type: Tabular (in-memory analytics)
- Compatibility Level: 1700+
- Data Refresh: Daily scheduled
- Caching: In-memory with query optimization

**Model Components:**
- **20 Active Relationships** between tables
- **202 Calculated Measures** including:
  - KPI calculations
  - Financial aggregations
  - Performance metrics
- **User Hierarchies:**
  - Geographic hierarchy (Region -> Country -> Warehouse)
  - Time hierarchy (Year -> Month -> Day)
  - Product hierarchy (Category -> Product)

### Presentation Layer

**Power BI Desktop Report Model** (Pharma Logistics.pbix)
- 4 Dashboard pages with 73 interactive visuals
- Live connection to Analysis Services
- Switchable button groups for comparative analysis
- Bookmark navigation for user experience

#### Dashboard Pages

1. **Overview Page**
   - 16 visuals
   - 6 KPI summary cards (Total Orders, OTIF, Lead Time, etc.)
   - Freight Cost by transportation mode (bar chart)
   - Cold Chain Supply composition (pie chart)
   - Total Revenue by Region with COGS (stacked bar)
   - Inventory Cost vs Value comparison (switchable buttons)
   - Supplier stockout financial impact (data table)

2. **Warehouses Page**
   - 17 visuals
   - 6 KPI summary cards
   - Current Stock inventory table (switchable with Stock at Risk)
   - Geographic warehouse distribution map (Microsoft Azure)
   - Inventory Turnover by month (switchable with Warehouse Utilization %)
   - Health Volume pie chart (switchable with Health Unit pie)
   - Products in Stocks matrix (Medical Device, Consumable, etc.)
   - Health Stock Unit and Volume data tables with reorder status

3. **Performance Page**
   - 20 visuals
   - 6 KPI summary cards
   - Delivery Delays by supplier (switchable with Reliability Rate)
   - Time Delay Categories stacked bar (switchable with Time Delay Visual)
   - Lead Time by Suppliers (switchable with Delivery Delays)
   - CO₂ per Kg analysis (switchable with CO₂ per 100 Km)
   - CO₂ by Carrier comparison (switchable with CO₂ by Mode)
   - CO₂ avg per Order trend (switchable with CO₂ per 100 Km)
   - Delivery Performance matrix by region and carrier

4. **Financial Page**
   - 20 visuals
   - 6 KPI summary cards
   - Actual Lead Time donut by carrier (switchable with Lead Time Total Orders)
   - OTIF Carriers comparison (switchable with On Time Carriers)
   - OTIF Breakdown % (switchable with Breakdown Cost %)
   - Orders by Status waterfall chart (Delivered, Pending, Returned, Cancelled)
   - Back Orders vs Orders (switchable with Excursion % vs Orders)
   - Transport Lead Time vs Global Lead Time by carrier
   - Delivery Performance and Quality Cost matrices by region

## KPI Architecture

**61 KPIs** organized across 4 categories:

### Transport KPIs (16)
- On-time delivery rate
- Average transit time
- Freight cost per unit
- Vehicle utilization rate
- Delivery distance optimization

### Warehouse KPIs (18)
- Inventory turnover rate
- Storage utilization rate
- Order fulfillment time
- Warehouse operation cost
- Stock accuracy rate

### Performance KPIs (15)
- Overall equipment effectiveness (OEE)
- Process adherence rate
- Quality score
- Productivity metrics
- Compliance indicators

### Financial KPIs (12)
- Total logistics cost
- Cost per shipment
- Revenue per region
- Margin by product
- ROI metrics

## Technologies Stack

| Component | Technology | Version |
|-----------|-----------|---------|
| **Database** | SQL Server | 2019+ |
| **Semantic Model** | Analysis Services (Tabular) | 2022+ |
| **BI Platform** | Power BI Desktop | Latest |
| **Refresh Engine** | Analysis Services Refresh | Scheduled Daily |
| **Reporting** | Power BI Service | Cloud-based |

## Data Refresh & Maintenance

### Refresh Schedule
- **Frequency:** Daily
- **Time:** Off-peak hours (after business close)
- **Duration:** 15-30 minutes typical
- **Trigger:** Scheduled refresh + on-demand capability

### Maintenance Tasks
- Daily: Data refresh from SQL Server
- Weekly: Data quality validation
- Monthly: Performance optimization and indexing
- Quarterly: Model review and KPI validation

## Security Architecture

### Data Security
- SQL Server integrated authentication
- Analysis Services role-based security (RLS)
- Row-level security (RLS) by region and user
- Connection string encryption

### Access Control
- Power BI Azure AD integration
- Workspace-level permissions
- Row-level security filters
- Audit logging enabled

## Performance Considerations

### Query Optimization
- Tabular model uses in-memory engine (Vertipaq)
- Calculation engine optimized for DAX
- Materialized aggregations for large datasets
- Compression ratio: Typical 10:1 from source

### Scalability
- Supports growing data volume (currently 822K+ records)
- Analysis Services can handle millions of records
- Partitioning strategy for large fact tables
- Incremental refresh capability for efficiency

## Integration Points

### Data Integration
- **SQL Server** <-> **Analysis Services** (XMLA protocol)
- **Analysis Services** <-> **Power BI** (DAX queries)
- **Power BI** <-> **Power BI Service** (cloud sync)

### External Connections
- Azure Key Vault for credentials (recommended)
- Service Principal for automated refresh
- Power BI Gateway for on-premises connectivity (if applicable)

## Disaster Recovery

### Backup Strategy
- SQL Server: Full backup + transaction logs
- Analysis Services: Model metadata backup
- Power BI: Report definitions in source control
- Retention: 30-day rolling backup window

### Recovery Procedures
- Database restore: Standard SQL Server procedure
- Model restore: TMSL script deployment
- Report restore: Git-based version control

## Future Enhancements

- Real-time data streaming (if required)
- Advanced ML predictive analytics
- Geospatial analysis expansion
- Mobile-optimized dashboards
- API layer for third-party integrations

---

**Last Updated:** December 2025  
**Documentation Version:** 2.0  
**Status:** Current

