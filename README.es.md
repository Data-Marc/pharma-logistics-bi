# [ EN] [ FR] [ ES] PHARMA LOGISTICS - Panel de Control Power BI

---

##  Elige Tu Idioma | Choose Your Language | Choisissez Votre Langue

|  English |  Fran�ais |  Espa�ol |
|:---:|:---:|:---:|
| [Read in English](README.md) | [Lire en Fran�ais](README.fr.md) | [Leer en Espa�ol](README.es.md) |

---

[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/releases)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![Power Query](https://img.shields.io/badge/Power%20Query-2.149.1429.0-00A4EF?logo=power-bi)](https://powerquery.microsoft.com)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.107.0-007ACC?logo=visualstudiocode)](https://code.visualstudio.com)
[![Excel](https://img.shields.io/badge/Excel-2511-217346?logo=microsoft-excel)](https://www.microsoft.com/excel)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)

---

## RESUMEN

**Pharma Logistics BI** es un panel de control integral de gesti�n de la cadena de suministro farmac�utica construido con Power BI. Proporciona visibilidad en tiempo real de pedidos, transporte, inventario, cumplimiento de calidad y desempe�o financiero en m�ltiples regiones y proveedores de log�stica.

Dise�ado para gerentes de cadena de suministro, coordinadores de log�stica y analistas financieros para monitorear KPI, identificar cuellos de botella y optimizar operaciones de distribuci�n farmac�utica.

### FUNDACI�N DE DATOS Y GOBIERNO

Este proyecto demuestra pr�cticas de ingenier�a de datos de calidad empresarial aplicadas al an�lisis de la cadena de suministro farmac�utica:

**Ingenier�a de Datos:**

- Fuente: El conjunto de datos completo est� dise�ado y arquitecturado desde cero siguiendo las mejores pr�cticas de la industria
- Capa de Datos: Importado en SQL Server 2019+ para transformaci�n y validaci�n rigurosa
- Procesamiento Ascendente: Todas las limpiezas de datos, enriquecimiento y validaciones de calidad se realizan en la capa SQL antes de llegar a Power BI. Siguiendo el principio: "Realizar transformaciones de datos tan ascendentemente (cerca de la fuente) como sea posible, y solo descendentemente (en el informe) cuando sea necesario" (M�xima de Roche). Esto asegura la integridad de los datos, mantiene una �nica fuente de verdad y optimiza el rendimiento del informe.

- Reglas de validaci�n estandarizadas aplicadas durante ETL
- 13 tablas de datos con 20 relaciones activas (arquitectura de esquema en estrella)
- 302 medidas calculadas para definiciones coherentes de KPI

Este enfoque ascendente garantiza la integridad de los datos en m�s de 75,000 registros que abarcan 4 regiones, 44 pa�ses y 44 almacenes a nivel mundial.

---

## P�GINAS DEL PANEL

### RESUMEN - Panel de Control de Desempe�o Global

P�gina de inicio principal con KPI en tiempo real e instant�nea operativa.

**KPI Principales (6 Tarjetas):**
- Total de Pedidos (con tendencia YoY)
- OTIF % (Entrega A Tiempo y Completa)
- Tiempo de Entrega (D�as)
- % Completitud (Tasa de completitud de entrega)
- % Entrega A Tiempo (Puntualidad)
- Pedidos Pendientes (Volumen)

**Visualizaciones Clave:**
- Desempe�o por transportista (7 proveedores)
- Desglose de Costos (por categor�a de producto: Inyectable, Comprimido, Vacuna, Otro)
- Desempe�o de Entrega (Entregado/Devuelto/Cancelado)
- Ingresos Regionales (Am�rica del Norte, Am�rica Latina, Asia, Europa)
- Resumen Financiero (mensual)

**Filtros Din�micos:**
- Control deslizante A�o-Mes (2023-2025)
- Selecci�n multi-regi�n (4 regiones)
- Selecci�n multi-pa�s (44 pa�ses)
- Filtro Modo de Transporte (Aire/Mar/Tierra)
- Men� desplegable Transportista (7 proveedores)
- Selector Pa�s del Proveedor

---

### DESEMPE�O - An�lisis de la Cadena de Suministro

An�lisis operacional detallado con capacidades de exploraci�n.

**Matrices de Desempe�o:**

**Matriz 1: Desempe�o por Regi�n**
- Filas: Regi�n con capacidad de exploraci�n hasta pa�ses
- Columnas: OTIF %, Tiempo Promedio, % Completitud, % A Tiempo, % Pedidos Perfectos
- Validaci�n de datos mediante c�lculos OTIF
- Resalte de umbrales de desempe�o
- An�lisis de comparaci�n entre regiones

**Matriz 2: Desempe�o por Transportista**
- Filas: Transportista (7 proveedores)
- Columnas: Tiempo de Entrega, Costo/KM, Estrellas de Eficiencia
- Evaluaci�n comparativa entre transportistas
- An�lisis de rentabilidad de costos

**An�lisis de Tendencias:**
- Tendencias Ingresos vs COGS (Ene-Dic)
- Comparaci�n MTP COGS vs YoY por Regi�n

**Medidas de Desempe�o Clave (22 Medidas):**
- Pedido Perfecto: % de pedidos entregados con precisi�n
- Indicador de Cadena de Suministro: M�trica compuesta (0-100%)
- Precisi�n de Entrega: Identifica discrepancias
- Cumplimiento de Cadena Fr�a: % de env�os controlados
- Tasa de Relleno: Pedidos sin pedidos pendientes
- Tiempo de Entrega Promedio: De pago a entrega
- OTIF %: Tasa de entrega a tiempo y completa
- M�s...

---

### FINANCIERO - An�lisis de Ingresos y Costos

Descripci�n general financiera completa de operaciones.

---

### ALMACENES - Visibilidad Log�stica Global

Seguimiento detallado de 44 almacenes distribuidos en 4 regiones, 44 pa�ses.

---

## SOPORTE

Para consultas de licencia:

Por favor cont�ctenos en: https://www.linkedin.com/in/samson18/

---

**Versi�n:** 1.0.0
**�ltima actualizaci�n:** Diciembre 2025
**Autor:** Marc James Samson
**Estado:** Production Ready
**Licencia:** Propietario y Confidencial



