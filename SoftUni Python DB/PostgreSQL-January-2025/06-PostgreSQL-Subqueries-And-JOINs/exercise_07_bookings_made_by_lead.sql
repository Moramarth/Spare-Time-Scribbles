SELECT B.apartment_id,
       B.booked_for,
       C.first_name,
       C.country
FROM bookings B
         JOIN customers C USING (customer_id)
WHERE C.job_type = 'Lead'
;