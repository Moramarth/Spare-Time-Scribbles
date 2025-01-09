SELECT continent_name,
       TRIM(LEADING FROM continent_name) as trim
FROM continents;