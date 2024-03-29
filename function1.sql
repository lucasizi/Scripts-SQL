-- Criando fun��o para m�dia ponderada

CREATE OR REPLACE FUNCTION FN_MEDIA_POND
    (NOTA1 IN NUMBER,
    PESO1 IN NUMBER,
    NOTA2 IN NUMBER,
    PESO2 IN NUMBER)
RETURN NUMBER
IS
MEDIA_POND NUMBER;
BEGIN
    MEDIA_POND:=(NOTA1*PESO1+NOTA2*PESO2)/(PESO1+PESO2);
    RETURN MEDIA_POND;
END;

-- RETORNANDO VALOR DA FUN��O
SELECT FN_MEDIA_POND(5,5,10,1) FROM SYS.DUAL;

--RETORNANDO ATRAV�S DE OUTPUT
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE(FN_MEDIA_POND(5,5,10,1));
END;