-- exemplos de union all
select employee_id, first_name, salary from hr.employees
union all
select employee_id, first_name, salary from hr.employees
order by 1;

select 'A' as campo1, 'B' as campo2 from dual
union all
select 'A' as campo1, 'B' as campo2 from dual;

-- exemplos de union
select employee_id, first_name, salary from hr.employees
union
select employee_id, first_name, salary from hr.employees
order by 1;

select 'A' as campo1, 'B' as campo2 from dual
union
select 'A' as campo1, 'B' as campo2 from dual;

--simulando erro 1
select employee_id, first_name, salary from hr.employees
union
select employee_id, first_name from hr.employees
order by 1;

--simulando erro 2
select employee_id, first_name, salary from hr.employees
union
select employee_id, salary, first_name from hr.employees
order by 1;

-- campos diferentes mas mesmo tipo
select employee_id, first_name, salary from hr.employees
union
select employee_id, last_name, salary from hr.employees
order by 1;


-- exemplo usando a tabela senso

select ano, estado
from aluno.senso
where ano = '2014'
union
select ano, estado
from aluno.senso
where ano = '2013';

--exemplo usando union all

select ano, estado
from aluno.senso
where ano = '2014'
union all
select ano, estado
from aluno.senso
where ano = '2013' 
-- exemplo com union
select ano, estado, nome_mun, populacao
from aluno.senso
where ano ='2014'
and cod_uf = '11'
union
select ano, estado, nome_mun, populacao
from aluno.senso
where ano ='2013'
and cod_uf = '11'
order by nome_mun,ano;