--CRIAÇÃO DA TABELA DE REFERENCIA DE JUROS
CREATE TABLE bancos (
cod_banco   int not null,
nome_banco  varchar2(50),
tipo_emprestimo varchar2(60),
juros_mensal float,
juros_anual float
);

-- inicio do programa em bloco anonimo
SET SERVEROUTPUT ON

ACCEPT I_CUSTO PROMPT 'DIGITE O VALOR DA COMPRA DO CLIENTE: '
ACCEPT I_ECO PROMPT 'DIGITE O QUANTO ELE QUER INVESTIR MENSALMENTE: '
ACCEPT I_REDE PROMPT 'AGORA DIGITE: O CODIGO DO BANCO DO CLIENTE: '
ACCEPT I_EMP PROMPT 'AGORA DIGITE: O CODIGO DO TIPO DE EMPRESTIMO DESEJADO: '

DECLARE

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
DBMS_OUTPUT.PUT_LINE('Você deseja uma parcela de: '||V_ECO||' por mês');
    SELECT A.NOME_BANCO, A.TIPO_EMPRESTIMO, A.JUROS_MENSAL, a.juros_anual
    INTO v_nome_banco, v_tipo_emprestimo, v_juros_mensal, V_JUROS_ANUAL
    FROM ALUNO.bancos A
    WHERE a.cod_banco=V_REDE
    AND
    a.cod_emprestimo=V_EMP;
    
    v_acrescimo:=V_ECO+V_ECO*v_juros_mensal/100;
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Com a base de juros do seu banco: '||v_nome_banco||' e o tipo de emprestimo: '||v_tipo_emprestimo||', fica um parcela de '||v_acrescimo);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    
    WHILE V_BANCO < V_CUSTO LOOP
        V_BANCO := V_BANCO+v_acrescimo;
        V_COUNT := V_COUNT +1;
    END LOOP;
    
    
    V_ANOS := V_COUNT/12;
    V_MESES := V_COUNT - (V_ANOS*12);
    
    v_acres_anual:=V_ANOS*V_JUROS_ANUAL;
    
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||v_count||' mês para finalizar o empréstimo');
    ELSIF  v_count > 1 and v_count < 12 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||v_count||' meses para finalizar o empréstimo');
    ELSIF v_count = 12 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||V_ANOS||' ano para finalizar o empréstimo');
    ELSIF v_count > 12 and v_count < 24 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||V_ANOS||' ano e '||ABS(V_MESES)||'meses para finalizar o empréstimo');
    ELSIF v_count >= 24 and MOD(V_COUNT,12) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||V_ANOS||' anos para finalizar o empréstimo');
    ELSIF v_count >= 24 and MOD(V_COUNT,12) != 0 THEN
        DBMS_OUTPUT.PUT_LINE('Você levara '||V_ANOS||' anos e '||ABS(V_MESES)||' meses para finalizar o empréstimo');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
        
    DBMS_OUTPUT.PUT_LINE('Ao final, você terá pago: '||V_BANCO||' + '||V_ANOS||' X '||v_acres_anual);
    
    EXCEPTION WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('BANCO NÃO ENCONTRADO NO SISTEMA!');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
        

END;
