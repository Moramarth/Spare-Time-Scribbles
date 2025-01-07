SELECT A.id,
       A.number || ' ' || A.street AS "Address",
       A.city_id
FROM addresses A
WHERE A.id >= 20;