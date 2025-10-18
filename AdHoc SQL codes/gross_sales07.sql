SELECT Year(date) as year, Month(date) as month,
	sum(sold_quantity*gross_price) as gross_sales
FROM fact_sales_monthly fs
JOIN fact_gross_price fg
ON fs.product_code=fg.product_code and
	fs.fiscal_year=fg.fiscal_year
JOIN dim_customer dc
ON fs.customer_code=dc.customer_code
WHERE customer= "Atliq Exclusive"
GROUP BY month, year(date)
ORDER BY gross_sales desc