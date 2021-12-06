-- EXEMPLO DE EXCEPTION

SET SERVEROUTPUT ON
DECLARE
LV_EXCESSAO EXCEPTION;
PRAGMA EXCEPTION_INIT (LV_EXCESSAO, -6502);
BEGIN
    RAISE LV_EXCESSAO;
    EXCEPTION
    WHEN OTHERS THEN
    IF SQLCODE=1 THEN
        DBMS_OUTPUT.PUT_LINE('ERRO QUE O USUARIO TRATOU LINHA 1'||SQLCODE||' - '||SQLERRM);
    ELSE 
        DBMS_OUTPUT.PUT_LINE('ERRO QUE O USUARIO TRATOU LINHA 2'||SQLCODE||' - '||SQLERRM);
    END IF;
END;

-- EXEMPLO 2
SET SERVEROUTPUT ON
DECLARE
LV_EXCESSAO EXCEPTION;
PRAGMA EXCEPTION_INIT (LV_EXCESSAO, -20000);
BEGIN
    RAISE_APPLICATION_ERROR(-20000, 'MENSAGEM TRATADA');
    EXCEPTION WHEN
        LV_EXCESSAO THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

-- EXEMPLO 3
-- PROGRAMA PARA TRATAR INTERVALOS ENTRE 50 E 100
SET SERVEROUTPUT ON
DECLARE
    P_NUM INT DEFAULT 56;
    EXC_MENOR EXCEPTION;
    EXC_MAIOR EXCEPTION;
BEGIN
    IF P_NUM > 100 THEN
        RAISE EXC_MAIOR;
    ELSIF P_NUM < 50 THEN
        RAISE EXC_MENOR;
    ELSE
        DBMS_OUTPUT.PUT_LINE('OK!!!');
    END IF;
    EXCEPTION
    WHEN EXC_MENOR THEN
        DBMS_OUTPUT.PUT_LINE('NUMERO MENOR QUE 50, DIGITE UM ENTRE 50 E 100');
    WHEN EXC_MAIOR THEN
        DBMS_OUTPUT.PUT_LINE('NUMERO MAIOR QUE 100, DIGITE UM ENTRE 50 E 100');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CODIGO E ERRO '||SQLCODE||'MSG '||SQLERRM);
END;

-- EXEMPLO 4
SET SERVEROUTPUT ON
DECLARE
    V_NUM NUMBER;
BEGIN
    V_NUM := 1/0;
    
    EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('ERRO: DIVIS�O POR ZERO');
        DBMS_OUTPUT.PUT_LINE('N�O � POSSIVEL OBTER VNUM = 1/0');
        DBMS_OUTPUT.PUT_LINE('CODIGO ORACLE: '||SQLCODE);
        DBMS_OUTPUT.PUT_LINE('MENSAGEM ORACLE: '||SQLERRM);
        DBMS_OUTPUT.PUT_LINE('--------------------------------');
END;

-- EXEMPLO 5
-- TRTATANDO OUTROS ERROS
SET SERVEROUTPUT ON
DECLARE
P_NUM NUMBER;
BEGIN
P_NUM := 1/0;
EXCEPTION WHEN
    OTHERS THEN
    IF SQLCODE = '-12170' THEN
        DBMS_OUTPUT.PUT_LINE('ERRO DE CONEX�O! VERIFIQUE SE A MAQUINA EST� LIGADA!');
        ELSE
        DBMS_OUTPUT.PUT_LINE('ERRO NA INTEGRA��O: '||SQLERRM);
    END IF;
END;