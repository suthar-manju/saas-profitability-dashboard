-- Business question: Which products make or lose money overall?
SELECT Product,
       COUNT(*) AS order_lines,
       ROUND(SUM(Sales),0) AS revenue,
       ROUND(SUM(Profit),0) AS profit,
       ROUND(100.0*SUM(Profit)/SUM(Sales),1) AS margin_pct,
       ROUND(AVG(Discount)*100,1) AS avg_discount_pct
FROM sales
GROUP BY Product
ORDER BY profit ASC;
