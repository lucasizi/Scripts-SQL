-- CRIANDO FUN��O PARA RETORNAR NUMERO DE SALARIOS MINIMOS
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION FN_SAL_MIN (P_SALARIO IN NUMBER)
RETURN NUMBER
IS
QTD_SAL_MIN NUMBER(10,2);
BEGIN
QTD_SAL_MIN := P_SALARIO/954;
RETURN QTD_SAL_MIN;
END;

SELECT A.FIRST_NAME, A.SALARY,FN_SAL_MIN(A.SALARY) AS QTD_MIN
FROM HR.EMPLOYEES A;

-- fun��o de calculo 
CREATE OR REPLACE FUNCTION FN_CALCULO(PAR1 IN NUMBER,
                                                                          PAR2 IN NUMBER,
                                                                          RES OUT NUMBER)
RETURN NUMBER
IS
AUX NUMBER := 0;

BEGIN
    RES := PAR1 + PAR2;
    AUX := RES + 100;
    RETURN (AUX);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERRO: '||SQLERRM);
END;

-- TESTANDO
DECLARE
RES0 NUMBER := 0;
RES1 NUMBER := 0;
BEGIN
    RES0 := FN_CALCULO(6, 14, RES1);
    DBMS_OUTPUT.PUT_LINE('O RESULTADO � '||RES0||' E '||RES1);
END;
