/*
Eventualmente o servidor Oracle ou o aplicativo do usuário causa um erro durante o processamento em runtime.
Tais erros podem surgir de falhas de hardware ou rede, erros lógicos de aplicativo, erros de integridade de dados e de muitas outras fontes.
Esses erros são conhecidos como exceções, ou seja, esses eventos indesejados são exceções do processamento normal e esperado.

FUNCIONAMENTO GERAL

Geralmente, quando um erro ocorre, o processamento do bloco PL/SQL é imediatamente encerrado.
O processamento corrente não é concluído. A Oracle permite que você esteja preparado para esses erros e implemente lógica nos programas para lidar com erros.

*/

-- Tratando exceções, EXEMPLO 1
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
