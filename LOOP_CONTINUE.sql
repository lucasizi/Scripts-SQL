--EXEMPLO DE LOOP
SET SERVEROUTPUT ON
DECLARE
    P_VALOR NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('DENTRO DO LOOP O VALOR � IGUAL '||TO_CHAR(P_VALOR));
        P_VALOR := P_VALOR +1;
        CONTINUE WHEN p_valor < 5;
        DBMS_OUTPUT.PUT_LINE('AP�S A CLAUSULA CONTINUE O VALOR � IGUAL '||TO_CHAR(P_VALOR));
    EXIT WHEN P_VALOR = 5;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('AP�S O LOOP O VALOR � IGUAL '||TO_CHAR(P_VALOR));
END;

-- OUTRO EXEMPLO
DECLARE
    VALOR NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('VALOR APRENSENTADO NO INTERIOR DO LOOP � IGUAL A: '||TO_CHAR(VALOR));
        VALOR := VALOR +1;
        IF VALOR < 15 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('DENTRO DO LOOP O VALOR � IGUAL '||TO_CHAR(P_VALOR));