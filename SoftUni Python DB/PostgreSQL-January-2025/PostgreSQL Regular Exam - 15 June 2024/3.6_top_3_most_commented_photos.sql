SELECT P.id        as photo_id,
       P.capture_date,
       P.description,
       count(C.id) AS comments_count
FROM photos P
         JOIN comments C ON P.id = C.photo_id
WHERE description IS NOT NULL
GROUP BY P.id, P.capture_date, P.description
ORDER BY comments_count DESC, photo_id
LIMIT 3;