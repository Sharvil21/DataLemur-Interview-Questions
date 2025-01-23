WITH cte AS (SELECT
*, COUNT(*) OVER() AS total_orders
FROM
orders)

SELECT
CASE
  WHEN order_id = total_orders THEN order_id
  WHEN order_id%2 = 0 THEN order_id - 1
  WHEN order_id%2 <> 0 THEN order_id + 1
  END AS corrected_order_id,
  item
FROM cte
ORDER BY 1 ASC;
