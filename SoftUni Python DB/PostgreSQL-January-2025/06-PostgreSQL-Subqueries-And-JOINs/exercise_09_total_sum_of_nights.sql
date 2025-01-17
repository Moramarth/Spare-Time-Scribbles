SELECT A.name,
       SUM(B.booked_for)
FROM apartments A
         JOIN bookings B ON A.apartment_id = B.apartment_id
GROUP BY A.name
ORDER BY A.name ASC
;