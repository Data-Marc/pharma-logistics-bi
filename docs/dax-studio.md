# DAX Studio

Using DAX Studio is considered a best practice when developing DAX measures or optimizing a Power BI model. The tool allows you to run and inspect queries to verify the accuracy of calculations, analyze performance, and identify potential bottlenecks. With features such as Server Timings, Query Plan, and memory usage analysis, it becomes possible to clearly understand how the engine executes DAX expressions. This validation step not only helps ensure functional correctness, but also contributes to a smoother user experience by reducing response times and making the model more robust and easier to maintain over time.

## What is VertiPaq?

VertiPaq is the in-memory columnar storage engine used by Power BI, Analysis Services Tabular, and Power Pivot. It is designed to deliver high performance for analytical queries by compressing data and optimizing storage structures. VertiPaq enables extremely fast aggregations and calculations by loading data into memory in a highly efficient format, allowing users to interact with large datasets in real time. Understanding how VertiPaq stores and processes data is essential for optimizing Power BI models, as it directly impacts memory usage, query speed, and overall model scalability.

## VertiPaq Analyzer in DAX Studio

DAX Studio provides a VertiPaq Analyzer feature, which offers a detailed view of the internal structure and memory usage of your Power BI model. The screenshot below illustrates the VertiPaq Analyzer's Tables view, where you can see key metrics such as cardinality, total size, number of columns, partitions, and the percentage of database memory used by each table.


This analysis is crucial for identifying large tables, understanding memory distribution, and detecting potential optimization opportunities. Notably, despite the complete creation of this project and all its metadata from scratch, the VertiPaq Analyzer reveals that there are no referential integrity (RI) violations or anomalies. This demonstrates a high level of rigor in the data modeling process and confirms that the model structure is robust, reliable, and fully compliant with best practices. The distribution of memory and table sizes appears consistent with a well-structured Power BI model. Such insights help ensure that your model remains efficient, scalable, and easy to maintain.

<img src="./images/Dax%20Studio_Vertipaq.png" alt="VertiPaq Analyzer in DAX Studio" width="900" height="1800" />

## VertiPaq Compression Efficiency

One of the key strengths of VertiPaq lies in its advanced data compression capabilities. The engine automatically selects the most efficient encoding method for each column, such as dictionary encoding (HASH) for text and low-cardinality columns, and value encoding (VALUE) for numeric data. This approach significantly reduces memory usage while maintaining high query performance.

The VertiPaq Analyzer Columns view demonstrates that the majority of columns in this model benefit from optimal compression. Dictionary sizes remain small relative to the total column size, and the encoding types are well suited to the data types and cardinalities present. This results in a highly efficient in-memory model, ensuring fast response times and optimal resource utilization, even with large datasets. No evidence of excessive memory consumption or suboptimal compression is present, confirming that the model design leverages VertiPaq’s full potential.


<img src="./images/Dax%20Studio_Vertipaq_2.png" alt="VertiPaq Analyzer Columns Compression" width="900" />

### Analyse professionnelle du screenshot VertiPaq Analyzer (onglet Columns)

Après analyse du screenshot VertiPaq Analyzer (onglet Columns), voici un retour professionnel :

• Les colonnes affichent des cardinalités, tailles et types d’encodage cohérents avec un modèle Power BI bien structuré.
• Les colonnes de type “HASH” sont attendues pour des chaînes de caractères, et “VALUE” pour des numériques.
• Les tailles de dictionnaire et de colonne sont proportionnelles à la cardinalité et au type de données.
• Le pourcentage de la base de données (% DB) et de la table (% Table) est bien réparti, sans concentration anormale sur une seule colonne.
• Aucune colonne ne semble occuper une taille disproportionnée par rapport à sa cardinalité ou à la table.
• Les colonnes d’ID (OrderID, ProductID, CustomerID, etc.) ont des tailles et cardinalités attendues.
• Pas de colonne “RI Violations” ou d’indicateur d’erreur visible.

**Conclusion** : Aucune anomalie ou problème de modélisation n’est détecté sur ce screenshot. La distribution mémoire, l’encodage et la structure des colonnes sont conformes aux bonnes pratiques Power BI. Si tu veux une analyse plus poussée (par exemple, sur la compression ou la pertinence métier de certaines colonnes), précise ta demande !

Sur le screenshot VertiPaq Analyzer (onglet Columns), la colonne “Encoding” indique le type de compression appliqué à chaque colonne :

• La majorité des colonnes sont en “HASH”, ce qui signifie que VertiPaq utilise un dictionnaire pour compresser les valeurs distinctes (idéal pour les chaînes de caractères ou les colonnes à faible cardinalité).
• Les colonnes numériques (“VALUE”) sont stockées de façon optimisée, souvent en utilisant le type de données natif le plus compact possible.
• Les tailles de dictionnaire (“Dictionary”) sont faibles par rapport à la taille totale des colonnes, ce qui montre une bonne efficacité de compression.
• Les colonnes à forte cardinalité (ex : OrderID, ProductID) restent bien compressées grâce à l’encodage adapté.

**Conclusion professionnelle** : La compression VertiPaq est efficace sur ce modèle. L’utilisation de l’encodage “HASH” pour les chaînes et “VALUE” pour les numériques permet d’optimiser la mémoire. Aucun signe de surconsommation ou de mauvaise compression n’est visible. Cela garantit de bonnes performances et une utilisation optimale des ressources.
