CREATE TABLE DIV_SATISFACAO (
EMPRESA VARCHAR2(30),
ID_FUNC INT,
GENERO VARCHAR2(30),
COR VARCHAR2(30),
SEXO VARCHAR2(30),
SATISFACAO VARCHAR2(30),
SATIS_NUMERO INT);

DROP TABLE DIV_SATISFACAO;

CREATE TABLE DIV_DEMO (
EMPRESA VARCHAR2(30),
ID_FUNC INT,
GENERO VARCHAR2(30),
COR VARCHAR2(30),
SEXO VARCHAR2(30));

SELECT * FROM DIV_DEMO;

--Inner join
select A.EMPRESA, A.ID_FUNC, A.GENERO, A.COR, A.SEXO, B.ANO,b.satisfacao, b.satis_numero
from DIV_DEMO a
inner join div_satisfacao B
    on a.id_FUNC = b.id_func
    WHERE  B.ANO = '01/05/10'
    ORDER BY ID_FUNC;