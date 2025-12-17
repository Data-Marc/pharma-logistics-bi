# Database Schema & Data Model

## Overview

This document describes the database schema and data relationships for the Pharma Logistics BI system. The data model supports comprehensive tracking and analytics across the pharmaceutical supply chain including inventory management, transportation, warehousing, and financial metrics.

---

## Entity Relationship Diagram (ERD)

The following diagram illustrates the relationships between all major entities in the pharma logistics database:

![Relations Table](./images/Relations%20Table.png)

---

## Core Entities

### **1. Orders**
- Unique order identifiers
- Order dates and delivery windows
- Customer information
- Order status tracking

### **2. Shipments**
- Shipment tracking information
- Carrier assignments
- Temperature and compliance monitoring
- Transit details (origin, destination, route)

### **3. Inventory**
- Stock keeping units (SKUs)
- Warehouse locations
- Batch tracking and expiry dates
- Quantity on hand and reserved stock

### **4. Warehouses**
- Warehouse locations globally (44 warehouses)
- Storage capacity
- Operational metrics
- Regional assignments

### **5. Carriers**
- Carrier information (7 tracked carriers)
- Performance metrics
- Service level agreements
- Cost rates

### **6. Products**
- Product catalog (6 categories)
- Product attributes
- Regulatory classifications
- Cost and pricing information

### **7. Transactions**
- Daily transaction records
- Financial entries
- Compliance documentation
- Audit trails

---

## Key Relationships

| From Entity | To Entity | Relationship | Cardinality |
| :--- | :--- | :--- | :--- |
| **Orders** | Shipments | One order can have multiple shipments | 1:N |
| **Orders** | Inventory | Orders consume inventory | M:N |
| **Shipments** | Carriers | Each shipment uses one carrier | N:1 |
| **Shipments** | Warehouses | Shipments originate from/go to warehouses | N:N |
| **Inventory** | Products | Inventory tracks product SKUs | N:1 |
| **Inventory** | Warehouses | Inventory stored in warehouses | N:1 |
| **Products** | Categories | Products belong to categories | N:1 |
| **Warehouses** | Regions | Warehouses assigned to regions | N:1 |

---

## Data Flow

```
Orders → Shipments → Inventory → Warehouses
   ↓         ↓            ↓           ↓
Customers  Carriers   Products    Regions
   ↓         ↓            ↓           ↓
Transactions Financial Metrics Performance KPIs
```

---

## Regional Structure

**4 Regions:**
- Region 1
- Region 2
- Region 3
- Region 4

**44 Warehouses** distributed globally with inventory and logistics tracking

---

## Product Categories

**6 Categories:**
- Category 1
- Category 2
- Category 3
- Category 4
- Category 5
- Category 6

---

## Data Quality Standards

- ✅ All foreign keys validated
- ✅ Referential integrity enforced
- ✅ Unique constraints on business keys
- ✅ Audit timestamps on all transactional data
- ✅ Data normalization (3NF)

---

## Refresh Schedules

- **Real-time:** Shipment tracking, Temperature monitoring
- **Hourly:** Order processing, Inventory movements
- **Daily:** Financial reconciliation, KPI calculations
- **Weekly:** Reporting aggregations
- **Monthly:** Historical analysis and archiving

---

## Related Documentation

- 📊 [KPIs Documentation](./KPIs.md) - Comprehensive KPI definitions
- 🏗️ [Architecture Guide](./ARCHITECTURE.md) - System architecture overview
- 📖 [Data Dictionary](./DATA_DICTIONARY.md) - Detailed field descriptions

---

**Last Updated:** December 2025  
**Schema Version:** 1.0.0  
**Data Model Compliance:** ISO 8601, HIPAA, GDP
