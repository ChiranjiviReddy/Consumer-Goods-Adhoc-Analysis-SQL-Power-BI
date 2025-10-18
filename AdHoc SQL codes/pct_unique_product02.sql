WITH total_unique_products
AS
  (
	SELECT   fiscal_year,
			count(DISTINCT product_code) AS total_products_count
		FROM   fact_sales_monthly
		GROUP BY fiscal_year)
  SELECT  a.total_products_count        AS unique_products_2020,
		  b.total_products_count        AS unique_products_2021,
		  (b.total_products_count-a.total_products_count)     AS new_products,
		  round((b.total_products_count-a.total_products_count)/a.total_products_count*100,2) AS pct_change
  FROM      total_unique_products a
  LEFT JOIN total_unique_products b
  ON        a.fiscal_year+1=b.fiscal_year
  LIMIT     1