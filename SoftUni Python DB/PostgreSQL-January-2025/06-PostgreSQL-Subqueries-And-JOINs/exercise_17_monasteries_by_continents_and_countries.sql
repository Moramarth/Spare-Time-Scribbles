UPDATE countries
SET country_name = 'Burma'
WHERE country_name = 'Myanmar';

INSERT INTO monasteries (monastery_name, country_code)
VALUES ('Hanga Abbey', 'TZ');
--('Myin-Tin-Daik', 'MM');

SELECT C2.continent_name,
       C.country_name,
       COUNT(M.monastery_name) AS monasteries_count
FROM countries C
         JOIN continents C2 ON C.continent_code = C2.continent_code
         LEFT JOIN monasteries M ON M.country_code = C.country_code
WHERE three_rivers = FALSE
GROUP BY C2.continent_name, C.country_name
ORDER BY monasteries_count DESC, C.country_name ASC;