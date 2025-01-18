WITH cte AS (SELECT
sender_id, COUNT(message_id) AS message_count, DENSE_RANK() OVER(ORDER BY COUNT(message_id) DESC) AS rnk
FROM messages
WHERE EXTRACT(YEAR FROM sent_date)::INT = 2022 AND EXTRACT(MONTH FROM sent_date)::INT = 08
GROUP BY 1
ORDER BY 2 DESC)

SELECT sender_id, message_count FROM cte WHERE rnk <3
ORDER BY 2 DESC;
