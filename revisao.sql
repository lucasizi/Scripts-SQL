SELECT COD_UF, ESTADO, COUNT(COD_MUN) QTD_cidades, SUM(POPULACAO)
FROM SENSO
WHERE ANO = '2014'
GROUP BY COD_UF, ESTADO
HAVING SUM(POPULACAO) > 5000000
ORDER BY 4 DESC;

SELECT COD_UF, ESTADO, COUNT(COD_MUN) QTD_cidades, SUM(POPULACAO)
FROM SENSO
WHERE ANO = '2014'
GROUP BY COD_UF, ESTADO
HAVING SUM(POPULACAO) < 5000000
ORDER BY 4 DESC;

--Desafio; saber quantos porcento da população de cada estado, refere-se a população brasileira.
SELECT COD_UF, ESTADO, SUM(POPULACAO) AS POPULACAO, (SUM(POPULACAO)*100)/(select sum(populacao) from senso where ano = '2014') as Porcentagem_populacao
FROM SENSO
WHERE ANO = '2014'
GROUP BY COD_UF, ESTADO
ORDER BY 3 DESC;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
ORDER BY 1;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
UNION
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
ORDER BY 1;

drop table matricula;
drop table disciplina;
drop table alunos;


SELECT * FROM ALUNOS;

create table alunos
(id_aluno int not null,
 nome varchar(20) not null,
 primary key(id_aluno)
 );


-- criando a tabela disciplina
create table disciplina
(
 id_disciplina int not null,
 nome_disc varchar2(20),
 primary key(id_disciplina)
 );


-- criando a tabela matricula
	CREATE TABLE MATRICULA
	 (
	 ID_ALUNO INT NOT NULL,
	 ID_DISCIPLINA INT NOT NULL,
	 PERIODO VARCHAR2(10), 
	 PRIMARY KEY (ID_ALUNO,ID_DISCIPLINA), 
	 FOREIGN KEY (ID_ALUNO) REFERENCES ALUNOS(ID_ALUNO), 
	 FOREIGN KEY (ID_DISCIPLINA) REFERENCES DISCIPLINA(ID_DISCIPLINA)
	);


 -- INSERINDO REGISTRO ALUNOS
  insert into alunos (id_aluno,nome) values (1,'Joao');
  insert into alunos (id_aluno,nome) values (2,'Maria');
  insert into alunos (id_aluno,nome) values (3,'Pedro');
  insert into alunos (id_aluno,nome) values (4,'Tiago');
  insert into alunos (id_aluno,nome) values (5,'Henrique');
  
--  insert into alunos (id_aluno,nome) values (5,'Henrique');


-- evidencia do insert
  SELECT * FROM alunos;


  -- INSERINDO REGISTRO DISCIPLINAS
  insert into disciplina (id_disciplina,nome_disc) values  (1,'Fisica');
  insert into disciplina (id_disciplina,nome_disc) values  (2,'Quimica');
  insert into disciplina (id_disciplina,nome_disc) values  (3,'Matematica');
  insert into disciplina (id_disciplina,nome_disc) values  (4,'Banco de Dados');
  insert into disciplina (id_disciplina,nome_disc) values  (5,'Programacao');

-- evidencia insert
  SELECT * FROM disciplina;

  -- INSERINDO MATRICULAS DE ALUNOS
  insert into matricula values ('1','1','Noturno');
  insert into matricula values ('1','2','Vespertino');
  insert into matricula values ('1','3','Matutino');

  insert into matricula values ('2','3','Noturno');
  insert into matricula values ('2','4','Noturno');

  insert into matricula values ('3','1','Noturno');
  insert into matricula values ('3','3','Noturno');
  insert into matricula values ('3','4','Noturno');

  insert into matricula values ('5','1','Matutino');
  insert into matricula values ('5','2','Vespertino');
  insert into matricula values ('5','4','Noturno');

