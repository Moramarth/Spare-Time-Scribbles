-- Solution with CASE hardcoded for every single group
SELECT CASE
           WHEN age BETWEEN 11 AND 20 THEN '[11-20]'
           WHEN age BETWEEN 21 AND 30 THEN '[21-30]'
           WHEN age BETWEEN 31 AND 40 THEN '[31-40]'
           WHEN age BETWEEN 41 AND 50 THEN '[41-50]'
           WHEN age BETWEEN 51 AND 60 THEN '[51-60]'
           WHEN age > 60 THEN '[61+]'
           END AS age_group,
       COUNT(id)
FROM wizard_deposits
GROUP BY age_group
ORDER BY age_group ASC;

-- Solution with dynamic creation of the labels for age group
SELECT CASE
           WHEN age > 60 THEN '[61+]'
           -- width bucket will return values from 1 to 5 e.g. in what range the current age value belongs
           ELSE '[' || (width_bucket(age, 11, 61, 5) * 10 + 1) || '-' || (width_bucket(age, 11, 61, 5) * 10 + 10) || ']'
           END AS age_group,
       COUNT(id)
FROM wizard_deposits
-- For good measure we don`t include ages under the first label min value
WHERE age > 10
GROUP BY age_group
ORDER BY age_group ASC;