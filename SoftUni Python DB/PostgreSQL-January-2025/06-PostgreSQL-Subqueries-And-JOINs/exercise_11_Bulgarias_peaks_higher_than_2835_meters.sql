SELECT C.country_code,
       M.mountain_range,
       P.peak_name,
       P.elevation
FROM mountains M
         JOIN peaks P ON M.id = P.mountain_id
         JOIN mountains_countries MC ON M.id = MC.mountain_id
         JOIN countries C on MC.country_code = C.country_code
WHERE MC.country_code = 'BG'
  AND P.elevation > 2835
ORDER BY P.elevation DESC;