# 🎯 GUIDE D'IMPLÉMENTATION - CRÉATION DES VISUELS
## Page Performance - Pharma Logistics BI

**Date**: Décembre 2025  
**Durée Estimée**: 4-5 heures  
**Niveau**: Intermédiaire Power BI  
**Prérequis**: Power BI Desktop 2.149+, accès sémantique model

---

## 📋 ORDRE RECOMMANDÉ

1. ✅ Créer toutes les mesures DAX (Étape 1)
2. ✅ Configurer les slicers (Étape 2)
3. ✅ Créer KPI Cards (Étape 3)
4. ✅ Créer Trend Line (Étape 4)
5. ✅ Créer Carrier Bar Chart (Étape 5)
6. ✅ Créer Regional Heat Map (Étape 6)
7. ✅ Ajouter Gauges (Étape 7)
8. ✅ Finaliser & Styliser (Étape 8)

---

# ⚙️ ÉTAPE 1: CRÉER LES MESURES DAX

## 1.1 - Créer "On-Time Delivery %"

**Chemin**: Data → Semantic Model → New Measure  
**Groupe**: Créer dans un groupe "_Performance" (pour organisation)

**Formule**:
```dax
On-Time Delivery % = 
DIVIDE(
    COUNTX(FILTER(Orders, Orders[OnTime_Flag] = 1), Orders[OrderID]),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Configuration**:
- Format: Decimal Number
- Decimal Places: 1
- Display Units: None
- Data Category: Percentage

**Test**: Devrait afficher ~95%

---

## 1.2 - Créer "In Full Delivery %"

**Formule**:
```dax
In Full Delivery % = 
DIVIDE(
    COUNTX(FILTER(Orders, Orders[InFull_Flag] = 1), Orders[OrderID]),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Configuration**: Identique à 1.1  
**Test**: Devrait afficher ~98%

---

## 1.3 - Créer "Average Lead Time"

**Formule**:
```dax
Average Lead Time = 
AVERAGE(Transportation[LeadTime])
```

**Configuration**:
- Format: Decimal Number
- Decimal Places: 1
- Display Units: None
- Data Category: None

**Test**: Devrait afficher ~5 days

---

## 1.4 - Créer "Total Order Volume"

**Formule**:
```dax
Total Order Volume = 
COUNTA(Orders[OrderID])
```

**Configuration**:
- Format: Whole Number
- Thousands Separator: Yes
- Data Category: None

**Test**: Devrait afficher ~9,800

---

## 1.5 - Créer "OTIF Orders Count"

**Formule**:
```dax
OTIF Orders Count = 
COUNTX(FILTER(Orders, Orders[OTIF_Flag] = 1), Orders[OrderID])
```

**Configuration**: Identique à 1.4  
**Test**: Devrait afficher ~9,200

---

## 1.6 - Créer "Regional OTIF %"

**Formule**:
```dax
Regional OTIF % = 
DIVIDE(
    COUNTX(FILTER(Orders, Orders[OTIF_Flag] = 1), Orders[OrderID]),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Configuration**: Identique à 1.1  
**Test**: Devrait afficher ~94% global

---

## 1.7 - Créer "Warehouse Utilization %"

**Formule**:
```dax
Warehouse Utilization % = 
DIVIDE(
    SUM(Inventory[CurrentStock]),
    SUM(Warehouses[Capacity]),
    0
) * 100
```

**Configuration**: Identique à 1.1  
**Test**: Devrait afficher ~75%

---

## 1.8 - Créer "Stock-to-Min Ratio"

**Formule**:
```dax
Stock-to-Min Ratio = 
AVERAGE(Inventory[CurrentStock] / Inventory[MinStock])
```

**Configuration**:
- Format: Decimal Number
- Decimal Places: 2
- Data Category: None

**Test**: Devrait afficher ~1.8

---

## 1.9 - Créer "Safety Stock Compliance %"

**Formule**:
```dax
Safety Stock Compliance % = 
DIVIDE(
    COUNTX(FILTER(Inventory, Inventory[CurrentStock] >= Inventory[SafetyStock]), 
        Inventory[InventoryID]),
    COUNTA(Inventory[InventoryID]),
    0
) * 100
```

**Configuration**: Identique à 1.1  
**Test**: Devrait afficher ~92%

---

## 1.10 - Créer "Fill Rate by Type"

**Formule**:
```dax
Fill Rate by Type = 
DIVIDE(
    COUNTX(FILTER(Orders, Orders[InFull_Flag] = 1), Orders[OrderID]),
    COUNTA(Orders[OrderID]),
    0
) * 100
```

**Configuration**: Identique à 1.1  
**Test**: Devrait afficher ~98%

---

## ✅ Vérification - Étape 1 Complétée

Vous devez avoir **10 mesures** visibles dans le Semantic Model:
- On-Time Delivery %
- In Full Delivery %
- Average Lead Time
- Total Order Volume
- OTIF Orders Count
- Regional OTIF %
- Warehouse Utilization %
- Stock-to-Min Ratio
- Safety Stock Compliance %
- Fill Rate by Type

**→ Continuer à Étape 2**

---

# 📌 ÉTAPE 2: CONFIGURER LES SLICERS

## 2.1 - Ajouter Slicer Region

**Insertion**: Insert → Slicer → Region table  
**Champ**: Customers[Region]  

**Configuration**:
- Type: Dropdown (pour économiser l'espace)
- Multi-select: ON
- Default Filter: Aucun (afficher tous)
- Titre: "Region"
- Couleur Fond: #FFFFFF (blanc)
- Couleur Bordure: #AAAAAA
- Police: Segoe UI, 10pt

**Position**: Top-Left, 120px hauteur

---

## 2.2 - Ajouter Slicer Warehouse

**Champ**: Warehouses[WarehouseName]  
**Type**: Dropdown  
**Titre**: "Warehouse"  
**Position**: À côté Region

---

## 2.3 - Ajouter Slicer Carrier

**Champ**: DIM_Carrier[Carrier]  
**Type**: Dropdown  
**Titre**: "Carrier"  
**Position**: À côté Warehouse

---

## 2.4 - Ajouter Slicer Date Range

**Champ**: Date[Date]  
**Type**: Between (plutôt que Dropdown)  
**Titre**: "Date Range"  
**Default**: Last 12 months  
**Position**: À droite (sur 150px)

---

## 2.5 - Configurer Cross-Filter

**Pour chaque Slicer**:
1. Clic droit → Edit interactions
2. Configuration:
   - Slicer doit filtrer: Tous les visuels SAUF les KPI cards principales
   - Slicer ne doit PAS filtrer: OTIF % KPI (on veut le total global)

---

## ✅ Vérification - Étape 2 Complétée

- ✅ 4 slicers visibles en haut de page
- ✅ Cross-filtering fonctionne
- ✅ OTIF % reste stable quand filtre Region

**→ Continuer à Étape 3**

---

# 💳 ÉTAPE 3: CRÉER LES KPI CARDS

## 3.1 - KPI Card OTIF % (Centrale - PRIORITAIRE)

**Insertion**: Insert → Visual → KPI Card (ou KPIViz custom si disponible)

**Configuration Données**:
- Value: OTIF % (mesure existante)
- Trend axis: Date (par mois)
- Comparison label: "vs Last Month"

**Configuration Formatting**:
- **Format**: Percentage with 1 decimal
- **Background Color**: #FFFFFF
- **Font Color**: #000000
- **Accent Color**: #12239E (Navy)
- **Title**: "OTIF %"
- **Title Font Size**: 14pt, Bold
- **Value Font Size**: 36pt, Bold
- **Subtitle**: "On-Time In-Full (Primary KPI)"

**Target/Gauge**:
- Show Gauge: ON
- Minimum: 80%
- Maximum: 100%
- Target: 92%
- Gauge Fill Color: 
  - >95%: #12239E
  - 90-95%: #0074D9
  - <90%: #FF4136

**Position**: Haut-Gauche, Large (350px × 150px)

---

## 3.2 - KPI Card On-Time %

**Configuration Données**:
- Value: On-Time Delivery %
- Trend axis: Date (par mois)

**Configuration Formatting**:
- **Accent Color**: #0074D9 (Bleu)
- **Title**: "On-Time %"
- **Target**: 95%
- **Gauge Fill**:
  - >95%: #12239E
  - 90-95%: #0074D9
  - <90%: #FF4136

**Position**: Haut-Centre-Gauche (250px × 150px)

---

## 3.3 - KPI Card In Full %

**Configuration Données**:
- Value: In Full Delivery %
- Trend axis: Date (par mois)

**Configuration Formatting**:
- **Accent Color**: #0074D9 (Bleu)
- **Title**: "In Full %"
- **Target**: 98%
- **Gauge Fill**:
  - >98%: #12239E
  - 95-98%: #0074D9
  - <95%: #FF4136

**Position**: Haut-Centre-Droit (250px × 150px)

---

## 3.4 - KPI Card Lead Time Average

**Configuration Données**:
- Value: Average Lead Time
- Comparison: "vs Last Month"

**Configuration Formatting**:
- **Accent Color**: #0074D9
- **Title**: "Avg Lead Time"
- **Value Font**: "X.X days"
- **Target**: 4.5 days (Jaune si >5)
- **Gauge Fill**:
  - <4 days: #12239E
  - 4-5 days: #0074D9
  - >5 days: #FF4136

**Position**: Haut-Droite (250px × 150px)

---

## ✅ Vérification - Étape 3 Complétée

Vous devez voir 4 KPI cards en ligne haute:
- OTIF % = ~94% (#12239E Navy)
- On-Time % = ~95% (#0074D9)
- In Full % = ~98% (#0074D9)
- Lead Time = ~4.7 days (#0074D9)

**→ Continuer à Étape 4**

---

# 📈 ÉTAPE 4: CRÉER TREND LINE - OTIF 12 MOIS

## 4.1 - Ajouter Line Chart

**Insertion**: Insert → Visualization → Line Chart

**Configuration Données**:
- X-Axis: Date[Date] (Grouped by Month)
- Y-Axis: OTIF %
- Legend: Non (pas besoin)

**Configuration Formatting**:
- **Line Color**: #12239E (Navy)
- **Line Width**: 3px
- **Markers**: Small circle, #12239E
- **Background**: White
- **Grid Lines**: Subtle (#EEEEEE)
- **Data Labels**: ON, format "94%"
- **Font Size Labels**: 9pt

**Axes**:
- X-Axis Title: "Month"
- Y-Axis Title: "OTIF %"
- Y-Axis Min: 85%
- Y-Axis Max: 100%
- Y-Axis Gridlines: Every 5%

**Ajouter Référence**:
1. Right-click on Y-Axis
2. Analytics → Constant Line
3. Value: 92% (Target)
4. Color: #FFB347 (Yellow), Style: Dashed, Width: 2px
5. Label: "Target: 92%"

**Position**: Milieu-Gauche (600px × 300px)

---

## 4.2 - Ajouter Combo Chart (Alternative)

Si vous voulez **OTIF % + Order Volume**:

**Configuration**:
- Primary Y-Axis: OTIF % (Line, #12239E)
- Secondary Y-Axis: Total Order Volume (Column, #AAAAAA light)
- X-Axis: Date (Monthly)

**Cela montre**: Relation entre volume et performance

**Position**: Milieu-Gauche ou Milieu (800px × 300px)

---

## ✅ Vérification - Étape 4 Complétée

- ✅ Line chart affiche tendance OTIF sur 12 mois
- ✅ Ligne bleue navy (#12239E) claire
- ✅ Ligne de cible (92%) en pointillé jaune
- ✅ Data labels visibles

**→ Continuer à Étape 5**

---

# 📊 ÉTAPE 5: CRÉER CARRIER PERFORMANCE BAR CHART

## 5.1 - Ajouter Clustered Bar Chart

**Insertion**: Insert → Visualization → Clustered Bar Chart

**Configuration Données**:
- X-Axis (Values):
  - Serie 1: OTIF %
  - Serie 2: On-Time %
  - Serie 3: Average Lead Time (Secondary Axis)
- Y-Axis (Categories): DIM_Carrier[Carrier]
- Sort: OTIF % Descending

**Données**: Trier par meilleur au pire performer

**Configuration Formatting**:
- **Serie 1 (OTIF%)**: Couleur #12239E (Navy)
- **Serie 2 (On-Time%)**: Couleur #0074D9 (Bleu)
- **Serie 3 (Lead Time)**: Line, Couleur #FF4136, Secondary Y-Axis

**Axes**:
- X-Axis Primary Title: "Performance %"
- X-Axis Secondary Title: "Lead Time (days)"
- Y-Axis Title: "Carrier"
- Legend Position: Bottom

**Data Labels**:
- Show Data Labels: ON
- Format: "94%", "5.2d"
- Font Size: 9pt

**Position**: Milieu-Droit (600px × 300px)

---

## 5.2 - Ajouter Tooltips

1. Format → Visual
2. Tooltips:
   - Show Tooltips: ON
   - Background: White
   - Font: Segoe UI, 10pt
   - Ajouter champs: Carrier, OTIF %, On-Time %, Lead Time, Orders Count

---

## ✅ Vérification - Étape 5 Complétée

- ✅ 7 carriers affichés (DHL, FedEx, UPS, Maersk, DB Schenker, Kuehne+Nagel, CMA CGM)
- ✅ Barres triées DHL > CMA CGM
- ✅ Couleurs distinctes (#12239E pour OTIF, #0074D9 pour On-Time, #FF4136 pour Lead Time)
- ✅ Hover affiche tooltip détaillé

**→ Continuer à Étape 6**

---

# 🌡️ ÉTAPE 6: CRÉER REGIONAL PERFORMANCE HEAT MAP

## 6.1 - Ajouter Matrix (Table avec Mise en Forme Conditionnelle)

**Insertion**: Insert → Visualization → Matrix

**Configuration Données**:
- Rows: Customers[Region]
- Columns: (Aucune colonne groupement)
- Values:
  - Regional OTIF %
  - On-Time Delivery %
  - In Full Delivery %
  - Total Order Volume

**Configuration Formatting**:
- **Cell Background**: Couleur conditionnelle basée sur valeur
- **Data Labels**: Show Values: ON

**Mise en Forme Conditionnelle**:

Pour chaque mesure (Regional OTIF %, On-Time %, In Full %):

1. Sélect colonne mesure
2. Format → Cell → Background Color
3. Mode: Color Scale
4. Type: Diverging
5. Points:
   - Minimum (<75%): #FF4136 (Rouge)
   - Middle (85%): #FFB347 (Jaune)
   - Maximum (>95%): #12239E (Navy)

**Cells**:
- Font Size: 11pt
- Font Color: Auto (White if Dark Background, Black if Light)
- Number Format: 
  - OTIF/On-Time/In Full: 0.0%
  - Volume: 0

**Position**: Bas-Gauche (500px × 200px)

---

## 6.2 - Ajouter Small Multiples (Alternative)

Si vous préférez une vue plus visuelle:

**Type**: Card (petits KPI cards par région)
1. Région: Africa → OTIF: 92%, On-Time: 93%, Volume: 2,150
2. Région: Americas → OTIF: 94%, On-Time: 95%, Volume: 3,200
3. Région: Asia → OTIF: 93%, On-Time: 94%, Volume: 2,450
4. Région: Europe → OTIF: 95%, On-Time: 96%, Volume: 2,000

**Couleurs Fond**: Gradient #FF4136 (faible) à #12239E (excellent)

---

## ✅ Vérification - Étape 6 Complétée

- ✅ 4 régions affichées (Africa, Americas, Asia, Europe)
- ✅ 4 colonnes de mesures
- ✅ Mise en forme conditionnelle active (couleurs gradient)
- ✅ Europe plus foncée (meilleure performance)
- ✅ Valeurs correctes (~92-95% range)

**→ Continuer à Étape 7**

---

# 🎛️ ÉTAPE 7: AJOUTER GAUGES

## 7.1 - Ajouter Gauge Warehouse Utilization

**Insertion**: Insert → Visualization → Gauge (ou KPIViz custom)

**Configuration Données**:
- Value: Warehouse Utilization %
- Min Value: 0
- Max Value: 100
- Target Value: 75 (Optimal)

**Configuration Formatting**:
- **Gauge Min Label**: "0%"
- **Gauge Max Label**: "100%"
- **Gauge Fill Colors**:
  - 0-60%: #FF4136 (Rouge) - Understocked
  - 60-80%: #0074D9 (Bleu) - Optimal
  - 80-90%: #FFB347 (Jaune) - High
  - 90-100%: #FF4136 (Rouge) - Over

**Title**: "Warehouse Utilization"
**Subtitle**: "Optimal: 70-85%"
**Value Font Size**: 28pt

**Position**: Bas-Centre-Gauche (250px × 200px)

---

## 7.2 - Ajouter Gauge Safety Stock Compliance

**Configuration Données**:
- Value: Safety Stock Compliance %
- Target: 95%
- Min: 0%, Max: 100%

**Configuration Formatting**:
- **Gauge Fill Color**: 
  - 0-90%: #FF4136 (Alert)
  - 90-95%: #FFB347 (Warning)
  - 95-100%: #12239E (Excellent)

**Title**: "Safety Stock Compliance"
**Subtitle**: "Target: > 95%"

**Position**: Bas-Centre-Droit (250px × 200px)

---

## ✅ Vérification - Étape 7 Complétée

- ✅ 2 gauges affichées
- ✅ Warehouse Utilization: ~78% (Bleu - Optimal)
- ✅ Safety Stock Compliance: ~92% (Jaune - Warning)
- ✅ Couleurs cohérentes avec palette

**→ Continuer à Étape 8**

---

# ✨ ÉTAPE 8: FINALISATION & STYLISATION

## 8.1 - Ajouter Titre Page

**Insertion**: Insert → Text box

**Contenu**: "PHARMA LOGISTICS - PERFORMANCE DASHBOARD"  
**Format**:
- Font: Segoe UI, Bold, 24pt
- Color: #12239E (Navy)
- Position: Top-Left

---

## 8.2 - Ajouter Sous-titre & Date

**Contenu**: "Supply Chain Performance Metrics - Updated: 17 Dec 2025"  
**Format**:
- Font: Segoe UI, 11pt, Italic
- Color: #AAAAAA (Gris)
- Position: Sous titre

---

## 8.3 - Ajouter Ligne Séparatrice

**Insertion**: Insert → Shape → Rectangle (très mince)

**Format**:
- Width: 100% page width
- Height: 2px
- Color: #AAAAAA
- Position: Entre titre et slicers

---

## 8.4 - Configurer Fond Page

**Format → Page**:
- Background Color: #FFFFFF (Blanc pur)
- Border Color: None
- Grid: 20px (aide à l'alignement)

---

## 8.5 - Aligner Tous Visuels

**Utiliser Ribbon Align**:
1. Select tous les visuels
2. Format → Align → Distribute Horizontally
3. Format → Align → Distribute Vertically
4. Vérifier espacement régulier (20px entre)

**Ordre visuel (haut-bas)**:
1. Titre + Slicers (120px)
2. 4 KPI Cards (150px)
3. Trend Line + Carrier Chart (300px)
4. Regional Matrix (200px)
5. 2 Gauges (200px)

---

## 8.6 - Ajouter Bookmarks

**Pour faciliter navigation**:

1. **Bookmark: "Performance Overview"** (Default)
   - Affiche: Tous les visuels, aucun filtre

2. **Bookmark: "Top Performers"**
   - Filtre Carrier: DHL, FedEx, UPS
   - Filtre OTIF > 94%

3. **Bookmark: "Problem Areas"**
   - Filtre OTIF < 92%
   - Highlight: Carriers underperforming

4. **Bookmark: "Europe Focus"**
   - Filtre Region: Europe
   - Highlight Europe row in Regional Matrix

**Navigation**: Insert → Buttons → Bookmark Navigator
- Position: Top-Right
- Couleur: #AAAAAA

---

## 8.7 - Configurer Interactions Cross-Filter

**Pour chaque Visual**:

1. Right-click → Edit interactions
2. Configure:
   - Trend Line → Filtre: Regional Matrix, Gauges
   - Carrier Chart → Filtre: Regional Matrix, Trend Line
   - Slicers → Filtrent TOUS sauf OTIF % principal

**Exclure Filtering**:
- OTIF % Card NE doit PAS être filtré (reste toujours global)

---

## 8.8 - Ajouter Drill-Through (Optionnel)

**Créer page "Carrier Details"**:
1. New Page → Rename "Carrier Details"
2. Ajouter visuels détaillés:
   - Orders by Carrier
   - Route Map
   - Cost Breakdown
   - Time Series Carrier Performance

**Configurer Drill-Through**:
1. Desde Carrier Chart → Right-click → Build drill-through page
2. Add field: DIM_Carrier[Carrier]
3. Target page: "Carrier Details"

---

## 8.9 - Formatage Final Vérifications

**Checklist**:
- ✅ Tous les textes align left (sauf titres: center)
- ✅ Toutes les mesures format correct (%, 0.0 decimal, etc.)
- ✅ Couleurs cohérentes: Navy (#12239E), Bleu (#0074D9), Rouge (#FF4136), Jaune (#FFB347), Gris (#AAAAAA)
- ✅ Font Segoe UI 11pt (sauf titles: 14-24pt)
- ✅ Espacement blanc régulier (20px minimum)
- ✅ Pas de scrolling horizontal (tout rentré en 1920px)
- ✅ Hover tooltips actifs sur tous charts
- ✅ Slicers actifs et cross-filter fonctionne

---

## 8.10 - Publier & Partager

**Avant publication**:
1. File → Save
2. File → Publish
3. Select Workspace: "Pharma Logistics"
4. Select Dataset: "Pharma Logistics"
5. Publish

**Après publication**:
1. Aller à Power BI Service
2. Configure refresh: Daily 2:00 AM (après refresh données)
3. Share: Permissions → Add users
4. Set alerts: OTIF < 92% → Alert

---

# ✅ CHECKLIST FINALE

## Mesures Créées (10)
- [ ] On-Time Delivery %
- [ ] In Full Delivery %
- [ ] Average Lead Time
- [ ] Total Order Volume
- [ ] OTIF Orders Count
- [ ] Regional OTIF %
- [ ] Warehouse Utilization %
- [ ] Stock-to-Min Ratio
- [ ] Safety Stock Compliance %
- [ ] Fill Rate by Type

## Slicers Configurés (4)
- [ ] Region Dropdown
- [ ] Warehouse Dropdown
- [ ] Carrier Dropdown
- [ ] Date Range Picker

## Visuels Créés (9)
- [ ] KPI Card: OTIF % (Navy #12239E)
- [ ] KPI Card: On-Time % (Bleu #0074D9)
- [ ] KPI Card: In Full % (Bleu #0074D9)
- [ ] KPI Card: Lead Time (Bleu #0074D9)
- [ ] Line Chart: OTIF Trend 12M
- [ ] Bar Chart: Carrier Performance
- [ ] Matrix: Regional Performance Heat Map
- [ ] Gauge: Warehouse Utilization
- [ ] Gauge: Safety Stock Compliance

## Styling & Format
- [ ] Titre page "PHARMA LOGISTICS - PERFORMANCE DASHBOARD"
- [ ] Palette couleurs appliquée (#12239E, #0074D9, #FF4136, #FFB347, #AAAAAA)
- [ ] Tous visuels alignés sur grille 20px
- [ ] Font cohérente (Segoe UI)
- [ ] Spacing blanc régulier
- [ ] Cross-filtering configuré
- [ ] Bookmarks créés (3+)
- [ ] Page publiée et partagée

---

## 🎯 RÉSULTAT FINAL

Une page **Performance** professionnelle avec:
✅ 4 KPIs centraux visibles immédiatement  
✅ Trend analysis sur 12 mois  
✅ Comparative analysis 7 carriers  
✅ Regional performance breakdown  
✅ Inventory & warehouse health  
✅ Interactif avec slicers + drill-through  
✅ Design cohérent et moderne  

**Temps Total**: ~4-5 heures  
**Complexité**: Moyenne  
**Impact**: Haute visibilité exécutive  

---

**Date**: Décembre 17, 2025  
**Status**: ✅ GUIDE COMPLET - PRÊT À EXÉCUTER  
**Suivant**: Publier sur Power BI Service
