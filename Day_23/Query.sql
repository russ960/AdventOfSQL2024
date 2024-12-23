WITH gapid AS (SELECT id, LEAD(id) OVER (ORDER BY id) AS NextVal FROM sequence_table),
	gaplist AS (SELECT id + 1 AS gapstart, NextVal - 1 AS gapend FROM gapid WHERE id + 1 <> NextVal)
SELECT gapstart, gapend, (SELECT array_agg(generate_series) AS gapvalues FROM generate_series(gapstart, gapend)) FROM gaplist
