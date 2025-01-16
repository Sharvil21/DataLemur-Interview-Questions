SELECT
page_id
FROM pages
FULL OUTER JOIN page_likes USING(page_id)
WHERE liked_date IS NULL
ORDER BY 1 ASC;
