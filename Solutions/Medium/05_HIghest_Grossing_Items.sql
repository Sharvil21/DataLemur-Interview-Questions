WITH cte AS (SELECT
category, product, COUNT(product), SUM(spend) AS total_spend, DENSE_RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS rnk
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date)::INT = 2022
GROUP BY 1,2)
SELECT category, product, total_spend FROM cte WHERE rnk <3
