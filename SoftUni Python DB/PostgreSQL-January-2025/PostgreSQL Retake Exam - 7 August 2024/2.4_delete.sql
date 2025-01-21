DELETE
FROM countries
WHERE id NOT IN (SELECT DISTINCT country_id
                 FROM actors)
  AND id NOT IN (SELECT DISTINCT country_id
                 FROM productions);