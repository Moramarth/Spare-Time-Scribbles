WITH likes_info AS
         (SELECT P.id        as photo_id,
                 count(L.id) AS likes_count
          FROM photos P
                   LEFT JOIN likes L ON P.id = L.photo_id
          GROUP BY P.id)
SELECT photo_id,
       likes_count,
       count(C.id) AS comments_count
FROM likes_info
         LEFT JOIN comments C USING (photo_id)
GROUP BY photo_id, likes_count
ORDER BY likes_count DESC, comments_count DESC, photo_id