
use sakila;

#de fato no brasil tem 5 linguas, mas falto libras hahaha
SELECT country.Name, sakila.countrylanguage.Language
FROM sakila.country
INNER JOIN sakila.countrylanguage where countrylanguage.CountryCode = country.Code and country.Name like 'Brazil'
;

SELECT * FROM sakila.country;

SELECT * FROM sakila.countrylanguage;

SELECT * FROM sakila.country where country.Continent like 'Europe' order by country.SurfaceArea DESC; 

#1
SELECT COUNT(*) AS NumberOfCountries FROM sakila.country; 

#2
SELECT country.Continent, COUNT(country.Name) AS NumberOfCountries 
FROM sakila.country 
group by country.Continent; 

#3
SELECT country.Continent, COUNT(country.Name) AS NumberOfCountries 
FROM sakila.country 
group by country.Continent
order by country.Continent;
 
#4
SELECT country.Continent, COUNT(country.Name) AS NumberOfCountries 
FROM sakila.country 
group by country.Continent
HAVING COUNT(*) > 50; 

#5
SELECT country.SurfaceArea
FROM sakila.country
order by country.SurfaceArea DESC limit 1;

#6
SELECT country.SurfaceArea
FROM sakila.country
order by country.SurfaceArea limit 1;

#7
SELECT AVG(country.SurfaceArea) as Media FROM country;

#8
SELECT AVG(country.SurfaceArea) as Media FROM country where country.Continent like 'Europe';

#9
SELECT country.Continent, AVG(country.SurfaceArea) AS Media
FROM sakila.country 
group by country.Continent; 

#10
SELECT country.Continent, AVG(country.SurfaceArea) as media
FROM sakila.country 
group by country.Continent
order by media desc; 

#11
SELECT country.Continent, MAX(country.SurfaceArea) as omaior
FROM sakila.country 
group by country.Continent;

#12
SELECT country.Continent, MAX(country.SurfaceArea) as omaior
FROM sakila.country 
group by country.Continent
order by omaior DESC;

#13
SELECT country.Name, COUNT(sakila.countrylanguage.Language)
FROM sakila.country
INNER JOIN sakila.countrylanguage where countrylanguage.CountryCode = country.Code
group by country.Name
;

#14
SELECT country.Name, COUNT(sakila.countrylanguage.Language) as lengNum
FROM sakila.country
INNER JOIN sakila.countrylanguage where countrylanguage.CountryCode = country.Code
group by country.Name
having lengNum > 10
;

#15
SELECT country.Name, COUNT(sakila.city.ID) as numeroDeCidades
FROM sakila.country
INNER JOIN sakila.city where sakila.city.CountryCode = country.Code
group by country.Name
;