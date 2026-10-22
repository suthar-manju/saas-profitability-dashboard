-- Business question: How do revenue and profit move month by month?
WITH monthly AS (
    SELECT Order_Month, SUM(Sales) AS revenue, SUM(Profit) AS profit
    FROM sales
    GROUP BY Order_Month
)
SELECT Order_Month,
       ROUND(revenue,0) AS revenue,
       ROUND(profit,0) AS profit,
       ROUND(SUM(revenue) OVER (ORDER BY Order_Month),0) AS running_revenue,
       ROUND(SUM(profit) OVER (ORDER BY Order_Month),0) AS running_profit,
       ROUND(100.0*(revenue - LAG(revenue) OVER (ORDER BY Order_Month))
             / LAG(revenue) OVER (ORDER BY Order_Month),1) AS mom_revenue_pct
FROM monthly
ORDER BY Order_Month;
