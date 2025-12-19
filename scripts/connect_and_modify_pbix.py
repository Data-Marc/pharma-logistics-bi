#!/usr/bin/env python3
"""
Script pour modifier le fichier PBIX et ajouter les 5 mesures DAX
"""

import json
import zipfile
import os
import shutil
import tempfile
from pathlib import Path
from datetime import datetime

PBIX_PATH = r"C:\Users\Marc\Desktop\Pharma Logistics.pbix"
BACKUP_SUFFIX = f"_BEFORE_MEASURES_{datetime.now().strftime('%Y%m%d_%H%M%S')}"

# Les 5 mesures à créer
MEASURES = {
    "Warehouse Utilization %": {
        "expression": "DIVIDE(SUM(Inventory[CurrentStock]), SUM(Warehouses[Capacity]), 0) * 100",
        "description": "Percentage of warehouse capacity used",
        "formatString": "0.0\"%\""
    },
    "Stock-to-Min Ratio": {
        "expression": "AVERAGE(DIVIDE(Inventory[CurrentStock], Inventory[MinStock]))",
        "description": "Ratio of current stock to minimum stock level",
        "formatString": "0.00"
    },
    "Safety Stock Compliance %": {
        "expression": "DIVIDE(COUNTX(FILTER(Inventory, Inventory[CurrentStock] >= Inventory[SafetyStock]), Inventory[InventoryID]), COUNTA(Inventory[InventoryID]), 0) * 100",
        "description": "Percentage of items meeting safety stock requirements",
        "formatString": "0.0\"%\""
    },
    "Regional OTIF %": {
        "expression": "DIVIDE(COUNTX(FILTER(Orders, Orders[OTIF_Flag] = 1), Orders[OrderID]), COUNTA(Orders[OrderID]), 0) * 100",
        "description": "On-Time In-Full percentage by region",
        "formatString": "0.0\"%\""
    },
    "Fill Rate by Type": {
        "expression": "DIVIDE(COUNTX(FILTER(Orders, Orders[InFull_Flag] = 1), Orders[OrderID]), COUNTA(Orders[OrderID]), 0) * 100",
        "description": "Percentage of orders with all items fulfilled",
        "formatString": "0.0\"%\""
    }
}

def backup_file(file_path):
    """Créer une sauvegarde du fichier"""
    backup_path = file_path.replace(".pbix", BACKUP_SUFFIX + ".pbix")
    print(f"💾 Sauvegarde: {backup_path}")
    shutil.copy2(file_path, backup_path)
    return backup_path

def extract_pbix(pbix_path, extract_dir):
    """Extraire le PBIX comme ZIP"""
    print(f"📦 Extraction de {os.path.basename(pbix_path)}...")
    with zipfile.ZipFile(pbix_path, 'r') as zip_ref:
        zip_ref.extractall(extract_dir)
    print(f"✅ Extraction complète")
    return extract_dir

def find_model_json(extract_dir):
    """Trouver le fichier de modèle JSON"""
    # Chercher report.json ou model.bim
    for root, dirs, files in os.walk(extract_dir):
        for file in files:
            if file == "model.bim":
                return os.path.join(root, file), "bim"
            elif file == "report.json" and "Report" in root:
                return os.path.join(root, file), "report"
    return None, None

def load_model(model_path, model_type):
    """Charger le fichier modèle"""
    print(f"📄 Chargement du modèle ({model_type})...")
    with open(model_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def add_measures_to_model(model, measures):
    """Ajouter les mesures au modèle"""
    print("📊 Ajout des mesures...")
    
    # Trouver ou créer la table "Measures"
    tables = model.get('model', {}).get('tables', [])
    measures_table = None
    
    for table in tables:
        if table.get('name') == 'Measures':
            measures_table = table
            break
    
    if not measures_table:
        print("  ⚠️ Table 'Measures' non trouvée, création...")
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
    if 'measures' not in measures_table:
        measures_table['measures'] = []
    
    added_count = 0
    for measure_name, measure_config in measures.items():
        # Vérifier si elle existe déjà
        exists = any(m.get('name') == measure_name for m in measures_table.get('measures', []))
        
        if not exists:
            new_measure = {
                "name": measure_name,
                "expression": measure_config["expression"],
                "description": measure_config["description"],
                "formatString": measure_config["formatString"],
                "isHidden": False
            }
            measures_table['measures'].append(new_measure)
            print(f"  ✅ {measure_name}")
            added_count += 1
        else:
            print(f"  ⏭️  {measure_name} (déjà existante)")
    
    return model, added_count

def save_model(model, model_path):
    """Sauvegarder le modèle modifié"""
    print(f"💾 Sauvegarde du modèle...")
    with open(model_path, 'w', encoding='utf-8') as f:
        json.dump(model, f, indent=2, ensure_ascii=False)
    print("✅ Modèle sauvegardé")

def repackage_pbix(extract_dir, output_path):
    """Repackager le PBIX"""
    print(f"📦 Repackaging en PBIX...")
    
    # Supprimer le fichier existant si présent
    if os.path.exists(output_path):
        os.remove(output_path)
    
    # Créer le ZIP
    with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(extract_dir):
            for file in files:
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, extract_dir)
                zipf.write(file_path, arcname)
    
    print(f"✅ PBIX créé: {os.path.basename(output_path)}")

def main():
    print("\n" + "="*70)
    print("🚀 Connexion et modification du fichier Power BI")
    print("="*70 + "\n")
    
    # Vérifier le fichier
    if not os.path.exists(PBIX_PATH):
        print(f"❌ Fichier non trouvé: {PBIX_PATH}")
        return False
    
    print(f"📁 Fichier: {PBIX_PATH}")
    print(f"📊 Taille: {os.path.getsize(PBIX_PATH) / 1024 / 1024:.1f} MB\n")
    
    try:
        # Sauvegarde
        backup_file(PBIX_PATH)
        
        # Créer répertoire temporaire
        with tempfile.TemporaryDirectory() as temp_dir:
            extract_dir = os.path.join(temp_dir, "pbix_extracted")
            os.makedirs(extract_dir)
            
            # Extraire
            extract_pbix(PBIX_PATH, extract_dir)
            
            # Trouver le modèle
            model_path, model_type = find_model_json(extract_dir)
            
            if not model_path:
                print("❌ Fichier modèle non trouvé dans le PBIX")
                print(f"📍 Répertoire: {extract_dir}")
                return False
            
            print(f"✅ Modèle trouvé: {model_type}\n")
            
            # Charger le modèle
            model = load_model(model_path, model_type)
            
            # Ajouter les mesures
            model, added = add_measures_to_model(model, MEASURES)
            
            # Sauvegarder
            save_model(model, model_path)
            
            # Repackager
            repackage_pbix(extract_dir, PBIX_PATH)
        
        # Résumé
        print("\n" + "="*70)
        print("✅ SUCCÈS!")
        print("="*70)
        print(f"📊 Mesures créées: {added}/{len(MEASURES)}")
        print(f"📁 Fichier modifié: {PBIX_PATH}")
        print(f"\n💡 Les mesures sont maintenant disponibles dans Power BI!")
        print(f"\n🔄 Pour voir les changements:")
        print(f"   1. Fermer Power BI Desktop si ouvert")
        print(f"   2. Rouvrir: {PBIX_PATH}")
        print(f"   3. Aller à: Données > Modèle")
        print(f"   4. Chercher le groupe '_Measures' ou 'Measures'")
        print("="*70 + "\n")
        
        return True
        
    except Exception as e:
        print(f"❌ Erreur: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    success = main()
    exit(0 if success else 1)
