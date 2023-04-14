CREATE OR REPLACE PROCEDURE PRC_CALCULADORA (OPERACAO IN VARCHAR, /* A -> ADIÇÃO/ S -> SUBTRAÇÃO/ D -> DIVISÃO/ M-> MULTIPLICAÇÃO */
                                                                                        PNUM1 IN NUMBER,
                                                                                        PNUM2 IN NUMBER,
                                                                                        RETORNO OUT NUMBER)
IS
MSG_OUTRAS EXCEPTION;
BEGIN
    IF OPERACAO = 'A' THEN
        RETORNO := PNUM1 + PNUM2;
    ELSIF OPERACAO = 'S' THEN
        RETORNO := PNUM1 - PNUM2;
    ELSIF OPERACAO = 'D' THEN
        RETORNO := PNUM1 / PNUM2;
    ELSIF OPERACAO = 'M' THEN
        RETORNO := PNUM1 * PNUM2;
    ELSE
        RAISE MSG_OUTRAS;
    END IF;

EXCEPTION
WHEN MSG_OUTRAS THEN
    DBMS_OUTPUT.PUT_LINE('OPÇÃO INVALIDA!!!');
    
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: '||SQLERRM);

END;

-- EXECUTANDO A PROCEDURE
DECLARE
RETORNO NUMBER :=0;
BEGIN
    PRC_CALCULADORA('D',0,0,RETORNO);
    DBMS_OUTPUT.PUT_LINE(RETORNO);
END;


    