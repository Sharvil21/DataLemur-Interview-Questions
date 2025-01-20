WITH cte AS (SELECT
policy_holder_id, COUNT(case_id) AS cnt
FROM callers
GROUP BY 1
ORDER BY 2 DESC)

SELECT COUNT(policy_holder_id)
FROM cte WHERE cnt >=3
