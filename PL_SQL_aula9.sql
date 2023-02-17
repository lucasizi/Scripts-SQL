-- [label] FOR index IN [REVERSE] menor_indice..indice_maximo LOOP
    --declarações
--END LOOP [LABEL];

/* Podemos encontrar na sintaxe apresentada os seguintes elementos:

Index; é o nome dado a variavel declarada implicitamente que é utilizada localmente na declaração do laço FOR;

Menor_inidice(limite inferior) e maior_indice(limite superior): Estes são valores inteiros que são avaliados dentro de um laço. Os valores que são postos estarão
dentro desse limite e são temporários.

Label; Um label identifica uma declaração dentro do laço FOR, como é o caso de instruções CONTINUE, EXIT que podem referenciar a label.
A utilização destes normalmente melhoram a legibilidade do código, principalmente quando as instruções do laço são instruções aninhas.
*/

-- exemplo de tabuada
SET SERVEROUTPUT ON

ACCEPT V_DIGITADO PROMPT 'DIGITE A TABUADA'

DECLARE

V_TAB INT;

BEGIN
    V_TAB := &V_DIGITADO;
    FOR SEQ IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(SEQ||' X '||V_TAB||' = '||SEQ*V_TAB);
    END LOOP;
END;

-- TABELA DE TEXTE

CREATE TABLE TEST_FOR(
NUMERO1 INT,
NUMERO2 INT
);

BEGIN
    FOR VALOR IN 1..10 LOOP
        INSERT INTO TEST_FOR (NUMERO1) VALUES (VALOR);
    END LOOP;
COMMIT;
END;

-- VERIFICANDO
SELECT * FROM TEST_FOR;

--EXEMPLO UPDATE

BEGIN
    FOR VALOR IN 1..10 LOOP
        UPDATE TEST_FOR SET NUMERO2=NUMERO1*VALOR
        WHERE NUMERO1=VALOR;
    END LOOP;
    COMMIT;
END;


-- LOOP REVERSE
BEGIN 
    FOR X IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('CONTADOR CRESCENTE : '|| TO_CHAR(X) );
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('    -    ');
    FOR X IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('CONTADOR DECRESCENTE :'|| TO_CHAR(X) );
    END LOOP;

END;


-- ESTRUTURA DE REPETIÇÃO LOOP WHILE

/*

WHILE condition
    LOOP
        {statements...}
    END LOOP;
    
    
A palavra "condition", que no caso é a condição que será testada a cada interação do loop. Caso ess condição seja avaliada com TRUE, o corpo do loop será executado;
Caso esta condição seja FALSE, o loop então será encerrado.

O "Statement" são as declarações do código que estaremos executando a cada passagem do loop. Como podemos perceber, a condição é relaziada antes de entrarmos no loop,
O que, em caso de ser FALSE, o código não pode ser executado nenhuma vez.
*/

-- tabuada usando o loop while
SET SERVEROUTPUT ON

ACCEPT V_DIGITADO PROMPT 'DIGITE A TABUADA: '

DECLARE

V_TAB INT;
V_LIMIT INT DEFAULT 1;

BEGIN
V_TAB := &V_DIGITADO;
    WHILE V_LIMIT <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(V_LIMIT||' X '|| V_TAB||' = '||V_LIMIT*V_TAB);
        V_LIMIT := V_LIMIT +1;
    END LOOP;
END;

-- tabuada usando o loop while e exit when
SET SERVEROUTPUT ON

ACCEPT V_DIGITADO PROMPT 'DIGITE A TABUADA: '

DECLARE

V_TAB INT;
V_LIMIT INT DEFAULT 1;

BEGIN
V_TAB := &V_DIGITADO;
    WHILE V_LIMIT <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(V_LIMIT||' X '|| V_TAB||' = '||V_LIMIT*V_TAB);
        V_LIMIT := V_LIMIT +1;
        EXIT WHEN V_LIMIT >5;
    END LOOP;
END;


-- LOOP CONTINUE
DECLARE
P_VALOR NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('DENTRO DO LOOP O VALOR É IGUAL A: '||TO_CHAR(P_VALOR));
        P_VALOR := P_VALOR +1;
        CONTINUE WHEN P_VALOR <5;
            DBMS_OUTPUT.PUT_LINE('APÓS A CLAUSULA CONTINUE O VALOR É IGUAL A: '||TO_CHAR(P_VALOR));
         EXIT WHEN P_VALOR = 5;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('APÓS O LOOP O VALOR É IGUAL A: '||TO_CHAR(P_VALOR));
END;

-- ,outro exemplo
SET SERVEROUTPUT ON

DECLARE
VALOR NUMBER :=0;

BEGIN
    LOOP -- APÓS A DECLARAÇÃO CONTINUE
        DBMS_OUTPUT.PUT_LINE('VALOR APRESENTADO NO INTERIOR DO LOOP É IGUAL A: '||VALOR);
        VALOR := VALOR +1;
        IF VALOR < 15 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('NO INTERIOR DO LOOP, APÓS A CLAUSULA IF-CONTINUE, O VALOR É IGUAL A: '||VALOR);
        EXIT WHEN VALOR > 15;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('APÓS O LOOP, O VALOR É IGUAL A: '||VALOR);
END;

