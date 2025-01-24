/*
SELECT a.user_id
FROM
(SELECT user_id, transaction_date, 
lag(transaction_date,1) over (PARTITION BY user_id order by transaction_date) as oneday,
lag(transaction_date,2) over (PARTITION BY user_id order by transaction_date) as twoday
FROM transactions) a
WHERE a.oneday = transaction_date - interval '1 day'
AND a.twoday = transaction_date - interval '2 day'
s;
*/

WITH cte AS (SELECT
*,
LAG(transaction_date, 1) OVER(PARTITION BY user_id) AS first_day,
LAG(transaction_date, 2) OVER(PARTITION BY user_id) AS second_day
FROM transactions)

SELECT user_id FROM cte WHERE first_day = transaction_date - INTERVAL '1 DAY'
AND second_day = transaction_date - INTERVAL '2 DAY'
