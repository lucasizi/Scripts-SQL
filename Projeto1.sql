-- fazer um programa que imprima o cada letra do funcionario at� completar o nome completo
SET SERVEROUTPUT ON

DECLARE
V_NOME HR.EMPLOYEES.FIRST_NAME%TYPE;
V_COUNT INT DEFAULT 0;
--IDEIA: CRIAR CONTADOR E USA-LO PARA DEFINIR A QUANTIDADE DE LETRA QUE VAI SER USADO.
BEGIN
V_COUNT:=V_COUNT+1;
FOR I IN 1..10 LOOP
DBMS_OUTPUT.PUT_LINE();