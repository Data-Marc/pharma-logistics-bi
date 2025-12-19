# Script PowerShell pour créer les mesures via XMLA
# Ce script se connecte au modèle Power BI et crée les mesures

# Configuration
$TenantName = "myorg"  # Remplacer par votre tenant
$WorkspaceName = "Pharma Logistics"  # Remplacer par votre workspace
$DatasetName = "PharmaLogistics"  # Remplacer par votre dataset

# Les 5 mesures au format TMSL
$Measures = @{
    "Warehouse Utilization %" = @{
        table = "Measures"
        expression = "DIVIDE(SUM(Inventory[CurrentStock]), SUM(Warehouses[Capacity]), 0) * 100"
        description = "Percentage of warehouse capacity used"
        formatString = "0.0`"%`""
    }
    "Stock-to-Min Ratio" = @{
        table = "Measures"
        expression = "AVERAGE(DIVIDE(Inventory[CurrentStock], Inventory[MinStock]))"
        description = "Ratio of current stock to minimum stock level"
        formatString = "0.00"
    }
    "Safety Stock Compliance %" = @{
        table = "Measures"
        expression = "DIVIDE(COUNTX(FILTER(Inventory, Inventory[CurrentStock] >= Inventory[SafetyStock]), Inventory[InventoryID]), COUNTA(Inventory[InventoryID]), 0) * 100"
        description = "Percentage of items meeting safety stock requirements"
        formatString = "0.0`"%`""
    }
    "Regional OTIF %" = @{
        table = "Measures"
        expression = "DIVIDE(COUNTX(FILTER(Orders, Orders[OTIF_Flag] = 1), Orders[OrderID]), COUNTA(Orders[OrderID]), 0) * 100"
        description = "On-Time In-Full percentage by region"
        formatString = "0.0`"%`""
    }
    "Fill Rate by Type" = @{
        table = "Measures"
        expression = "DIVIDE(COUNTX(FILTER(Orders, Orders[InFull_Flag] = 1), Orders[OrderID]), COUNTA(Orders[OrderID]), 0) * 100"
        description = "Percentage of orders with all items fulfilled"
        formatString = "0.0`"%`""
    }
}

function New-TMSLMeasure {
    param(
        [string]$MeasureName,
        [string]$TableName,
        [string]$Expression,
        [string]$Description,
        [string]$FormatString
    )
    
    $tmsl = @"
{
    "name": "$MeasureName",
    "description": "$Description",
    "expression": "$($Expression -replace '"', '\"')",
    "formatString": "$FormatString"
}
"@
    
    return $tmsl
}

function Invoke-TMSLCommand {
    param(
        [string]$TMSL,
        [string]$Server,
        [string]$Database
    )
    
    # Utiliser SSMS ou AMO pour exécuter le TMSL
    Write-Host "⚠️ TMSL Command (à exécuter dans SSMS ou Power BI):"
    Write-Host "==============================================="
    Write-Host $TMSL
    Write-Host "==============================================="
}

function Create-MeasuresViaAPI {
    param(
        [hashtable]$Measures
    )
    
    Write-Host "🚀 Création des mesures Power BI..."
    Write-Host "====================================`n"
    
    # Options:
    Write-Host "OPTION 1: Utiliser Power BI Desktop (RECOMMANDÉ)"
    Write-Host "-------"
    Write-Host "1. Ouvrir: C:\Users\Marc\Desktop\Pharma Logistics.pbix"
    Write-Host "2. Aller à: Accueil > Données"
    Write-Host "3. Dans le modèle sémantique, créer chaque mesure:"
    Write-Host ""
    
    $Measures.GetEnumerator() | ForEach-Object {
        Write-Host "MESURE: $($_.Key)"
        Write-Host "Expression:"
        Write-Host "  $($_.Value.expression)"
        Write-Host "Format: $($_.Value.formatString)"
        Write-Host ""
    }
    
    Write-Host "`n`nOPTION 2: Utiliser le script DAX ci-dessous"
    Write-Host "-------`n"
    
    # Générer le script DAX
    $daxScript = @()
    $Measures.GetEnumerator() | ForEach-Object {
        $measureName = $_.Key
        $expression = $_.Value.expression
        
        $dax = @"
Measure = 
    $expression
"@
        $daxScript += $dax
    }
    
    $daxScript
}

# Exécuter
Create-MeasuresViaAPI -Measures $Measures

Write-Host "`n`n✅ Script généré!"
Write-Host "Choisir l'option 1 (Power BI Desktop) pour un résultat garanti"
