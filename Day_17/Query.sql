SELECT 
  w.workshop_id,
  w.workshop_name,
  w.business_start_time - ptn.utc_offset utc_start_time,
  w.business_end_time - ptn.utc_offset utc_end_time
FROM 
  Workshops w INNER JOIN pg_timezone_names ptn ON w.timezone = ptn.name
  WHERE w.business_start_time - ptn.utc_offset BETWEEN '14:00:00' AND '16:00:00'
ORDER BY utc_start_time;

--SELECT * FROM pg_timezone_names
--SELECT MIN(utc_offset), MAX(utc_offset) FROM  Workshops w INNER JOIN pg_timezone_names ptn ON w.timezone = ptn.name

