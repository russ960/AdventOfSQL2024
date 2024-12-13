;WITH TreeHarvests_cte AS (
SELECT field_name
	,harvest_year
	,CASE
		WHEN season = 'Spring' THEN 1
		WHEN season = 'Summer' THEN 2
		WHEN season = 'Fall' THEN 3
		WHEN season = 'Winter' THEN 4
		ELSE NULL 
		END AS season
	,trees_harvested
FROM TreeHarvests_Test
)
SELECT field_name
	,harvest_year
	,season
	,round((avg(trees_harvested) OVER (
                PARTITION BY field_name
                ORDER BY
                        harvest_year,
                        season
                ROWS 2 preceding
        )),2) AS three_season_moving_avg
FROM TreeHarvests_cte
ORDER BY three_season_moving_avg DESC, season