-- Solution variant 1:
-- Actually changing the titles in the DB records
UPDATE books
SET title = '***' || SUBSTRING(title, 4)
WHERE title LIKE 'The%'
;
SELECT title
FROM books
WHERE title LIKE '***%'
ORDER BY id;

-- Solution variant 2:
-- Only change the title for the returned result. DB records stay the same
SELECT REPLACE(title, 'The', '***')
           AS "Title"
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;