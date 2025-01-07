CREATE VIEW view_addresses AS
SELECT E.first_name || ' ' || E.last_name AS full_name,
       E.department_id,
       A.number || ' ' || A.street AS address
FROM employees E
JOIN addresses A on A.id = E.address_id
ORDER BY address;