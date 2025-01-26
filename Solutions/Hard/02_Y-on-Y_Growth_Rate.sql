WITH cte AS (SELECT
EXTRACT(YEAR FROM transaction_date) AS year,
product_id, spend, LAG(spend) OVER(PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date) ASC) AS previous_year_spend
FROM user_transactions
ORDER BY product_id, 1)

SELECT
year, product_id,
spend AS current_year_spend, previous_year_spend AS prev_year_spend,
ROUND((100.0*(spend - previous_year_spend)/previous_year_spend),2) AS yoy_rate
FROM cte;
