# 🎯 SCRIPT: CRÉER 5 MESURES DAX DANS POWER BI DESKTOP

## ⚙️ INSTRUCTIONS

1. Ouvrir: **Pharma Logistics.pbix** dans Power BI Desktop
2. Aller à: **Data** tab (en haut)
3. Chercher: **Semantic Model** panel (à droite)
4. Clic sur: **New Measure** (icône + ou ribbon)
5. **Pour CHAQUE mesure** ci-dessous:
   - Copier la formule DAX exactement
   - Coller dans la barre de formule
   - Appuyer sur **Enter**
   - Vérifier que ✅ aucune erreur

---

## 📝 MESURE 1: Warehouse Utilization %

**Nom de la mesure**: `Warehouse Utilization %`

**Formule DAX** (copier-coller complet):
```dax
Warehouse Utilization % = 
DIVIDE(
    SUM(Inventory[CurrentStock]),
    SUM(Warehouses[Capacity]),
    0
) * 100
```

**Configuration après création**:
- Format: Percentage (0-100%)
- Decimal Places: 1
- Résultat attendu: ~75-78%

---

## 📝 MESURE 2: Stock-to-Min Ratio

**Nom de la mesure**: `Stock-to-Min Ratio`

**Formule DAX** (copier-coller complet):
```dax
Stock-to-Min Ratio = 
AVERAGE(
    Inventory[CurrentStock] / Inventory[MinStock]
)
```

**Configuration après création**:
- Format: Decimal Number
- Decimal Places: 2
- Résultat attendu: ~1.5-1.8

---

## 📝 MESURE 3: Safety Stock Compliance %

**Nom de la mesure**: `Safety Stock Compliance %`

**Formule DAX** (copier-coller complet):
```dax
Safety Stock Compliance % = 
DIVIDE(
    COUNTX(
        FILTER(
            Inventory, 
            Inventory[CurrentStock] >= Inventory[SafetyStock]
        ), 
        Inventory[InventoryID]
    ),
    COUNTA(Inventory[InventoryID]),
    0
) * 100
```

**Configuration après création**:
- Format: Percentage (0-100%)
- Decimal Places: 1
- Résultat attendu: ~90-95%

---

## 📝 MESURE 4: Regional OTIF %

**Nom de la mesure**: `Regional OTIF %`

**Formule DAX** (copier-coller complet):
```dax
Regional OTIF % = 
DIVIDE(
    COUNTX(
        FILTER(Orders, Orders[OTIF_Flag] = 1), 
        Orders[OrderID]
    ),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Configuration après création**:
- Format: Percentage (0-100%)
- Decimal Places: 1
- Résultat attendu: ~93-95%

---

## 📝 MESURE 5: Fill Rate by Type

**Nom de la mesure**: `Fill Rate by Type`

**Formule DAX** (copier-coller complet):
```dax
Fill Rate by Type = 
DIVIDE(
    COUNTX(
        FILTER(Orders, Orders[InFull_Flag] = 1), 
        Orders[OrderID]
    ),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Configuration après création**:
- Format: Percentage (0-100%)
- Decimal Places: 1
- Résultat attendu: ~97-98%

---

## ✅ VÉRIFICATION FINALE

Après création, vous devez voir dans **Semantic Model** panel:

```
📊 Semantic Model
├── Tables
│   ├── Orders
│   ├── Transportation
│   ├── Inventory
│   ├── Customers
│   ├── Products
│   ├── Warehouses
│   └── ... autres tables
│
└── _Measures (ou _Performance)
    ├── OTIF % ✅ (existant)
    ├── On-Time % ✅ (existant)
    ├── In Full ✅ (existant)
    ├── Lead Time ✅ (existant)
    ├── Revenue ✅ (existant)
    ├── Total Orders ✅ (existant)
    ├── Warehouse Utilization % ✅ NOUVEAU ← Vous l'avez créé
    ├── Stock-to-Min Ratio ✅ NOUVEAU ← Vous l'avez créé
    ├── Safety Stock Compliance % ✅ NOUVEAU ← Vous l'avez créé
    ├── Regional OTIF % ✅ NOUVEAU ← Vous l'avez créé
    └── Fill Rate by Type ✅ NOUVEAU ← Vous l'avez créé
```

---

## 🔍 VÉRIFICATION DES VALEURS

Tester chaque mesure en l'ajoutant à une **Card** temporaire:

| Mesure | Valeur Attendue | Range Acceptable |
|--------|-----------------|------------------|
| Warehouse Utilization % | ~76% | 60-90% |
| Stock-to-Min Ratio | ~1.7 | 1.0-2.5 |
| Safety Stock Compliance % | ~92% | 85-99% |
| Regional OTIF % | ~94% | 90-98% |
| Fill Rate by Type | ~98% | 95-100% |

**Si une valeur sort de range**: Vérifier la formule DAX (erreur de syntaxe)

---

## 🆘 TROUBLESHOOTING

### Erreur: "Column 'CurrentStock' not found"
→ Vérifier: Inventory table a colonne `CurrentStock` (case-sensitive)
→ Remplacer par le nom exact de la colonne

### Erreur: "Table 'Orders' not found"
→ Vérifier: Nom exact de la table (Orders, OrderID, etc.)
→ Clic sur table dans Semantic Model pour voir colonnes exactes

### Erreur: "Division by zero"
→ Normal - formule utilise DIVIDE(..., 0) qui retourne 0 si aucune donnée
→ Ajouter filtre pour avoir donnée minimum

### Mesure affiche #ERROR
→ Copier-coller: Enlever les espaces extras
→ Vérifier: Tous les noms de colonnes match exactement (Orders[OnTime_Flag], pas Orders.OnTime_Flag)

### Mesure vide ou 0
→ Check: La table a des données (Tables > [Table] > voir aperçu données)
→ Check: Le filtre ne cache pas toutes les données

---

## 💾 SAUVEGARDER

Après création des 5 mesures:

1. **File** → **Save** (Ctrl+S)
2. Fichier sauvegardé dans: `C:\Users\Marc\Desktop\Pharma Logistics.pbix`

---

## 🎯 ÉTAPE SUIVANTE

Une fois les 5 mesures créées:

1. ✅ Mesures DAX créées ← Vous êtes ici
2. → Créer les visuels (KPI Cards, Charts, Gauges)
3. → Suivre le guide: `IMPLEMENTATION_STEP_BY_STEP.md` à partir de **ÉTAPE 3**

---

## 📞 QUESTIONS?

**Q: Où voir les mesures créées?**  
A: Data tab → Semantic Model panel (droite) → _Measures → vos mesures lisées

**Q: Comment éditer une mesure existante?**  
A: Double-click sur mesure dans Semantic Model → Edit formula

**Q: Comment supprimer une mesure si erreur?**  
A: Right-click sur mesure → Delete

**Q: Erreur "OTIF_Flag" colonne not found?**  
A: Vérifier: Orders table a colonne `OTIF_Flag` (peut être `OTIFFlag` ou `OTIF`)

---

**Date**: 17 Décembre 2025  
**Status**: ✅ GUIDE CRÉATION 5 MESURES  
**Durée**: ~15-20 minutes
