-- This query identifies high-spending customers in each city
-- It compares each customer's total spending against the overall average order amount

SELECT 
    c.City,                           -- Customer's city
    c.FirstName + ' ' + c.LastName AS CustomerName,  -- Full customer name
    SUM(o.Amount) AS TotalSpent,      -- Customer's total spending across all orders
    (SELECT AVG(Amount) FROM Orders) AS OverallAvgOrderAmount  -- Subquery to get overall average
FROM 
    Customers c                       -- From Customers table
JOIN 
    Orders o ON c.CustomerID = o.CustomerID  -- Join with Orders table
GROUP BY 
    c.City, c.FirstName, c.LastName   -- Group by city and customer name
HAVING 
    SUM(o.Amount) > (SELECT AVG(Amount) FROM Orders)  -- Only show customers who spent more than average
ORDER BY 
    c.City, TotalSpent DESC;          -- Sort by city, then by highest spenders first