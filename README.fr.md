# [ EN] [ FR] [ ES] PHARMA LOGISTICS - Tableau de Bord Power BI


[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/releases)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![Power Query](https://img.shields.io/badge/Power%20Query-2.149.1429.0-00A4EF?logo=power-bi)](https://powerquery.microsoft.com)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.107.0-007ACC?logo=visualstudiocode)](https://code.visualstudio.com)
[![Excel](https://img.shields.io/badge/Excel-2511-217346?logo=microsoft-excel)](https://www.microsoft.com/excel)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)

---

## APER�U

**Pharma Logistics BI** est un tableau de bord complet de gestion de la cha�ne d'approvisionnement pharmaceutique construit avec Power BI. Il fournit une visibilit� en temps r�el sur les commandes, le transport, l'inventaire, la conformit� de la qualit� et les performances financi�res dans plusieurs r�gions et fournisseurs de logistique.

Con�u pour les responsables de la cha�ne d'approvisionnement, les coordinateurs logistiques et les analystes financiers pour surveiller les KPI, identifier les goulots d'�tranglement et optimiser les op�rations de distribution pharmaceutique.

### FONDATION DE DONN�ES & GOUVERNANCE

Ce projet d�montre les pratiques d'ing�nierie de donn�es de qualit� professionnelle appliqu�es � l'analyse de la cha�ne d'approvisionnement pharmaceutique:

**Ing�nierie des Donn�es:**

- Source: L'ensemble de donn�es est enti�rement con�u et architect� � partir de z�ro en suivant les meilleures pratiques du secteur
- Couche de Donn�es: Import� dans SQL Server 2019+ pour une transformation et validation rigoureuses
- Traitement en Amont: Tous les nettoyage, enrichissement et validations de qualit� des donn�es sont effectu�s � la couche SQL avant d'atteindre Power BI. Suivant le principe: "Effectuer les transformations de donn�es aussi en amont (pr�s de la source) que possible, et uniquement en aval (dans le rapport) si n�cessaire" (Maxime de Roche). Cela assure l'int�grit� des donn�es, maintient une source de v�rit� unique et optimise les performances du rapport.

- R�gles de validation standardis�es appliqu�es lors de l'ETL
- 13 tables de donn�es avec 20 relations actives (architecture de sch�ma en �toile)
- 302 mesures calcul�es pour des d�finitions de KPI coh�rentes

Cette approche centr�e en amont garantit l'int�grit� des donn�es sur 75,000+ enregistrements couvrant 4 r�gions, 44 pays et 44 entrep�ts mondialement.

---

## PAGES DE TABLEAU DE BORD

### APER�U - Tableau de Bord de Performance Globale

Page d'accueil principale avec KPI en temps r�el et snapshot op�rationnel.

**KPI Principaux (6 Cartes):**
- Total des Commandes (avec tendance YoY)
- OTIF % (Livraison � Temps et Complet)
- D�lai d'Ex�cution (Jours)
- % Livr� (Taux de compl�tude de livraison)
- % Livraison � Temps (Ponctualit�)
- Commandes en Attente (Volume)

**Visualisations Cl�s:**
- Performance par transporteur (7 fournisseurs)
- Ventilation des Co�ts (par cat�gorie de produit: Injectable, Comprim�, Vaccine, Autre)
- Performance de Livraison (Livr�e/Retourn�e/Annul�e)
- Revenus R�gionaux (Am�rique du Nord, Am�rique Latine, Asie, Europe)
- R�sum� Financier (mensuel)

**Filtres Dynamiques:**
- Curseur Ann�e-Mois (2023-2025)
- S�lection multi-r�gion (4 r�gions)
- S�lection multi-pays (44 pays)
- Filtre Mode de Transport (Air/Mer/Terre)
- Menu d�roulant Transporteur (7 fournisseurs)
- S�lecteur Pays du Fournisseur

---

### PERFORMANCE - Analyse de la Cha�ne d'Approvisionnement

Analyse op�rationnelle d�taill�e avec capacit�s de forage.

**Matrices de Performance:**

**Matrice 1: Performance par R�gion**
- Lignes: R�gion avec possibilit� de forage jusqu'aux pays
- Colonnes: OTIF %, D�lai Moyen, Compl�tude %, % � Temps, % de Commandes Parfaites
- Validation des donn�es par calculs OTIF
- Mise en �vidence des seuils de performance
- Analyse de comparaison entre r�gions

**Matrice 2: Performance par Transporteur**
- Lignes: Transporteur (7 fournisseurs)
- Colonnes: D�lai d'Ex�cution, Co�t/KM, �toiles d'Efficacit�
- Benchmarking entre transporteurs
- Analyse de rentabilit� des co�ts

**Analyse de Tendances:**
- Revenus vs COGS Tendances (Jan-D�c)
- COGS MTP vs YoY Comparaison par R�gion

**Mesures de Performance Cl�s (22 Mesures):**
- Commande Parfaite: % de commandes livr�es avec exactitude
- Indicateur de Cha�ne d'Approvisionnement: M�trique composite (0-100%)
- Pr�cision de Livraison: Identifie les �carts
- Conformit� Cha�ne Froide: % d'exp�ditions contr�l�es
- Taux de Remplissage: Commandes sans commandes en attente
- D�lai d'Ex�cution Moyen: Du paiement � la livraison
- OTIF %: Taux de livraison � temps et complet
- Plus...

---

### FINANCIER - Analyse des Revenus et Co�ts

Aper�u financier complet des op�rations.

---

### ENTREP�TS - Visibilit� Logistique Mondiale

Suivi d�taill� des 44 entrep�ts r�partis dans 4 r�gions, 44 pays.

---


**Version:** 1.0.0
**Derni�re mise � jour:** D�cembre 2025
**Auteur:** Marc James Samson
**Statut:** Production Ready
**Licence:** Propri�taire et Confidentiel



