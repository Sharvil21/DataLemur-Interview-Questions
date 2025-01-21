WITH cte AS (SELECT
*, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS num
FROM transactions)

SELECT user_id, spend, transaction_date
FROM cte WHERE num = 3;
