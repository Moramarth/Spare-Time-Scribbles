UPDATE productions_info
SET duration = duration + CASE
                              WHEN id < 15 THEN 15
                              WHEN id >= 20 THEN 20
    END
WHERE id NOT BETWEEN 15 AND 19
  AND synopsis IS NULL;