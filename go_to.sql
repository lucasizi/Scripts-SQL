--FAZER A LEITURA DE UM RANGE DE NUMERO E FALAR QUAL É PAR QUAL É IMPAR
SET SERVEROUTPUT ON

DECLARE
    --DECLARAÇÃO DO TIPO DE VARIAVEIS
    tipo_numero VARCHAR2(100);
    j           INTEGER;
BEGIN
    --FOR É A ESTRUTURA DE REPETIÇÃO. INTERVALO DE 1 A 10.
    FOR j IN 1..10 LOOP
    -- DENTRO DO LOOP DE 1 A 10, FAZER UM IF MOD.
    -- MOD É A FUNÇÃO PARA SABER SE UM NÚMERO TEM SOBRA.
        IF MOD(j, 2) = 0 THEN
    -- SE DIVIDIR POR 2 E NÃO TER SOBRA, É NUMERO PAR, SE NÃO É IMPART
            tipo_numero := ' NUMERO PAR';
        -- INSTRUÇÃO PARA IR PARA O LABEL ESPECIFICO
            GOTO mensagem;
        ELSE
            tipo_numero := ' NUMERO IMPAR';
            GOTO mensagem;
        END IF;

        << mensagem >>
        dbms_output.put_line(to_char(j)|| tipo_numero);
    END LOOP;
END;