-- evidencia
 select * from matricula;
 
  -- ALUNO CODIG 4 NAO TEM MATRICULA
  -- DISCIPLINA 5 NAO TEM ALUNOS


  -- INNER JOIN
SELECT A.ID_ALUNO, A.NOME, B.NOME_DISC, C.PERIODO
FROM ALUNOS A
INNER JOIN MATRICULA C
    ON A.ID_ALUNO=C.ID_ALUNO
INNER JOIN DISCIPLINA B
    ON C.ID_DISCIPLINA=B.ID_DISCIPLINA
ORDER BY a.id_aluno;


--LEFT JOIN
SELECT A.NOME, B.PERIODO, C.NOME_DISC
FROM ALUNOS A
LEFT JOIN MATRICULA B
    ON A.ID_ALUNO=B.ID_ALUNO
LEFT JOIN DISCIPLINA C
    ON B.ID_DISCIPLINA=C.ID_DISCIPLINA;
    
    
  -- LEFT JOIN
	SELECT a.nome,c.nome_disc,b.periodo
	FROM alunos a
	LEFT JOIN matricula b 
		ON a.id_aluno=b.id_aluno
	LEFT JOIN disciplina c 
		ON b.id_disciplina=c.id_disciplina;
  

 -- RIGHT JOIN
	SELECT a.nome,c.nome_disc,b.periodo
	FROM alunos a
	RIGHT JOIN matricula b 
		ON a.id_aluno=b.id_aluno
	RIGHT JOIN disciplina c 
		ON b.id_disciplina=c.id_disciplina;
		

 -- full JOIN
	SELECT a.nome,c.nome_disc,b.periodo
	FROM alunos a
	full JOIN matricula b 
		ON a.id_aluno=b.id_aluno
	full JOIN disciplina c 
		ON b.id_disciplina=c.id_disciplina;


-- INNER JOIN

select * from hr.employees;
select * from HR.DEPARTMENTS;
select * from hr.jobs;

SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME, C.JOB_TITLE
FROM HR.EMPLOYEES A
INNER JOIN HR.DEPARTMENTS B
    ON A.DEPARTMENT_ID=B.DEPARTMENT_ID
INNER JOIN HR.JOBS C
    ON A.JOB_ID=C.JOB_ID
ORDER BY 1;



SELECT a.employee_id,a.first_name,b.department_name,c.job_title 
 FROM HR.EMPLOYEES a
 inner join HR.DEPARTMENTS b
  on a.department_id=b.department_id
 inner join HR.JOBS c
 on a.job_id=c.job_id
 order by 1;


-- LEFT JOIN

SELECT a.employee_id,a.first_name,b.department_name,c.job_title 
 FROM HR.EMPLOYEES a
 left join HR.DEPARTMENTS b
  on a.department_id=b.department_id
 left join HR.JOBS c
 on a.job_id=c.job_id
 order by 1;


-- RIGHT JOIN
SELECT a.employee_id,a.first_name,b.department_name,c.job_title 
 FROM HR.EMPLOYEES a
 right join HR.DEPARTMENTS b
  on a.department_id=b.department_id
 right join HR.JOBS c
 on a.job_id=c.job_id
 order by 1;

--subquerry
SELECT * FROM HR.EMPLOYEES A
WHERE A.EMPLOYEE_ID IN (SELECT B.EMPLOYEE_ID FROM HR.JOB_HISTORY B);


SELECT * FROM HR.EMPLOYEES A
WHERE A.MANAGER_ID ='100'
AND A.EMPLOYEE_ID IN (SELECT B.EMPLOYEE_ID FROM HR.JOB_HISTORY B);


SELECT * FROM  HR.EMPLOYEES A
WHERE A.EMPLOYEE_ID IN (SELECT B.EMPLOYEE_ID FROM HR.JOB_HISTORY B
                        WHERE B.DEPARTMENT_ID='50');
                        
