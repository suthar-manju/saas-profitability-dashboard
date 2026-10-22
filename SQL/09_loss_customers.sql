-- Business question: Which customers lose us money overall, and what discount do they get?
SELECT Customer,
       COUNT(DISTINCT Order_ID) AS orders,
       ROUND(SUM(Sales),0) AS revenue,
       ROUND(SUM(Profit),0) AS profit,
       ROUND(AVG(Discount)*100,1) AS avg_discount_pct
FROM sales
GROUP BY Customer_ID, Customer
HAVING SUM(Profit) < 0
ORDER BY profit ASC;
