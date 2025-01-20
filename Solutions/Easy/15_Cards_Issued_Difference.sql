WITH cte AS (SELECT
card_name, MAX(issued_amount) AS highest, MIN(issued_amount) AS lowest
FROM monthly_cards_issued
GROUP BY 1)

SELECT
card_name, highest-lowest AS difference
FROM cte
ORDER BY 2 DESC;
