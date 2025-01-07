SELECT E.id,
       E.first_name || ' ' || E.last_name AS full_name,
       E.job_title,
       E.salary
FROM employees E
WHERE E.salary > 1000.00
ORDER BY E.id;