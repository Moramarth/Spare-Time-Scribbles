SELECT E.id,
       E.first_name || ' ' || E.middle_name || ' ' || E.last_name AS "Full Name",
       E.hire_date                                                AS "Hire Date"
FROM employees E
ORDER BY E.hire_date ASC
OFFSET 9;