-- BLOCO IF COMPARANDO VALORES
SET SERVEROUTPUT ON
-- COMANDO PARA ABRIR PROMPT PARA DIGITAR UM VALOR
ACCEPT VDIGITADO PROMPT 'DIGITE UM VALOR: '
DECLARE
    VNUMERO INT;
    VSORTE INT DEFAULT 5;
BEGIN
    VNUMERO:=&VDIGITADO;
    IF VNUMERO = VSORTE THEN
        DBMS_OUTPUT.PUT_LINE('PARAB�NS, VOC� ACERTOU');
    END IF;
END;


-- BLOCO IF COMPARANDO VALORES COM ELSE
SET SERVEROUTPUT ON
-- COMANDO PARA ABRIR PROMPT PARA DIGITAR UM VALOR
ACCEPT VDIGITADO PROMPT 'DIGITE UM VALOR: '
DECLARE
    VNUMERO INT;
    VSORTE INT DEFAULT 5;
BEGIN
    VNUMERO:=&VDIGITADO;
    IF VNUMERO = VSORTE THEN
        DBMS_OUTPUT.PUT_LINE('PARAB�NS, VOC� ACERTOU');
        ELSE
        DBMS_OUTPUT.PUT_LINE('MAIS SORTE NA PROXIMA VEZ');
    END IF;
END;


-- USANDO ESTRUTURA IF THEN ELSEIF
--0 A 10, 11 A 30, 31 A 50, 51 A 100
SET SERVEROUTPUT ON
ACCEPT VDIGITADO PROMPT 'DIGITE UM N�MERO DE 0 A 100'
DECLARE
    VNUMERO INT;
BEGIN
    VNUMERO:=&VDIGITADO;
    IF VNUMERO <= 10 THEN
        DBMS_OUTPUT.PUT_LINE('SEU NUMERO '||VNUMERO||' EST� ENTRE 0 E 10');
        ELSIF VNUMERO > 10 AND VNUMERO <= 30 THEN
            DBMS_OUTPUT.PUT_LINE('SEU NUMERO '||VNUMERO||' EST� ENTRE 11 E 30');
        ELSIF VNUMERO > 30 AND VNUMERO <= 50 THEN
            DBMS_OUTPUT.PUT_LINE('SEU NUMERO '||VNUMERO||' EST� ENTRE 31 E 50');
        ELSIF VNUMERO > 50 AND VNUMERO <= 100 THEN
            DBMS_OUTPUT.PUT_LINE('SEU NUMERO '||VNUMERO||' EST� ENTRE 51 E 100');
         ELSIF VNUMERO > 100 THEN
            DBMS_OUTPUT.PUT_LINE('SEU NUMERO '||VNUMERO||' EST� FORA DOS LIMITES');
    END IF;
END;
    