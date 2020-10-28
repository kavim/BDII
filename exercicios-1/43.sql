#43
# - - - - -  primeira forma - - - - -  
SELECT
*
FROM sakila.city
where sakila.city.CountryCode like 'BRA' and sakila.city.Population > 1000000;
# - - - - -  segunda forma - - - - -  mais performatico
SELECT sakila.city.* 
FROM sakila.city 
INNER JOIN sakila.country
ON sakila.country.code = sakila.city.CountryCode
WHERE sakila.country.Code = 'BRA'
AND sakila.city.Population > 1000000;