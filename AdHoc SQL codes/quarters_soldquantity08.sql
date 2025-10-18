SELECT 
CASE
	WHEN date BETWEEN '2019-09-01' and '2019-11-01' then concat('Q1')
    WHEN date BETWEEN '2019-12-01' and '2020-02-01' then concat('Q2')
    WHEN date BETWEEN '2020-03-01' and '2020-05-01' then concat('Q3')
    WHEN date BETWEEN '2020-06-01' and '2020-08-01' then concat('Q4')
    END AS Quarters,
    
    CONCAT(cast(ROUND(SUM(sold_quantity)/100000,2) AS CHAR),"M") as total_sold_quantity
    FROM fact_sales_monthly
WHERE fiscal_year=2020
GROUP BY Quarters
Order by total_sold_quantity desc