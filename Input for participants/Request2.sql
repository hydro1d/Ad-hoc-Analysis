#answer of q2
select *from fact_sales_monthly; 

WITH unique_products_per_year AS (
    SELECT
        fiscal_year AS year,
        COUNT(DISTINCT product_code) AS unique_products
    FROM fact_sales_monthly
    GROUP BY fiscal_year
)
SELECT 
    up2020.unique_products AS unique_products_2020,
    up2021.unique_products AS unique_products_2021,
    ROUND(((up2021.unique_products - up2020.unique_products) / up2020.unique_products) * 100, 2) AS percentage_chg
FROM 
    (SELECT unique_products FROM unique_products_per_year WHERE year = 2020) up2020,
    (SELECT unique_products FROM unique_products_per_year WHERE year = 2021) up2021;