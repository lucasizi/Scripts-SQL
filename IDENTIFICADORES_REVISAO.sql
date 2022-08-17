SET SERVEROUTPUT ON
DECLARE
VCOUNT INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO VCOUNT
    FROM HR.EMPLOYEES;
    
    DBMS_OUTPUT.PUT_LINE('EXISTEM '||TO_CHAR(VCOUNT)||' FUNCIONARIOS CADASTRADOS.');
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('N�O FOI POSSIVEL VERIFICAR A QUANTIDADE DE FUNCIONARIOS CADASTRADOS');
END;
/

DECLARE
    V_HOJE DATE DEFAULT SYSDATE;
BEGIN
    --IMPRIME A DATA
    DBMS_OUTPUT.PUT_LINE('HOJE �: '||V_HOJE);
END;