SELECT product_id,
       rate,
       description,
       customer_id,
       age,
       gender
FROM feedbacks F
         JOIN customers C ON F.customer_id = C.id
WHERE rate < 5.0
  AND C.gender = 'F'
  AND C.age > 30
ORDER BY product_id DESC;