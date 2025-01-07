SELECT EP.employee_id,
       EP.project_id
FROM employees_projects EP
WHERE EP.employee_id IN (200, 250)
  AND EP.project_id NOT IN (50, 100);