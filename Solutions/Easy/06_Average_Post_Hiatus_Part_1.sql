WITH cte AS (SELECT user_id, COUNT(user_id) FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY 1
HAVING COUNT(user_id) >2)

SELECT user_id, EXTRACT(DAY FROM (MAX(post_date) - MIN(post_date)))
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021 AND user_id IN (SELECT user_id FROM cte)
GROUP BY user_id
ORDER BY user_id;
