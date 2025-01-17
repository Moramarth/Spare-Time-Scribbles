SELECT B.booking_id,
       B.apartment_id,
       C.companion_full_name
FROM bookings B
         JOIN customers C USING (customer_id)
WHERE B.apartment_id IS NULL
;