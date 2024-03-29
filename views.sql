--CRIANDO A VIEW

CREATE OR REPLACE VIEW V_FUNC_DEPTO
AS
SELECT  A.EMPLOYEE_ID,
        A.FIRST_NAME,
        A.SALARY,
        A.DEPARTMENT_ID,
        B.DEPARTMENT_NAME
FROM HR.EMPLOYEES A
INNER JOIN HR.DEPARTMENTS B
ON A.DEPARTMENT_ID=B.DEPARTMENT_ID;

--USANDO A VIEW
SELECT * FROM V_FUNC_DEPTO
WHERE DEPARTMENT_ID = '20';

--ALTERANDO A VIEW
CREATE OR REPLACE VIEW V_FUNC_DEPTO
AS
SELECT  A.FIRST_NAME,
        A.LAST_NAME,
        A.SALARY,
        A.DEPARTMENT_ID,
        B.DEPARTMENT_NAME
FROM HR.EMPLOYEES A
INNER JOIN HR.DEPARTMENTS B
ON A.DEPARTMENT_ID=B.DEPARTMENT_ID;

--PAISES, LOCATION, E REGIOES
CREATE OR REPLACE VIEW V_PAIS_REGIAO
AS
SELECT  A.COUNTRY_ID,
        A.COUNTRY_NAME,
        A.REGION_ID,
        B.REGION_NAME
FROM HR.COUNTRIES A
INNER JOIN HR.REGIONS B
ON A.REGION_ID=B.REGION_ID;

--USANDO A VIEW
SELECT * FROM v_pais_regiao
WHERE REGION_NAME <>'Europe';

--Reutilizando a view
Select region_name, count(*) qtd
from v_pais_regiao
group by region_name;


-- criando view
CREATE OR REPLACE VIEW V_PAIS_LOCAL
AS
SELECT  A.LOCATION_ID,
        A.CITY,
        B.COUNTRY_NAME
FROM HR.LOCATIONS A
INNER JOIN V_PAIS_REGIAO B
ON A.COUNTRY_ID=B.COUNTRY_ID;

-- UTILIZANDO A VIEW
SELECT * FROM V_PAIS_LOCAL WHERE COUNTRY_NAME<>'Italy';

-- CRIANDO VIEW COM UNION ALL
CREATE OR REPLACE VIEW V_DEPTO_UNION
AS
SELECT  A.EMPLOYEE_ID,
        A.FIRST_NAME,
        A.SALARY,
        A.DEPARTMENT_ID,
        B.DEPARTMENT_NAME
FROM HR.EMPLOYEES A
INNER JOIN HR.DEPARTMENTS B
ON A.DEPARTMENT_ID=B.DEPARTMENT_ID
WHERE A.DEPARTMENT_ID ='10'

UNION ALL

SELECT  A.EMPLOYEE_ID,
        A.FIRST_NAME,
        A.SALARY,
        A.DEPARTMENT_ID,
        B.DEPARTMENT_NAME
FROM HR.EMPLOYEES A
INNER JOIN HR.DEPARTMENTS B
ON A.DEPARTMENT_ID=B.DEPARTMENT_ID
WHERE A.DEPARTMENT_ID ='20'

UNION ALL

SELECT  A.EMPLOYEE_ID,
        A.FIRST_NAME,
        A.SALARY,
        A.DEPARTMENT_ID,
        B.DEPARTMENT_NAME
FROM HR.EMPLOYEES A
INNER JOIN HR.DEPARTMENTS B
ON A.DEPARTMENT_ID=B.DEPARTMENT_ID
WHERE A.DEPARTMENT_ID NOT IN ('10', '20');


-- UTILIZANDO A VIEW
SELECT * FROM v_depto_union;

--CRIAR VIEW DE HISTORICO DE FUNCIONARIO

--VERIFICANDO SE ALGUM FUNCIONARIO N�O TEM HISTORICO.

SELECT * FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID NOT IN(SELECT EMPLOYEE_ID FROM HR.JOB_HISTORY);

--VERIFICANDO SE ALGUM FUNCIONARIO TEM HISTORICO.
SELECT * FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID IN(SELECT EMPLOYEE_ID FROM HR.JOB_HISTORY);

-- criando a view de historico de funciorios/ usando union all
create or replace view v_hist_func
as
--selectionando informa??es do historico
select a.EMPLOYEE_ID,
       b.FIRST_NAME,
       a.START_DATE,
       a.END_DATE,
       a.JOB_ID,
       c.JOB_TITLE, 
       a.DEPARTMENT_ID,
       d.DEPARTMENT_NAME
from hr.JOB_HISTORY a
inner join hr.EMPLOYEES b
on a.EMPLOYEE_ID=b.EMPLOYEE_ID
inner join hr.JOBS c
on a.JOB_ID=c.JOB_ID
inner join HR.DEPARTMENTS d
on a.DEPARTMENT_ID=d.DEPARTMENT_ID
--where a.EMPLOYEE_ID='101'

union all

select a.EMPLOYEE_ID,
       a.FIRST_NAME,
       (select max(b.END_DATE)+1 from hr.JOB_HISTORY b
           where a.EMPLOYEE_ID=b.EMPLOYEE_ID)as START_DATE,
       sysdate END_DATE,
       a.JOB_ID,
       c.JOB_TITLE,
       a.DEPARTMENT_ID,
       d.DEPARTMENT_NAME
from hr.EMPLOYEES a
inner join hr.JOBS c
on a.JOB_ID=c.JOB_ID
inner join HR.DEPARTMENTS d
on a.DEPARTMENT_ID=d.DEPARTMENT_ID
--where a.EMPLOYEE_ID='101'
order by 1 asc,3 asc;

--consultando view
select * from v_hist_func
where EMPLOYEE_ID='101';