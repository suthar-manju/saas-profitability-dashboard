-- Business question: What share of customers active in a year were still active the next year?
WITH active AS (
    SELECT DISTINCT Customer_ID, Order_Year FROM sales
)
SELECT a.Order_Year,
       COUNT(*) AS active_customers,
       COUNT(n.Customer_ID) AS active_next_year,
       ROUND(100.0*COUNT(n.Customer_ID)/COUNT(*),1) AS retention_pct
FROM active a
LEFT JOIN active n
       ON a.Customer_ID = n.Customer_ID AND n.Order_Year = a.Order_Year + 1
GROUP BY a.Order_Year
ORDER BY a.Order_Year;
