#45
# - - - - -  primeira forma - - - - -  
SELECT
pais.Name,
pais.Continent,
pais.Region,
pais.Population,
cidade.Name,
cidade.District,
cidade.Population,
lingua.Language
FROM sakila.country pais, sakila.city cidade, sakila.countrylanguage lingua
where pais.Continent like 'Europe' and lingua.IsOfficial like 'T';
# - - - - -  segunda forma - - - - -  BEM MAIS PERFORMATICO/CERTO
SELECT  
	country.name, 	
    country.Continent, 
    country.Region, 
    country.Population,
	city.name city_name, 
    city.District, 
    city.Population, 
    countrylanguage.Language
FROM country
INNER JOIN city 
ON city.CountryCode = country.code
INNER JOIN countrylanguage
ON countrylanguage.CountryCode = country.code 
WHERE country.Continent = 'Europe'
AND countrylanguage.IsOfficial= 'T';