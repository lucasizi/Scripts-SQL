SET SERVEROUTPUT ON
DECLARE
-- Declara??o de cursores
CURSOR cs_func(pMenor NUMBER, pMaior NUMBER) is
SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
WHERE a.SALARY BETWEEN pMenor AND pMaior order by a.SALARY desc ;
BEGIN
-- Abre cursor para Funcionarios com Salario entre 1000 e 9999
dbms_output.put_line('Funcionarios com m?dia entre 1000 e 9999');
FOR rFunc in cs_func(1000,9999) LOOP
/* Imprime na tela os Funcionarios com Salario no intervalo de 1000 e 9999
*/
dbms_output.put_line(rFunc.EMPLOYEE_ID||' - '||rFunc.FIRST_NAME||' - '||rFunc.SALARY);
END LOOP;
-- Abre cursor para Funcionarios com Salario entre 10000 e 19000
dbms_output.put_line('Funcionarios com m?dia entre 10000 e 19000');
FOR rFunc in cs_func(10000,19000) LOOP
/* Imprime na tela os Funcionarios com Salario entre 10000 e 19000
Est? no intervalo de 10000 e 19000
*/
dbms_output.put_line(rFunc.EMPLOYEE_ID||' - '||rFunc.FIRST_NAME||' - '||rFunc.SALARY);
END LOOP;

END;
/

DECLARE
-- Declara??o de cursores
CURSOR cs_func(pMenor NUMBER, pMaior NUMBER) is
SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
WHERE a.SALARY BETWEEN pMenor AND pMaior order by a.SALARY desc ;
BEGIN
-- Abre cursor para Funcionarios com Salario entre 1000 e 9999
dbms_output.put_line('Funcionarios com m?dia entre 1000 e 9999');
FOR rFunc in cs_func(10000,9999) LOOP
/* Imprime na tela os Funcionarios com Salario no intervalo de 1000 e 9999
*/
dbms_output.put_line(rFunc.EMPLOYEE_ID||' - '||rFunc.FIRST_NAME||' - '||rFunc.SALARY);
END LOOP;
-- Abre cursor para Funcionarios com Salario entre 10000 e 19000
dbms_output.put_line('Funcionarios com m?dia entre 10000 e 19000');
FOR rFunc in cs_func(10000,19000) LOOP
/* Imprime na tela os Funcionarios com Salario entre 10000 e 19000
Est? no intervalo de 10000 e 19000
*/
dbms_output.put_line(rFunc.EMPLOYEE_ID||' - '||rFunc.FIRST_NAME||' - '||rFunc.SALARY);
END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('N?O TEM REGISTROS');
     WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/