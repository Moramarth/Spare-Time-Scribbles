SELECT A.name,
       A.country,
       DATE(B.booked_at) AS booked_at
FROM apartments A
        LEFT JOIN bookings B on B.booking_id = A.booking_id
LIMIT 10;