SELECT * FROM HR.EMPLOYEES A
WHERE A.EMPLOYEE_ID NOT IN (SELECT B.EMPLOYEE_ID FROM HR.JOB_HISTORY B WHERE B.DEPARTMENT_ID='50');

SELECT  A.EMPLOYEE_ID,
        A.FIRST_NAME,
        A.JOB_ID,
        (SELECT B.JOB_TITLE FROM HR.JOBS B WHERE A.JOB_ID=B.JOB_ID) AS CARGO
FROM HR.EMPLOYEES A;


SELECT  A.EMPLOYEE_ID,
        A.FIRST_NAME,
        A.DEPARTMENT_ID,
        (SELECT B.DEPARTMENT_NAME FROM HR.DEPARTMENTS B WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID) AS NOME_DEPARTAMENTO
FROM HR.EMPLOYEES A;
        
        
SELECT  A.DEPARTMENT_ID,
        A.MANAGER_ID,
        A.DEPARTMENT_NAME,
        (SELECT B.FIRST_NAME FROM HR.EMPLOYEES B WHERE A.MANAGER_ID=B.EMPLOYEE_ID) NOME_GERENTE
FROM HR.DEPARTMENTS A;

-- SOMA SALARIO POR DEPARTAMENTO
SELECT  A.DEPARTMENT_ID,
        A.DEPARTMENT_NAME,
        (SELECT SUM(B.SALARY) FROM HR.EMPLOYEES B WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID) SALARIO_DEPARTAMENTO
FROM HR.DEPARTMENTS A;

SELECT  A.DEPARTMENT_ID,
        A.DEPARTMENT_NAME,
        (SELECT SUM(B.SALARY) FROM HR.EMPLOYEES B WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID) SALARIO_DEPARTAMENTO,
        (SELECT COUNT(*) FROM HR.EMPLOYEES B WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID) QTD_FUNCIONARIOS
FROM HR.DEPARTMENTS A;

SELECT  A.DEPARTMENT_ID,
        A.DEPARTMENT_NAME,
        (SELECT SUM(B.SALARY) FROM HR.EMPLOYEES B WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID) SALARIO_DEPARTAMENTO,
        (SELECT COUNT(*) FROM HR.EMPLOYEES B WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID) QTD_FUNCIONARIOS,
        (SELECT SUM(B.SALARY) FROM HR.EMPLOYEES B WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID) / (SELECT COUNT(*) FROM HR.EMPLOYEES B WHERE A.DEPARTMENT_ID=B.DEPARTMENT_ID) AS MEDIA
FROM HR.DEPARTMENTS A
GROUP BY a.department_id, a.department_name
ORDER BY 3;



-- FUNÇÕES

SELECT * FROM SENSO;

SELECT AVG(POPULACAO) FROM SENSO WHERE ANO ='2014';

SELECT ESTADO, AVG(POPULACAO) FROM SENSO WHERE ANO ='2014' group by ESTADO ORDER BY 2 DESC;

SELECT  A.COD_UF,
        A.ESTADO,
        B.SIGLA_UF,
        AVG(A.POPULACAO) MEDIA
FROM SENSO A
INNER JOIN UF B
ON A.COD_UF=B.COD_UF
WHERE ANO = '2014'
GROUP BY A.COD_UF, A.ESTADO, B.SIGLA_UF
ORDER BY 4 DESC;


SELECT A.REGIAO, AVG(A.POPULACAO)
FROM SENSO A
WHERE ANO = '2014'
GROUP BY A.REGIAO
ORDER BY 2 DESC;

SELECT  A.ESTADO,
        MIN(A.POPULACAO)
FROM SENSO A
WHERE ANO ='2014'
GROUP BY A.ESTADO
ORDER BY 2 DESC;

SELECT ANO, COUNT(*) AS QTD_CIDADES
FROM SENSO
GROUP BY ANO;

SELECT COUNT(DISTINCT COD_UF) FROM SENSO;

SELECT COUNT(COD_UF) FROM SENSO;

