SELECT CONCAT(first_name, ' ', last_name)        AS full_name,
       CONCAT(LOWER(SUBSTRING(first_name, 1, 1)),
              SUBSTRING(last_name, LENGTH(last_name) - 1, 2),
              LENGTH(last_name), '@sm-cast.com') AS email,
       awards
FROM actors
WHERE id NOT IN (SELECT DISTINCT actor_id from productions_actors)
ORDER BY awards DESC, id ASC
