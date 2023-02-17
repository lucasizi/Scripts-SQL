-- [label] FOR index IN [REVERSE] menor_indice..indice_maximo LOOP
    --declara��es
--END LOOP [LABEL];

/* Podemos encontrar na sintaxe apresentada os seguintes elementos:

Index; � o nome dado a variavel declarada implicitamente que � utilizada localmente na declara��o do la�o FOR;

Menor_inidice(limite inferior) e maior_indice(limite superior): Estes s�o valores inteiros que s�o avaliados dentro de um la�o. Os valores que s�o postos estar�o
dentro desse limite e s�o tempor�rios.

Label; Um label identifica uma declara��o dentro do la�o FOR, como � o caso de instru��es CONTINUE, EXIT que podem referenciar a label.
A utiliza��o destes normalmente melhoram a legibilidade do c�digo, principalmente quando as instru��es do la�o s�o instru��es aninhas.
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


-- ESTRUTURA DE REPETI��O LOOP WHILE

/*

WHILE condition
    LOOP
        {statements...}
    END LOOP;
    
    
A palavra "condition", que no caso � a condi��o que ser� testada a cada intera��o do loop. Caso ess condi��o seja avaliada com TRUE, o corpo do loop ser� executado;
Caso esta condi��o seja FALSE, o loop ent�o ser� encerrado.

O "Statement" s�o as declara��es do c�digo que estaremos executando a cada passagem do loop. Como podemos perceber, a condi��o � relaziada antes de entrarmos no loop,
O que, em caso de ser FALSE, o c�digo n�o pode ser executado nenhuma vez.
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
        DBMS_OUTPUT.PUT_LINE('DENTRO DO LOOP O VALOR � IGUAL A: '||TO_CHAR(P_VALOR));
        P_VALOR := P_VALOR +1;
        CONTINUE WHEN P_VALOR <5;
            DBMS_OUTPUT.PUT_LINE('AP�S A CLAUSULA CONTINUE O VALOR � IGUAL A: '||TO_CHAR(P_VALOR));
         EXIT WHEN P_VALOR = 5;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('AP�S O LOOP O VALOR � IGUAL A: '||TO_CHAR(P_VALOR));
END;

-- ,outro exemplo
SET SERVEROUTPUT ON

DECLARE
VALOR NUMBER :=0;

BEGIN
    LOOP -- AP�S A DECLARA��O CONTINUE
        DBMS_OUTPUT.PUT_LINE('VALOR APRESENTADO NO INTERIOR DO LOOP � IGUAL A: '||VALOR);
        VALOR := VALOR +1;
        IF VALOR < 15 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('NO INTERIOR DO LOOP, AP�S A CLAUSULA IF-CONTINUE, O VALOR � IGUAL A: '||VALOR);
        EXIT WHEN VALOR > 15;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('AP�S O LOOP, O VALOR � IGUAL A: '||VALOR);
END;

