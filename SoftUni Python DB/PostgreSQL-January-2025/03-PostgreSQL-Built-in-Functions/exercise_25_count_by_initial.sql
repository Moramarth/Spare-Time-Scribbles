-- Add new column
ALTER TABLE users
    ADD COLUMN initials CHAR(2);

-- Set values for all rows
UPDATE users
SET initials = SUBSTRING(first_name, 1, 2);

-- Get results
SELECT initials,
       COUNT(initials) AS user_count
FROM users
GROUP BY initials
ORDER BY user_count DESC, initials ASC;