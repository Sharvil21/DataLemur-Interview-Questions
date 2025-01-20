SELECT
manufacturer, '$' || ROUND(1.0*SUM(total_sales)/1000000,0) || ' million' AS sale
FROM pharmacy_sales
GROUP BY 1
ORDER BY SUM(total_sales) DESC, manufacturer ASC
