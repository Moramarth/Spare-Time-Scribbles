CREATE VIEW view_continents_countries_currencies_details AS
SELECT CONCAT(C.continent_name, ': ', C.continent_code)                       AS continent_details,
       CONCAT_WS(' - ', CS.country_name, CS.capital, CS.area_in_sq_km, 'km2') AS country_information,
       CONCAT(CUR.description, ' (', CUR.currency_code, ')')                  AS currencies
FROM continents C
    JOIN countries CS on C.continent_code = CS.continent_code
        JOIN currencies CUR on CS.currency_code = CUR.currency_code
ORDER BY country_information, currencies;