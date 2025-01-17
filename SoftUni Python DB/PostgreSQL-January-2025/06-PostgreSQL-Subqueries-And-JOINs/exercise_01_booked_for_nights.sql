SELECT CONCAT(A.address, ' ', A.address_2) AS apartment_address,
       B.booked_for                        AS nights
FROM apartments A
         JOIN bookings B on B.booking_id = A.booking_id
ORDER BY A.apartment_id;