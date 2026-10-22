-- Business question: How much profit do lines above a 20% discount destroy?
SELECT CASE WHEN Discount > 0.20 THEN 'Above 20%' ELSE '20% or less' END AS discount_band,
       COUNT(*) AS order_lines,
       ROUND(SUM(Sales),0) AS revenue,
       ROUND(SUM(Profit),0) AS profit,
       ROUND(100.0*SUM(Profit)/SUM(Sales),1) AS margin_pct,
       ROUND(100.0*SUM(Is_Loss)/COUNT(*),1) AS loss_line_pct
FROM sales
GROUP BY discount_band;
