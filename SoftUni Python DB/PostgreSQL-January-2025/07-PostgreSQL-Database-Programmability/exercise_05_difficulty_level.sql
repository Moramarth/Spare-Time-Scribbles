CREATE OR REPLACE FUNCTION fn_difficulty_level(level INT)
    RETURNS VARCHAR
    LANGUAGE plpgsql
AS
$$
DECLARE
    difficulty VARCHAR;
BEGIN
    IF level <= 40 THEN
        difficulty := 'Normal Difficulty';
    ELSEIF level <= 60 THEN
        difficulty := 'Nightmare Difficulty';
    ELSE
        difficulty := 'Hell Difficulty';
    END IF;
    RETURN difficulty;
END
$$;