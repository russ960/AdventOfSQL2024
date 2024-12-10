WITH reindeer_exercise_cte AS (
SELECT r.reindeer_name, ts.exercise_name, AVG(speed_record) avg FROM reindeers r 
INNER JOIN training_sessions ts
	ON r.reindeer_id = ts.reindeer_id
WHERE r.reindeer_name NOT IN ('Rudolf')
GROUP BY r.reindeer_name, ts.exercise_name
ORDER BY AVG(speed_record) DESC)
SELECT reindeer_name, round(MAX(avg),2) max_avg FROM reindeer_exercise_cte GROUP BY reindeer_name ORDER BY max_avg DESC
