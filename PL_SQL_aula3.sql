-- Um registro � uma cole��o de valores individuais que est�o relacionados de alguma forma. Com frequencia os registros s�o usados para representar uma linha de uma tabela.
-- e assim o relacionamento se baseia no fato de que todos os valores v�m da mesma linha.
-- Cada campo de um registro � exclusivo e tem seus pr�prios valores. Um registro com um todo n�o tem valor.

declare
-- defini��o de tipos
type Tfuncionario is record(
nome varchar2(40),
depto varchar2(20),
salario number(10,2)
);

-- declara��o de vari�veis
vFunc TFuncionario;

begin

-- Exemplo

SET SERVEROUTPUT ON

DECLARE

-- DEFINI��O DE TIPOS
TYPE TFUNCIONARIO IS RECORD(
NOME    VARCHAR2(40),
DEPTO    VARCHAR2(20),
SALARIO NUMBER(10,2)
);

-- DECLARA��O DE VARIAVEIS

VFUNC TFUNCIONARIO;
BEGIN
-- ATRIUIR VALOR PARA O REGISTRO VPRODUTO
SELECT A.FIRST_NAME, A.DEPARTMENT_ID, A.SALARY
INTO VFUNC.NOME, VFUNC.DEPTO, VFUNC.SALARIO
FROM HR.EMPLOYEES A
WHERE A.EMPLOYEE_ID=102;

-- IMPRIMIR NA TELA OS DADOS RECUPERADOS

DBMS_OUTPUT.PUT_LINE('NOME DO PRODUTO: '||vfunc.nome||chr(10)||'Depto: '||vfunc.depto||chr(10)||'Salario: '||to_char(vfunc.salario));

end;
