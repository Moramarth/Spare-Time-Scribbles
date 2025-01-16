-- Add one to the sum for each of the rows that are in the result
SELECT SUM(1) AS countries_without_rivers
FROM countries C
         LEFT JOIN countries_rivers CR on C.country_code = CR.country_code
WHERE CR.country_code IS NULL;