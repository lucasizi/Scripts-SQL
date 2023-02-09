/*
A instru��o CASE � uma forma mais compacta de para realizar a avalia��o de uma unica condi��o
E escolher entre algumas a��es alternativas. No caso de termos mais de dois IF's, de certa forma,
Passa a ser mais aplicavel
a utiliza��o de CASES

*/

CASE [EXPRESSION]
    WHEN CONDITION_1 THEN RESULT_1
    WHEN CONDITION_2 THEN RESULT_2
    ...
    WHEN CONDITION_N THEN RESULT_N
    ELSE RESULT
END CASE;

----------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON

ACCEPT V_Nota1 PROMPT 'DIGITE SUA NOTA: '

DECLARE
V_NOTA integer;

BEGIN
V_NOTA := &V_NOTA1;

    CASE v_nota
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('NOTA EXCELENTE');
        WHEN  9 THEN DBMS_OUTPUT.PUT_LINE('NOTA MUITO BOA');
        WHEN  8 THEN DBMS_OUTPUT.PUT_LINE('BOA NOTA');
        WHEN  7 THEN DBMS_OUTPUT.PUT_LINE('NOTA NA M�DIA');
        WHEN  6 THEN DBMS_OUTPUT.PUT_LINE('NOTA ABAIXO DA M�DIA');
        ELSE DBMS_OUTPUT.PUT_LINE('SEM CLASSIFICA��O');
    END CASE;
END;