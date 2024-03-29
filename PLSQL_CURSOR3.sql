SET SERVEROUTPUT ON
-- DECLARA��O DE VARIAVEIS
DECLARE
V_ID HR.EMPLOYEES.EMPLOYEE_ID%TYPE;
V_NOME HR.EMPLOYEES.FIRST_NAME%TYPE;
V_SALARIO HR.EMPLOYEES.SALARY%TYPE;
V_POSICAO INT DEFAULT 0;

-- DECLARA��O DE CURSORES
CURSOR CS_SALARIO IS
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY
FROM HR.EMPLOYEES A
ORDER BY A.SALARY DESC;

BEGIN
-- ABRE O CURSOR SE AINDA N�O ESTIVER ABERTO
IF NOT CS_SALARIO%ISOPEN THEN
OPEN CS_SALARIO;
END IF;
-- EXECUTA UM LOOP
LOOP
    -- EXTRAI DADOS O REGISTRO CORRENTE DO CURSOR E AVAN�A PARA O PROXIMO
    FETCH CS_SALARIO INTO V_ID, V_NOME, V_SALARIO;
    -- SAI DO LOOP QUANDO N�O HOUVER MAIS ESPA�O PARA PREENCHER
    EXIT WHEN CS_SALARIO%NOTFOUND;
    V_POSICAO := V_POSICAO + 1;
    DBMS_OUTPUT.PUT_LINE(V_POSICAO||' - '||V_ID||' - '||V_NOME||' - '||V_SALARIO);
END LOOP;

END;