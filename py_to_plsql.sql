/*

SCRIPT COM INTUITO DE FAZER OS DESAFIOS QUE IMAGINO.

*/

-- Desafio 1
-- Refazer o programa das casas em python para o PL/SQL (INCOMPLETO)
SET SERVEROUTPUT ON

ACCEPT VCASA PROMPT 'INSIRA O VALOR DA CASA QUE DESEJA: '
ACCEPT VSALARIO PROMPT 'DIGITE SEU SALARIO: '
ACCEPT VECONOMIA PROMPT 'QUANTOS PORCENTO QUER ECONOMIZAR POR MES: '

DECLARE

    vcasa1     INT;
    vanos      FLOAT;
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

    vanos := (count/12);

    if vcount = 1 THEN
        dbms_output.put_line('Voce levara '||VCOUNT||' mes para comprar sua casa');

        ELSIF vcount > 1 and vcount < 12 THEN
            dbms_output.put_line('Voce levara '||VCOUNT||'meses para comprar sua casa');

        ELSIF vcount = 12 THEN
            dbms_output.put_line('Voce levara '||VCOUNT/12||'ano para comprar sua casa');

        ELSIF vcount > 12 and vcount < 24 THEN
            dbms_output.put_line('Voce levara '||((VCOUNT/12))||'ano e '||(((VCOUNT/12) - (vanos)) * 12)|| 'meses para comprar sua casa');

        ELSIF vcount >= 24 and ROUND(VCOUNT/12)= 0 THEN
            dbms_output.put_line('Voce levara '||((VCOUNT/12))||' anos para comprar sua casa');

        ELSIF vcount >= 24 and ROUND(VCOUNT/12) != 0 THEN
            dbms_output.put_line('Voce levara '||((VCOUNT/12))||'anos e '||(((VCOUNT/12) - (vanos)) * 12)|| 'meses para comprar sua casa');
    END IF;

    if vbanco > vcasa1 THEN
        dbms_output.put_line('E ainda sobram: '||(vbanco-vcasa1)|| 'da sua economia na ultima parcela');
    END IF;
END;