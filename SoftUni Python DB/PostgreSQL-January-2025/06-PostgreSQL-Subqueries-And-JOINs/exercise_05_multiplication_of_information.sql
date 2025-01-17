SELECT B.booking_id AS booking_id,
       C.first_name AS customer_name
FROM bookings B
         CROSS JOIN customers C
ORDER BY customer_name;