use sakila;
SELECT * FROM sakila.city;

SELECT ci.Name, ci.CountryCode 
FROM sakila.city as ci
where ci.CountryCode in 
(select co.Code from country as co where co.Code like 'URY');