SELECT gift_name, COUNT(g.gift_name), ROUND(CAST(PERCENT_RANK() OVER (ORDER BY COUNT(g.gift_name)) AS NUMERIC),2) AS overall_rank
FROM gifts g INNER JOIN gift_requests gr ON g.gift_id = gr.gift_id 
GROUP BY gift_name
ORDER BY overall_rank DESC, gift_name ASC