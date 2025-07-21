-- This query analyzes customer purchase patterns across different cities
-- It joins the Customers and Orders tables to provide aggregated statistics

SELECT 
    c.City,                           -- Grouping by customer city
    COUNT(o.OrderID) AS TotalOrders,  -- Count of all orders per city
    MIN(o.Amount) AS MinOrderAmount,  -- Smallest order amount in each city
    MAX(o.Amount) AS MaxOrderAmount,  -- Largest order amount in each city
    AVG(o.Amount) AS AvgOrderAmount,  -- Average order amount in each city
    SUM(o.Amount) AS TotalSpent       -- Total money spent in each city
FROM 
    Customers c                       -- From Customers table (aliased as 'c')
JOIN 
    Orders o ON c.CustomerID = o.CustomerID  -- Join with Orders table where CustomerIDs match
GROUP BY 
    c.City                            -- Group results by city
ORDER BY 
    TotalSpent DESC;                  -- Sort by highest spending cities first