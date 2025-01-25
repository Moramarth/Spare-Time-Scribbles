SELECT P.id                 AS photo_id,
       count(DISTINCT L.id) AS likes_count,
       count(DISTINCT C.id) AS comments_count
FROM photos P
         LEFT JOIN likes L ON P.id = L.photo_id
         LEFT JOIN comments C ON P.id = C.photo_id
GROUP BY P.id
ORDER BY likes_count DESC, comments_count DESC, photo_id;