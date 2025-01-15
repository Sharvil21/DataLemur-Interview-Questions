WITH cte AS (SELECT 
user_id, COUNT(user_id) AS total_tweets
FROM tweets
WHERE EXTRACT(YEAR FROM tweet_date)::INT = 2022
GROUP BY 1)

SELECT
total_tweets AS tweet_bucket, COUNT(user_id) AS users_num
FROM cte 
GROUP BY 1;
