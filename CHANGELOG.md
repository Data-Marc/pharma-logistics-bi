# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-12-16

### Added
- **Initial Release** - Complete pharmaceutical supply chain analytics dashboard
- **Overview Page** - Global KPIs and performance dashboard with carrier metrics
- **Performance Page** - Regional performance matrix and carrier lead time analysis with dual-axis revenue/COGS visualization
- **Financial Page** - Supply chain economics, profitability analysis, and carrier efficiency benchmarking
- **Warehouses Page** - Inventory health monitoring with DOH tracking and stock status indicators
- **Quality Page** - Cold chain compliance and delivery accuracy metrics
- **Forecast Page** - Demand planning and forecast accuracy analytics
- **180+ DAX Measures** - Comprehensive business logic covering KPIs, time intelligence (MTD/YTD), and financial analytics
- **Dynamic Filtering** - 10+ interactive slicers (Region, Country, Carrier, Transport Mode, etc.)
- **Visual Indicators** - Stars (⭐), Triangles (▲◆▼) for intuitive status representation
- **Environmental Metrics** - CO2 tracking per KM, per 100km, and per order
- **Data Model** - 29 tables, 20 relationships, star schema architecture
- **Documentation** - Comprehensive setup guide, data dictionary, and technical architecture

### Technical Details
- Power BI Desktop (Premium)
- Analysis Services Tabular Model
- SQL Server Backend
- Support for time-based comparisons and regional drill-downs

### Database Schema
- **Fact Tables**: Orders (24 columns), Transportation (11), Inventory (12), Returns, TemperatureExcursions
- **Dimensions**: Customers, Products, Suppliers, Warehouses, Carriers, Date (20 columns), etc.
- **Measure Tables**: 5 specialized tables (Overview, Performance, Quality, Financial, Warehouses, CO2)

---

## [0.9.0] - 2025-12-14

### Beta Testing Phase
- Core data model established
- Performance matrices created with regional drill-down
- Financial KPIs under development
- Warehouse metrics framework

---

## Planned Features (Roadmap)

- [ ] Export to PDF automation
- [ ] Real-time data refresh configuration
- [ ] Mobile-optimized dashboard layouts
- [ ] Advanced forecasting algorithms
- [ ] Budget vs Actual analysis
- [ ] Predictive analytics for demand
- [ ] API integration for external data sources
- [ ] Multi-language support

---

## Known Issues

None currently reported.

---

## Support

For bug reports or feature requests, please open an issue in the repository.
