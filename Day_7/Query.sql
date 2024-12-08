WITH RankedElves AS (
    SELECT
        elf_id,
        primary_skill,
        years_experience,
        ROW_NUMBER() OVER (PARTITION BY primary_skill ORDER BY years_experience DESC, elf_id) AS max_rank,
        ROW_NUMBER() OVER (PARTITION BY primary_skill ORDER BY years_experience ASC, elf_id) AS min_rank
    FROM workshop_elves
),
MaxMinElves AS (
    SELECT
        MAX(elf_id) FILTER (WHERE max_rank = 1) AS elf_max_id,
        MAX(elf_id) FILTER (WHERE min_rank = 1) AS elf_min_id,
        primary_skill
    FROM RankedElves
    WHERE max_rank = 1 OR min_rank = 1
    GROUP BY primary_skill
)
SELECT
    elf_max_id AS elf_1_id,
    elf_min_id AS elf_2_id,
    primary_skill
FROM MaxMinElves
WHERE elf_max_id != elf_min_id -- Ensure they are not the same elf
ORDER BY primary_skill, elf_1_id, elf_2_id;
