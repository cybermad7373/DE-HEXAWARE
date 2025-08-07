-- This query analyzes how discounts are used across different age groups and product categories
-- It uses CASE statements to create age brackets and calculates discount percentages

SELECT 
    CASE                               -- Create age groups using CASE
        WHEN c.Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN c.Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN c.Age >= 40 THEN '40+'
    END AS AgeGroup,                   -- Resulting age group column
    o.ProductCategory,                 -- Product category column
    COUNT(CASE WHEN o.DiscountApplied = 1 THEN 1 END) AS DiscountedOrders,  -- Count of orders with discount
    COUNT(o.OrderID) AS TotalOrders,   -- Total orders in this group
    CAST(COUNT(CASE WHEN o.DiscountApplied = 1 THEN 1 END) AS FLOAT) / 
        COUNT(o.OrderID) * 100 AS DiscountPercentage  -- Calculate percentage of orders with discount
FROM 
    Customers c                        -- From Customers table
JOIN 
    Orders o ON c.CustomerID = o.CustomerID  -- Join with Orders table
GROUP BY 
    CASE                               -- Group by the same age groups
        WHEN c.Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN c.Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN c.Age >= 40 THEN '40+'
    END,
    o.ProductCategory                  -- Also group by product category
ORDER BY 
    AgeGroup, DiscountPercentage DESC; -- Sort by age group, then by highest discount percentage