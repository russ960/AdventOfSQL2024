;WITH production_data AS (SELECT production_date, toys_produced, LAG(toys_produced, 1) OVER (ORDER BY production_date) previous_day_production  FROM toy_production)
SELECT production_date, 
toys_produced, 
previous_day_production, 
(toys_produced-previous_day_production) production_change, 
ROUND((toys_produced-previous_day_production)/CAST(previous_day_production AS NUMERIC(10,4)),4) * 100 production_change_percentage  
FROM production_data
ORDER BY production_change_percentage DESC