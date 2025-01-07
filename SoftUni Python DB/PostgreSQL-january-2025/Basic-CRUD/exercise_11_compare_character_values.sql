SELECT P.name,
       P.start_date
FROM projects P
WHERE P.name IN ('Mountain', 'Road', 'Touring')
LIMIT 20;