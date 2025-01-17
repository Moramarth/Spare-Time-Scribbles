SELECT COUNT(employee_id) AS count
FROM employees
WHERE employees.salary > (SELECT AVG(salary)
                          from employees);