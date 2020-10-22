#42
SELECT
*
FROM sakila.country pais
LEFT JOIN 
sakila.countrylanguage 
ON sakila.countrylanguage.CountryCode = pais.Code
where sakila.countrylanguage.Language like 'Spanish' and sakila.countrylanguage.Percentage > 96.00;