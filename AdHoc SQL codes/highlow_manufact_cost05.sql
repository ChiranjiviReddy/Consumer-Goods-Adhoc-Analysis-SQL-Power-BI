(SELECT p.product_code,
        p.product,
        Round(m.manufacturing_cost, 2) AS manufacturing_cost
 FROM   fact_manufacturing_cost m
        JOIN dim_product p
          ON m.product_code = p.product_code
 ORDER  BY m.manufacturing_cost DESC
 LIMIT  1)
UNION ALL
(SELECT p.product_code,
        p.product,
        Round(m.manufacturing_cost, 2) AS manufacturing_cost
 FROM   fact_manufacturing_cost m
        JOIN dim_product p
          ON m.product_code = p.product_code
 ORDER  BY m.manufacturing_cost ASC
 LIMIT  1);