WITH cte AS (SELECT
*, DENSE_RANK() OVER(ORDER BY order_occurrences DESC) AS rnk
FROM items_per_order)

SELECT 
item_count AS mode 
FROM cte WHERE rnk = 1;
