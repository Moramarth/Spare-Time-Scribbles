-- Calculate the initial string
WITH initial_string AS (
    SELECT CONCAT(mountain_range, ' ', peak_name) AS mountain_information
FROM mountains M
    JOIN peaks P ON M.id = P.mountain_id
)
-- Select string value and it`s length and bit length
SELECT
    mountain_information,
    LENGTH(mountain_information) AS characters_length,
    BIT_LENGTH(mountain_information) AS bits_of_a_tring
FROM initial_string;