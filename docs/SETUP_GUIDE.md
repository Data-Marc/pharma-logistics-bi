# Setup Guide - Pharma Logistics BI Dashboard

Complete installation and configuration instructions.

---

## Prerequisites

- **Power BI Desktop** (Latest version, minimum 2.131.xxx)
- **SQL Server** (2019 or later)
- **PharmaLogistics Database** (included or provided separately)
- **Windows OS** (7 or later, 64-bit recommended)
- **RAM** : 2GB minimum, 4GB+ recommended
- **Disk Space** : 1GB for Power BI files

---

## Installation Steps

### 1. Install Power BI Desktop

```bash
# Download from Microsoft
https://www.microsoft.com/en-us/download/details.aspx?id=58494

# Install with default settings
# Restart your computer after installation
```

### 2. Clone or Download Repository

```bash
# Clone via Git
git clone https://github.com/Data-Marc/pharma-logistics-bi.git

# Or download ZIP file directly from GitHub
```

### 3. Database Setup

#### Option A: Using Existing PharmaLogistics Database

```sql
-- Verify database exists
SELECT name FROM sys.databases WHERE name = 'PharmaLogistics'

-- Check tables
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'dbo'
```

#### Option B: Restore Database Backup

```sql
-- Restore from backup file
RESTORE DATABASE PharmaLogistics 
FROM DISK = 'C:\Backups\PharmaLogistics.bak'
WITH RECOVERY
```

#### Option C: Create from Scratch

Contact maintainers for SQL scripts to create tables and seed data.

### 4. Open Power BI File

1. Launch **Power BI Desktop**
2. Navigate to `pharma-logistics-bi` folder
3. Open **`Pharma Logistics.pbix`**
4. You may see a "refresh" prompt

### 5. Configure Data Source Connection

**If prompted for credentials:**

1. Click **Edit queries** → **Data source settings**
2. Select SQL Server connection
3. Enter credentials:
   - **Server** : `localhost\SQLEXPRESS` (or your server name)
   - **Database** : `PharmaLogistics`
   - **Authentication** : Windows or SQL credentials
4. Click **OK**

**If using Production Server:**

```
Server: [YOUR_SERVER_ADDRESS]\[INSTANCE]
Port: 1433 (default)
Database: PharmaLogistics
```

### 6. Refresh Data

```
Home → Refresh (or Ctrl + Shift + R)
```

**Expected Load Time:**
- First refresh: 30-60 seconds
- Subsequent refreshes: 10-20 seconds

**If errors occur:**
- Check database connection
- Verify SQL Server is running
- Check firewall rules
- Review Power BI error messages

### 7. Verify Installation

✅ **All dashboard pages load without errors**
✅ **KPI cards display current data**
✅ **Matrices show regional breakdown**
✅ **Filters respond to selections**
✅ **Drill-down features work**

---

## Configuration

### Change Data Source

```
File → Options → Data Source Settings → Edit Source
```

### Adjust Refresh Schedule (Service Only)

For Power BI Service:

1. Publish to Power BI Service
2. Go to dataset settings
3. Configure scheduled refresh
4. Set preferred refresh times

### Customize Date Range

Edit Date table filters in slicers or modify DAX measures for custom periods.

---

## Troubleshooting

### Issue: "Unable to connect to SQL Server"

**Solutions:**
- Verify SQL Server is running: `Services.msc`
- Check server name format
- Verify firewall allows SQL Server ports (1433)
- Test connection with SQL Management Studio

### Issue: "Data not refreshing"

**Solutions:**
- Check database availability
- Review refresh logs in Power BI Service
- Verify data source credentials
- Check for locked tables in SQL Server

### Issue: "Performance is slow"

**Solutions:**
- Reduce data volume in filters
- Close unnecessary visuals
- Increase Power BI Desktop memory
- Archive historical data if very large

### Issue: "Formula errors in measures"

**Solutions:**
- Check column names in data model
- Verify table relationships
- Review DAX syntax in problematic measures
- Refresh data model metadata

---

## Performance Optimization

### For Large Datasets

1. **Import vs DirectQuery** : Current setup uses Import (recommended)
2. **Compression** : Power BI Desktop compresses data automatically
3. **Aggregations** : Consider creating aggregated tables for huge volumes

### Recommended Hardware

| Scenario | RAM | CPU | Disk |
|----------|-----|-----|------|
| Small (< 100K rows) | 2GB | i5 | SSD 256GB |
| Medium (100K-1M rows) | 4GB | i7 | SSD 512GB |
| Large (> 1M rows) | 8GB | i9 | SSD 1TB |

---

## Publishing to Power BI Service

```
Home → Publish → Select Workspace → Publish

# Configure gateway for scheduled refresh
# (if using on-premises SQL Server)
```

---

## Support & Documentation

- **User Guide** : `/docs/USER_GUIDE.md`
- **Data Dictionary** : `/docs/DATA_DICTIONARY.md`
- **Technical Architecture** : `/docs/ARCHITECTURE.md`
- **FAQ** : `/docs/FAQ.md`

---

## Next Steps

1. ✅ Review **Overview** page for global KPIs
2. ✅ Explore **Performance** metrics by region
3. ✅ Analyze **Financial** data and margins
4. ✅ Monitor **Warehouse** inventory health
5. ✅ Check **Quality** compliance metrics

---

**Happy analyzing!** 📊
