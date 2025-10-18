WITH Channels as 
(SELECT channel, (sum(sold_quantity*gross_price)/1000000)
as gross_sales_mln
	FROM fact_sales_monthly fs 
    JOIN fact_gross_price fg
    ON fs.product_code=fg.product_code
    and fs.fiscal_year=fg.fiscal_year
    JOIN dim_customer dc
    ON dc.customer_code=fs.customer_code
 WHERE fs.fiscal_year=2021
GROUP BY channel)

SELECT *, ROUND(gross_sales_mln*100/(SELECT SUM(gross_sales_mln) FROM Channels),2) as pct
FROM Channels
Order by pct DESC


