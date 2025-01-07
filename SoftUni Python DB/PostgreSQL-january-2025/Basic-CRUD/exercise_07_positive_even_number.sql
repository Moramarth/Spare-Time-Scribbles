SELECT A.number || ' ' || A.street AS "Address",
       A.city_id
FROM addresses A
WHERE A.city_id % 2 = 0
ORDER BY A.city_id ASC;