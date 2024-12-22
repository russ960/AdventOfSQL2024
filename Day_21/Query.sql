WITH sales_agg AS (SELECT extract(year from sale_date) AS Year, 
CASE 
 WHEN extract(month from sale_date) IN (1,2,3) THEN 1
 WHEN extract(month from sale_date) IN (4,5,6) THEN 2
 WHEN extract(month from sale_date) IN (7,8,9) THEN 3
 WHEN extract(month from sale_date) IN (10,11,12) THEN 4
END AS Quarter,
SUM(amount) AS QuarterSales
FROM sales
GROUP BY Year,Quarter )
, sales_agg_with_prev_q AS (SELECT 
Year,
Quarter,
QuarterSales,
LAG(QuarterSales, 1) OVER (
ORDER BY
  Year, Quarter
) previousquarter
FROM sales_agg)

SELECT year, quarter, quartersales, COALESCE ((QuarterSales-previousquarter)/previousquarter, 0) growthrate FROM sales_agg_with_prev_q 
ORDER BY growthrate DESC
LIMIT 1;
