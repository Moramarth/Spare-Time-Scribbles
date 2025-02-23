-- Both Solutions pass Judge
-- Solution 1
SELECT id,
       first_name,
       last_name,
       TO_CHAR(salary, '9999.99') as salary,
       department_id,
       CASE
           WHEN department_id = 1 THEN 'Management'
           WHEN department_id = 2 THEN 'Kitchen Staff'
           WHEN department_id = 3 THEN 'Service Staff'
           ELSE 'Other'
           END                    AS department_name
FROM employees
ORDER BY id;

-- Solution 2
SELECT id,
       first_name,
       last_name,
       TRUNC(salary, 2) AS salary,
       department_id,
       CASE department_id
           WHEN 1 THEN 'Management'
           WHEN 2 THEN 'Kitchen Staff'
           WHEN 3 THEN 'Service Staff'
           ELSE 'Other'
           END          AS department_name
FROM employees
ORDER BY id;