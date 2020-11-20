SELECT * FROM sakila.country;

SELECT 
c.Name, c.Population
FROM sakila.country as c
where c.Population > (select avg(c.Population) from sakila.country as c)
;