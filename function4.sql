--1) criar tabela.
CREATE TABLE NOTAS(
ID_ALUNO    INT,
NOTA1   NUMBER,
PESO1   NUMBER,
NOTA2   NUMBER,
PESO2   NUMBER,
MEDIA   NUMBER);

--2) INSERINDO DADOS
INSERT INTO NOTAS VALUES(1,8,4,6,6,NULL);
INSERT INTO NOTAS VALUES(2,10,4,10,6,NULL);
INSERT INTO NOTAS VALUES(3,5,4,5,6,NULL);

--SELECIONANDO.
SELECT * FROM NOTAS;

--ATUALIZANDO COM A FUN��O DE MEDIA DAS NOTAS, FEITA ANTERIORMENTE.
UPDATE NOTAS SET MEDIA=FN_MEDIA_POND(NOTA1, PESO1, NOTA2, PESO2)
WHERE 1=1;

--SELECIONANDO PARA VER AS MUDAN�AS.
SELECT * FROM NOTAS;