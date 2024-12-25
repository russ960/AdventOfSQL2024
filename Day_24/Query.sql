WITH cte
AS (
	SELECT s.song_title
		,COUNT(up.play_id) plays
		,COUNT(CASE 
				WHEN s.song_duration > up.duration OR up.duration IS NULL
					THEN 1
				END) AS full_play_count
	FROM users u
	INNER JOIN user_plays up ON u.user_id = up.user_id
	INNER JOIN songs s ON s.song_id = up.song_id
	GROUP BY s.song_title
	)
SELECT *
FROM cte
ORDER BY plays DESC
	,full_play_count DESC LIMIT 1
