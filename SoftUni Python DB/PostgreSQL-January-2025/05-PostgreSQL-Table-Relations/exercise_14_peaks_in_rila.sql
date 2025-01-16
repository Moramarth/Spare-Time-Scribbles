SELECT M.mountain_range,
       P.peak_name,
       P.elevation
FROM mountains M
         JOIN peaks P on M.id = P.mountain_id
WHERE mountain_range = 'Rila'
ORDER BY elevation DESC;