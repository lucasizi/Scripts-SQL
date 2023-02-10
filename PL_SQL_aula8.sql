/*
Com a declara��o GOTO, o controle � transferido para a lavel incondicionalmente, onde temos tamb�m que o label deve ser �nico dentro de um escopo
E deve ser posto antes de uma declara��o executav�l ou mesmo de um bloco PL/SQL

sintaxe:
GOTO Label;

O label tem por finalidade identificar tanto um bloco quanto uma declara��o;
Caso o nosso label n�o esteja dentro do bloco no qual estejamos trabalhando, a declara��o GOTO ir� transferir o controle
Para o primeiro bloco que contiver na declara��o da label;

*/

-- Verificando n�mero par ou impar
SET SERVEROUTPUT ON
DECLARE
    TIPO_NUMERO VARCHAR2(100);
    J INTEGER;
BEGIN
    FOR J IN 1..10 LOOP
        IF MOD(J,2) = 0 THEN
            TIPO_NUMERO := 'NUMERO PAR';
            GOTO MENSAGEM;
            ELSE
            TIPO_NUMERO := 'NUMERO IMPAR';
            GOTO MENSAGEM;
        END IF;
    <<MENSAGEM>>
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(J) ||' '|| TIPO_NUMERO);
    END LOOP;
END;


-- ANALISE NUMERO PRIMO
/* A DEFINI��O MAIS COMUM � QUE "UM NUMERO � PRIMO SE FOR DIVISIVEL POR 1 E POR ELE MESMO" OU ENT�O "�
TODO N�MERO COM DOIS E SOMENTE DOIS DIVISORES, ELE PROPRIO E A UNIDADE
*/

SET SERVEROUTPUT ON
DECLARE
    TIPO_NUMERO VARCHAR2(100);
    VALOR PLS_INTEGER := 2;
    
BEGIN
    FOR J IN 2..ROUND(SQRT(VALOR)) LOOP
        IF VALOR MOD J = 0 THEN
            TIPO_NUMERO := 'ESTE N�O � UM N�MERO PRIMO';
            GOTO MENSAGEM;
        END IF;
    END LOOP;
    TIPO_NUMERO := 'ESTE � UM N�MERO PRIMO';
    <<MENSAGEM>>
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(VALOR) || TIPO_NUMERO);
END;
