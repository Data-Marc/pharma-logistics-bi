#    PHARMA LOGISTICS - Panel de Control Power BI

---

##  Elige Tu Idioma | Choose Your Language | Choisissez Votre Langue

|  English |  Français |  Español |
|:---:|:---:|:---:|
| [Read in English](README.md) | [Lire en Français](README.fr.md) | [Leer en Español](README.es.md) |

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

**Pharma Logistics BI** es un panel de control integral de gestión de la cadena de suministro farmacéutica construido con Power BI. Proporciona visibilidad en tiempo real de pedidos, transporte, inventario, cumplimiento de calidad y desempeño financiero en múltiples regiones y proveedores de logística.

Diseñado para gerentes de cadena de suministro, coordinadores de logística y analistas financieros para monitorear KPI, identificar cuellos de botella y optimizar operaciones de distribución farmacéutica.

### FUNDACIÓN DE DATOS Y GOBIERNO

Este proyecto demuestra prácticas de ingeniería de datos de calidad empresarial aplicadas al análisis de la cadena de suministro farmacéutica:

**Ingeniería de Datos:**

- Fuente: El conjunto de datos completo está diseñado y arquitecturado desde cero siguiendo las mejores prácticas de la industria
- Capa de Datos: Importado en SQL Server 2019+ para transformación y validación rigurosa
- Procesamiento Ascendente: Todas las limpiezas de datos, enriquecimiento y validaciones de calidad se realizan en la capa SQL antes de llegar a Power BI. Siguiendo el principio: "Realizar transformaciones de datos tan ascendentemente (cerca de la fuente) como sea posible, y solo descendentemente (en el informe) cuando sea necesario" (Máxima de Roche). Esto asegura la integridad de los datos, mantiene una única fuente de verdad y optimiza el rendimiento del informe.

- Reglas de validación estandarizadas aplicadas durante ETL
- 13 tablas de datos con 20 relaciones activas (arquitectura de esquema en estrella)
- 302 medidas calculadas para definiciones coherentes de KPI

Este enfoque ascendente garantiza la integridad de los datos en más de 75,000 registros que abarcan 4 regiones, 44 países y 44 almacenes a nivel mundial.

---

## PÁGINAS DEL PANEL

### RESUMEN - Panel de Control de Desempeño Global

Página de inicio principal con KPI en tiempo real e instantánea operativa.

**KPI Principales (6 Tarjetas):**
- Total de Pedidos (con tendencia YoY)
- OTIF % (Entrega A Tiempo y Completa)
- Tiempo de Entrega (Días)
- % Completitud (Tasa de completitud de entrega)
- % Entrega A Tiempo (Puntualidad)
- Pedidos Pendientes (Volumen)

**Visualizaciones Clave:**
- Desempeño por transportista (7 proveedores)
- Desglose de Costos (por categoría de producto: Inyectable, Comprimido, Vacuna, Otro)
- Desempeño de Entrega (Entregado/Devuelto/Cancelado)
- Ingresos Regionales (América del Norte, América Latina, Asia, Europa)
- Resumen Financiero (mensual)

**Filtros Dinámicos:**
- Control deslizante Año-Mes (2023-2025)
- Selección multi-región (4 regiones)
- Selección multi-país (44 países)
- Filtro Modo de Transporte (Aire/Mar/Tierra)
- Menú desplegable Transportista (7 proveedores)
- Selector País del Proveedor

---

### DESEMPEÑO - Análisis de la Cadena de Suministro

Análisis operacional detallado con capacidades de exploración.

**Matrices de Desempeño:**

**Matriz 1: Desempeño por Región**
- Filas: Región con capacidad de exploración hasta países
- Columnas: OTIF %, Tiempo Promedio, % Completitud, % A Tiempo, % Pedidos Perfectos
- Validación de datos mediante cálculos OTIF
- Resalte de umbrales de desempeño
- Análisis de comparación entre regiones

**Matriz 2: Desempeño por Transportista**
- Filas: Transportista (7 proveedores)
- Columnas: Tiempo de Entrega, Costo/KM, Estrellas de Eficiencia
- Evaluación comparativa entre transportistas
- Análisis de rentabilidad de costos

**Análisis de Tendencias:**
- Tendencias Ingresos vs COGS (Ene-Dic)
- Comparación MTP COGS vs YoY por Región

**Medidas de Desempeño Clave (22 Medidas):**
- Pedido Perfecto: % de pedidos entregados con precisión
- Indicador de Cadena de Suministro: Métrica compuesta (0-100%)
- Precisión de Entrega: Identifica discrepancias
- Cumplimiento de Cadena Fría: % de envíos controlados
- Tasa de Relleno: Pedidos sin pedidos pendientes
- Tiempo de Entrega Promedio: De pago a entrega
- OTIF %: Tasa de entrega a tiempo y completa
- Más...

---

### FINANCIERO - Análisis de Ingresos y Costos

Descripción general financiera completa de operaciones.

---

### ALMACENES - Visibilidad Logística Global

Seguimiento detallado de 44 almacenes distribuidos en 4 regiones, 44 países.

---

## SOPORTE

Para consultas de licencia:

Por favor contáctenos en: https://www.linkedin.com/in/samson18/

---

**Versión:** 1.0.0
**Última actualización:** Diciembre 2025
**Autor:** Marc James Samson
**Estado:** Production Ready
**Licencia:** Propietario y Confidencial



