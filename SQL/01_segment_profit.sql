-- Business question: Which segments make money, and at what margin?
SELECT Segment,
       COUNT(DISTINCT Order_ID) AS orders,
       ROUND(SUM(Sales),0) AS revenue,
       ROUND(SUM(Profit),0) AS profit,
       ROUND(100.0*SUM(Profit)/SUM(Sales),1) AS margin_pct
FROM sales
GROUP BY Segment
ORDER BY profit DESC;
