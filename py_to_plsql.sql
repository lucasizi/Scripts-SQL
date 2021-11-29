/*

SCRIPT COM INTUITO DE FAZER OS DESAFIOS QUE IMAGINO.

*/

-- Desafio 1
-- Refazer o programa das casas em python para o PL/SQL (completo)
-- O programa serve para fazer um calculo simples e descobrir quanto tempo você levara para comprar uma casa
-- Ele pede o valor da casa em questão, seu salario e quantos porcento do seu salario vai querer economizar por mês.

SET SERVEROUTPUT ON

ACCEPT VCASA PROMPT 'INSIRA O VALOR DA CASA QUE DESEJA: '
ACCEPT VSALARIO PROMPT 'DIGITE SEU SALARIO: '
ACCEPT VECONOMIA PROMPT 'QUANTOS PORCENTO QUER ECONOMIZAR POR MES: '

DECLARE

    vcasa1     FLOAT;
    vanos      FLOAT;
    vsalario1  FLOAT;
    veconomia1 FLOAT;
    vbanco     FLOAT;
    vconta     FLOAT DEFAULT 1;
    vmeses     FLOAT;
BEGIN
    vcasa1 := &vcasa;
    vsalario1 := &vsalario;
    veconomia1 := &veconomia;
    vbanco := 0;

    WHILE vbanco < vcasa1 LOOP
        vbanco := vbanco + (veconomia1 * vsalario1 / 100);
        VCONTA := VCONTA + 1;
    END LOOP;


    vanos := trunc(vconta/12);
    vmeses := (vconta)-trunc(vanos*12);
    
    dbms_output.put_line('--------------------------------------------------------');
    dbms_output.put_line('Deste modo as parcelas ficam em '||vconta||'x de R$'||veconomia1 * vsalario1 / 100);
    if vconta = 1 THEN
        dbms_output.put_line('Voce levara '||vconta||' mes para comprar sua casa');

        ELSIF vconta > 1 and vconta < 12 THEN
            dbms_output.put_line('Voce levara '||vconta||' meses para comprar sua casa');

        ELSIF vconta = 12 THEN
            dbms_output.put_line('Voce levara '||vanos||' ano para comprar sua casa');

        ELSIF vconta > 12 and vconta < 24 THEN
            dbms_output.put_line('Voce levara '||vanos||' ano e '||vmeses||' meses para comprar sua casa');

        ELSIF vconta >= 24 and vmeses = 0 THEN
            dbms_output.put_line('Voce levara '||vanos||' anos para comprar sua casa');

        ELSIF vconta >= 24 and vmeses >= 1 THEN
            dbms_output.put_line('Voce levara '||vanos||' anos e '||vmeses||' meses para comprar sua casa');
    END IF;

    if vbanco > vcasa1 THEN
        dbms_output.put_line('E ainda sobram R$'||vbanco-vcasa1||' da sua economia na ultima parcela');
    END IF;
    
    dbms_output.put_line('--------------------------------------------------------');
END;


-- criar "Gerador de desculpas", onde a pessoa entra com uma data e o programa gera uma desculpa aleatoria
-- exemplo "no dia 25/05/2022 eu terei uma consulta médica" / "no dia 25/05/2022 eu terei uma reunião importante"