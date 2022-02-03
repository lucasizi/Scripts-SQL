-- function como bloco anônimo concluído.
-- pegar dois números e dizer qual é o maior.
SET SERVEROUTPUT ON
DECLARE
    PNUM1       NUMBER;
    PNUM2       NUMBER;
    PNUM_AUX    NUMBER;
    
FUNCTION FN_MAX_VAL(
    PNUM1 IN NUMBER,
    PNUM2 IN NUMBER)
RETURN NUMBER
AS
    PNUM_AUX    NUMBER;
BEGIN
    IF  PNUM1 > PNUM2 THEN
        PNUM_AUX := PNUM1;
    ELSE 
        PNUM_AUX := PNUM2;
    END IF;
    RETURN PNUM_AUX;
END;
BEGIN
    PNUM1:=70;
    PNUM2:=85;
    PNUM_AUX:= FN_MAX_VAL(PNUM1, PNUM2);
    DBMS_OUTPUT.PUT_LINE('O MAIOR VALOR ENTRE '||PNUM1||' E '||PNUM2||' É '||PNUM_AUX);
END;