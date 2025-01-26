CREATE OR REPLACE PROCEDURE sp_customer_country_name(
    IN customer_full_name VARCHAR(50),
    OUT country_name VARCHAR(50)
)
    LANGUAGE plpgsql
AS
$$
DECLARE
BEGIN
    SELECT INTO country_name COU.name
    FROM countries COU
             JOIN customers CUS ON COU.id = CUS.country_id
    WHERE CONCAT(CUS.first_name, ' ', CUS.last_name) = customer_full_name;
END
$$;