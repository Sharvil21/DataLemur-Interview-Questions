WITH cte AS (SELECT
company_id, title, description, COUNT(*) AS total_duplicates
FROM job_listings
GROUP BY 1,2,3)
SELECT COUNT(total_duplicates) AS duplicate_companies
FROM cte
WHERE total_duplicates <> 1;
