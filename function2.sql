-- sem parametros, ou seja, com o funcionario j� definido, sem parametro para definirmos depois.
CREATE OR REPLACE FUNCTION FN_NOME
    RETURN VARCHAR IS
    V_NOME VARCHAR(20);
BEGIN
    SELECT A.FIRST_NAME
    INTO V_NOME
    FROM HR.EMPLOYEES A
    WHERE A.EMPLOYEE_ID = 100;
    
    RETURN V_NOME;
END;

-- SELECIONAR A FUN��O
SELECT FN_NOME FROM DUAL;

-- COM PARAMETROS
CREATE OR REPLACE FUNCTION FN_NOME2(P_ID IN NUMBER)
    RETURN VARCHAR IS
    V_NOME VARCHAR(15);
BEGIN
    SELECT A.FIRST_NAME
    INTO V_NOME
    FROM HR.EMPLOYEES A
    WHERE A.EMPLOYEE_ID=P_ID;
    
    RETURN V_NOME;
END;

-- SELECIONAR A FUN��O
SELECT FN_NOME2(101) AS FUNCIONARIO FROM DUAL;

-- FUNCTION SIMULA AUMENTO
CREATE OR REPLACE FUNCTION FN_AUMENTO(P_PCT IN NUMBER,P_ID IN NUMBER)
    RETURN      NUMBER IS
    V_SAL_NOVO  NUMBER(20);
BEGIN
    SELECT((A.SALARY/100)*P_PCT)+A.SALARY
    INTO    V_SAL_NOVO
    FROM    HR.EMPLOYEES A
    WHERE   A.EMPLOYEE_ID=P_ID;
    
    RETURN V_SAL_NOVO;
END;

-- SELECIONAR A FUN��O
SELECT A.FIRST_NAME, A.SALARY AS SALARIO_ANTIGO, FN_AUMENTO(10,A.EMPLOYEE_ID) AS SALARIO_NOVO
FROM HR.EMPLOYEES A;