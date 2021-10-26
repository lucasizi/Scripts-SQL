create table funcionarios
(
id int not null,
nome varchar2(50) not null,
salario decimal(10,2),
setor varchar2(30),
primary key (id)
);

CREATE SEQUENCE ID_FUNC
START WITH 1
INCREMENT BY 1
NOCACHE;

-- EXEMPLO SELECT * = TUDO
SELECT * FROM FUNCIONARIOS;

-- SELECT COM CAMPOS SELECIONADOS
SELECT ID, NOME, SALARIO, SETOR AS DEPTO
FROM funcionarios;

-- DML INSERT
INSERT INTO FUNCIONARIOS (ID,NOME,SALARIO,SETOR) VALUES
(ID_FUNC.NEXTVAL,'Pedro',1000,'');

INSERT INTO FUNCIONARIOS (ID,NOME,SALARIO,SETOR) VALUES
(ID_FUNC.NEXTVAL,'Cleiton',1000,'');

INSERT INTO FUNCIONARIOS (ID,NOME,SALARIO,SETOR) VALUES
(ID_FUNC.NEXTVAL,'Joao',1000,'');

INSERT INTO FUNCIONARIOS (ID,NOME,SALARIO,SETOR) VALUES
(ID_FUNC.NEXTVAL,'Alexandre',1000,'');

INSERT INTO FUNCIONARIOS (ID,NOME,SALARIO,SETOR) VALUES
(ID_FUNC.NEXTVAL,'Jose',1000,'');


--DML UPDATE
update funcionarios set salario=1500
where id = '1';

update funcionarios set salario=1080
where id = '2';

update funcionarios set salario=salario*1.5
where id='2';

update funcionarios set salario=salario*1.5, setor='TI'
where id <> '1';

--DML DELETE
delete from funcionarios
where id='1';

--DML SELECT EVIDENCI DA EXCLUSAO
select * from funcionarios;