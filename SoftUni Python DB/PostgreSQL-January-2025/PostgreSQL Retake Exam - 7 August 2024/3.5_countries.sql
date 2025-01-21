SELECT *
FROM countries
WHERE continent = 'South America'
  AND (currency LIKE 'U%' OR currency LIKE 'P%')
ORDER BY currency DESC, id ASC;