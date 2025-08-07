CREATE DATABASE IF NOT EXISTS subtotal;
USE subtotal;

CREATE TABLE SalesList (
    SalesMonth VARCHAR(20),
    SalesQuartes VARCHAR(5),
    SalesYear SMALLINT,
    SalesTotal DECIMAL(10,2)
);

INSERT INTO SalesList(SalesMonth, SalesQuartes, SalesYear, SalesTotal) VALUES 
('March', 'Q1', 2019, 60),
('March', 'Q1', 2020, 50),
('May', 'Q2', 2019, 30),
('July', 'Q3', 2020, 10),
('November', 'Q4', 2019, 120),
('October', 'Q4', 2019, 150),
('November', 'Q4', 2019, 180),
('November', 'Q4', 2020, 120),
('July', 'Q3', 2019, 160),
('March', 'Q1', 2020, 170);

-- View data
SELECT * FROM SalesList;

-- Rollup: Year-wise subtotals + grand total
SELECT 
    IFNULL(SalesYear, 'Grand Total') AS SalesYear,
    SUM(SalesTotal) AS SalesTotal
FROM SalesList
GROUP BY SalesYear WITH ROLLUP;

-- Rollup: Year & Quarter subtotals
SELECT 
    IFNULL(SalesYear, 'Grand Total') AS SalesYear,
    IFNULL(SalesQuartes, 'SubTotal') AS SalesQuartes,
    SUM(SalesTotal) AS SalesTotal
FROM SalesList
GROUP BY SalesYear, SalesQuartes WITH ROLLUP;

-- Full Rollup: Year, Quarter, Month
SELECT 
    IFNULL(SalesYear, 'Grand Total') AS SalesYear,
    IFNULL(SalesQuartes, 'SubTotal') AS SalesQuartes,
    IFNULL(SalesMonth, 'Detail Total') AS SalesMonth,
    SUM(SalesTotal) AS SalesTotal
FROM SalesList
GROUP BY SalesYear, SalesQuartes, SalesMonth WITH ROLLUP;

-- Subtotal logic using ROW_NUMBER and UUID for randomness
WITH CTE AS (
    SELECT SalesMonth, SalesTotal, 
           ROW_NUMBER() OVER (ORDER BY RAND()) AS RowNumber
    FROM SalesList
)
SELECT 
    IFNULL(SalesMonth, 'SubTotal') AS SalesMonth,
    SUM(SalesTotal) AS SalesTotal
FROM CTE
GROUP BY SalesMonth, RowNumber WITH ROLLUP;

-- Filtering only non-null SalesMonth (excluding Grand Total row)
WITH CTE AS (
    SELECT SalesMonth, SalesTotal, 
           ROW_NUMBER() OVER (ORDER BY RAND()) AS RowNumber
    FROM SalesList
)
SELECT 
    IFNULL(SalesMonth, 'SubTotal') AS SalesMonth,
    SUM(SalesTotal) AS SalesTotal
FROM CTE
GROUP BY SalesMonth, RowNumber WITH ROLLUP
HAVING SalesMonth IS NOT NULL;

-- GROUPING SETS simulation using UNION ALL in MySQL
SELECT 
    SalesYear,
    NULL AS SalesQuartes,
    SUM(SalesTotal) AS SalesTotal
FROM SalesList
GROUP BY SalesYear

UNION ALL

SELECT 
    SalesYear,
    SalesQuartes,
    SUM(SalesTotal) AS SalesTotal
FROM SalesList
GROUP BY SalesYear, SalesQuartes

UNION ALL

SELECT 
    NULL AS SalesYear,
    NULL AS SalesQuartes,
    SUM(SalesTotal) AS SalesTotal
FROM SalesList;
