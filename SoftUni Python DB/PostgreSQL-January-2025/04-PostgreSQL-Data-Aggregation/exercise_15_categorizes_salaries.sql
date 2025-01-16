WITH salary_info AS (SELECT job_title,
                            AVG(salary) as avg_salary
                     FROM employees
                     GROUP BY job_title)
SELECT job_title,
       CASE
           WHEN avg_salary < 27500 THEN 'Need Improvement'
           WHEN avg_salary <= 45800 THEN 'Medium'
           ELSE 'Good' END AS category
FROM salary_info
ORDER BY category ASC, job_title