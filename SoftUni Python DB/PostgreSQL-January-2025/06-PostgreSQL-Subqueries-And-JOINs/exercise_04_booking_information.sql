SELECT B.booking_id                           AS booking_id,
       A.name                                 AS appartment_owner,
       A.apartment_id                         AS apartment_di,
       CONCAT(C.first_name, ' ', C.last_name) AS customer_name
FROM apartments A
         FULL JOIN bookings B on B.booking_id = A.booking_id
         FULL JOIN customers C on C.customer_id = B.customer_id
ORDER BY booking_id ASC, appartment_owner ASC, customer_name ASC;