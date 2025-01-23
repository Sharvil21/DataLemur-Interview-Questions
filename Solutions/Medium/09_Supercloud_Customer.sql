WITH cte AS (SELECT
customer_id, COUNT(DISTINCT product_category) AS total_purchased
FROM customer_contracts
JOIN products USING(product_id)
GROUP BY 1)

SELECT customer_id FROM cte
WHERE total_purchased = (SELECT COUNT(DISTINCT product_category) FROM products)
