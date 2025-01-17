WITH row_number AS
         (SELECT C.country_name,
                 P.peak_name                                                 AS highest_peak_name,
                 p.elevation                                                 AS highest_peak_elevation,
                 M.mountain_range                                            AS mountain_range,
                 row_number() over
                     (PARTITION BY C.country_name ORDER BY P.elevation DESC) AS peak_rank
          FROM countries C
                   LEFT JOIN mountains_countries MC ON c.country_code = MC.country_code
                   LEFT JOIN peaks P ON mc.mountain_id = P.mountain_id
                   LEFT JOIN mountains M ON P.mountain_id = M.id)

SELECT country_name,
       COALESCE(highest_peak_name, '(no highest peak)') AS highest_peak_name,
       COALESCE(highest_peak_elevation, 0)              AS highest_peak_elevation,
       COALESCE(mountain_range, '(no mountain)')        AS mountain
FROM row_number
WHERE peak_rank = 1
ORDER BY country_name ASC, highest_peak_elevation DESC;