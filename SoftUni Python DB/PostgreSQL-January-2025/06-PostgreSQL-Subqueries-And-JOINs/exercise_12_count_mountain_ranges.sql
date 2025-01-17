SELECT MC.country_code,
       COUNT(M.id) AS mountain_range_count
FROM mountains M
         JOIN mountains_countries MC ON M.id = MC.mountain_id
WHERE MC.country_code IN ('US', 'RU', 'BG')
GROUP BY MC.country_code
ORDER BY mountain_range_count DESC;