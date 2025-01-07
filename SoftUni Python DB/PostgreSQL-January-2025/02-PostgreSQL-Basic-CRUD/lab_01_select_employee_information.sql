SELECT E.id,
       E.first_name || ' ' || E.last_name AS "Full Name",
       E.job_title                        AS "Job Title"
FROM employees E;