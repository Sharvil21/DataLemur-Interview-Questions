WITH cte AS (SELECT
*, DATE(measurement_time) AS measurement_day, ROW_NUMBER() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_id ASC) AS rownum
FROM measurements)

SELECT 
measurement_day,
SUM(CASE WHEN rownum%2 =1 THEN measurement_value ELSE 0 END) AS odd_sum,
SUM(CASE WHEN rownum%2 =0 THEN measurement_value ELSE 0 END) AS even_sum 
FROM cte
GROUP BY 1
