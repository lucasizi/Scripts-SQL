CREATE OR REPLACE PROCEDURE PRC_MOV_ESTOQUE (P_OPER IN VARCHAR2, P_COD_MAT IN INT, P_LOTE IN VARCHAR2, P_QTD IN INT)
IS
    V_SALDO_ESTOQUE INT;
    V_SALDO_ESTOQUE_LOTE INT;
    V_MAT_EXISTE INT;
    V_REG_ESTOQUE INT;
    V_REG_ESTOQUE_LOTE INT;
    EXC_MAT_N_EXISTE EXCEPTION;
    EXC_ESTOQUE_NEGATIVO EXCEPTION;
    EXC_ESTOQUE_NEGATIVO_LOTE EXCEPTION;

BEGIN
    --VERIFICANDO SE OPERACAO É PERMITIDA
    IF P_OPER NOT IN ('E','S') THEN 
        RAISE EXC_OPERACAO_NAO_PERMITIDA;
    ELSE
        DBMS_OUTPUT.PUT_LINE('OPERACAO OK! CONTINUA!');
    END IF;
    -- VERIFICANDO SE MATERIAL EXISTE
    SELECT COUNT(*) INTO V_MAT_EXISTE FROM MATERAL WHERE COD_MAT=P_COD_MAT;
    IF V_MAT_EXISTE = 0 THEN
        RAISE EXC_MAT_N_EXISTE;
    ELSE
        DBMS_OUTPUT.PUT_LINE('MATERIAL EXISTE! CONTINUA!');
    END IF;
    -- VERIFICANDO SE EXISTE REGISTRO EM ESTOQUE
    SELECT COUNT(*) INTO V_REG_ESTOQUE
    FROM ESTOQUE
    WHERE COD_MAT=COD_MAT;
        DBMS_OUTPUT.PUT_LINE('QTD REG ESTOQUE '||V_REG_ESTOQUE);
    -- VERIFICANDO OPERACAO DE SAIDA SE MATERIAL EXISTE NO ESTOQUE
    IF P_OPER='S' AND V_REG_ESTOQUE=0 THEN
        RAISE EXC_ESTOQUE_NEGATIVO;
    ELSIF P_OPER='S' AND V_REG_ESTOQUE > 0 THEN
        --ATRIBUINDO SALDO DE ESTOQUE E QTD REGISTRO
        SELECT SALDO, COUNT(*) INTO V_SALDO_ESTOQUE, V_REG_ESTOQUE
        FROM ESTOQUE
        WHERE COD_MAT=COD_MAT
        GROUP BY SALDO;
        DBMS_OUTPUT.PUT_LINE('TEM ESTOQUE!');
    END IF;

    -- VERIFICANDO SE EXISTE REGISTRO EM ESTOQUE LOTE
    SELECT COUNT(*) INTO V_REG_ESTOQUE_LOTE FROM ESTOQUE_LOTE
    WHERE COD_MAT=P_COD_MAT AND LOTE=P_LOTE;
    DBMS_OUTPUT.PUT_LINE('QTD REG ESTOQUE LOTE '||V_REG_ESTOQUE_LOTE);
    -- VERIFICANDO OPERACAO DE SAIDA SE MATERIAL EXISTE NAO EXISTE
    IF P_OPER='S' AND V_REG_ESTOQUE_LOTE = 0 THEN
        RAISE EXC_ESTOQUE_NEGATIVO_LOTE;
    ELSIF P_OPER='S' AND V_REG_ESTOQUE_LOTE > 0 THEN
        --ATRIBUINDO SALDO DE ESTOQUE LOTE E QTD REGISTRO
        SELECT SUM(SALDO), COUNT(*) INTO V_SALDO_ESTOQUE_LOTE, V_REG_ESTOQUE_LOTE FROM ESTOQUE_LOTE
        WHERE COD_MAT=P_COD_MAT AND LOTE=P_LOTE;
        DBMS_OUTPUT.PUT_LINE('TEM ESTOQUE LOTE');
    END IF;

    IF P_OPER='S' AND (V_SALDO_ESTOQUE_LOTE-P_QTD<0 OR V_SALDO_ESTOQUE-P_QTD<0) THEN
        RAISE EXC_ESTOQUE_NEGATIVO_LOTE;
    ELSIF P_OPER='S' AND V_SALDO_ESTOQUE_LOTE-P_QTD >= 0 THEN
    --ATUALIZA ESTOQUE
    UPDATE ESTOQUE SET SALDO=SALDO-P_QTD WHERE COD_MAT=P_COD_MAT;
    -- ATUALIZA ESTOQUE LOTE 