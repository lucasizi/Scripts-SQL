/*
SINTAXE BASICA DO IF THEN

IF condition THEN
    {As instru��es que ser�o executadas v�o aqui quando a condi��o � TRUE}
END IF;

SINTAXE BASICA DO IF - THEN - ELSE

IF condition THEN
    {As instru��es que ser�o executadas v�o aqui quando a condi��o � TRUE}
ELSE
    {As instru��es que ser�o executadas v�o aqui quando a condi��o � FALSE}
END IF;

SINTAXE BASICA DO IF - THEN - ELSIF

IF condition THEN
    {As instru��es que ser�o executadas v�o aqui quando a condi��o � TRUE}
ELSIF
    {As instru��es que ser�o executadas v�o aqui quando a condi��o � TRUE}
END IF;

*/

-- BLOCO IF THEN comparando valores
SET SERVEROUTPUT ON

ACCEPT v_digitado PROMPT 'DIGITE O VALOR: '

DECLARE
    V_NUMERO INT;
    V_SORTE INT DEFAULT 5;
    
BEGIN
    V_NUMERO :=&V_DIGITADO;
    
    IF V_NUMERO = V_SORTE THEN
        DBMS_OUTPUT.PUT_LINE('PARAB�NS! VOC� ACERTOU');
    END IF;
    
END;
    
    
-- BLOCO IF THEN ELSE comparando valores
SET SERVEROUTPUT ON

ACCEPT v_digitado PROMPT 'DIGITE O VALOR: '

DECLARE
    V_NUMERO INT;
    V_SORTE INT DEFAULT 5;
    
BEGIN
    V_NUMERO :=&V_DIGITADO;
    
    IF V_NUMERO = V_SORTE THEN
        DBMS_OUTPUT.PUT_LINE('PARAB�NS! VOC� ACERTOU');
        ELSE
            DBMS_OUTPUT.PUT_LINE('OPS! VOC� ERROU');
    END IF;
    
END;

-- BLOCO IF THEN ELSIF comparando valores
SET SERVEROUTPUT ON

ACCEPT v_digitado PROMPT 'DIGITE UM NUMERO DE 0 A 100: '

DECLARE
    V_NUMERO INT;
    
BEGIN
    V_NUMERO :=&V_DIGITADO;
    
    IF V_NUMERO <=10 THEN
        DBMS_OUTPUT.PUT_LINE('VOC� DIGITOU UM N�MEROM DE 0 A 10');
    ELSIF v_numero >10 AND v_numero <=30 THEN
        DBMS_OUTPUT.PUT_LINE('VOC� DIGITOU UM N�MEROM DE 11 A 30');
    ELSIF v_numero >30 AND v_numero <=50 THEN
        DBMS_OUTPUT.PUT_LINE('VOC� DIGITOU UM N�MEROM DE 31 A 50');  
    ELSIF v_numero >50 AND v_numero <=100 THEN
        DBMS_OUTPUT.PUT_LINE('VOC� DIGITOU UM N�MEROM DE 51 A 100');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O N�MERO EST� FORA DOS LIMITES');
    END IF;
END;
