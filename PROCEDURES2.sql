-- CRIANDO A PROCEDURE
CREATE OR REPLACE PROCEDURE PRC_FUNC
IS
    CURSOR FUN_CURSOR
    IS
        SELECT A.DEPARTMENT_ID, B.DEPARTMENT_NAME, SUM(SALARY) SALARIO FROM HR.EMPLOYEES A
        INNER JOIN HR.DEPARTMENTS B
        ON A.DEPARTMENT_ID=B.DEPARTMENT_ID
        GROUP BY A.DEPARTMENT_ID, B.DEPARTMENT_NAME
        ORDER BY SALARIO DESC;
    -- DECLARANDO O CURSOR NAS VARIAVEIS
    FUN_REC FUN_CURSOR%ROWTYPE;
-- INICIO DO CODIGO QUE NO CASO SER� O LOOP
BEGIN
    -- DECLARA��O INICIAL DO LOOP
    FOR FUN_REC IN FUN_CURSOR
    LOOP
        DBMS_OUTPUT.PUT_LINE('CODIGO DEPTO: '||FUN_REC.DEPARTMENT_ID);
        DBMS_OUTPUT.PUT_LINE('NOME_DEPTO: '||FUN_REC.DEPARTMENT_NAME);
        DBMS_OUTPUT.PUT_LINE('SALARIO TOTAL DO DEPARTAMENTO: '||FUN_REC.SALARIO);
    END LOOP;
    -- BLOCO DE EXCE��O PARA ERROS
    EXCEPTION 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: '||SQLERRM);
        
END;

-- EXECUTANDO A PROCEDURE
EXECUTE PRC_FUNC;