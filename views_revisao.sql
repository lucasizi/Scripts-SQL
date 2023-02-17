-- criar view que traga as informações dos funcionarios, salario, depto
create or replace view v_func_depto
as
select  a.first_name, a.salary, a.department_id, b.department_name
from hr.employees a
inner join hr.departments b
on a.department_id=b.department_id;


-- usando a view

select * from v_func_depto
where department_id = '20';


-- atualizando a view

create or replace view v_func_depto
as
select a.first_name nome_funcionario, a.salary salario, a.department_id id_departamento, b.department_name nome_departamento
from hr.employees a
inner join hr.departments b
on a.department_id=b.department_id;

-- utilzando a view
select * from v_func_depto;

-- paises, localização e região
create or replace view v_pais_local
as
select A.COUNTRY_ID, A.COUNTRY_NAME, A.REGION_ID, B.REGION_NAME
FROM HR.COUNTRIES A
INNER JOIN HR.REGIONS B
ON A.REGION_ID=B.REGION_ID;

-- USANDO A VIEW

SELECT * FROM v_pais_local WHERE REGION_NAME = 'Europe';

-- reutilizando
select region_name, count(*) qtd
from v_pais_local
group by region_name;