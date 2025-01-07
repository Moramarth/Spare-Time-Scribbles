SELECT P.name,
       P.start_date,
       P.end_date
FROM projects P
WHERE P.start_date >= '2016-06-01 07:00:00'
  AND P.end_date < '2023-06-04 00:00:00'
ORDER BY P.start_date ASC;