SELECT
ROUND(100.0*SUM(CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1 ELSE 0 END)/COUNT(*),1)
FROM callers
