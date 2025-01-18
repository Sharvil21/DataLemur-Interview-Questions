WITH cte AS (SELECT
city, COUNT(order_id) AS total_orders, DENSE_RANK() OVER(ORDER BY COUNT(order_id) DESC) AS rnk
FROM trades
JOIN users USING(user_id)
WHERE status ~* 'Completed'
GROUP BY 1)
SELECT city, total_orders FROM cte WHERE rnk <4;
