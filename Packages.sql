-- Criando especificacao do package
-- criando a package com 2 fun��es e uma procedure

CREATE OR REPLACE PACKAGE PKG_FUNC AS

    -- PROCEDURE SIMULA SALARIO AUMENTO
    PROCEDURE PROC_SIMULA(N_FUNC_ID NUMBER);
    -- GET NOME COMPLETO DO FUNCIONARIO
    FUNCTION GET_NOMECOMPLETO(N_FUNC_ID NUMBER) RETURN VARCHAR2;
    --GET SALARIO DO FUNCIONARIO
    FUNCTION GET_SALARIO(N_FUNC_ID NUMBER) RETURN NUMBER;
END PKG_FUNC;

-- CRIANDO O BODY
-- PACKAGE PKG_FUNC BODY
CREATE OR REPLACE PACKAGE BODY PKG_FUNC AS
-- GET FUNCIONARIO NOME COMPLETO
FUNCTION GET_NOMECOMPLETO(N_FUNC_ID NUMBER) RETURN VARCHAR2 IS
V_NOMECOMPLETO VARCHAR2(50);
BEGIN
    SELECT A.FIRST_NAME || ' , ' || A.LAST_NAME
    INTO V_NOMECOMPLETO
    FROM HR.EMPLOYEES A
    WHERE A.EMPLOYEE_ID = N_FUNC_ID;
    
    RETURN V_NOMECOMPLETO;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RETURN NULL;
    WHEN TOO_MANY_ROWS THEN
    RETURN NULL;
    END;
    -- END GET_NOMECOMPLETO
    
    -- GET SALARIO
    FUNCTION GET_SALARIO(N_FUNC_ID NUMBER) RETURN NUMBER IS
    BEGIN
    SELECT A.SALARY
    INTO N_SALARIO
    FROM HR.EMPLOYEES A
    WHERE A.EMPLOYEE_ID=N_FUNC_ID;
    
    RETURN N_SALARIO;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RETURN NULL;
    WHEN TOO_MANY_ROWS THEN
    RETURN NULL;
    END;
-- END GET_SALARIO

-- PROCEDURE
    PROCEDURE PROC_SIMULA(N_FUNC_ID NUMBER) IS
    V_SAL_NOVO NUMBER(8,2);
    BEGIN
        SELECT A.SALARY*1.10 INTO V_SAL_NOVO FROM HR.EMPLOYEES A
        WHERE A.EMPLOYEE_ID=N_FUNC_ID;
        DBMS_OUTPUT.PUT_LINE('O NOVO SALARIO �->> '||VAL_SAL_NOVO);
    END;
    -- FIM PROCEDURE
END PKG_FUNC;