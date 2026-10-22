-- Business question: Which 10 product-segment combinations earn the least profit (only the first is loss-making)?
SELECT Product, Segment,
       COUNT(*) AS order_lines,
       ROUND(SUM(Profit),0) AS profit,
       ROUND(AVG(Discount)*100,1) AS avg_discount_pct
FROM sales
GROUP BY Product, Segment
ORDER BY SUM(Profit) ASC
LIMIT 10;
