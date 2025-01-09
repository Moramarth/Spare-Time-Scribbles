SELECT continent_name,
       TRIM(TRAILING FROM continent_name) as trim
FROM continents;