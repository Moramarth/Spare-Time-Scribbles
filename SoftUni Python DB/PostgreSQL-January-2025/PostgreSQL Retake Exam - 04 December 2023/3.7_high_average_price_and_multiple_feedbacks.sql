SELECT P.name                 AS product_name,
       ROUND(AVG(P.price), 2) AS average_price,
       count(F.id)            AS total_feedbacks
FROM products P
         JOIN feedbacks F ON P.id = F.product_id
WHERE P.price > 15
GROUP BY product_name
HAVING count(F.id) > 1
ORDER BY total_feedbacks, average_price DESC;