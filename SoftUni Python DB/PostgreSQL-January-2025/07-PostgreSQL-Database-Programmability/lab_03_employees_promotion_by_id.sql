CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF (SELECT employee_id FROM employees where employee_id = id) IS NULL THEN
        RETURN;
    END IF;
    UPDATE employees
    SET salary = salary * 1.05
    WHERE employee_id = id;
END;
$$;