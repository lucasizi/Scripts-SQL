SET SERVEROUTPUT ON

DECLARE
    V_ID HR.EMPLOYEES.EMPLOYEE_ID%TYPE;
    V_NAME HR.EMPLOYEES.FIRST_NAME%TYPE;
    V_SALARY HR.EMPLOYEES.SALARY%TYPE;

BEGIN
    SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY
    INTO V_ID, V_NAME, V_SALARY
    FROM HR.EMPLOYEES A
    WHERE A.EMPLOYEE_ID = &EMP_ID;

    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('ID: '||TO_CHAR(V_ID));
    DBMS_OUTPUT.PUT_LINE('NOME: '||TO_CHAR(V_NAME));
    DBMS_OUTPUT.PUT_LINE('SALARIO :'||TO_CHAR(V_SALARY));
    
END;

/

-- EX2
SET SERVEROUTPUT ON

DECLARE
    V_EMP HR.EMPLOYEES%ROWTYPE;
BEGIN
    SELECT * INTO V_EMP
    FROM HR.EMPLOYEES
    WHERE EMPLOYEE_ID=&EMP_ID;
    
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('ID: '||TO_CHAR(V_EMP.EMPLOYEE_ID));
    DBMS_OUTPUT.PUT_LINE('NOME: '||TO_CHAR(V_EMP.FIRST_NAME));
    DBMS_OUTPUT.PUT_LINE('SALARIO :'||TO_CHAR(V_EMP.SALARY));
    
END;

/

-- EX3
SET SERVEROUTPUT ON

DECLARE
    V_EMP HR.EMPLOYEES%ROWTYPE;
BEGIN
    SELECT * INTO V_EMP
    FROM HR.EMPLOYEES
    WHERE EMPLOYEE_ID=&EMP_ID;
    
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('ID: '||TO_CHAR(V_EMP.EMPLOYEE_ID));
    DBMS_OUTPUT.PUT_LINE('NOME: '||TO_CHAR(V_EMP.FIRST_NAME));
    DBMS_OUTPUT.PUT_LINE('SALARIO :'||TO_CHAR(V_EMP.SALARY));
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('MATRICULA N�O EXISTE');
END;