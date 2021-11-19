-- sistema para notas
SET SERVEROUTPUT ON

ACCEPT vnota_dig PROMPT 'DIGITE SUA NOTA'

DECLARE
    vnota INT;
BEGIN
    vnota := &vnota_dig;
    CASE vnota
        WHEN 10 THEN
            dbms_output.put_line('NOTA EXCELENTE');
        WHEN 9 THEN
            dbms_output.put_line('NOTA MUITO BOA');
        WHEN 8 THEN
            dbms_output.put_line('BOA NOTA');
        WHEN 7 THEN
            dbms_output.put_line('NOTA NA M�DIA');
        WHEN 6 THEN
            dbms_output.put_line('NOTA ABAIXO DA M�DIA');
        ELSE
            dbms_output.put_line('SEM CLASSIFICA��O DE NOTA');
    END CASE;

END;
        
-- sistema para notas COM EXCEPTION
SET SERVEROUTPUT ON

ACCEPT vnota_dig PROMPT 'DIGITE SUA NOTA'

DECLARE
    vnota INT;
BEGIN
    vnota := &vnota_dig;
    CASE vnota
        WHEN 10 THEN
            dbms_output.put_line('NOTA EXCELENTE');
        WHEN 9 THEN
            dbms_output.put_line('NOTA MUITO BOA');
        WHEN 8 THEN
            dbms_output.put_line('BOA NOTA');
        WHEN 7 THEN
            dbms_output.put_line('NOTA NA M�DIA');
        WHEN 6 THEN
            dbms_output.put_line('NOTA ABAIXO DA M�DIA');
    END CASE;

EXCEPTION
    WHEN case_not_found THEN
        dbms_output.put_line('SEM CLASSIFICA��O DE NOTA');
END; 