;WITH cte AS (SELECT place_name, timestamp - LAG(timestamp, 1) OVER (PARTITION BY place_name ORDER BY timestamp) as delta 
FROM areas a INNER JOIN sleigh_locations sl ON ST_Contains(a.polygon, sl.coordinate))
SELECT place_name, SUM(delta) total_time FROM cte WHERE delta IS NOT NULL GROUP BY place_name ORDER BY total_time DESC