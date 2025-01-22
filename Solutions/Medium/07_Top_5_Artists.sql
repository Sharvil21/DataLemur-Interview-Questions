WITH cte AS (SELECT artist_name, DENSE_RANK() OVER(ORDER BY COUNT(artist_name) DESC) AS artist_rank
FROM artists
JOIN songs USING(artist_id)
JOIN global_song_rank USING(song_id)
WHERE rank < 11
GROUP BY artist_name)
SELECT * FROM cte
WHERE artist_rank <6
