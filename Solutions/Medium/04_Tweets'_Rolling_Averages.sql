WITH cte AS (SELECT 
user_id, tweet_date, 
AVG(tweet_count) OVER(PARTITION BY user_id ORDER BY tweet_date ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) 
AS rolling_avg_3rd
FROM tweets
GROUP BY 1,2, tweet_count)

SELECT user_id, tweet_date, ROUND(rolling_avg_3rd,2) AS rolling_avg_3rd
FROM cte;
