-- Solution 1
WITH cte1 AS (SELECT
user_id,
EXTRACT(MONTH FROM event_date)::INT AS month,
SUM(CASE WHEN event_type = 'sign-in' OR event_type = 'like' OR event_type = 'comment' THEN 1 ELSE NULL END) AS num_activities
FROM user_actions
WHERE event_date BETWEEN '06/01/2022' AND '07/31/2022'
GROUP BY 1,2
ORDER BY 1,2),

cte2 AS (SELECT 
user_id, month, num_activities, LAG(num_activities,1) OVER(PARTITION BY user_id ORDER BY month ASC) AS previous_activities
FROM cte1)

SELECT
month, COUNT(user_id) AS monthly_active_users
FROM cte2
WHERE num_activities >0 AND previous_activities > 0 AND month = 7
GROUP BY month
