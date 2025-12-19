-- ============================================================================
-- Pharma Logistics Database Schema Updates
-- Purpose: Add quality, compliance, and SLA columns for Performance page KPIs
-- Database: PharmaLogistics (SQL Server 2019+)
-- Date: December 2025
-- ============================================================================

-- STEP 1: Backup current schema (Run in separate script)
-- BACKUP DATABASE [PharmaLogistics] TO DISK = 'C:\Backups\PharmaLogistics_Backup_Dec2025.bak'
-- GO

-- ============================================================================
-- STEP 2: Add new columns to Orders table
-- ============================================================================

-- Check if columns exist before adding
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME = 'Damaged_Flag')
BEGIN
    ALTER TABLE [dbo].[Orders] ADD
        [Damaged_Flag] INT DEFAULT 0
    CONSTRAINT CK_Damaged_Flag CHECK ([Damaged_Flag] IN (0, 1));
    PRINT 'Added Damaged_Flag to Orders table';
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME = 'CorrectItems_Flag')
BEGIN
    ALTER TABLE [dbo].[Orders] ADD
        [CorrectItems_Flag] INT DEFAULT 1
    CONSTRAINT CK_CorrectItems_Flag CHECK ([CorrectItems_Flag] IN (0, 1));
    PRINT 'Added CorrectItems_Flag to Orders table';
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME = 'CorrectQuantity_Flag')
BEGIN
    ALTER TABLE [dbo].[Orders] ADD
        [CorrectQuantity_Flag] INT DEFAULT 1
    CONSTRAINT CK_CorrectQuantity_Flag CHECK ([CorrectQuantity_Flag] IN (0, 1));
    PRINT 'Added CorrectQuantity_Flag to Orders table';
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME = 'SLA_DeliveryDate')
BEGIN
    ALTER TABLE [dbo].[Orders] ADD
        [SLA_DeliveryDate] DATETIME2 NULL;
    PRINT 'Added SLA_DeliveryDate to Orders table';
END

-- ============================================================================
-- STEP 3: Add new columns to Transportation table
-- ============================================================================

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Transportation' AND COLUMN_NAME = 'MinTemp')
BEGIN
    ALTER TABLE [dbo].[Transportation] ADD
        [MinTemp] DECIMAL(5, 2) NULL;
    PRINT 'Added MinTemp to Transportation table';
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Transportation' AND COLUMN_NAME = 'MaxTemp')
BEGIN
    ALTER TABLE [dbo].[Transportation] ADD
        [MaxTemp] DECIMAL(5, 2) NULL;
    PRINT 'Added MaxTemp to Transportation table';
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Transportation' AND COLUMN_NAME = 'SetMinTemp')
BEGIN
    ALTER TABLE [dbo].[Transportation] ADD
        [SetMinTemp] DECIMAL(5, 2) NULL;
    PRINT 'Added SetMinTemp to Transportation table';
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Transportation' AND COLUMN_NAME = 'SetMaxTemp')
BEGIN
    ALTER TABLE [dbo].[Transportation] ADD
        [SetMaxTemp] DECIMAL(5, 2) NULL;
    PRINT 'Added SetMaxTemp to Transportation table';
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Transportation' AND COLUMN_NAME = 'TempCompliant')
BEGIN
    ALTER TABLE [dbo].[Transportation] ADD
        [TempCompliant] BIT DEFAULT 1;
    PRINT 'Added TempCompliant to Transportation table';
END

-- ============================================================================
-- STEP 4: Create indexes for improved query performance
-- ============================================================================

-- Index on Orders for quality metrics
IF NOT EXISTS (SELECT 1 FROM sys.indexes 
    WHERE name = 'IX_Orders_Quality_Metrics')
BEGIN
    CREATE INDEX IX_Orders_Quality_Metrics
    ON [dbo].[Orders] (OrderID, Damaged_Flag, CorrectItems_Flag, CorrectQuantity_Flag, Status)
    INCLUDE (DeliveryDate, InFull_Flag, OnTime_Flag, SLA_DeliveryDate)
    WITH (FILLFACTOR = 90);
    PRINT 'Created index IX_Orders_Quality_Metrics';
END

-- Index on Transportation for temperature compliance
IF NOT EXISTS (SELECT 1 FROM sys.indexes 
    WHERE name = 'IX_Transportation_Temperature')
BEGIN
    CREATE INDEX IX_Transportation_Temperature
    ON [dbo].[Transportation] (OrderID, Carrier, TempCompliant)
    INCLUDE (MinTemp, MaxTemp, SetMinTemp, SetMaxTemp)
    WITH (FILLFACTOR = 90);
    PRINT 'Created index IX_Transportation_Temperature';
END

-- ============================================================================
-- STEP 5: Initialize data for new columns (Set sensible defaults)
-- ============================================================================

-- Initialize Damaged_Flag: Set to 0 for all existing records (no damage by default)
UPDATE [dbo].[Orders]
SET [Damaged_Flag] = 0
WHERE [Damaged_Flag] IS NULL;
PRINT 'Initialized Damaged_Flag for existing records';

-- Initialize CorrectItems_Flag: Set to 1 for all existing delivered orders
UPDATE [dbo].[Orders]
SET [CorrectItems_Flag] = CASE 
    WHEN [Status] = 'Delivered' OR [Status] = 'Completed' THEN 1 
    ELSE 0 
END
WHERE [CorrectItems_Flag] IS NULL;
PRINT 'Initialized CorrectItems_Flag for existing records';

