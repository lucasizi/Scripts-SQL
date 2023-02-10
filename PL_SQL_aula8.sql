/*
Com a declaração GOTO, o controle é transferido para a lavel incondicionalmente, onde temos também que o label deve ser único dentro de um escopo
E deve ser posto antes de uma declaração executavél ou mesmo de um bloco PL/SQL

sintaxe:
GOTO Label;

O label tem por finalidade identificar tanto um bloco quanto uma declaração;
Caso o nosso label não esteja dentro do bloco no qual estejamos trabalhando, a declaração GOTO irá transferir o controle
Para o primeiro bloco que contiver na declaração da label;

*/

-- Verificando número par ou impar
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
/* A DEFINIÇÃO MAIS COMUM É QUE "UM NUMERO É PRIMO SE FOR DIVISIVEL POR 1 E POR ELE MESMO" OU ENTÃO "É
TODO NÚMERO COM DOIS E SOMENTE DOIS DIVISORES, ELE PROPRIO E A UNIDADE
*/

SET SERVEROUTPUT ON
DECLARE
    TIPO_NUMERO VARCHAR2(100);
    VALOR PLS_INTEGER := 2;
    
BEGIN
    FOR J IN 2..ROUND(SQRT(VALOR)) LOOP
        IF VALOR MOD J = 0 THEN
            TIPO_NUMERO := 'ESTE NÃO É UM NÚMERO PRIMO';
            GOTO MENSAGEM;
        END IF;
    END LOOP;
    TIPO_NUMERO := 'ESTE É UM NÚMERO PRIMO';
    <<MENSAGEM>>
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(VALOR) || TIPO_NUMERO);
END;
