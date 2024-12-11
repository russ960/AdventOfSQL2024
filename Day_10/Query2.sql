CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * 
FROM crosstab(
    $$WITH drink_cte AS (
        SELECT 
            date,
            drink_name,
            SUM(quantity) AS drink_qty
        FROM drinks
		WHERE drink_name IN ('Hot Cocoa','Peppermint Schnapps','Eggnog')
        GROUP BY date, drink_name
        ORDER BY date, drink_name
    )
    SELECT date, drink_name, drink_qty
    FROM drink_cte
    ORDER BY date, drink_name$$
) AS ct (date DATE,"Eggnog" BIGINT,"Hot Cocoa" BIGINT,"Peppermint Schnapps" BIGINT);
