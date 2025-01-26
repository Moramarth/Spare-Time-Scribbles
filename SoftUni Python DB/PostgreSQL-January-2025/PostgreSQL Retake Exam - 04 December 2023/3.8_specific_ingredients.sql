SELECT I.name AS ingredient_name,
       P.name AS product_name,
       D.name AS distributor_name
FROM ingredients I
         LEFT JOIN products_ingredients PING ON I.id = PING.ingredient_id
         LEFT JOIN products P ON PING.product_id = P.id
         LEFT JOIN distributors D ON I.distributor_id = D.id
WHERE I.name ILIKE '%mustard%'
  AND D.country_id = 16
ORDER BY product_name;