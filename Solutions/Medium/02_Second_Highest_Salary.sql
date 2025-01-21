WITH cte AS (SELECT *, DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
FROM employee)
SELECT
DISTINCT salary
FROM cte
WHERE rnk = 2;
