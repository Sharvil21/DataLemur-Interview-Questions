WITH cte1 AS (SELECT
a.caller_id, a.receiver_id, b.country_id AS caller_country, c.country_id AS receiver_country
FROM phone_calls a
JOIN phone_info b ON a.caller_id = b.caller_id 
JOIN phone_info c on a.receiver_id = c.caller_id),

cte2 AS (SELECT
COUNT(*) AS num
FROM cte1 
WHERE caller_country <> receiver_country)

SELECT
ROUND(100.0*(SELECT num FROM cte2)/COUNT(*),1)
FROM phone_calls
