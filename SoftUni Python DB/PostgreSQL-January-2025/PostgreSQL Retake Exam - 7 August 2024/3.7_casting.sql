SELECT CONCAT(first_name, ' ', last_name)        AS full_name,
       CONCAT(LOWER(LEFT(first_name, 1)),
              RIGHT(last_name, 2),
              LENGTH(last_name), '@sm-cast.com') AS email,
       awards
FROM actors
WHERE id NOT IN (SELECT DISTINCT actor_id from productions_actors)
ORDER BY awards DESC, id ASC
