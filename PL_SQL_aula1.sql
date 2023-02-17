 -- Declarando variaveis
-- Adote padr�es para dar nomes a variaveis. Por exemplo, vFrase para representar uma variavel e vFrase para representar uma vari�vel de cole��o.
-- Se usar uma vari�vel NOT NULL, inicie cm algum valor v�lido;
-- Declarar uma vari�vel que facilite a leitura e manuten��o do c�digo;
-- N�o utilizar uma variav�l com o mesmo nome de uma coluna de tabela referenciada no bloco

-- Dica; Para iniciar uma vari�vel voc� pode utilizar o operador " := " ou a palavra chave DEFAULT, como nos exemplos abaixo;

vFrase varchar2(30) := 'Hello World';

-- ou 

vFrase varchar2(30) DEFAULT 'Hello World';

-- Declara��o

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

dbms_output.put_line('TOTAL DO SALARIO DO DEPARTAMENTO '||v_depto||' � '||v_total_sal);
dbms_output.put_line('TOTAL DE COLABORADORES DO DEPARTAMENTO � '||v_qtd);
dbms_output.put_line('A M�dia de salario do departamento '||v_depto||' � '||round(v_total_sal / v_qtd,2));

END;