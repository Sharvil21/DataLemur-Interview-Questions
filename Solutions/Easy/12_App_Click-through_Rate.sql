WITH cte AS (SELECT
app_id, 
SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS clicks,
SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS impressions
FROM events
WHERE EXTRACT(YEAR FROM timestamp)::INT = 2022
GROUP BY 1)

SELECT
app_id, ROUND(100.0*clicks/impressions,2) AS ctr
FROM cte;
