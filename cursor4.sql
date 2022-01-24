SET SERVEROUTPUT ON

DECLARE

--DECLARANDO O TIPO DE REGISTRO

TYPE TFUNCIONARIO IS RECORD(
V_IDFUNC    HR.EMPLOYEES.EMPLOYEE_ID%TYPE,
V_NOME      HR.EMPLOYEES.FIRST_NAME%TYPE,
V_SALARIO    HR.EMPLOYEES.SALARY%TYPE);

--DECLARA��O DE VARIAVEIS

V_FUNC TFUNCIONARIO;

--DECLARA��O DE CURSORES

CURSOR CS_FUNC IS
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY
FROM HR.EMPLOYEES A
ORDER BY A.SALARY DESC;

--ABRE CURSOR SE N�O TIVER ABERTO
BEGIN 

IF NOT CS_FUNC%ISOPEN THEN
OPEN CS_FUNC;
END IF;

--EXECUTA UM LOOP
LOOP
--EXTRAI DADOS DO REGISTRO CORRENTE DO CURSOR E AVAN�A PARA O PR�XIMO
FETCH CS_FUNC INTO V_FUNC;
-- SAI DO LOOP QUANDO N�O TIVER MAIS REGISTROS PARA PROCESSAR
EXIT WHEN CS_FUNC%NOTFOUND;
-- IMPRIME DADOS EXTRAIDOS NA TELA
DBMS_OUTPUT.PUT_LINE(V_FUNC.V_IDFUNC||' - '||V_FUNC.V_NOME||' - '||V_FUNC.V_SALARIO);
END LOOP;
--FECHA CURSOR
CLOSE CS_FUNC;
END;