SELECT A.ESTADO, COUNT(*) FROM SENSO A
WHERE ANO ='2014'
GROUP BY A.ESTADO
ORDER BY 2 DESC;


SELECT  AVG(A.POPULACAO) MEDIA_POP,
        MIN(A.POPULACAO) MINIMO_POP,
        MAX(A.POPULACAO) MAXIMO_POP,
        SUM(A.POPULACAO) TOTAL_POP,
        COUNT(*) QTD_CIDADES
FROM SENSO A
WHERE ANO ='2014';

-- APRESENTAR O NOME DA CIDADE COM MAIOR POLUCAO DE CADA ESTADOS

SELECT  A.ESTADO,
        A.NOME_MUN,
        A.POPULACAO
FROM
(SELECT B.ESTADO, MAX(B.POPULACAO) AS POPULACAO FROM SENSO B
WHERE ANO ='2014'
GROUP BY B.ESTADO
) B
JOIN SENSO A
ON A.ESTADO=B.ESTADO
AND A.POPULACAO=B.POPULACAO
WHERE A.ANO='2014'
ORDER BY A.POPULACAO DESC;



SELECT  A.NOME_MUN,
        A.POPULACAO AS SENSO_2010,
        B.POPULACAO AS SENSO_2014,
        (100/A.POPULACAO)*(B.POPULACAO)-100 AS PERCENTUAL
FROM SENSO A
INNER JOIN SENSO B
ON A.COD_MUN=B.COD_MUN
WHERE A.ANO='2010'
AND B.ANO='2014';

SELECT  A.ESTADO,
        SUM(A.POPULACAO) AS SENSO_2010,
        SUM(B.POPULACAO) AS SENSO_2014,
        (100/SUM(A.POPULACAO))*(SUM(B.POPULACAO))-100 AS PERCENTUAL
FROM SENSO A
INNER JOIN SENSO B
ON A.COD_MUN=B.COD_MUN
WHERE A.ANO='2010'
AND B.ANO='2014'
GROUP BY A.ESTADO;

-- FUNÇÕES DE CADEIRA DE CARACTERES
SELECT NULL FROM SYS.DUAL;


-- exemplo com lower
select  a.department_name nome_depto,
        lower(a.department_name) nome_depto_l,
        lower('Curso SQL')
        from hr.departments a;
        
select  a.department_name nome_depto,
        initcap(upper(a.department_name)) nome_depto_1,
        initcap('curso SQL')
        from hr.departments a;
        
-- exemplos com concat
select  a.first_name,
        a.last_name,
        concat(a.first_name, a.last_name) nome_completo
from hr.employees a;

select  a.first_name,
        a.last_name,
        a.first_name||' '||a.last_name nome_completo,
        a.first_name||' '||a.last_name||' '||a.salary texto
        from hr.employees a;
        
select  a.employee_id,
        lpad(a.employee_id,10,'0') id_lpad,
        a.first_name
        from hr.employees a;
        
select  substr('oracle',2,4) from sys.dual;


select  a.first_name,
        a.last_name,
        substr(a.first_name,1,1) ini_1,
        substr(a.last_name,1,1) ini_2,
        concat(substr(a.first_name,1,1),substr(a.last_name,1,1)) ini_3
        from hr.employees a;
        
select  a.first_name,
        substr(a.first_name,1,3) parte1,
        substr(a.first_name,4,10) parte2
        from hr.employees a;
        
select  a.job_title,
        instr(a.job_title,'r') posicao
        from hr.jobs a;
        
select  a.job_title,
        instr(a.job_title,'es') posicao
        from hr.jobs a
        order by 2 desc;
        
select  a.job_title,
        instr(a.job_title,'t',12) posicao
        from hr.jobs a;
        
select a.job_title,
        ltrim(a.job_title,'AFPS') posicao
        from hr.jobs a;
        
select '        andre' com_espaco,
ltrim('     andre   ',' ') com_espaco
from dual;


