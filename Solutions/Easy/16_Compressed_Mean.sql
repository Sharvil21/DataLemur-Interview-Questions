WITH cte AS (SELECT 
(1.0*SUM(order_occurrences*item_count)/SUM(order_occurrences))::FLOAT AS mean
FROM items_per_order)

SElECT ROUND(CAST(mean AS NUMERIC),1)  FROM cte;
