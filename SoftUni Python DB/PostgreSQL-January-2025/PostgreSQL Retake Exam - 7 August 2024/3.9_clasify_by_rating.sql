SELECT P.title,
       CASE
           WHEN PI.rating <= 3.50 THEN 'poor'
           WHEN PI.rating <= 8.00 THEN 'good'
           ELSE 'excellent'
           END            AS rating,
       CASE
           WHEN PI.has_subtitles = TRUE THEN 'Bulgarian'
           ELSE 'N/A'
           END            AS subtitles,
       COUNT(PA.actor_id) AS actors_count
FROM productions P
         JOIN productions_info PI
              on P.production_info_id = PI.id
         JOIN productions_actors PA on P.id = PA.production_id
GROUP BY P.title, PI.rating, subtitles
ORDER BY rating ASC, actors_count DESC, P.title ASC;