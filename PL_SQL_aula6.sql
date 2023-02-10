/*
SINTAXE BASICA DO IF THEN

IF condition THEN
    {As instruções que serão executadas vão aqui quando a condição é TRUE}
END IF;

SINTAXE BASICA DO IF - THEN - ELSE

IF condition THEN
    {As instruções que serão executadas vão aqui quando a condição é TRUE}
ELSE
    {As instruções que serão executadas vão aqui quando a condição é FALSE}
END IF;

SINTAXE BASICA DO IF - THEN - ELSIF

IF condition THEN
    {As instruções que serão executadas vão aqui quando a condição é TRUE}
ELSIF
    {As instruções que serão executadas vão aqui quando a condição é TRUE}
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
        DBMS_OUTPUT.PUT_LINE('PARABÉNS! VOCÊ ACERTOU');
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
        DBMS_OUTPUT.PUT_LINE('PARABÉNS! VOCÊ ACERTOU');
        ELSE
            DBMS_OUTPUT.PUT_LINE('OPS! VOCÊ ERROU');
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
        DBMS_OUTPUT.PUT_LINE('VOCÊ DIGITOU UM NÚMEROM DE 0 A 10');
    ELSIF v_numero >10 AND v_numero <=30 THEN
        DBMS_OUTPUT.PUT_LINE('VOCÊ DIGITOU UM NÚMEROM DE 11 A 30');
    ELSIF v_numero >30 AND v_numero <=50 THEN
        DBMS_OUTPUT.PUT_LINE('VOCÊ DIGITOU UM NÚMEROM DE 31 A 50');  
    ELSIF v_numero >50 AND v_numero <=100 THEN
        DBMS_OUTPUT.PUT_LINE('VOCÊ DIGITOU UM NÚMEROM DE 51 A 100');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O NÚMERO ESTÁ FORA DOS LIMITES');
    END IF;
END;
