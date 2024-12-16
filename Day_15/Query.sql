;WITH cte AS (
SELECT place_name, ST_Transform(polygon::geometry, 4326) AS polygon_geo FROM areas
)
SELECT a.place_name 
FROM cte a, sleigh_locations sl
WHERE ST_Contains(a.polygon_geo, ST_Transform(sl.coordinate::geometry, 4326)) = true;


