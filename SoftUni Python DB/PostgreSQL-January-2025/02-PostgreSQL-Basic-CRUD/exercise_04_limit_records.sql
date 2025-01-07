SELECT E.id                               AS "ID",
       E.first_name || ' ' || E.last_name AS "Full Name",
       E.job_title                        AS "Job Title"
FROM employees E
ORDER BY E.first_name ASC
LIMIT 50;