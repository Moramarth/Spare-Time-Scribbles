SELECT A.number,
       A.street
FROM addresses A
WHERE A.id BETWEEN 50 AND 100
   OR A.number < 1000;