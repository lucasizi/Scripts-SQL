/*
Eventualmente o servidor Oracle ou o aplicativo do usu�rio causa um erro durante o processamento em runtime.
Tais erros podem surgir de falhas de hardware ou rede, erros l�gicos de aplicativo, erros de integridade de dados e de muitas outras fontes.
Esses erros s�o conhecidos como exce��es, ou seja, esses eventos indesejados s�o exce��es do processamento normal e esperado.

FUNCIONAMENTO GERAL

Geralmente, quando um erro ocorre, o processamento do bloco PL/SQL � imediatamente encerrado.
O processamento corrente n�o � conclu�do. A Oracle permite que voc� esteja preparado para esses erros e implemente l�gica nos programas para lidar com erros.

*/

-- Tratando exce��es, EXEMPLO 1
SET SERVEROUTPUT ON

DECLARE
LV_EXCECAO EXCEPTION;
PRAGMA EXCEPTION_INIT (LV_EXCECAO, -6502);
BEGIN
    RAISE LV_EXCECAO;
    EXCEPTION
    WHEN OTHERS THEN
    IF SQLCODE = 1 THEN
        DBMS_OUTPUT.PUT_LINE('ERRO QUE O USUARIO TRATOU LINHA 1 '||SQLCODE||' - '||SQLERRM);
        ELSE
            DBMS_OUTPUT.PUT_LINE('ERRO QUE O USUARIO TRATOU LINHA 2'||SQLCODE||' - '||SQLERRM);
    END IF;
END;

-- EXEMPLO 2
SET SERVEROUTPUT ON

DECLARE

LV_EXCECAO EXCEPTION;
PRAGMA EXCEPTION_INIT(LV_EXCECAO, -20000);
BEGIN
    RAISE_APPLICATION_ERROR(-20000,'MENSAGEM TRATADA');
    EXCEPTION
    WHEN LV_EXCECAO THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

-- EXEMPLO 3

SET SERVEROUTPUT ON

DECLARE

P_NUM INT DEFAULT 76;
EXC_MENOR EXCEPTION;
EXC_MAIOR EXCEPTION;

BEGIN
    IF P_NUM > 100 THEN
        RAISE EXC_MAIOR;
    ELSIF P_NUM < 50 THEN
        RAISE EXC_MENOR;
    ELSE
        dbms_output.put_line('Ok!!!');
    END IF;
    EXCEPTION
    WHEN EXC_MENOR THEN
        DBMS_OUTPUT.PUT_LINE('NUMERO MENOR QUE 50, DIGITE UM NUMERO ENTRE 50 E 100');
    WHEN EXC_MAIOR THEN
        DBMS_OUTPUT.PUT_LINE('NUMERO MAIOR QUE 100, DIGITE UM NUMERO ENTRE 50 E 100');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CODIGO E ERRO: '||SQLCODE||' - '||SQLERRM);
END;

-- EXEMPLO 4, DIVIS�O POR 0
SET SERVEROUTPUT ON

DECLARE

V_NUM NUMBER;

BEGIN

    V_NUM := 1/0;
    
    EXCEPTION
    WHEN ZERO_DIVIDE THEN -- ESTE � O "R�TULO" DADO  PELA ORACLE
                                               -- PARA O TIPO DE ERRO DISPARADO
                                               -- QUANDO OCORRE A DIVIS�O POR ZERO
    DBMS_OUTPUT.PUT_LINE('------------------------');
    DBMS_OUTPUT.PUT_LINE('ERRO: DIVIS�O POR ZERO.');
    DBMS_OUTPUT.PUT_LINE('N�O � POSSIVEL OBTER O V_NUM = 1/0.');
    DBMS_OUTPUT.PUT_LINE('------------------------');
    DBMS_OUTPUT.PUT_LINE('CODIGO ORACLE: '||SQLCODE);
    DBMS_OUTPUT.PUT_LINE('MENSAGEM ORACLE: '||SQLERRM);
END;

    