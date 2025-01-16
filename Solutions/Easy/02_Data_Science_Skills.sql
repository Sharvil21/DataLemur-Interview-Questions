WITH cte AS (SELECT
candidate_id, COUNT(skill)
FROM candidates
WHERE skill = 'Python' OR skill = 'Tableau' OR skill = 'PostgreSQL'
GROUP BY 1
HAVING COUNT(skill) = 3)

SELECT candidate_id
FROM cte;
