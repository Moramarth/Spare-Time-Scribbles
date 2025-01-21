CREATE OR REPLACE FUNCTION udf_category_productions_count(category_name VARCHAR(50))
    RETURNS VARCHAR
    LANGUAGE plpgsql
AS
$$
DECLARE
    count INT;
BEGIN
    SELECT COUNT(production_id)
    INTO count
    FROM categories C
             JOIN categories_productions CP on C.id = CP.category_id
    WHERE C.name = category_name;

    RETURN CONCAT('Found ', count, ' productions.');
END
$$;