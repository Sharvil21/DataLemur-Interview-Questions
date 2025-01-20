WITH cte1 AS (SELECT
DISTINCT employee_id, query_id::TEXT
FROM queries 
RIGHT JOIN employees USING(employee_id)
WHERE EXTRACT(YEAR FROM query_starttime)::INT = 2023
AND
EXTRACT(QUARTER FROM query_starttime)::INT = 3

UNION ALL

SELECT DISTINCT employee_id,
(CASE WHEN (EXTRACT(YEAR FROM query_starttime)::INT <> 2023 AND
EXTRACT(QUARTER FROM query_starttime)::INT <> 3)
THEN NULL END) AS query_id
FROM queries FULL OUTER JOIN employees USING(employee_id)),


cte2 AS (SELECT 
employee_id, COUNT(query_id) AS unique_queries
FROM cte1
GROUP BY 1)

SELECT
unique_queries, COUNT(unique_queries)
FROM cte2 
GROUP BY 1
ORDER BY 1
