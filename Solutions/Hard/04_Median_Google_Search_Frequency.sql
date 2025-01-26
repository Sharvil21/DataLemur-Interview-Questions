WITH cte AS (SELECT
searches, GENERATE_SERIES(1,num_users)
FROM search_frequency)

SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY searches ASC) AS median
FROM cte;
