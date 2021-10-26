--exemplo de ascii 
SELECT Ascii('ab') test
FROM sys.dual;

SELECT Ascii('a')
FROM sys.dual;

SELECT Ascii('b')
FROM sys.dual;

-- exemplo com lower 
SELECT a.department_name nome_depto
	,Lower(a.department_name) nome_depto_1
	,Lower('Curso SQL')
FROM hr.departments a;

--exemplo com upper 
SELECT a.department_name nome_depto
	,Upper(a.department_name) nome_depto_1
	,Upper('curso SQL') curso
FROM hr.departments a;

--initcap
SELECT a.department_name nome_depto
	,initcap(upper(a.department_name)) nome_depto_1
	,initcap('curso SQL')
FROM hr.departments a;

-- exemplo com concat
SELECT a.first_name, a.last_name, CONCAT(a.first_name,a.last_name) nome_completo
FROM hr.employees a;

--outra opção para concatenar
SELECT a.first_name
	,a.last_name
	,a.first_name || ' ' || a.last_name
FROM hr.employees a;

--lpad
SELECT a.employee_id
	,lpad(a.employee_id, 10, '0') id_lpad
	,a.first_name
FROM hr.employees a;

--rpad
SELECT rpad(a.employee_id, 5, 'x') r_pad
	,a.first_name
FROM hr.employees a;

--substrg
select substr('oracle',2,4) from sys.dual;

-- primeiro nome, ultimo nome, primeira letra do primeiro nome, primeira letra do ultimo nome, as duas iniciais juntas
select  a.first_name,
            a.last_name,
            SUBSTR(a.first_name,1,1) int_1,
            SUBSTR(a.last_name,1,1) int_2,
            CONCAT(SUBSTR(a.first_name,1,1),SUBSTR(a.last_name,1,1)) texto3
from HR.EMPLOYEES a;

-- função instr
SELECT a.job_title, ltrim(a.job_title,'a') posicao
FROM HR.JOBS a;
