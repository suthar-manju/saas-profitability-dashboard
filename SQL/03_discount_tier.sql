-- Business question: At which discount tier do orders start losing money?
SELECT Discount_Tier,
       COUNT(*) AS order_lines,
       ROUND(SUM(Sales),0) AS revenue,
       ROUND(SUM(Profit),0) AS profit,
       ROUND(100.0*SUM(Profit)/SUM(Sales),1) AS margin_pct,
       ROUND(100.0*SUM(Is_Loss)/COUNT(*),1) AS loss_line_pct
FROM sales
GROUP BY Discount_Tier
ORDER BY MIN(Discount);
