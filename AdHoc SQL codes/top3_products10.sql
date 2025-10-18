SELECT * FROM
(SELECT dp.division, dp.product,
	fs.product_code, SUM(fs.sold_quantity) as total_sold_quantity,
dense_rank() OVER(partition by dp.division order by 
SUM(fs.sold_quantity) desc) as Rank_Order
	FROM fact_sales_monthly fs
    JOIN dim_product dp
    ON fs.product_code=dp.product_code
    WHERE fiscal_year = 2021
    GROUP BY dp.division, dp.product, fs.product_code) as Ranked_Products
WHERE RANK_ORDER<=3;