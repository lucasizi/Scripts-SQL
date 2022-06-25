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