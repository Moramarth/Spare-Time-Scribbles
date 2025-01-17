SELECT B.booking_id,
       DATE(B.starts_at)                  AS starts_at,
       B.apartment_id,
       CONCAT(first_name, ' ', last_name) AS customer_name
FROM bookings B
         RIGHT JOIN customers c on C.customer_id = B.customer_id
ORDER BY customer_name ASC
LIMIT 10;