CREATE VIEW continent_currency_usage AS

WITH currency_count AS (SELECT continent_code,
                               currency_code,
                               COUNT(currency_code) AS currency_usage
                        FROM countries
                        GROUP BY continent_code, currency_code
                        HAVING COUNT(currency_code) > 1),

     rank_currencies AS (SELECT continent_code,
                                currency_code,
                                currency_usage,
                                dense_rank() OVER (PARTITION BY continent_code ORDER BY currency_usage DESC) AS rank
                         FROM currency_count)
SELECT continent_code,
       currency_code,
       currency_usage
FROM rank_currencies
WHERE rank = 1
ORDER BY currency_usage DESC
;