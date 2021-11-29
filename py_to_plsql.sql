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


    vanos := (vconta/12);
    vmeses := (vconta)-(vanos*12);
    
    dbms_output.put_line('vconta: '||vconta);
    dbms_output.put_line('vanos: '||vanos);
    dbms_output.put_line('vmeses: '||vmeses);
    
    if vconta = 1 THEN
        dbms_output.put_line('Voce levara '||vconta||' mes para comprar sua casa');

        ELSIF vconta > 1 and vconta < 12 THEN
            dbms_output.put_line('Voce levara '||vconta||' meses para comprar sua casa');

        ELSIF vconta = 12 THEN
            dbms_output.put_line('Voce levara '||vanos||' ano para comprar sua casa');

        ELSIF vconta > 12 and vconta < 24 THEN
            dbms_output.put_line('Voce levara '||vanos||' ano e '||vmeses|| 'meses para comprar sua casa');

        ELSIF vconta >= 24 and vmeses = 0 THEN
            dbms_output.put_line('Voce levara '||vanos||' anos para comprar sua casa');

        ELSIF vconta >= 24 and vmeses >= 1 THEN
            dbms_output.put_line('Voce levara '||vanos||'anos e '||vmeses||' mese para comprar sua casa');
    END IF;

    if vbanco > vcasa1 THEN
        dbms_output.put_line('E ainda sobram: '||(vbanco-vcasa1)||' da sua economia na ultima parcela');
    END IF;
END;

SELECT CAST(319/12 as numeric) FROM DUAL;

/* Faltam poucas coisas para serem corrigidas agora
    Tought; Passar o primeiro vconta dos prints para numero inteiro
    talvez o cast(vonta) as integer, faça isso.
    cast (vconta) as integer / 12
    ou algo assim...
    O proximo é mais complicado, transformar o resto da divisão em meses.
*/

-- criar "Gerador de desculpas", onde a pessoa entra com uma data e o programa gera uma desculpa aleatoria
-- exemplo "no dia 25/05/2022 eu terei uma consulta médica" / "no dia 25/05/2022 eu terei uma reunião importante"