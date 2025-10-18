SELECT pi.customer_code, Round(pre_invoice_discount_pct,5) as pct,
c.customer
FROM fact_pre_invoice_deductions pi
	JOIN dim_customer c
    ON pi.customer_code=c.customer_code
WHERE fiscal_year=2021 and market="India" and
	pi.pre_invoice_discount_pct>
    (SELECT avg(pre_invoice_discount_pct) from fact_pre_invoice_deductions)
Order by pct desc
Limit 5

