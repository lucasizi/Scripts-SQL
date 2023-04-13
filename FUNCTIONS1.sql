-- CRIANDO FUNÇÃO PARA MÉDIA PONDERADA

CREATE OR REPLACE FUNCTION FN_MEDIAPOD (
                                                    NOTA1 IN NUMBER,
                                                    PESO1 IN NUMBER,
                                                    NOTA2 IN NUMBER,
                                                    PESO2 IN NUMBER)

RETURN NUMBER
IS
MEDIA_POD NUMBER;
BEGIN
    MEDIA_POD := (NOTA1 * PESO1 + NOTA2 * PESO2)/(PESO1+PESO2);
    RETURN MEDIA_POD;
END;

-- RETORNANDO VALOR DE FUNÇÃO
SELECT FN_MEDIAPOD(5,1,5,2) FROM SYS.DUAL;

-- RETORNANDO ATRAVÉS DE OUTPUT
SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE(FN_MEDIAPOD(5,5,10,1));
END;