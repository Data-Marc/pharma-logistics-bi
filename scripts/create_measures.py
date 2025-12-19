#!/usr/bin/env python3
"""
Script pour créer 5 mesures DAX dans Power BI Desktop
Les mesures sont créées directement dans le modèle sémantique
"""

import os
import json
import zipfile
import tempfile
import shutil
from pathlib import Path

# Configuration
PBIX_PATH = r"C:\Users\Marc\Desktop\Pharma Logistics.pbix"
BACKUP_PATH = r"C:\Users\Marc\Desktop\Pharma Logistics_BACKUP_MEASURES.pbix"

# Les 5 mesures à créer
MEASURES = {
    "Warehouse Utilization %": {
        "table": "Measures",
        "expression": "DIVIDE(SUM(Inventory[CurrentStock]), SUM(Warehouses[Capacity]), 0) * 100",
        "description": "Percentage of warehouse capacity used",
        "format": "0.0\"%\""
    },
    "Stock-to-Min Ratio": {
        "table": "Measures",
        "expression": "AVERAGE(DIVIDE(Inventory[CurrentStock], Inventory[MinStock]))",
        "description": "Ratio of current stock to minimum stock level",
        "format": "0.00"
    },
    "Safety Stock Compliance %": {
        "table": "Measures",
        "expression": "DIVIDE(COUNTX(FILTER(Inventory, Inventory[CurrentStock] >= Inventory[SafetyStock]), Inventory[InventoryID]), COUNTA(Inventory[InventoryID]), 0) * 100",
        "description": "Percentage of items meeting safety stock requirements",
        "format": "0.0\"%\""
    },
    "Regional OTIF %": {
        "table": "Measures",
        "expression": "DIVIDE(COUNTX(FILTER(Orders, Orders[OTIF_Flag] = 1), Orders[OrderID]), COUNTA(Orders[OrderID]), 0) * 100",
        "description": "On-Time In-Full percentage by region",
        "format": "0.0\"%\""
    },
    "Fill Rate by Type": {
        "table": "Measures",
        "expression": "DIVIDE(COUNTX(FILTER(Orders, Orders[InFull_Flag] = 1), Orders[OrderID]), COUNTA(Orders[OrderID]), 0) * 100",
        "description": "Percentage of orders with all items fulfilled",
        "format": "0.0\"%\""
    }
}

def extract_pbix(pbix_path, extract_dir):
    """Extraire le fichier PBIX"""
    print(f"📦 Extraction de {pbix_path}...")
    with zipfile.ZipFile(pbix_path, 'r') as zip_ref:
        zip_ref.extractall(extract_dir)
    print(f"✅ Extraction complète: {extract_dir}")

def find_model_file(extract_dir):
    """Trouver le fichier model.bim ou le fichier de modèle"""
    # Chercher model.bim
    for root, dirs, files in os.walk(extract_dir):
        for file in files:
            if file == "model.bim":
                return os.path.join(root, file)
    
    # Si pas de model.bim, chercher le rapport
    report_path = os.path.join(extract_dir, "Report", "definition", "report.json")
    if os.path.exists(report_path):
        return report_path
    
    return None

def repackage_pbix(extract_dir, output_path):
    """Repackager en PBIX"""
    print(f"📦 Repackaging en {output_path}...")
    with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(extract_dir):
            for file in files:
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, extract_dir)
                zipf.write(file_path, arcname)
    print(f"✅ PBIX créé: {output_path}")

def main():
    print("🚀 Création des mesures Power BI...")
    print("=" * 60)
    
    # Vérifier que le fichier existe
    if not os.path.exists(PBIX_PATH):
        print(f"❌ Fichier non trouvé: {PBIX_PATH}")
        return False
    
    # Créer backup
    print(f"💾 Création de la sauvegarde...")
    shutil.copy2(PBIX_PATH, BACKUP_PATH)
    print(f"✅ Sauvegarde: {BACKUP_PATH}")
    
    # Créer répertoire temporaire
    with tempfile.TemporaryDirectory() as temp_dir:
        extract_dir = os.path.join(temp_dir, "extracted")
        os.makedirs(extract_dir)
        
        # Extraire PBIX
        extract_pbix(PBIX_PATH, extract_dir)
        
        # Trouver le fichier modèle
        model_file = find_model_file(extract_dir)
        
        if model_file and model_file.endswith(".bim"):
            print(f"📄 Fichier modèle trouvé: {model_file}")
            
            # Charger le modèle BIM
            with open(model_file, 'r', encoding='utf-8') as f:
                model = json.load(f)
            
            # Ajouter les mesures
            print("\n📊 Ajout des mesures...")
            
            # Vérifier si la table "Measures" existe
            measures_table = None
            for table in model.get('model', {}).get('tables', []):
                if table.get('name') == 'Measures':
                    measures_table = table
                    break
            
            if not measures_table:
                print("⚠️ Table 'Measures' non trouvée, création...")
                measures_table = {
                    "name": "Measures",
                    "columns": [],
                    "measures": [],
                    "partitions": [{
                        "name": "Measures",
                        "mode": "import",
                        "source": {
                            "type": "calculated"
                        }
                    }]
                }
                model['model']['tables'].append(measures_table)
            
            # Ajouter chaque mesure
            for measure_name, measure_config in MEASURES.items():
                measure = {
                    "name": measure_name,
                    "expression": measure_config["expression"],
                    "description": measure_config["description"],
                    "formatString": measure_config["format"]
                }
                
                if 'measures' not in measures_table:
                    measures_table['measures'] = []
                
                # Éviter les doublons
                if not any(m.get('name') == measure_name for m in measures_table['measures']):
                    measures_table['measures'].append(measure)
                    print(f"  ✅ {measure_name}")
                else:
                    print(f"  ⏭️  {measure_name} (déjà existante)")
            
            # Sauvegarder le modèle modifié
            with open(model_file, 'w', encoding='utf-8') as f:
                json.dump(model, f, indent=2, ensure_ascii=False)
            
            print("\n✅ Modèle mis à jour")
            
            # Repackager en PBIX
            repackage_pbix(extract_dir, PBIX_PATH)
            
            print("\n" + "=" * 60)
            print("🎉 SUCCÈS! Les mesures ont été créées!")
            print("=" * 60)
            print("\n📋 Mesures créées:")
            for measure_name in MEASURES.keys():
                print(f"  • {measure_name}")
            print(f"\n💡 Ouvrez le fichier dans Power BI Desktop pour les utiliser")
            print(f"📁 Fichier: {PBIX_PATH}")
            
            return True
        
        elif model_file and model_file.endswith("report.json"):
            print("⚠️ Modèle cloud détecté (Remote Artifacts)")
            print("❌ Les mesures cloud doivent être créées dans Power BI Service")
            print("\n💡 Solution: Utiliser Power BI Desktop pour créer les mesures manuellement")
            return False
        
        else:
            print("❌ Fichier modèle non trouvé")
            print(f"📍 Répertoire: {extract_dir}")
            return False

if __name__ == "__main__":
    try:
        success = main()
        exit(0 if success else 1)
    except Exception as e:
        print(f"❌ Erreur: {e}")
        import traceback
        traceback.print_exc()
        exit(1)
