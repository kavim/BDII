insert into departments
values ('d99','Compras internas');

select dep.dept_name, emp.first_name, emp.last_name
FROM employees as emp

INNER JOIN  dept_emp
on emp.emp_no = dept_emp.emp_no

RIGHT JOIN  departments as dep
on dept_emp.dept_no = dep.dept_no;

#Ok, acabamos de criar uma linha na tabela "departments"... Ou seja, esse departamente não uma possui relação com outras tabelas e deve retorno null para os dados do usuario.
#Seria preciso criar um novo registro na tabela "dept_emp" para vincular usuario e departamento... no caso o novo departamento "Compras internas"
