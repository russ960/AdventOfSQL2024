SELECT c.name, 
JSON_VALUE(wl.wishes, '$.first_choice') AS primary_wish,
JSON_VALUE(wl.wishes, '$.second_choice') AS backup_wish,
JSON_VALUE(wl.wishes, '$.colors[0]') AS favorite_color,
color_count = (SELECT count(*) From OpenJson(wl.wishes,'$.colors')),
CASE tc.difficulty_to_make
	WHEN 1 THEN 'Simple Gift'
	WHEN 2 THEN 'Moderate Gift'
	ELSE 'Complex Gift'S
END AS gift_complexity,
CASE tc.category
	WHEN  'outdoor' THEN 'Outside Workshop'
	WHEN 'educational' THEN 'Learning Workshop'
	ELSE 'General Workshop'
END AS workshop_assignment
FROM children_demo c
INNER JOIN wish_lists_demo wl ON c.child_id = wl.child_id
INNER JOIN toy_catalogue_demo tc ON tc.toy_name = JSON_VALUE(wl.wishes, '$.first_choice')
GROUP BY c.name, wl.wishes, tc.difficulty_to_make, tc.category
ORDER BY c.name


