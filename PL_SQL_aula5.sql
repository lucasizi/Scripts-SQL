-- exemplo mostrar quantidade de funcionario na tabela employees
set serveroutput on
declare
vcount integer;

begin
select count(*)
into vcount
from hr.employees;

dbms_output.put_line('Existem: '||to_char(vcount)||' Colaboradores cadastrados');


end;


-- print de data
DECLARE

    v_data date default sysdate;

BEGIN
    DBMS_OUTPUT.PUT_LINE('HOJE É '||V_DATA);
    
END;




-- CONTANDO DIAS DE VIDA
DECLARE 
    V_DATA_NASC DATE := '26/01/98';
    V_HOJE DATE DEFAULT SYSDATE;
    V_DIAS INT;

BEGIN
V_DIAS := V_HOJE - V_DATA_NASC;

DBMS_OUTPUT.PUT_LINE('ESTOU VIVO A: '||V_DIAS||' DIAS');

END;



