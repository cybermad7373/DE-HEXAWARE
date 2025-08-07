-- This query examines purchasing patterns of customers over 30 years old
-- It filters by age, groups by product category, and only shows categories with multiple orders

SELECT 
    o.ProductCategory,                -- The category of product ordered
    AVG(o.Amount) AS AverageOrderAmount,  -- Average amount spent in this category
    COUNT(o.OrderID) AS OrderCount    -- Number of orders in this category
FROM 
    Orders o                          -- From Orders table (aliased as 'o')
JOIN 
    Customers c ON o.CustomerID = c.CustomerID  -- Join with Customers table
WHERE 
    c.Age > 30                        -- Only include customers older than 30
GROUP BY 
    o.ProductCategory                 -- Group results by product category
HAVING 
    COUNT(o.OrderID) > 1              -- Only show categories with more than 1 order
ORDER BY 
    AverageOrderAmount DESC;          -- Sort by highest average order amount first