# 📊 GUIDE: Créer les 5 mesures dans Power BI Desktop

## ⚠️ Situation actuelle
- ✅ Fichier .pbix: LOCAL sur `C:\Users\Marc\Desktop\Pharma Logistics.pbix`
- ✅ Modèle: CLOUD (Remote Artifacts)
- ❌ Les mesures ne peuvent PAS être ajoutées via script
- ✅ Les mesures DOIVENT être créées manuellement via Power BI Desktop

---

## 🎯 Étapes (5 minutes)

### **ÉTAPE 1: Ouvrir le fichier**
1. Ouvrir **Power BI Desktop**
2. Fichier → Ouvrir
3. Sélectionner: `C:\Users\Marc\Desktop\Pharma Logistics.pbix`
4. Attendre le chargement (~30 secondes)

---

### **ÉTAPE 2: Accéder au modèle sémantique**
1. Cliquer sur **"Données"** dans le ruban
2. Ou: Vue → Modèle

---

### **ÉTAPE 3: Créer la première mesure**

**MESURE 1: Warehouse Utilization %**

1. Dans le volet "Données" (à gauche), chercher la table **"Measures"**
2. Si n'existe pas → Nouvelle table: Ajouter → Nouvelle table (vide)
3. Dans la table Measures:
   - Clic-droit → Nouvelle mesure
   - Copier-coller cette formule:

```dax
Warehouse Utilization % = 
DIVIDE(SUM(Inventory[CurrentStock]), SUM(Warehouses[Capacity]), 0) * 100
```

4. Appuyer sur **Entrée**
5. Propriétés (à droite):
   - Format: **Pourcentage**
   - Décimales: **1**

---

### **ÉTAPE 4: Créer les 4 autres mesures**

#### **MESURE 2: Stock-to-Min Ratio**
```dax
Stock-to-Min Ratio = 
AVERAGE(DIVIDE(Inventory[CurrentStock], Inventory[MinStock]))
```
- Format: **Nombre**
- Décimales: **2**

---

#### **MESURE 3: Safety Stock Compliance %**
```dax
Safety Stock Compliance % = 
DIVIDE(
    COUNTX(FILTER(Inventory, Inventory[CurrentStock] >= Inventory[SafetyStock]), Inventory[InventoryID]),
    COUNTA(Inventory[InventoryID]),
    0
) * 100
```
- Format: **Pourcentage**
- Décimales: **1**

---

#### **MESURE 4: Regional OTIF %**
```dax
Regional OTIF % = 
DIVIDE(
    COUNTX(FILTER(Orders, Orders[OTIF_Flag] = 1), Orders[OrderID]),
    COUNTA(Orders[OrderID]),
    0
) * 100
```
- Format: **Pourcentage**
- Décimales: **1**

---

#### **MESURE 5: Fill Rate by Type**
```dax
Fill Rate by Type = 
DIVIDE(
    COUNTX(FILTER(Orders, Orders[InFull_Flag] = 1), Orders[OrderID]),
    COUNTA(Orders[OrderID]),
    0
) * 100
```
- Format: **Pourcentage**
- Décimales: **1**

---

## ✅ Vérification

Après création, vous devriez voir:
- ✅ 5 mesures dans le groupe "_Measures"
- ✅ Chaque mesure avec l'icône `f(x)`
- ✅ Format correct (% ou nombre)

---

## 💾 Sauvegarder

1. **Ctrl+S** pour sauvegarder
2. Attendre la synchronisation avec le cloud
3. Message: "Modèle sémantique synchronisé" ✅

---

## 🚀 Utiliser les mesures

Une fois créées, vous pouvez:

1. **Créer des visuels** avec ces mesures
2. **Drill-down** par région, warehouse, etc.
3. **Utiliser dans des KPI cards**
4. **Filtrer dynamiquement**

### Exemple de visuel:
- **Type**: Carte
- **Valeurs**: Warehouse Utilization %
- **Résultat**: Affiche ~76%

---

## ⚠️ Dépannage

### Si vous voyez "Colonne introuvable"
→ Vérifier les noms de table/colonne:
- `Inventory[CurrentStock]`
- `Inventory[MinStock]`
- `Inventory[SafetyStock]`
- `Warehouses[Capacity]`
- `Orders[OTIF_Flag]`
- `Orders[InFull_Flag]`
- `Orders[OrderID]`

### Si erreur "Division by zero"
→ C'est normal, la formule gère ce cas

### Si modèle ne se synchronise pas
→ Redémarrer Power BI Desktop

---

## 📍 Localisation des fichiers

- **Fichier PBIX**: `C:\Users\Marc\Desktop\Pharma Logistics.pbix`
- **Sauvegarde**: `C:\Users\Marc\Desktop\Pharma Logistics_BACKUP_MEASURES.pbix`
- **Documentation**: `c:/Projects/pharma-logistics-bi/docs/`

---

**Temps estimé: 5-10 minutes** ⏱️

Besoin d'aide? Voir [PERFORMANCE_PAGE_COMPLETE_ANALYSIS.md](../docs/PERFORMANCE_PAGE_COMPLETE_ANALYSIS.md)
