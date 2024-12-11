;WITH drink_cte AS (SELECT date,
    drink_name,
    SUM(quantity) drink_qty
FROM drinks
WHERE drink_name IN ('Hot Cocoa','Peppermint Schnapps','Eggnog')
GROUP BY date, drink_name
ORDER BY date, drink_name)
SELECT * FROM drink_cte WHERE (drink_name = 'Peppermint Schnapps' AND drink_qty = 298) OR 
(drink_name = 'Hot Cocoa' AND drink_qty = 38) OR
(drink_name = 'Eggnog' AND drink_qty = 198) 


