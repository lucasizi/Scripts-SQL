 -- Declarando variaveis
-- Adote padrões para dar nomes a variaveis. Por exemplo, vFrase para representar uma variavel e vFrase para representar uma variável de coleção.
-- Se usar uma variável NOT NULL, inicie cm algum valor válido;
-- Declarar uma variável que facilite a leitura e manutenção do código;
-- Não utilizar uma variavél com o mesmo nome de uma coluna de tabela referenciada no bloco

-- Dica; Para iniciar uma variável você pode utilizar o operador " := " ou a palavra chave DEFAULT, como nos exemplos abaixo;

vFrase varchar2(30) := 'Hello World';

-- ou 

vFrase varchar2(30) DEFAULT 'Hello World';

-- Declaração

DECLARE

vDataNasc DATE;
vCodFunc   NUMBER(2) NOT NULL := 10;
vCidade     VARCHAR2(30) := 'jundiai';
vPI CONSTANT NUMBER := 3.1415;
vBloqueado BOOLEAN := FALSE;

Begin

-- Exemplo

SET SERVEROUTPUT ON
DECLARE
v_total_sal NUMBER(10,2);
v_depto NUMBER;
v_qtd     INT;

BEGIN
v_depto := 100;
select sum(a.salary), count(*) qtd
    into v_total_sal, v_qtd
    from hr.employees a where a.department_id=v_depto;

dbms_output.put_line('TOTAL DO SALARIO DO DEPARTAMENTO '||v_depto||' é '||v_total_sal);
dbms_output.put_line('TOTAL DE COLABORADORES DO DEPARTAMENTO É '||v_qtd);
dbms_output.put_line('A Média de salario do departamento '||v_depto||' é '||round(v_total_sal / v_qtd,2));

END;