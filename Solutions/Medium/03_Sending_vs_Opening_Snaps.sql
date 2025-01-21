WITH cte1 AS (SELECT
age_bucket,
SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0.0 END) AS time_spent_opening,
SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0.0 END) AS time_spent_sending
FROM activities
JOIN age_breakdown USING(user_id)
GROUP BY 1),

cte2 AS (SELECT *, time_spent_opening + time_spent_sending AS total_time
FROM cte1)

SELECT age_bucket, 
ROUND(100.0*time_spent_sending/total_time,2) AS send_perc,
ROUND(100.0*time_spent_opening/total_time,2) AS open_perc
FROM cte2;
