-- Quando declaramos uma variavel PL/SQL para manipular valores que estão em tabelas,
-- temos que garantir que esta varialvel seja do mesmo tipo e tenha a mesma precisão do campo que será referenciado.

-- Se isto não acontecer, um erro PL/SQL ocorrerá durante a execução;
-- Para evitar isto, podemos utilizar o atributo %TYPE para declarar a variavel de acordo com a declaração de outra variável ou coluna de uma tabela.

-- O atributo %TYPE é mais utilizado quando o valor armazenado na variavel for um valor derivado de uma coluna de uma tabela do banco.

DECLARE
    v_id_temp HR.EMPLOYEE.EMPLOYEE_d%TYPE; -- CAMPO
    V_EMP HR.EMPLOYEE%ROWTYPE; -- TABELA TODA    
BEGIN
NULL;
END;

-- Exibe dados de um funcionario da tabela 'employees', schema 'hr'
SET SERVEROUTPUT ON
DECLARE
    V_ID HR.EMPLOYEES.EMPLOYEE_ID%TYPE;
    V_NAME HR.EMPLOYEES.FIRST_NAME%TYPE;
    V_SALARY HR.EMPLOYEES.SALARY%TYPE;

BEGIN
    select a.employee_id, a.first_name, a.salary
    into v_id, v_name, v_salary
    from hr.employees a
    where a.employee_id=&emp_id;
    
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ID: '||TO_CHAR(V_ID));
    DBMS_OUTPUT.PUT_LINE('NOME: '||TO_CHAR(V_NAME));
    DBMS_OUTPUT.PUT_LINE('SALARIO: '||TO_CHAR(V_SALARY));

END;

-- EXEMPLO ROWTYPE
SET SERVEROUTPUT ON
DECLARE

V_EMP HR.EMPLOYEES%ROWTYPE;

BEGIN
    SELECT * INTO V_EMP
    FROM HR.EMPLOYEES
    WHERE EMPLOYEE_ID=&EMP_ID;
    
DBMS_OUTPUT.PUT_LINE('----------------------------------------');
DBMS_OUTPUT.PUT_LINE('ID: '||V_EMP.EMPLOYEE_ID);
DBMS_OUTPUT.PUT_LINE('NOME: '||V_EMP.FIRST_NAME);
DBMS_OUTPUT.PUT_LINE('SOBRENOME: '||V_EMP.LAST_NAME);

END;

-- EXEMPLO COM EXCEPTION

SET SERVEROUTPUT ON
DECLARE

V_EMP HR.EMPLOYEES%ROWTYPE;

BEGIN
    SELECT * INTO V_EMP
    FROM HR.EMPLOYEES
    WHERE EMPLOYEE_ID=&EMP_ID;
    
DBMS_OUTPUT.PUT_LINE('----------------------------------------');
DBMS_OUTPUT.PUT_LINE('ID: '||V_EMP.EMPLOYEE_ID);
DBMS_OUTPUT.PUT_LINE('NOME: '||V_EMP.FIRST_NAME);
DBMS_OUTPUT.PUT_LINE('SOBRENOME: '||V_EMP.LAST_NAME);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('MATRICULA NÃO EXISTE');
        
END;
    