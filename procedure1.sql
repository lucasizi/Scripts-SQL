CREATE OR REPLACE PROCEDURE DETALHE_DOS_FUNCIONARIOS
IS
    CURSOR EMP_CUR
    IS
        SELECT FIRST_NAME, LAST_NAME, SALARY FROM HR.EMPLOYEES;
    EMP_REC EMP_CUR%ROWTYPE;
BEGIN
    FOR EMP_REC IN EMP_CUR
    LOOP
        DBMS_OUTPUT.PUT_LINE('Nome do funcionario: '||emp_rec.first_name);
        DBMS_OUTPUT.PUT_LINE('Sobrenome do funcionario: '||emp_rec.first_name);
        DBMS_OUTPUT.PUT_LINE('Salario do funcionario: '||emp_rec.first_name);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
    END LOOP;
END;

-- EXECUTANDO A PROCEDURE