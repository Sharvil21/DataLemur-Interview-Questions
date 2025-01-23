WITH cte1 AS (SELECT
ticker, open, to_char(date, 'Mon-YYYY') AS highest_mth, DENSE_RANK() OVER(PARTITION BY ticker ORDER BY open DESC) AS rnk1
FROM stock_prices),
cte2 AS (
SELECT
ticker, open, to_char(date, 'Mon-YYYY') AS lowest_mth, DENSE_RANK() OVER(PARTITION BY ticker ORDER BY open ASC) AS rnk2
FROM stock_prices)

SELECT 
ticker, highest_mth, cte1.open AS highest_open,
lowest_mth, cte2.open AS lowest_open
FROM cte1 JOIN cte2 USING(ticker)
WHERE rnk1 = 1 AND rnk2 = 1
