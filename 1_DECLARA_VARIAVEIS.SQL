SET SERVEROUTPUT ON
DECLARE

    v_tot_sal NUMBER(10,2);
    v_depto NUMBER;
    v_qtd int;

BEGIN
v_depto:=&v_depto;
SELECT SUM(A.salary),count(*) qtd
  INTO v_tot_sal,v_qtd
  FROM hr.employees A WHERE A.department_id=v_depto;
 
 
    dbms_output.put_line('Soma total todos de salario do depto: Nº'||v_depto||' é R$'||v_tot_sal);

    IF (v_qtd = 1)THEN
        dbms_output.put_line('O total de Colaboradores nesse Departamente é apenas 1');
    ELSE  
        dbms_output.put_line('Total de Colaboradores são  '||v_qtd);
    END IF;

END;
