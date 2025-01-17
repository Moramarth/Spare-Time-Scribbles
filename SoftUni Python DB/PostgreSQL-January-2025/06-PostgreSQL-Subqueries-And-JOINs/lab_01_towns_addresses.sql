SELECT T.town_id,
       T.name AS town_name,
       A.address_text
FROM towns T
         JOIN addresses A ON T.town_id = A.town_id
WHERE T.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY T.town_id, A.address_id
;