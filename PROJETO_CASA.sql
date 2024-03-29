--CRIA��O DA TABELA DE REFERENCIA DE JUROS

/*
CREATE TABLE bancos (
cod_banco   int not null,
nome_banco  varchar2(50),
tipo_emprestimo varchar2(60),
juros_mensal float,
juros_anual float
);
*/
-- inicio do programa em bloco anonimo
SET SERVEROUTPUT ON
-- Entrada de dados do operador
ACCEPT I_CUSTO PROMPT 'DIGITE O VALOR DA COMPRA DO CLIENTE: '
ACCEPT I_ECO PROMPT 'DIGITE O QUANTO ELE QUER INVESTIR MENSALMENTE: '
ACCEPT I_REDE PROMPT 'AGORA DIGITE: O CODIGO DO BANCO DO CLIENTE: '
ACCEPT I_EMP PROMPT 'AGORA DIGITE: O CODIGO DO TIPO DE EMPRESTIMO DESEJADO: '

DECLARE
-- Declara��o de variaveis
V_CUSTO FLOAT := &I_CUSTO;
V_ECO FLOAT := &I_ECO;
V_COUNT INT DEFAULT 0;
V_BANCO FLOAT := 0;
V_ANOS INT := 0;
V_MESES INT := 0;
V_REDE INT :=&I_REDE;
V_EMP INT := &I_EMP;
V_NOME_BANCO ALUNO.bancos.nome_banco%TYPE;
V_TIPO_EMPRESTIMO ALUNO.bancos.tipo_emprestimo%TYPE;
V_JUROS_MENSAL ALUNO.bancos.juros_mensal%TYPE;
V_JUROS_ANUAL ALUNO.bancos.juros_anual%TYPE;
V_ACRESCIMO FLOAT := 0;
V_ACRES_ANUAL FLOAT := 0;

BEGIN
DBMS_OUTPUT.PUT_LINE('Voc� deseja uma parcela de: R$'||V_ECO||' por m�s');
-- Introdu��o de dados da tabela de referencia nas variaveis
    SELECT A.NOME_BANCO, A.TIPO_EMPRESTIMO, A.JUROS_MENSAL, a.juros_anual
    INTO v_nome_banco, v_tipo_emprestimo, v_juros_mensal, V_JUROS_ANUAL
    FROM ALUNO.bancos A
    WHERE a.cod_banco=V_REDE
    AND
    a.cod_emprestimo=V_EMP;
    
    -- calculo de parcela com juros mensal
    v_acrescimo:=V_ECO+V_ECO*v_juros_mensal/100;
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Com a base de juros do seu banco: '||v_nome_banco||' e o tipo de emprestimo: '||v_tipo_emprestimo||', fica a parcela de R$'||v_acrescimo);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    
    -- Loop para contagem de meses faltantes at� quita��o do valor introduzido
    WHILE V_BANCO < V_CUSTO LOOP
        V_BANCO := V_BANCO+v_acrescimo;
        V_COUNT := V_COUNT +1;
    END LOOP;
    
    -- cria��o de anos e meses a partir do count
    V_ANOS := V_COUNT/12;
    V_MESES := V_COUNT - (V_ANOS*12);
    
    -- calculo de juros anual
    v_acres_anual:=V_ANOS*V_JUROS_ANUAL;

    -- print's com informa��es sobre as tabelas
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Voc� levara '||v_count||' m�s para finalizar o empr�stimo');
    ELSIF  v_count > 1 and v_count < 12 THEN
        DBMS_OUTPUT.PUT_LINE('Voc� levara '||v_count||' meses para finalizar o empr�stimo');
    ELSIF v_count = 12 THEN
        DBMS_OUTPUT.PUT_LINE('Voc� levara '||V_ANOS||' ano para finalizar o empr�stimo');
    ELSIF v_count > 12 and v_count < 24 THEN
        DBMS_OUTPUT.PUT_LINE('Voc� levara '||V_ANOS||' ano e '||ABS(V_MESES)||'meses para finalizar o empr�stimo');
    ELSIF v_count >= 24 and MOD(V_COUNT,12) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Voc� levara '||V_ANOS||' anos para finalizar o empr�stimo');
    ELSIF v_count >= 24 and MOD(V_COUNT,12) != 0 THEN
        DBMS_OUTPUT.PUT_LINE('Voc� levara '||V_ANOS||' anos e '||ABS(V_MESES)||' meses para finalizar o empr�stimo');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    
    DBMS_OUTPUT.PUT_LINE('Ao final, voc� ter� pago: R$'||V_BANCO||' + '||V_ANOS||' x R$'||v_acres_anual);

    DBMS_OUTPUT.PUT_LINE('FINALIZARA AS PARCELAS EM: '||TO_CHAR(ADD_MONTHS(SYSDATE, V_COUNT), 'MONTH/YYYY'));
    
    -- exce��o de erro para quando n�o � encontrado o banco ou o tipo de emprestimo na tabela
    EXCEPTION WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('BANCO N�O ENCONTRADO NO SISTEMA!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    
END;

