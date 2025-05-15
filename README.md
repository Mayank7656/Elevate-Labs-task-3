# Ecommerce SQL Data Analysis

## Overview
This repository contains the SQL code and dataset used to complete **Task 3: SQL for Data Analysis** — focusing on importing, querying, and analyzing an ecommerce sales dataset using MySQL.

---

## Dataset

- `clean_sales_data.csv` — Cleaned ecommerce sales data with columns:  
  `InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country`  
  The dataset was cleaned to remove trailing commas and properly format datetime values to ensure successful import.

---

## SQL Code

The SQL scripts include:

- Creating the `sales_data` table with appropriate column types.
- Importing the cleaned CSV dataset using `LOAD DATA INFILE`.
- Sample queries demonstrating:
  - Data selection (`SELECT`, `LIMIT`)
  - Aggregations (`SUM`, `AVG`)
  - Grouping (`GROUP BY`)
  - Filtering (`WHERE`)
  - Sorting (`ORDER BY`)
