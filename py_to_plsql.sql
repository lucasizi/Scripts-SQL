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
    vconta     INT DEFAULT 1;
BEGIN
    vcasa1 := &vcasa;
    vsalario1 := &vsalario;
    veconomia1 := &veconomia;
    vbanco := 0;

    WHILE vbanco < vcasa1 LOOP
        vbanco := vbanco + (veconomia1 * vsalario1 / 100);
        VCONTA := VCONTA + 1;
    END LOOP;

    vanos := (vconta/12);

    if vconta = 1 THEN
        dbms_output.put_line('Voce levara '||vconta||' mes para comprar sua casa');

        ELSIF vconta > 1 and vconta < 12 THEN
            dbms_output.put_line('Voce levara '||vconta||'meses para comprar sua casa');

        ELSIF vconta = 12 THEN
            dbms_output.put_line('Voce levara '||vconta/12||'ano para comprar sua casa');

        ELSIF vconta > 12 and vconta < 24 THEN
            dbms_output.put_line('Voce levara '||(vconta/12)||'ano e '||(((vconta/12) - (vconta)) * 12)|| 'meses para comprar sua casa');

        ELSIF vconta >= 24 and ROUND(vconta/12)= 0 THEN
            dbms_output.put_line('Voce levara '||(vconta/12)||' anos para comprar sua casa');

        ELSIF vconta >= 24 and ROUND(vconta/12) != 0 THEN
            dbms_output.put_line('Voce levara '||(vconta/12)||'anos e '||(((vconta/12) - (vconta)) * 12)|| 'meses para comprar sua casa');
    END IF;

    if vbanco > vcasa1 THEN
        dbms_output.put_line('E ainda sobram: '||(vbanco-vcasa1)|| 'da sua economia na ultima parcela');
    END IF;
END;

/* Faltam poucas coisas para serem corrigidas agora
    Tought; Passar o primeiro vconta dos prints para numero inteiro
    talvez o cast(vonta) as integer, faça isso.
    cast (vconta) as integer / 12
    ou algo assim...
    O proximo é mais complicado, transformar o resto da divisão em meses.
*/