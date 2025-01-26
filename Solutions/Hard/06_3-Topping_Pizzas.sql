WITH cte AS (SELECT
a.topping_name AS ingredient1, b.topping_name AS ingredient2, c.topping_name AS ingredient3,
a.ingredient_cost AS cost1, b.ingredient_cost AS cost2, c.ingredient_cost AS cost3
FROM pizza_toppings a
JOIN pizza_toppings b ON a.topping_name < b.topping_name
JOIN pizza_toppings c ON b.topping_name < c.topping_name AND a.topping_name <> c.topping_name
ORDER BY a.topping_name, b.topping_name, c.topping_name)

SELECT
DISTINCT ingredient1 || ','|| ingredient2 || ',' || ingredient3, cost1+cost2+cost3 AS total_cost
FROM cte
ORDER BY 2 DESC;
