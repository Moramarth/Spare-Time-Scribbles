-- Solution with LIKE statement
SELECT title
FROM books
WHERE title LIKE 'The%'
ORDER BY id;

-- Solution with SUBSTRING function
SELECT title
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;