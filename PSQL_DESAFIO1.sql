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
-- ATRIBUIÇÃO --> " := "
v_depto := 100;
SELECT SUM(A.SALARY), COUNT(*) qtd
    INTO v_tot_sal, v_qtd
    from HR.EMPLOYEES A
    WHERE A.DEPARTMENT_ID=v_depto;

dbms_output.put_line('Total de salario do departemento '||v_depto||' é '||v_tot_sal);
dbms_output.put_line('Total de colaboradores do departamento '||v_depto||' são '||v_qtd);
dbms_output.put_line('A média de salário do departamento '||v_depto||' é '||round(v_tot_sal/v_qtd,2));

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

dbms_output.put_line('Total de salario do departemento '||v_depto||' é '||v_tot_sal);

    IF v_qtd > 1 THEN dbms_output.put_line('Total de colaboradores do departamento '||v_depto||' são '||v_qtd);
    ELSIF v_qtd = 1 THEN dbms_output.put_line('Este departamento possui apenas 1 colaborador');
    ELSE dbms_output.put_line('Este departamento não possui colaboradores');
    END IF;

dbms_output.put_line('A média de salário do departamento '||v_depto||' é '||round(v_tot_sal/v_qtd,2));

END;

-- Desafio 1
-- Refazer o programa das casas em python, para o PL/SQL
SET SERVEROUTPUT ON

ACCEPT VCASA PROMPT 'INSIRA O VALOR DA CASA QUE DESEJA: '
ACCEPT VSALARIO PROMPT 'DIGITE SEU SALARIO: '
ACCEPT VECONOMIA PROMPT 'QUANTOS PORCENTO QUER ECONOMIZAR POR MES: '

DECLARE

    vcasa1     INT;
    vsalario1  INT;
    veconomia1 FLOAT;
    vbanco     INT;
    vcount     INT DEFAULT 1;
BEGIN
    vcasa1 := &vcasa;
    vsalario1 := &vsalario;
    veconomia1 := &veconomia;
    WHILE vbanco < vcasa1 LOOP
        vcount := vcount + 1;
    END LOOP;
    
    if vcount = 1 THEN
        dbms_output.put_line('VocE levara ", VCOUNT, "m?s para comprar sua casa');

    ELSIF vcount > 1 and vcount < 12 THEN
        dbms_output.put_line('Voc? levara ", VCOUNT, "meses para comprar sua casa');

    ELSIF vcount = 12 THEN
        dbms_output.put_line('Voc? levara ", int((vcount/12)), "ano para comprar sua casa');

    ELSIF vcount > 12 and vcount < 24 THEN
        dbms_output.put_line('Voc? levara ", int((VCOUNT/12)), "ano e ",int(((VCOUNT/12) - (anos)) * 12), "meses para comprar sua casa');

    ELSIF vcount >= 24 and ROUND(VCOUNT/12)= 0 THEN
        dbms_output.put_line('Voc? levara ", int((VCOUNT/12)), "anos para comprar sua casa');
    ELSIF vcount >= 24 and ROUND(VCOUNT/12) != 0 THEN
        dbms_output.put_line('Voc? levara ", int((VCOUNT/12)), "anos e ", int(((VCOUNT/12) - (anos)) * 12), "meses para comprar sua casa');
    ELSIF banco > casa: