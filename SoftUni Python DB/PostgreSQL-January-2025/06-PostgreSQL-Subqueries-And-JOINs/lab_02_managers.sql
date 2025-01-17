SELECT E.employee_id,
       CONCAT(E.first_name, ' ', E.last_name) AS full_name,
       D.department_id,
       D.name                                 AS department_name
FROM employees E
         RIGHT JOIN departments D ON D.manager_id = E.employee_id
ORDER BY E.employee_id
LIMIT 5;