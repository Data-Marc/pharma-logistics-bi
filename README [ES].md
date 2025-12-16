# PHARMA LOGISTICS - Panel de Control Power BI


[![License: PROPRIETARY](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/Data-Marc/pharma-logistics-bi/blob/main/README%20%5BES%5D.md)
[![Power BI](https://img.shields.io/badge/Power%20BI-2.149.1429.0-F2CC8F?logo=powerbi)](https://powerbi.microsoft.com)
[![Power Query](https://img.shields.io/badge/Power%20Query-2.149.1429.0-00A4EF?logo=power-bi)](https://powerquery.microsoft.com)
[![DAX Studio](https://img.shields.io/badge/DAX%20Studio-3.2.1-0078D4?logo=visualstudio)](https://daxstudio.org)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?logo=microsoft-sql-server)](https://www.microsoft.com/sql-server)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.107.0-007ACC?logo=visualstudiocode)](https://code.visualstudio.com)
[![Excel](https://img.shields.io/badge/Excel-2511-217346?logo=microsoft-excel)](https://www.microsoft.com/excel)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)


---

## DESCRIPCIÓN GENERAL

**Pharma Logistics BI** es un panel de control integral de gestión de cadena de suministro farmacéutica construido con Power BI. Ofrece visibilidad en tiempo real de pedidos, transporte, inventario, cumplimiento de calidad y desempeño financiero en múltiples regiones y proveedores logísticos.

Diseñado para gerentes de cadena de suministro, coordinadores logísticos y analistas financieros para monitorear KPI, identificar cuellos de botella y optimizar las operaciones de distribución farmacéutica.

### FUNDACIÓN DE DATOS Y GOBERNANZA

Este proyecto demuestra las prácticas de ingeniería de datos de nivel empresarial aplicadas a la analítica de cadena de suministro farmacéutica:

**Ingeniería de Datos:**

- Fuente: Conjunto de datos completamente diseñado y arquitecturado desde cero siguiendo las mejores prácticas de la industria
- Capa de Datos: Importada en SQL Server 2019+ para transformación y validación rigurosa usando restricciones y relaciones
- Procesamiento Ascendente: Todas las limpiezas de datos, enriquecimientos y validaciones de calidad se realizan a nivel SQL antes de llegar a Power BI. Siguiendo el principio: "Realiza transformaciones de datos lo más aguas arriba (cercano a la fuente) posible, y solo aguas abajo (en el informe) si es necesario" (Maxim de Roche). Esto asegura integridad de datos, mantiene una única fuente de verdad y optimiza el desempeño del informe.

- Reglas de validación estandarizadas aplicadas durante ETL
- 13 tablas de datos con 20 relaciones activas (arquitectura de esquema de estrella)
- 302 medidas calculadas para definiciones de KPI consistentes
Este enfoque ascendente garantiza integridad de datos en más de 75,000 registros cubriendo 4 regiones, 44 países y 44 almacenes globalmente.

---

### Diagrama de Arquitectura

```
┌─────────────────┐         ┌──────────────────────────┐         ┌───────────────────────────┐        ┌──────────┐
│  Datos Crudos   │         │   SQL Server 2019+       │         │   Power BI                │        │  Usua-   │
│                 │────────▶│   (ETL & Validación)     │────────▶│  Dataset e Informes       │────────▶│  rios    │
│ • Sistemas ERP  │         │                          │         │                           │        │ Analistas│
│ • APIs/Base de  │         │ • Verificaciones Calidad │         │ • Esquema de Estrella (13 Tablas)  │ Gerentes │
│   Datos         │         │ • Procedimientos Almac.  │         │ • 20 Relaciones Activas   │        │          │
│ • Archivos      │         │ • Carga Staging/DW       │         │ • Lógica DAX (302 Medidas)        │          │
│   Planos        │         │                          │         │                           │        │          │
└─────────────────┘         └──────────────────────────┘         └───────────────────────────┘        └──────────┘
```

---

## PÁGINAS DEL PANEL DE CONTROL

📊 **DESCRIPCIÓN GENERAL** - Panel de Control Global de Desempeño

<img src="docs/images/overview.png" width="700" alt="Panel de Control OVERVIEW">

---

📈 **DESEMPEÑO** - Analítica de Cadena de Suministro

<img src="docs/images/warehouses.png" width="700" alt="Panel de Control WAREHOUSES">

---

🏭 **ALMACENES** - Optimización de Inventario

<img src="docs/images/performance.png" width="700" alt="Panel de Control PERFORMANCE">

---

💰 **FINANCIERO** - Rentabilidad y Economía

<img src="docs/images/financial.png" width="700" alt="Panel de Control FINANCIAL">

---

## KPI POR CATEGORÍA

### Descripción General Rápida de KPI

El panel de control monitorea **61 indicadores clave de desempeño (KPI)** organizados en 4 categorías de negocio. Ver [docs/KPIs.md](docs/KPIs.md) para descripciones completas y cálculos.

### 📦 KPI Clave de Transporte
| Nombre del KPI | Descripción | Alcance |
| :--- | :--- | :--- |
| **OTIF %** | Tasa de Entrega a Tiempo y Completa | 🌍 Global |
| **Tiempo de Entrega** | Días promedio desde orden a entrega | 🚚 Logística |
| **Costo por KM** | Métrica de eficiencia de transporte | 💰 Financiero |
| **Emisiones CO2** | Huella ambiental por KM | 🌱 ESG |

### 🏭 KPI Clave de Almacén
| Nombre del KPI | Descripción | Alcance |
| :--- | :--- | :--- |
| **Días en Inventario (DOH)** | Análisis de duración del almacenamiento | 📉 Riesgo |
| **Rotación de Inventario** | COGS / Valor Promedio de Inventario | 🔄 Eficiencia |
| **Riesgo de Vencimiento (GBP)** | Impacto financiero del stock que vence | 💰 Financiero |
| **Inventario Muerto %** | Porcentaje de inventario no móvil | 📉 Riesgo |

### ⚙️ KPI Clave de Desempeño
*Métricas que rastrean eficiencia operativa, cumplimiento de calidad y precisión de pronósticos.*

| Nombre del KPI | Descripción | Área de Enfoque |
| :--- | :--- | :--- |
| **Cumplimiento de Cadena Fría %** | Porcentaje de envíos en temperatura controlada | ❄️ Aseguramiento Calidad |
| **MAPE** | Porcentaje de Error Absoluto Medio (Precisión de Pronósticos) | 📊 Planificación Demanda |
| **Excursiones de Temperatura** | Número y severidad de incidentes térmicos | 🚨 Gestión Riesgos |
| **Eficiencia Cadena Suministro** | Puntuación compuesta (0-100%) de operaciones | ⚡ Operaciones |
| **Puntuación de Cumplimiento** | Puntuación de auditoría de cumplimiento (0-100%) | ⚖️ Cumplimiento |
| **Tasa de Devolución %** | Productos devueltos vs pedidos totales | ↩️ Logística Inversa |
| **Sesgo de Pronóstico** | Tendencia de sobreestimación/subestimación | 📈 Planificación |
| **Tiempo Resolución Excursión** | Horas promedio para resolver incidentes térmicos | ⏱️ Agilidad |

### 💰 KPI Clave Financieros
*Indicadores económicos que miden rentabilidad, costo de servicio y valor de inventario.*

| Nombre del KPI | Descripción | Impacto Comercial |
| :--- | :--- | :--- |
| **Margen Bruto %** | Relación de rentabilidad `(Ingresos - COGS) / Ingresos` | 💰 Rentabilidad |
| **Costo Logístico Total** | Transporte + Cargos de almacenamiento combinados | 📉 Control Costos |
| **Contribución Neta** | Ganancia neta después de todos los costos | 💵 Salud P&L |
| **Costo Logístico %** | Gastos logísticos relativos a ingresos | ⚡ Eficiencia |
| **Costo Almacenamiento Inventario** | Costo anual de almacenamiento y capital inmovilizado | 🏦 Capital Trabajo |
| **Impacto Desabastecimiento** | Pérdida de ingresos estimada por desabastecimiento | ⚠️ Costo Oportunidad |
| **Costo de Bienes Vendidos** | COGS Total (MTD, YTD, YoY) | 🧾 Contabilidad |
| **Riesgo de Vencimiento (GBP)** | Valor financiero del inventario en riesgo | 🗑️ Gestión Residuos |

**📊 Documentación Completa de KPI:** Ver [docs/KPIs.md](docs/KPIs.md) para descripciones detalladas, metodologías de cálculo y asignaciones de paneles.

---

## STACK TECNOLÓGICO

| Componente | Tecnología | Versión |
|-----------|-----------|---------|
| Plataforma BI | Power BI Desktop | 2.149.1429.0 |
| Transformación de Datos | Power Query | 2.149.1429.0 |
| Análisis y Optimización | DAX Studio | 3.2.1 |
| IDE | Visual Studio Code | 1.107.0 |
| Hoja de Cálculo | Microsoft Excel | 2511 |
| Base de Datos | SQL Server | 2019+ (SQLEXPRESS) |
| Gestión Base de Datos | SQL Server Management Studio | 21.6.17 |

---

## MÉTRICAS DEL PROYECTO

| Métrica | Valor |
|--------|-------|
| Páginas del Panel | 4 |
| Cantidad de Visuales | 20+ (apilados/superpuestos, equivalente a 9-10 páginas) |
| Tablas de Datos | 13 |
| Tablas de Medidas | 5 |
| Medidas Totales | 302 |
| Relaciones | 20 |
| Tamaño del Archivo de Informe | ~150MB |
| Regiones Cubiertas | 4 |
| Países Incluidos | 44 |
| Almacenes Rastreados | 44 |
| Transportistas Rastreados | 7 |
| Proveedores Rastreados | 20 |
| Productos Rastreados | 31 |
| Categorías de Producto | 6 |
| Modos de Transporte | 4 |
| Pedidos Rastreados | 9 980 |
| Clientes Rastreados | 2 535 |
| Excursiones de Temperatura | 2 |
| Volumen de Datos | 822 000+ registros |
| Período de Retención de Datos | 2023-2025 (3 años) |
| Tiempo de Actualización | 16-20 segundos |

---

## LICENCIA

Este proyecto está bajo una **Licencia Proprietaria y Confidencial**.
Este software NO es de código abierto y solo se ofrece bajo licencia comercial.

Para solicitudes de licencia: https://www.linkedin.com/in/samson18/

Ver archivo LICENSE para términos legales completos.

---

## SOPORTE

Por favor contáctese: https://www.linkedin.com/in/samson18/

---


**Versión:** 1.0.0
**Última Actualización:** Diciembre 2025
**Autor:** Marc James Samson
**Estado:** Production Ready
**Licencia:** Proprietaria y Confidencial

---
