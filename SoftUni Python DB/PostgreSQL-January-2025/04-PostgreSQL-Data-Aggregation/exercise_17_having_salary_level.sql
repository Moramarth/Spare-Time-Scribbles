WITH salary_info AS (SELECT department_id,
                            AVG(salary) as avg_salary
                     FROM employees
                     GROUP BY department_id
                     HAVING AVG(salary) > 30000)
SELECT salary_info.department_id    AS department_id,
       COUNT(e.id)                  as num_employees,
       CASE
           WHEN avg_salary <= 50000 THEN 'Below average'
           ELSE 'Above average' END AS salary_level
FROM salary_info
         JOIN employees E on salary_info.department_id = E.department_id
GROUP BY salary_info.department_id, salary_level
ORDER BY salary_info.department_id;