select  a.job_title,
        length(a.job_title) tamanho
        from hr.jobs a;
        
select  a.job_title,
        translate(a.job_title, 'S', 'x') traducao
        from hr.jobs a;
        
select  a.job_title,
        replace(a.job_title,'Manager','Gerente')
        from hr.jobs a;
        
select row_number() over (order by a.salary desc) sequencia,
a.first_name,
a.salary,
NTILE(4) over (order by a.salary desc) faixa
from hr.employees a
order by a.salary desc;


SELECT A.FIRST_NAME, A.COMMISSION_PCT,
CASE WHEN A.COMMISSION_PCT IS NOT NULL THEN 'VENDEDOR'
ELSE 'INTERNO' END HIERARQUIA
FROM HR.EMPLOYEES A;

SELECT A.FIRST_NAME, A.COMMISSION_PCT,
CASE WHEN A.COMMISSION_PCT IS NOT NULL THEN 'VENDEDOR'
ELSE 'INTERNO' END HIERARQUIA
FROM HR.EMPLOYEES A;

SELECT A.FIRST_NAME, A.SALARY, A.SALARY *-1 SALARIO_NEGATIVO, ABS(A.SALARY*-1) SALARIO_ABS
FROM HR.EMPLOYEES A;

SET SERVEROUTPUT ON

DECLARE
     v_str VARCHAR2(100);
     v_frase VARCHAR2(100);
    BEGIN
     -- atribuindo valor
     v_frase:='Utilidades Oracle';
      --generate encoded value
      --1 PARAM BUF VALOR
      --2 PARAM ENCODE_CHARSET SAO TIPO WE8ISO8859P1 - AL32UTF8
      --3 PARAM ENCODING - BASE64
      v_str := utl_encode.text_encode(v_frase,'WE8ISO8859P1', UTL_ENCODE.BASE64);
      --imprimi valor
      dbms_output.put_line(v_str);
      
      --take the encoded value and decode it
      v_str := utl_encode.text_decode(v_str,'WE8ISO8859P1', UTL_ENCODE.BASE64);
      --imprimi valor
     dbms_output.put_line(v_str);
     
   END;

-- criando historico de funcionarios usando union all
create or replace view v_hist_func
as
-- selecionando as informações do historico
select a.employee_id,
       b.first_name,
       a.start_date,
       a.end_date,
       a.job_id,
       c.job_title,
       a.department_id,
       d.department_name
from hr.job_history a
inner join hr.employees b
on a.employee_id=b.employee_id
inner join hr.jobs c
on a.job_id=c.job_id
inner join hr.departments d
on b.manager_id=d.manager_id;


CREATE GLOBAL TEMPORARY TABLE MINHA_TEMP (
ID NUMBER,
NOME VARCHAR2(30)
)
ON COMMIT DELETE ROWS;

INSERT INTO MINHA_TEMP VALUES (1, 'TESTE1');
INSERT INTO MINHA_TEMP VALUES (2, 'TESTE2');
INSERT INTO MINHA_TEMP VALUES (3, 'TESTE3');

SELECT COUNT(*) FROM MINHA_TEMP;

SELECT * FROM MINHA_TEMP;

COMMIT;


CREATE GLOBAL TEMPORARY TABLE EMPREGADOS_TEMP (
EMPLOYEE_ID NUMBER(6, 0) NOT NULL,
FIRST_NAME VARCHAR2(20 BYTE),
LAST_NAME VARCHAR2(25 BYTE) NOT NULL,
COMMISSION_PCT NUMBER(2, 2)
)
ON COMMIT DELETE ROWS;

INSERT INTO EMPREGADOS_TEMP
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.LAST_NAME, A.COMMISSION_PCT
FROM HR.EMPLOYEES A;

SELECT COUNT(*) FROM EMPREGADOS_TEMP;

DROP TABLE EMPREGADOS_TEMP;
DROP TABLE TEST_FOR;