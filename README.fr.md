# PHARMA LOGISTICS - Tableau de Bord Power BI

 [English](README.md) |  [Français](README.fr.md) |  [Español](README.es.md)

[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/releases)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![Power Query](https://img.shields.io/badge/Power%20Query-2.149.1429.0-00A4EF?logo=power-bi)](https://powerquery.microsoft.com)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.107.0-007ACC?logo=visualstudiocode)](https://code.visualstudio.com)
[![Excel](https://img.shields.io/badge/Excel-2511-217346?logo=microsoft-excel)](https://www.microsoft.com/excel)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)

---

## APERÇU

**Pharma Logistics BI** est un tableau de bord complet de gestion de la chaîne d'approvisionnement pharmaceutique construit avec Power BI. Il fournit une visibilité en temps réel sur les commandes, le transport, l'inventaire, la conformité de la qualité et les performances financières dans plusieurs régions et fournisseurs de logistique.

Conçu pour les responsables de la chaîne d'approvisionnement, les coordinateurs logistiques et les analystes financiers pour surveiller les KPI, identifier les goulots d'étranglement et optimiser les opérations de distribution pharmaceutique.

### FONDATION DE DONNÉES & GOUVERNANCE

Ce projet démontre les pratiques d'ingénierie de données de qualité professionnelle appliquées à l'analyse de la chaîne d'approvisionnement pharmaceutique:

**Ingénierie des Données:**

- Source: L'ensemble de données est entièrement conçu et architecté à partir de zéro en suivant les meilleures pratiques du secteur
- Couche de Données: Importé dans SQL Server 2019+ pour une transformation et validation rigoureuses
- Traitement en Amont: Tous les nettoyage, enrichissement et validations de qualité des données sont effectués à la couche SQL avant d'atteindre Power BI. Suivant le principe: "Effectuer les transformations de données aussi en amont (près de la source) que possible, et uniquement en aval (dans le rapport) si nécessaire" (Maxime de Roche). Cela assure l'intégrité des données, maintient une source de vérité unique et optimise les performances du rapport.

- Règles de validation standardisées appliquées lors de l'ETL
- 13 tables de données avec 20 relations actives (architecture de schéma en étoile)
- 302 mesures calculées pour des définitions de KPI cohérentes

Cette approche centrée en amont garantit l'intégrité des données sur 75,000+ enregistrements couvrant 4 régions, 44 pays et 44 entrepôts mondialement.

---

## PAGES DE TABLEAU DE BORD

### APERÇU - Tableau de Bord de Performance Globale

Page d'accueil principale avec KPI en temps réel et snapshot opérationnel.

**KPI Principaux (6 Cartes):**
- Total des Commandes (avec tendance YoY)
- OTIF % (Livraison À Temps et Complet)
- Délai d'Exécution (Jours)
- % Livré (Taux de complétude de livraison)
- % Livraison À Temps (Ponctualité)
- Commandes en Attente (Volume)

**Visualisations Clés:**
- Performance par transporteur (7 fournisseurs)
- Ventilation des Coûts (par catégorie de produit: Injectable, Comprimé, Vaccine, Autre)
- Performance de Livraison (Livrée/Retournée/Annulée)
- Revenus Régionaux (Amérique du Nord, Amérique Latine, Asie, Europe)
- Résumé Financier (mensuel)

**Filtres Dynamiques:**
- Curseur Année-Mois (2023-2025)
- Sélection multi-région (4 régions)
- Sélection multi-pays (44 pays)
- Filtre Mode de Transport (Air/Mer/Terre)
- Menu déroulant Transporteur (7 fournisseurs)
- Sélecteur Pays du Fournisseur

---

### PERFORMANCE - Analyse de la Chaîne d'Approvisionnement

Analyse opérationnelle détaillée avec capacités de forage.

**Matrices de Performance:**

**Matrice 1: Performance par Région**
- Lignes: Région avec possibilité de forage jusqu'aux pays
- Colonnes: OTIF %, Délai Moyen, Complétude %, % À Temps, % de Commandes Parfaites
- Validation des données par calculs OTIF
- Mise en évidence des seuils de performance
- Analyse de comparaison entre régions

**Matrice 2: Performance par Transporteur**
- Lignes: Transporteur (7 fournisseurs)
- Colonnes: Délai d'Exécution, Coût/KM, Étoiles d'Efficacité
- Benchmarking entre transporteurs
- Analyse de rentabilité des coûts

**Analyse de Tendances:**
- Revenus vs COGS Tendances (Jan-Déc)
- COGS MTP vs YoY Comparaison par Région

**Mesures de Performance Clés (22 Mesures):**
- Commande Parfaite: % de commandes livrées avec exactitude
- Indicateur de Chaîne d'Approvisionnement: Métrique composite (0-100%)
- Précision de Livraison: Identifie les écarts
- Conformité Chaîne Froide: % d'expéditions contrôlées
- Taux de Remplissage: Commandes sans commandes en attente
- Délai d'Exécution Moyen: Du paiement à la livraison
- OTIF %: Taux de livraison à temps et complet
- Plus...

---

### FINANCIER - Analyse des Revenus et Coûts

Aperçu financier complet des opérations.

---

### ENTREPÔTS - Visibilité Logistique Mondiale

Suivi détaillé des 44 entrepôts répartis dans 4 régions, 44 pays.

---

## SUPPORT

Pour les demandes de licence:

Veuillez contacter: https://www.linkedin.com/in/samson18/

---

**Version:** 1.0.0
**Dernière mise à jour:** Décembre 2025
**Auteur:** Marc James Samson
**Statut:** Production Ready
**Licence:** Propriétaire et Confidentiel

