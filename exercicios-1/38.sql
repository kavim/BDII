#38
select emp.emp_no as Numero, emp.first_name as Nome from psdb.employees AS emp where emp.emp_no in (494831, 479832, 599833) and emp.gender between 'F' and 'M';