-- 1. Select your database
USE ecommerce;

-- 2. Drop the table if it exists (optional, to avoid errors)
DROP TABLE IF EXISTS sales_data;

-- 3. Create the sales_data table
CREATE TABLE sales_data (
  InvoiceNo VARCHAR(50),
  StockCode VARCHAR(50),
  Description TEXT,
  Quantity INT,
  InvoiceDate DATETIME,
  UnitPrice DECIMAL(10,2),
  CustomerID INT,
  Country VARCHAR(100)
);

-- 4. Load data from CSV into the table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clean_sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@InvoiceNo, @StockCode, @Description, @Quantity, @InvoiceDate, @UnitPrice, @CustomerID, @Country)
SET
InvoiceNo = @InvoiceNo,
StockCode = @StockCode,
Description = @Description,
Quantity = @Quantity,
InvoiceDate = @InvoiceDate,
UnitPrice = @UnitPrice,
CustomerID = NULLIF(@CustomerID, ''),
Country = @Country;

-- See first 10 rows
SELECT * FROM sales_data LIMIT 10;

-- Total quantity sold per country
SELECT Country, SUM(Quantity) AS TotalQuantity
FROM sales_data
GROUP BY Country
ORDER BY TotalQuantity DESC;

-- Average unit price by description
SELECT Description, AVG(UnitPrice) AS AvgPrice
FROM sales_data
GROUP BY Description
ORDER BY AvgPrice DESC
LIMIT 10;

-- Count unique customers
SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomers FROM sales_data;
