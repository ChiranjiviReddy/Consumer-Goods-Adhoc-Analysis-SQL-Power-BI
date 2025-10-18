SELECT segment,
       Count(product_code) AS product_count
FROM   dim_product
GROUP  BY segment
ORDER  BY Count(product_code) DESC