-- VARIAVEL DE AMBIENTE. SERVE PARA IMPRIMIR O VALOR DESEJADO.
SET SERVEROUTPUT ON
-- DECLARANDO AS VARIAVEIS
DECLARE
--VARIAVEIS
v_tot_sal NUMBER(10,2);
v_depto NUMBER;
v_qtd INT;
-- INICIO DO BLOCO OBRIGATORIO
BEGIN
-- ATRIBUI��O --> " := "
v_depto := 100;
SELECT SUM(A.SALARY), COUNT(*) qtd
    INTO v_tot_sal, v_qtd
    from HR.EMPLOYEES A
    WHERE A.DEPARTMENT_ID=v_depto;

dbms_output.put_line('Total de salario do departemento '||v_depto||' � '||v_tot_sal);
dbms_output.put_line('Total de colaboradores do departamento '||v_depto||' s�o '||v_qtd);
dbms_output.put_line('A m�dia de sal�rio do departamento '||v_depto||' � '||round(v_tot_sal/v_qtd,2));

END;


-- Desafio 1
-- Mostrar mensagem diferente caso o numero de colaboradores seja menor que 2

SET SERVEROUTPUT ON

DECLARE
v_tot_sal NUMBER(10,2);
v_depto NUMBER;
v_qtd INT;

BEGIN

v_depto := 10;
SELECT SUM(A.SALARY), COUNT(*) qtd
    INTO v_tot_sal, v_qtd
    from HR.EMPLOYEES A
    WHERE A.DEPARTMENT_ID=v_depto;

dbms_output.put_line('Total de salario do departemento '||v_depto||' � '||v_tot_sal);

    IF v_qtd > 1 THEN dbms_output.put_line('Total de colaboradores do departamento '||v_depto||' s�o '||v_qtd);
    ELSIF v_qtd = 1 THEN dbms_output.put_line('Este departamento possui apenas 1 colaborador');
    ELSE dbms_output.put_line('Este departamento n�o possui colaboradores');
    END IF;

dbms_output.put_line('A m�dia de sal�rio do departamento '||v_depto||' � '||round(v_tot_sal/v_qtd,2));

END;