#42
SELECT
*
FROM sakila.country pais
INNER JOIN 
sakila.countrylanguage 
ON sakila.countrylanguage.CountryCode = pais.Code
where sakila.countrylanguage.Language like 'Spanish' and sakila.countrylanguage.Percentage > 96.00 and sakila.countrylanguage.IsOfficial like 'T';