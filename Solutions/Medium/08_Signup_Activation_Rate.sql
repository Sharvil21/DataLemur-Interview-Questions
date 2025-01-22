WITH cte AS (SELECT
SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END) AS confirmed,
COUNT(*) AS total
FROM emails
LEFT JOIN texts USING(email_id)
WHERE signup_action IS NOT NULL)

SELECT
ROUND(1.0*confirmed/total,2) FROM cte;
