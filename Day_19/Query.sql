;WITH cte AS (SELECT 
CASE WHEN year_end_performance_scores[array_upper(year_end_performance_scores,1)] > avgs THEN salary*1.15
ELSE salary
END
salary
FROM employees,
(SELECT avg(year_end_performance_scores[array_upper(year_end_performance_scores,1)]) avgs FROM employees) averageval)
SELECT round(SUM(salary),2) FROM cte