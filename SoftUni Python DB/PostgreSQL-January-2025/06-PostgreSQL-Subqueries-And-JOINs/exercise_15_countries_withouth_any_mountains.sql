SELECT COUNT(C.id) AS countries_without_mountains
FROM countries C
         LEFT JOIN mountains_countries MC ON C.country_code = MC.country_code
WHERE MC.country_code IS NULL;