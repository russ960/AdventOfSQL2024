;WITH cleaning_cte AS (SELECT 
REPLACE(CAST(json_array_elements(cleaning_receipts::json)::json->'drop_off' AS text), '"','') dropoff
, REPLACE(CAST(json_array_elements(cleaning_receipts::json)::json->'color' AS text),'"','') color 
, REPLACE(CAST(json_array_elements(cleaning_receipts::json)::json->'garment' AS text),'"','') garment 
FROM SantaRecords)
SELECT * FROM cleaning_cte 
WHERE color = 'green'
AND garment = 'suit'
ORDER BY dropoff DESC
