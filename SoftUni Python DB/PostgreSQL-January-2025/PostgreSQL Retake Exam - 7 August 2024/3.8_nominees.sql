SELECT C.name,
       COUNT(P.country_id)         AS productions_count,
       COALESCE(AVG(pi.budget), 0) AS budget
FROM countries C
         JOIN productions P ON C.id = P.country_id
         JOIN productions_info PI ON PI.id = P.production_info_id
GROUP BY C.name
ORDER BY productions_count DESC, C.name ASC;