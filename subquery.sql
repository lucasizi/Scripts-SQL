 -- subquery
 
 -- descobrir todos atores que fizeram filmes com os seguintes parametros
 -- film_id = 1 com title = ACADEMY DINOSAUR
 -- conhecer a estrutura das tabelas alvo

 select * from HR.employees;
 select * from HR.JOB_HISTORY;
 select * from HR.DEPARTMENTS;
 select * from HR.JOBS;
 
 -- EXEMPLO DE SUBSELECT 1 OPERADOR IN
SELECT * FROM HR.employees A
WHERE a.employee_id IN (SELECT B.EMPLOYEE_ID FROM HR.JOB_HISTORY B);

 -- EXEMPLO DE SUBSELECT 2 OPERADOR IN
select * from hr.employees a
where a.manager_id = '100'
and a.employee_id in (select b.employee_id from HR.job_history B);

 -- EXEMPLO DE SUBSELECT 3 OPERADOR IN
select * from hr.employees a
where a.employee_id in (select b.employee_id from HR.job_history b
where b.department_id = '50');
--obs
select * from HR.job_history b where b.department_id = '50';
--obs
select * from HR.employees where employee_id=122;

 -- EXEMPLO DE SUBSELECT 1 OPERADOR NOT IN
select * from hr.employees a
where a.manager_id = '100'
and a.employee_id not in (select b.employee_id from HR.job_history B);

-- subselect retornando coluna
select b.employee_id,
    b.first_name,
        b.job_id,
            (select a.job_title from HR.jobs a where a.job_id=b.job_id)
                as cargo from HR.employees b;
                
-- subselect retornando coluna    

select a.department_id,
    a.department_name,
        a.manager_id,
            (select b.first_name from HR.employees b where a.manager_id=b.employee_id) as nome_gerente
                from HR.departments a;


-- soma de todos salarios por departamento

select a.department_id, a.department_name,
(select sum(b.salary) from HR.employees b where a.department_id= b.department_id)
as soma
from HR.departments a
order by soma;

--subselect com valor agregado soma
-- soma de todos salarios por departamento com quantidade de funcionarios
select a.department_id, a.department_name,
(select sum(b.salary) from HR.employees b where a.department_id=b.department_id) as soma_salario,
(select count(*) from HR.employees b where a.department_id=b.department_id) as qtd_funcionarios
from HR.departments a;

-- soma de todos salarios por departamento com quantidade de funcionarios e media de salario
select a.department_id, a.department_name,
(select sum(b.salary) from HR.employees b where a.department_id=b.department_id) as soma_salario,
(select count(*) from HR.employees b where a.department_id=b.department_id) as qtd_funcionario,
(select sum(b.salary) from HR.employees b where a.department_id=b.department_id) /
(select count(*) from HR.employees b where a.department_id=b.department_id) as media_salario
from HR.departments a
group by a.department_id, a.department_name
order by soma_salario;