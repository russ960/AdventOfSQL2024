/* Sorry this query is stupid ugly */
WITH params AS (SELECT url,split_part(url,'?',2) key_val_pairs FROM web_requests WHERE url LIKE '%utm_source=advent-of-sql%'),
pairs AS (SELECT url,STRING_TO_ARRAY(key_val_pairs,'&') valpairs FROM params),
unnested AS (SELECT url, unnest(valpairs) valpair FROM pairs),
jsonified AS (SELECT url, jsonb_object_agg(split_part(valpair, '=', 1), split_part(valpair, '=', 2)) key_value_json FROM unnested GROUP BY url),
cte AS (SELECT url, 
key_value_json, 
(SELECT COUNT(*) FROM jsonb_object_keys(key_value_json) AS keys) AS key_value_count 
FROM jsonified)
SELECT * FROM cte ORDER BY key_value_count DESC, url ASC
