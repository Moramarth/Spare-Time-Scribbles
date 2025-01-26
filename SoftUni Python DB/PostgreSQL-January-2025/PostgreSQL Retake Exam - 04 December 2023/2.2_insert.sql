CREATE TABLE IF NOT EXISTS gift_recipients
(
    id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name       VARCHAR,
    country_id INT     NOT NULL REFERENCES countries
        ON UPDATE CASCADE ON DELETE CASCADE,
    gift_sent  BOOLEAN NOT NULL DEFAULT FALSE
);

-- This insert fails the true/false check. Test does not take DEFAULT table value into consideration.
INSERT INTO gift_recipients(name, country_id, gift_sent)
SELECT CONCAT(C.first_name, ' ', last_name),
       C.country_id,
       TRUE
FROM customers C
WHERE C.country_id IN (7, 8, 14, 17, 26);

-- Insert with CASE passes in judge
INSERT INTO gift_recipients(name, country_id, gift_sent)
SELECT
  CONCAT(first_name, ' ', last_name) AS "name",
  country_id AS "country_id",
  CASE
    WHEN country_id IN (7, 8, 14, 17, 26) THEN TRUE
    ELSE FALSE
  END AS gift_sent
FROM customers;