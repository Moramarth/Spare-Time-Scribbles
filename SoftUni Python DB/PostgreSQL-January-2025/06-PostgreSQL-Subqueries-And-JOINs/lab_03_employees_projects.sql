SELECT E.employee_id,
       CONCAT(E.first_name, ' ', E.last_name) AS full_name,
       P.project_id,
       P.name                                 AS project_name
FROM employees_projects EP
         JOIN employees E on E.employee_id = EP.employee_id
         JOIN projects P on EP.project_id = P.project_id
WHERE EP.project_id = 1
;