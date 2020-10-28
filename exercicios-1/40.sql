#40
SELECT
*
FROM sakila.city cidade
INNER JOIN 
sakila.countrylanguage 
ON sakila.countrylanguage.CountryCode = cidade.CountryCode
where sakila.countrylanguage.Language like 'Dutch';