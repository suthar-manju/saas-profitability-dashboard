-- Business question: At exactly which discount value do order lines start losing money?
SELECT ROUND(Discount*100,0) AS discount_pct,
       COUNT(*) AS order_lines,
       ROUND(SUM(Profit),0) AS profit,
       ROUND(100.0*SUM(Is_Loss)/COUNT(*),1) AS loss_line_pct
FROM sales
GROUP BY Discount
ORDER BY Discount;
