WITH continent_avg_area AS (SELECT continent_code,
                                   AVG(area_in_sq_km) as avg_area
                            FROM countries
                            GROUP BY continent_code)
SELECT MIN(avg_area) AS min_average_area
FROM continent_avg_area