WITH cte AS (SELECT
transaction_date, user_id, COUNT(user_id) AS purchase_count, DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rnk
FROM user_transactions
GROUP BY user_id, transaction_date)

SELECT transaction_date, user_id, purchase_count
FROM cte WHERE rnk = 1
ORDER BY 1;
