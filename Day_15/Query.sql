SELECT a.place_name 
FROM areas a, sleigh_locations sl
WHERE ST_Contains(ST_Transform(polygon::geometry, 4326), ST_Transform(sl.coordinate::geometry, 4326)) = true;