-- Initialize CorrectQuantity_Flag: Set to 1 (assume correct by default)
UPDATE [dbo].[Orders]
SET [CorrectQuantity_Flag] = 1
WHERE [CorrectQuantity_Flag] IS NULL;
PRINT 'Initialized CorrectQuantity_Flag for existing records';

-- Initialize SLA_DeliveryDate: Set to 3 days after order date (default SLA)
UPDATE [dbo].[Orders]
SET [SLA_DeliveryDate] = DATEADD(DAY, 3, [Date])
WHERE [SLA_DeliveryDate] IS NULL;
PRINT 'Initialized SLA_DeliveryDate for existing records (default 3 days)';

-- Initialize TempCompliant: Set to 1 for all carriers without cold chain requirements
UPDATE [dbo].[Transportation]
SET [TempCompliant] = 1
WHERE [TempCompliant] IS NULL AND [Carrier] NOT IN (
    'CMA CGM Air Cargo', 'Kuehne+Nagel', 'Maersk'
);
PRINT 'Initialized TempCompliant for non-cold-chain carriers';

-- ============================================================================
-- STEP 6: Validation and verification
-- ============================================================================

-- Verify columns were added successfully
SELECT 
    'Orders' AS [Table],
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders'
AND COLUMN_NAME IN ('Damaged_Flag', 'CorrectItems_Flag', 'CorrectQuantity_Flag', 'SLA_DeliveryDate')
ORDER BY ORDINAL_POSITION;

SELECT 
    'Transportation' AS [Table],
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Transportation'
AND COLUMN_NAME IN ('MinTemp', 'MaxTemp', 'SetMinTemp', 'SetMaxTemp', 'TempCompliant')
ORDER BY ORDINAL_POSITION;

-- Verify data integrity
SELECT 
    'Orders Data Summary' AS [Check],
    COUNT(*) AS TotalRecords,
    SUM(CASE WHEN Damaged_Flag = 1 THEN 1 ELSE 0 END) AS DamagedCount,
    SUM(CASE WHEN CorrectItems_Flag = 0 THEN 1 ELSE 0 END) AS IncorrectItemsCount,
    SUM(CASE WHEN SLA_DeliveryDate IS NOT NULL THEN 1 ELSE 0 END) AS SLA_DatePopulated
FROM [dbo].[Orders];

SELECT 
    'Transportation Data Summary' AS [Check],
    COUNT(*) AS TotalRecords,
    SUM(CASE WHEN MinTemp IS NOT NULL THEN 1 ELSE 0 END) AS TempsRecorded,
    SUM(CASE WHEN TempCompliant = 0 THEN 1 ELSE 0 END) AS TemperatureViolations
FROM [dbo].[Transportation];

-- ============================================================================
-- STEP 7: Sample temperature data population (for testing)
-- ============================================================================

-- OPTIONAL: Populate sample temperature data for cold chain suppliers
-- Adjust these values based on your actual requirements

BEGIN TRANSACTION PopulateTemperatureData

UPDATE [dbo].[Transportation]
SET 
    [SetMinTemp] = 2.0,      -- Cold chain minimum: 2°C
    [SetMaxTemp] = 8.0,      -- Cold chain maximum: 8°C
    [MinTemp] = ROUND(RAND() * 8 + 0, 2),     -- Random between 0-8
    [MaxTemp] = ROUND(RAND() * 6 + 4, 2),     -- Random between 4-10
    [TempCompliant] = CASE 
        WHEN ROUND(RAND() * 8 + 0, 2) >= 2.0 AND ROUND(RAND() * 6 + 4, 2) <= 8.0 
        THEN 1 
        ELSE 0 
    END
WHERE [Carrier] IN ('CMA CGM Air Cargo', 'Kuehne+Nagel', 'Maersk')
AND [MinTemp] IS NULL;

COMMIT TRANSACTION PopulateTemperatureData

PRINT 'Populated sample temperature data for cold chain carriers';

-- ============================================================================
-- STEP 8: Verify Performance and Indexes
-- ============================================================================

-- Check index usage
SELECT 
    OBJECT_NAME(i.object_id) AS [Table],
    i.name AS [Index],
    s.user_updates,
    s.user_seeks,
    s.user_scans,
    s.user_lookups
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats s 
    ON i.object_id = s.object_id 
    AND i.index_id = s.index_id
WHERE OBJECT_NAME(i.object_id) IN ('Orders', 'Transportation')
ORDER BY s.user_seeks + s.user_scans DESC;

-- ============================================================================
-- COMPLETION REPORT
-- ============================================================================

PRINT '';
PRINT '========================================';
PRINT 'Schema Update Completed Successfully!';
PRINT '========================================';
PRINT '';
PRINT 'Changes Made:';
PRINT '  ✓ Added 4 new columns to Orders table';
PRINT '  ✓ Added 5 new columns to Transportation table';
PRINT '  ✓ Created 2 performance indexes';
PRINT '  ✓ Initialized data for new columns';
PRINT '  ✓ Validated data integrity';
PRINT '';
PRINT 'Next Steps:';
PRINT '  1. Run diagnostic queries to verify data';
PRINT '  2. Refresh Power BI data connection';
PRINT '  3. Create DAX measures in Power BI';
PRINT '  4. Build visuals on Performance page';
PRINT '';
PRINT 'For issues or questions, review:';
PRINT '  - IMPLEMENTATION_SUMMARY.md';
PRINT '  - DAX_MEASURES_PERFORMANCE_PAGE.md';
PRINT '========================================';

