-- Create and use database
CREATE DATABASE IF NOT EXISTS subtotal;
USE subtotal;

-- Create the SalesList table (MySQL does not support MONEY or NVARCHAR)
CREATE TABLE SalesList (
    SalesMonth VARCHAR(20),
    SalesQuartes VARCHAR(5),
    SalesYear SMALLINT,
    SalesTotal DECIMAL(10,2)
);

-- Insert data
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
