UPDATE employees
SET salary = salary + 100
WHERE job_title = 'Manager';

SELECT *
FROM employees E
WHERE E.job_title = 'Manager';