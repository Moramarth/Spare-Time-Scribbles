SELECT CONCAT(id::varchar, ' ', username) AS id_username,
       email
FROM accounts A
         JOIN accounts_photos AP ON A.id = AP.account_id
WHERE AP.account_id = AP.photo_id
ORDER BY A.id;