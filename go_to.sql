--FAZER A LEITURA DE UM RANGE DE NUMERO E FALAR QUAL � PAR QUAL � IMPAR
SET SERVEROUTPUT ON

DECLARE
    --DECLARA��O DO TIPO DE VARIAVEIS
    tipo_numero VARCHAR2(100);
    j           INTEGER;
BEGIN
    --FOR � A ESTRUTURA DE REPETI��O. INTERVALO DE 1 A 10.
    FOR j IN 1..10 LOOP
    -- DENTRO DO LOOP DE 1 A 10, FAZER UM IF MOD.
    -- MOD � A FUN��O PARA SABER SE UM N�MERO TEM SOBRA.
        IF MOD(j, 2) = 0 THEN
    -- SE DIVIDIR POR 2 E N�O TER SOBRA, � NUMERO PAR, SE N�O � IMPART
            tipo_numero := ' NUMERO PAR';
        -- INSTRU��O PARA IR PARA O LABEL ESPECIFICO
            GOTO mensagem;
        ELSE
            tipo_numero := ' NUMERO IMPAR';
            GOTO mensagem;
        END IF;

        << mensagem >>
        dbms_output.put_line(to_char(j)|| tipo_numero);
    END LOOP;
END;