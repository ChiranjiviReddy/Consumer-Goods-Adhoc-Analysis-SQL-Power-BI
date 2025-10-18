WITH x
     AS (SELECT p.segment,
                Count(DISTINCT p.product_code) AS cnt
         FROM   dim_product p
                JOIN fact_sales_monthly s
                  ON p.product_code = s.product_code
         WHERE  fiscal_year = 2020
         GROUP  BY segment),
     y
     AS (SELECT p.segment,
                Count(DISTINCT p.product_code) AS cnt
         FROM   dim_product p
                JOIN fact_sales_monthly s
                  ON p.product_code = s.product_code
         WHERE  fiscal_year = 2021
         GROUP  BY segment)
SELECT x.segment,
       x.cnt             AS product_count_2020,
       y.cnt             AS product_count_2021,
       ( y.cnt - x.cnt ) AS difference
FROM   x
       JOIN y
         ON y.segment = x.segment
ORDER  BY difference DESC;