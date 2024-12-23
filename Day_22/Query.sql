WITH cte AS (SELECT id, elf_name, unnest(STRING_TO_ARRAY(skills, ',')) skills FROM elves)
SELECT COUNT(*) FROM cte WHERE skills = 'SQL'