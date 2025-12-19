# PHARMA LOGISTICS - Tableau de Bord Power BI

Par [Marc James Samson](https://www.linkedin.com/in/marc-james-samson/)

---

[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/blob/main/README%20%5BFR%5D.md)
[![Power BI](https://img.shields.io/badge/Power%20BI-2.149.1429.0-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![Power Query](https://img.shields.io/badge/Power%20Query-2.149.1429.0-00A4EF?logo=power-bi)](https://powerquery.microsoft.com)
[![DAX Studio](https://img.shields.io/badge/DAX%20Studio-3.2.1-0078D4?logo=visualstudio)](https://daxstudio.org)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.107.0-007ACC?logo=visualstudiocode)](https://code.visualstudio.com)
[![Excel](https://img.shields.io/badge/Excel-2511-217346?logo=microsoft-excel)](https://www.microsoft.com/excel)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)

---

## APERÇU

**Pharma Logistics BI** est un tableau de bord complet de gestion de la chaîne d'approvisionnement pharmaceutique construit avec Power BI. Il offre une visibilité en temps réel sur les commandes, le transport, l'inventaire, la conformité qualité et la performance financière dans plusieurs régions et prestataires logistiques.

Conçu pour les responsables de chaîne d'approvisionnement, les coordinateurs logistiques et les analystes financiers pour surveiller les KPI, identifier les goulets d'étranglement et optimiser les opérations de distribution pharmaceutique.

### FONDATION DES DONNÉES ET GOUVERNANCE

Ce projet démontre les pratiques d'ingénierie des données de niveau entreprise appliquées à l'analytique de chaîne d'approvisionnement pharmaceutique :

**Ingénierie des données :**

- Source : Ensemble de données entièrement conçu et architecturé à partir de zéro en suivant les meilleures pratiques du secteur
- Couche de données : Importée dans SQL Server 2019+ pour transformation et validation rigoureuse en utilisant des contraintes et des relations
- Traitement en amont : Tous les nettoyages de données, enrichissements et validations de qualité sont effectués au niveau SQL avant d'atteindre Power BI. Suivant le principe : « Effectuez les transformations de données aussi loin en amont (près de la source) que possible, et seulement en aval (dans le rapport) si nécessaire » (Maxime de Roche). Cela garantit l'intégrité des données, maintient une source unique de vérité et optimise les performances des rapports.

- Règles de validation standardisées appliquées pendant l'ETL
- 13 tables de données avec 20 relations actives (architecture de schéma en étoile)
- 302 mesures calculées pour des définitions de KPI cohérentes
Cette approche upstream-first garantit l'intégrité des données sur plus de 822 000+ enregistrements couvrant 4 régions, 44 pays, 44 entrepôts et 2 535 clients mondialement.

---

## 🏗️ Diagramme d'Architecture

```mermaid
graph LR
    subgraph "Source"
    A["Données Brutes<br/>• Systèmes ERP<br/>• APIs<br/>• Fichiers Plats"]
    end
    
    subgraph "Engineering"
    B["SQL Server 2019+<br/>• Qualité Données<br/>• ETL & Validation<br/>• Staging/DW"]
    end
    
    subgraph "Analytics"
    C["Power BI<br/>• Schéma Étoile 13 Tables<br/>• 20 Relations Actives<br/>• Logique DAX 302 Mesures"]
    end
    
    subgraph "Business"
    D["Utilisateurs<br/>• Analystes<br/>• Managers<br/>• Équipes Supply Chain"]
    end

    A --> B
    B --> C
    C --> D
    
    style A fill:#e8f4f8,stroke:#0066cc,stroke-width:2px,color:#000
    style B fill:#ffe8cc,stroke:#ff6600,stroke-width:2px,color:#000
    style C fill:#ffd700,stroke:#ff8c00,stroke-width:2px,color:#000
    style D fill:#87ceeb,stroke:#0066cc,stroke-width:2px,color:#000
```

---

## <img src="./docs/images/SQL 96 crop.png" width="35" height="35" alt="SQL Server" style="vertical-align:middle"/>             Architecture Base de Données

![SQL Server Database Schema](./docs/images/SQL_Screenshot.png)

Le système est construit sur une base de données **SQL Server avec 13 tables** organisées en schéma en étoile pour optimiser les requêtes analytiques.

---

## PAGES DU TABLEAU DE BORD

<img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>             **APERÇU** - Tableau de Bord Global de Performance

<img src="docs/images/overview.png" width="700" alt="Aperçu du Tableau de Bord OVERVIEW">

---

<img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>             **PERFORMANCE** - Analytique de Chaîne d'Approvisionnement

<img src="docs/images/warehouses.png" width="700" alt="Aperçu du Tableau de Bord WAREHOUSES">

---

<img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>             **ENTREPÔTS** - Optimisation de l'Inventaire

<img src="docs/images/performance.png" width="700" alt="Aperçu du Tableau de Bord PERFORMANCE">

---

<img src="./docs/images/Power Bi 96 crop.png" width="35" height="35" alt="Power BI" style="vertical-align:middle"/>             **FINANCIER** - Rentabilité & Économie

<img src="docs/images/financial.png" width="700" alt="Aperçu du Tableau de Bord FINANCIAL">

---

## KPI PAR CATÉGORIE

### Aperçu Rapide des KPI

### 📦 KPI Clés de Transport
| Nom du KPI | Description | Portée |
| :--- | :--- | :--- |
| **OTIF %** | Taux de Livraison à l'Heure et Complet | 🌍 Global |
| **Délai de Livraison** | Jours moyens de la commande à la livraison | 🚚 Logistique |
| **Coût par KM** | Métrique d'efficacité de transport | 💰 Financier |
| **Émissions CO2** | Empreinte environnementale par KM | 🌱 ESG |

### 🏭 KPI Clés d'Entrepôt
| Nom du KPI | Description | Portée |
| :--- | :--- | :--- |
| **Jours en Stock (DOH)** | Analyse de durée d'entreposage | 📉 Risque |
| **Rotation d'Inventaire** | COGS / Valeur Moyenne d'Inventaire | 🔄 Efficacité |
| **Risque d'Expiration (GBP)** | Impact financier du stock expirant | 💰 Financier |
| **Stock Mort %** | Pourcentage d'inventaire non-mobile | 📉 Risque |

### ⚙️ KPI Clés de Performance
*Métriques suivi l'efficacité opérationnelle, la conformité qualité et la précision des prévisions.*

| Nom du KPI | Description | Domaine de Focus |
| :--- | :--- | :--- |
| **Conformité Chaîne Froide %** | Pourcentage d'expéditions en température contrôlée | ❄️ Assurance Qualité |
| **MAPE** | Erreur Moyenne Absolue en Pourcentage (Précision des prévisions) | 📊 Planification de la Demande |
| **Excursions de Température** | Nombre et sévérité des incidents thermiques | 🚨 Gestion des Risques |
| **Efficacité Chaîne d'Approvisionnement** | Score composite (0-100%) des opérations | ⚡ Opérations |
| **Score de Conformité** | Score d'audit de conformité (0-100%) | ⚖️ Conformité |
| **Taux de Retour %** | Produits retournés par rapport aux commandes totales | ↩️ Logistique Inverse |
| **Biais de Prévision** | Tendance de sur/sous-estimation | 📈 Planification |
| **Temps de Résolution d'Excursion** | Heures moyennes pour résoudre les incidents thermiques | ⏱️ Agilité |

### 💰 KPI Clés Financiers
*Indicateurs économiques mesurant la rentabilité, le coût de service et la valeur d'inventaire.*

| Nom du KPI | Description | Impact Commercial |
| :--- | :--- | :--- |
| **Marge Brute %** | Ratio de rentabilité `(Rev - COGS) / Rev` | 💰 Rentabilité |
| **Coût Logistique Total** | Transport + Frais de stockage d'inventaire combinés | 📉 Contrôle des Coûts |
| **Contribution Nette** | Bénéfice net après tous les coûts | 💵 Santé du P&L |
| **Coût Logistique %** | Frais généraux logistiques relatifs aux revenus | ⚡ Efficacité |
| **Coût de Stockage d'Inventaire** | Coût annuel de stockage et capital immobilisé | 🏦 Fonds de Roulement |
| **Impact des Ruptures de Stock** | Perte de revenu estimée par les ruptures | ⚠️ Coût d'Opportunité |
| **Coût des Biens Vendus** | COGS Total (MTD, YTD, YoY) | 🧾 Comptabilité |
| **Risque d'Expiration (GBP)** | Valeur financière de l'inventaire à risque | 🗑️ Gestion des Déchets |

📊 Documentation Complète des 61 KPI : Voir [docs/KPIs.md](docs/KPIs.md) pour voir l'intégralité des KPI proposés.

---

## MÉTRIQUES DU PROJET

| Métrique | Valeur |
|--------|-------|
| Pages du Tableau de Bord | 4 |
| Nombre de Visuels | 20+ (empilés/superposés, équivalent à 9-10 pages) |
| Tableaux de Données | 13 |
| Tableaux de Mesures | 5 |
| Mesures Totales | 302 |
| Relations | 20 |
| Taille du Fichier Rapport | ~150MB |
| Régions Couvertes | 4 |
| Pays Inclus | 44 |
| Entrepôts Suivi | 44 |
| Transporteurs Suivi | 7 |
| Fournisseurs Suivi | 20 |
| Produits Suivi | 31 |
| Catégories de Produits | 6 |
| Modes de Transport | 4 |
| Commandes Suivi | 9 980 |
| Clients Suivi | 2 535 |
| Excursions de Température | 2 |
| Volume de Données | 822 000+ enregistrements |
| Période de Rétention des Données | 2023-2025 (3 ans) |
| Temps d'Actualisation | 16-20 secondes |

---

## PILE TECHNOLOGIQUE

| Composant | Technologie | Version |
|-----------|-----------|---------|
| Plateforme BI | Power BI Desktop | 2.149.1429.0 |
| Transformation de Données | Power Query | 2.149.1429.0 |
| Analyse & Optimisation | DAX Studio | 3.2.1 |
| IDE | Visual Studio Code | 1.107.0 |
| Feuille de Calcul | Microsoft Excel | 2511 |
| Base de Données | SQL Server | 2019+ (SQLEXPRESS) |
| Gestion Base de Données | SQL Server Management Studio | 21.6.17 |

---

## LICENCE

Ce projet est concédé sous une **Licence Propriétaire et Confidentielle**.
Ce projet n'est PAS open-source et est proposé uniquement pour une licence commerciale.

Pour les demandes de licence : https://www.linkedin.com/in/samson18/

Voir le fichier [LICENSE](../LICENSE) pour les termes juridiques complets.

---

## SUPPORT

Veuillez contacter : https://www.linkedin.com/in/samson18/

---


**Version :** 1.0.0
**Dernière mise à jour :** Décembre 2025
**Auteur :** Marc James Samson
**Statut :** Production Ready
**Licence :** Propriétaire et Confidentielle

---
