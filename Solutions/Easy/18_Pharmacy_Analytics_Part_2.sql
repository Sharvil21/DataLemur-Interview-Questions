WITH cte AS (SELECT
manufacturer, drug, total_sales - cogs AS total_loss
FROM pharmacy_sales)

SELECT
manufacturer, COUNT(drug) AS drug_count, ABS(SUM(total_loss)) AS total_loss
FROM cte 
WHERE total_loss <0
GROUP BY 1
ORDER BY 3 DESC;
