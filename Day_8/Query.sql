-- Borrowed method from here: https://learnsql.com/blog/sql-recursive-cte/

WITH RECURSIVE staff_hierarchy AS (
  SELECT staff_id, staff_name, manager_id, 1 AS hierarchy_level
  FROM staff
  WHERE manager_id IS NULL
 
  UNION ALL
   
  SELECT s.staff_id, s.staff_name, s.manager_id, hierarchy_level + 1
  FROM staff s, staff_hierarchy sh
  WHERE s.manager_id = sh.staff_id
)
 
SELECT   sh.staff_id AS employee_first_name,
       sh.staff_name AS employee_last_name,
       s.staff_id AS boss_first_name,
       s.staff_name AS boss_last_name,
       hierarchy_level
FROM staff_hierarchy sh
LEFT JOIN staff s
ON sh.manager_id = s.staff_id
ORDER BY sh.hierarchy_level DESC, sh.manager_id;