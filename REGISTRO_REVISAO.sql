-- EXIBE DADOS DE UM FUNCIONARIO DE TABELA 'EMPLOYEES', SCHEMA 'HR' --
-- & COMERCIAL NA VARIAVEL PARA PL/SQL PEDIR UM VALOR PARA A VARIAVEL
SET SERVEROUTPUT ON

DECLARE
--DEFINI��O DE TIPOS
TYPE TFUNCIONARIO IS RECORD(
NOME VARCHAR2(40),
DEPTO VARCHAR2(20),
SALARIO NUMBER(10,2)
);
--DECLARA��O DE VARIAVEIS
VFUNC TFUNCIONARIO;
BEGIN
SELECT A.FIRST_NAME, A.DEPARTMENT_ID, A.SALARY
INTO VFUNC.NOME, VFUNC.DEPTO, VFUNC.SALARIO
FROM HR.EMPLOYEES A
WHERE A.EMPLOYEE_ID=102;

-- IMPRIMIR NA TELA OS DADOS RECUPERADOS
DBMS_OUTPUT.PUT_LINE('NOME DO FUNCIONARIO: '||VFUNC.NOME||CHR(10)||'DEPTO: '||VFUNC.DEPTO||CHR(10)||'SALARIO: '||VFUNC.SALARIO);
END;
/