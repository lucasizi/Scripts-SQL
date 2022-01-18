SET SERVEROUTPUT ON

-- DECLARA��O DE VARIAVEL
DECLARE

V_IDFUNC HR.EMPLOYEES.EMPLOYEE_ID%TYPE;
V_NOME HR.EMPLOYEES.FIRST_NAME%TYPE;
V_SALARIO HR.EMPLOYEES.SALARY%TYPE;

-- DECLARA��O DE CURSORES

CURSOR CS_TOP_10 IS
    SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY
    FROM HR.EMPLOYEES A
    ORDER BY SALARY DESC;

BEGIN

-- ABRE CURSOR SE AINDA N�O TIVER ABERTO
IF NOT CS_TOP_10%ISOPEN THEN
OPEN CS_TOP_10;
END IF;

-- EXECUTA UM LOOP COM 10 CICLOS.
FOR I IN 1..10 LOOP

-- EXTRAI DADOS O REGISTRO CORRENTE DO CUJRSOR E AVAN�AR PARA O PROXIMO
FETCH CS_TOP_10 INTO V_IDFUNC, V_NOME, V_SALARIO;
-- IMPRIME DADOS EXTRAIDOS NA TELA
DBMS_OUTPUT.PUT_LINE(I||' - '||V_IDFUNC||' - '||V_NOME||' - '||V_SALARIO);
-- FECHA CURSOR
END LOOP;

END;
