SELECT P.id,
       P.title,
       PI.duration,
       ROUND(PI.budget, 1)               AS budget,
       TO_CHAR(PI.release_date, 'MM-YY') AS release_date
FROM productions P
         JOIN productions_info PI ON P.production_info_id = PI.id
WHERE PI.release_date BETWEEN '2023-01-01' AND '2024-12-31'
  AND PI.budget > 1500000.00
ORDER BY budget ASC, duration DESC, P.id ASC
LIMIT 3;
