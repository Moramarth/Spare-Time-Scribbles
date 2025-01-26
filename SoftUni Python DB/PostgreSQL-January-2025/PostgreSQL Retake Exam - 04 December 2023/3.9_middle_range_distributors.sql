SELECT D.name      AS distributor_name,
       I.name      AS ingredient_name,
       P.name      AS product_name,
       AVG(F.rate) as average_rate
FROM distributors D
         JOIN ingredients I ON D.id = I.distributor_id
         JOIN products_ingredients PING ON I.id = PING.ingredient_id
         JOIN products P ON PING.product_id = P.id
         JOIN feedbacks F ON P.id = F.product_id
GROUP BY distributor_name, ingredient_name, product_name
HAVING AVG(F.rate) BETWEEN 5 AND 8
ORDER BY distributor_name, ingredient_name, product_name;