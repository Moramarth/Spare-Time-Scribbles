CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name VARCHAR)
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE employees E
    SET salary = salary * 1.05
    WHERE E.department_id =
          (SELECT department_id
           FROM departments
           WHERE name = department_name);
END;
$$;