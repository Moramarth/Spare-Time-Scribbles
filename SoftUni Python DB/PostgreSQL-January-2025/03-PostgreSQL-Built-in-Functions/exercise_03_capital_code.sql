-- Column creation
ALTER TABLE countries
    ADD COLUMN capital_code CHAR(2);
-- Column data population
UPDATE countries
SET capital_code = SUBSTRING(capital, 1, 2);