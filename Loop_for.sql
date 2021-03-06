--LOOP FOR PARA TABUADA
ACCEPT VTABUADA PROMPT 'DIGITE O NUMERO QUAL QUER SABER A TABUADA'
SET SERVEROUTPUT ON
DECLARE VTAB INT;
BEGIN
    VTAB:=&VTABUADA;
    FOR SEQ IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(SEQ||' X '||VTAB||' = '||SEQ * VTAB);
    END LOOP;
END;


-- criando tabela de teste
CREATE TABLE TEST_FOR
(
NUMERO1 INT,
NUMERO2 INT
);

-- LOOP PARA INSERT
BEGIN
    FOR VALOR IN 1..10 LOOP
    INSERT INTO TEST_FOR (NUMERO1) VALUES (VALOR);
    END LOOP;
    COMMIT;
END;

-- VERIFICANDO
SELECT * FROM TEST_FOR;

-- EXEMPLO UPDATE
BEGIN
    FOR VALOR IN 1..10 LOOP
        UPDATE TEST_FOR SET NUMERO2=NUMERO1*VALOR
        WHERE NUMERO1=VALOR;
    END LOOP;
    COMMIT;
END;

--LOOP reverse
BEGIN
    FOR X IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('CONTADOR CRESCENTE: '||TO_CHAR(X));
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(' - ');
    
    FOR X IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('CONTADOR DECRESCENTE: '||TO_CHAR(X));
    END LOOP;
END;