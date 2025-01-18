CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
    RETURNS INT
    LANGUAGE plpgsql
AS
$$
DECLARE
    count INT;
BEGIN
    SELECT COUNT(*)
    INTO count
    FROM employees
             JOIN addresses USING (address_id)
             JOIN towns USING (town_id)
    WHERE towns.name = town_name;
    RETURN count;
END;
$$;