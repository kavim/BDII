#1
select * from psdb.employees;

#2
select emp_no, first_name from psdb.employees;

#3
select distinct first_name from psdb.employees;

#4
select distinct first_name from psdb.employees order by first_name;

#5
select distinct first_name from psdb.employees order by first_name desc;

#6
select distinct first_name from psdb.employees order by first_name asc;

#7
select distinct first_name, last_name from psdb.employees;

#8
select distinct first_name, last_name from psdb.employees order by first_name, last_name;

#9
select distinct first_name, last_name from psdb.employees order by first_name, last_name desc;

#10
select distinct first_name, last_name from psdb.employees order by first_name, last_name asc;

#11
select * from psdb.employees limit 100;

#12 
select * from psdb.employees order by emp_no limit 100;

#13
select * from psdb.employees order by emp_no asc limit 100;

#14
select * from psdb.employees order by emp_no desc limit 100;

#15
select * from psdb.employees where first_name like 'Basil';

#16
select * from psdb.employees where first_name like 'Basil' and gender like 'M';

#17
select * from psdb.employees where first_name like 'Basil' and gender <> 'M';

#18
select * from psdb.employees where first_name like 'Basil' and last_name like 'Strooper' and gender like 'M';

#19
select * from psdb.employees where first_name like 'Crist%';

#20
select * from psdb.employees where first_name like '%zette';

#21
select * from psdb.employees where first_name like '%zette' and gender like 'M';

#22
select * from psdb.employees where first_name like '%arvi%';

#23
select * from psdb.employees where first_name like '%arvi%' and gender like 'M';

#24
select * from psdb.employees where first_name like 'Yinghua' or first_name  like 'Elvis';

#25
select * from psdb.employees where first_name like 'Yinghua' or first_name  like 'Elvis' and gender like 'M';

#26
select * from psdb.employees where emp_no = 14037;

#27
select first_name, last_name from psdb.employees where emp_no = 14037;

#28
select first_name, last_name from psdb.employees where emp_no in (15037, 14039, 16039);

#29
select first_name, last_name from psdb.employees where emp_no between 14037 and 14047;

#30
select first_name, last_name from psdb.employees where emp_no >= 14037 and emp_no <= 14047;

#31
select * from psdb.employees where first_name like 'Crist%' and emp_no > 485733; 

#32
select * from psdb.employees where first_name like 'Crist%' and emp_no >= 485733;

#33
select * from psdb.employees where first_name like 'Crist%' and emp_no < 37126;

#34
select * from psdb.employees where first_name like 'Crist%' and emp_no <= 37126;

#35
select * from psdb.employees where emp_no in (494831, 479832, 599833) and gender between 'F' and 'M';

#36
select * from psdb.employees where emp_no in (494831, 479832, 599833) and gender between 'F' and 'M' limit 10;

#37
select * from psdb.employees AS emp where emp.emp_no in (494831, 479832, 599833) and emp.gender between 'F' and 'M';

#38
select emp.emp_no as Numero, emp.first_name as Nome from psdb.employees AS emp where emp.emp_no in (494831, 479832, 599833) and emp.gender between 'F' and 'M';

use sakila;

#39
select * from sakila.countrylanguage where Language like 'Dutch';

#40
SELECT
*
FROM sakila.city cidade
LEFT JOIN 
sakila.countrylanguage 
ON sakila.countrylanguage.CountryCode = cidade.CountryCode
where sakila.countrylanguage.Language like 'Dutch';





