WITH RECURSIVE cte as (
  SELECT staff_id, staff_name, manager_id, 1 as depth, ARRAY[ROW(manager_id)] as path 
  FROM staff
         WHERE staff_id = 2
  UNION ALL
  SELECT e.staff_id, e.staff_name, e.manager_id, t.depth + 1,
         t.path || ROW(e.manager_id)
  FROM staff as e
  JOIN cte t
  ON t.staff_id = e.manager_id
  )
  SELECT *, array_length(path,1)+1 level FROM cte WHERE (depth+1) = (  SELECT level FROM (SELECT manager_id, array_length(path,1)+1 level, COUNT(*) cnt FROM cte GROUP BY manager_id, array_length(path,1)+1 ORDER BY array_length(path,1)+1 DESC) a
  GROUP BY manager_id, level
  ORDER BY manager_id desc LIMIT 1) LIMIT 1
