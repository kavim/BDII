use sakila;

select * from country;
select * from countrylanguage;

#exe1
select subq.codigo, subq.nome, subq.lengNum
#select ROUND(avg(subq.lengNum),0)
from
#subquery
(SELECT country.Name as nome, country.Code as codigo, COUNT(sakila.countrylanguage.Language) as lengNum
FROM sakila.country
INNER JOIN sakila.countrylanguage where countrylanguage.CountryCode = country.Code
group by country.Code) as subq
#fimSubquery
group by subq.codigo
having subq.lengNum > (select avg(subq.lengNum)
from
#subquery
(SELECT COUNT(sakila.countrylanguage.Language) as lengNum
FROM sakila.country
INNER JOIN sakila.countrylanguage where countrylanguage.CountryCode = country.Code
group by country.Code
) as subq
#fimSubquery
)
;
#fimexe1

