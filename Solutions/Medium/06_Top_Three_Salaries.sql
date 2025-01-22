WITH cte AS (SELECT name, department_name, salary, DENSE_RANK() OVER(PARTITION BY department_name ORDER BY salary DESC) AS rnk
FROM 
employee
JOIN department USING(department_id))
SELECT
department_name, name, salary
FROM cte
WHERE rnk <4
ORDER BY department_name ASC, salary DESC;
