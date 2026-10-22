-- Business question: Within each segment, which products rank best and worst on profit?
WITH seg_prod AS (
    SELECT Segment, Product, SUM(Sales) AS revenue, SUM(Profit) AS profit
    FROM sales
    GROUP BY Segment, Product
)
SELECT Segment, Product,
       ROUND(profit,0) AS profit,
       ROUND(100.0*profit/revenue,1) AS margin_pct,
       RANK() OVER (PARTITION BY Segment ORDER BY profit DESC) AS profit_rank
FROM seg_prod
ORDER BY Segment, profit_rank;
