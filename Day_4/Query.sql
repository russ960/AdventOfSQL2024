SELECT
    toy_id,
    toy_name,
	COALESCE(array_length(ARRAY(SELECT UNNEST(new_tags) EXCEPT SELECT UNNEST(previous_tags)),1),0) AS added_tags,
    COALESCE(array_length(ARRAY(SELECT UNNEST(previous_tags) INTERSECT SELECT UNNEST(new_tags)),1),0) AS unchanged_tags,
	COALESCE(array_length(ARRAY(SELECT UNNEST(previous_tags) EXCEPT SELECT UNNEST(new_tags)),1),0) AS removed_tags	
FROM
    toy_production
GROUP BY
    toy_id, toy_name
ORDER BY added_tags DESC;
