CREATE TABLE monasteries
(
    id             SERIAL PRIMARY KEY,
    monastery_name VARCHAR(255),
    country_code   CHAR(2)
);

INSERT INTO monasteries (monastery_name, country_code)
VALUES ('Rila Monastery "St. Ivan of Rila"', 'BG'),
       ('Bachkovo Monastery "Virgin Mary"', 'BG'),
       ('Troyan Monastery "Holy Mother''s Assumption"', 'BG'),
       ('Kopan Monastery', 'NP'),
       ('Thrangu Tashi Yangtse Monastery', 'NP'),
       ('Shechen Tennyi Dargyeling Monastery', 'NP'),
       ('Benchen Monastery', 'NP'),
       ('Southern Shaolin Monastery', 'CN'),
       ('Dabei Monastery', 'CN'),
       ('Wa Sau Toi', 'CN'),
       ('Lhunshigyia Monastery', 'CN'),
       ('Rakya Monastery', 'CN'),
       ('Monasteries of Meteora', 'GR'),
       ('The Holy Monastery of Stavronikita', 'GR'),
       ('Taung Kalat Monastery', 'MM'),
       ('Pa-Auk Forest Monastery', 'MM'),
       ('Taktsang Palphug Monastery', 'BT'),
       ('Sümela Monastery', 'TR');

ALTER TABLE countries
    ADD COLUMN three_rivers BOOLEAN DEFAULT FALSE;

UPDATE countries C
SET three_rivers = TRUE
WHERE 3 <= (SELECT COUNT(cr.river_id)
           FROM countries_rivers CR
           WHERE CR.country_code = C.country_code
           GROUP BY CR.country_code);


SELECT M.monastery_name,
       C.country_name
FROM monasteries M
         JOIN countries C ON M.country_code = C.country_code
WHERE C.three_rivers = FALSE
ORDER BY monastery_name ASC;