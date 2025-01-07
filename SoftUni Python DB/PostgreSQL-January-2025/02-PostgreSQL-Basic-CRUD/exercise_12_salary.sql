SELECT E.first_name || ' ' || E.last_name AS "Full Name",
       E.job_title,
       E.salary
FROM employees E
WHERE E.salary IN (12500, 14000, 23600, 25000)
ORDER BY E.salary DESC;