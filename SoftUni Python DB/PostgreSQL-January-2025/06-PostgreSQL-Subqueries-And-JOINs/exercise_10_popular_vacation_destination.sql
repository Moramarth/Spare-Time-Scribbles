SELECT A.country,
       COUNT(B.booking_id) as booking_count
FROM bookings B
         JOIN apartments A USING (apartment_id)
WHERE B.booked_at >= '2021-05-18 07:52:09.904+03'
  AND B.booked_at < '2021-09-17 19:48:02.147+03'
GROUP BY A.country
ORDER BY booking_count DESC;
