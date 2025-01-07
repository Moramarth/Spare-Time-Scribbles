SELECT E.id,
       E.first_name,
       E.last_name
FROM employees E
WHERE E.middle_name IS NULL
LIMIT 3;