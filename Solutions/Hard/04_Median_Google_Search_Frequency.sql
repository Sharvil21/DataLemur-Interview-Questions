--Method 1

WITH cte AS (SELECT
searches, GENERATE_SERIES(1,num_users)
FROM search_frequency)

SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY searches ASC) AS median
FROM cte;


--Similar Method 2
WITH cte AS (SELECT
searches, GENERATE_SERIES(1,num_users) AS user_number
FROM search_frequency)

SELECT
1.0*PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY searches ASC) AS median
FROM cte
