SELECT COUNT(booking_id) as count
FROM bookings B
         JOIN customers C USING (customer_id)
WHERE C.last_name = 'Hahn'
;