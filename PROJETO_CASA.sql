SET SERVEROUTPUT ON

ACCEPT I_CUSTO PROMPT 'DIGITE O VALOR DA SUA COMPRA: '
ACCEPT I_ECO PROMPT 'DIGITE O QUANTO QUER INVESTIR MENSALMENTE: '

DECLARE

V_CUSTO FLOAT := &I_CUSTO;
V_ECO FLOAT := &I_ECO;
V_COUNT INT DEFAULT 0;
V_BANCO FLOAT := 0;
V_ANOS INT := 0;
V_MESES INT := 0;


BEGIN
DBMS_OUTPUT.PUT_LINE('VOCÊ CONSEGUE GUARDAR UM TOTAL DE: '||V_ECO||' POR MÊS');

    WHILE V_BANCO < V_CUSTO LOOP
        V_BANCO := V_BANCO+V_ECO;
        V_COUNT := V_COUNT +1;
    END LOOP;
    
    V_ANOS := V_COUNT/12;
    V_MESES := V_COUNT - (V_ANOS*12);
    
    
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||v_count||' mês para comprar sua casa');
    ELSIF  v_count > 1 and v_count < 12 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||v_count||' meses para comprar sua casa');
    ELSIF v_count = 12 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||V_ANOS||' ano para comprar sua casa');
    ELSIF v_count > 12 and v_count < 24 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||V_ANOS||' ano e '||ABS(V_MESES)||'meses para comprar sua casa');
    ELSIF v_count >= 24 and MOD(V_COUNT,12) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||V_ANOS||' anos para comprar sua casa');
    ELSIF v_count >= 24 and MOD(V_COUNT,12) != 0 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||V_ANOS||' anos e '||ABS(V_MESES)||' meses para comprar sua casa');
    END IF;
    
    
END;
