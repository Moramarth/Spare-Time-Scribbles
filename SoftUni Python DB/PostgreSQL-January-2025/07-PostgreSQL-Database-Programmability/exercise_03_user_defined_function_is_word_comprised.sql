CREATE OR REPLACE FUNCTION fn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
    RETURNS BOOLEAN
    LANGUAGE plpgsql
AS
$$
DECLARE
    letters_lowercase VARCHAR(50);
    word_lowercase    VARCHAR(50);
    i                 INT;
    letter            CHAR(1);
    can_be_composed   BOOLEAN := TRUE;
BEGIN
    letters_lowercase := LOWER(set_of_letters);
    word_lowercase := LOWER(word);

    FOR i IN 1..LENGTH(word_lowercase)
        LOOP
            letter := SUBSTRING(word_lowercase, i, 1);
            IF POSITION(letter IN letters_lowercase) = 0 THEN
                can_be_composed := FALSE;
                EXIT;
            ELSE
                letters_lowercase := REGEXP_REPLACE(letters_lowercase, letter, '', 1, 1);
            END IF;

        END LOOP;
    RETURN can_be_composed;
END;
$$;