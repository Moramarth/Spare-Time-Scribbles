SELECT C.country_name,
       R.river_name
FROM countries C
         LEFT JOIN countries_rivers CR ON C.country_code = CR.country_code
         LEFT JOIN rivers R ON R.id = CR.river_id
WHERE C.continent_code = 'AF'
ORDER BY country_name ASC
LIMIT 5;