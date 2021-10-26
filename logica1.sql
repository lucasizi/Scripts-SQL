/*criação da tabelas senso */
CREATE TABLE senso
 (
ano INT NOT NULL,
cod_uf CHAR(2) NOT NULL,
estado VARCHAR2(50) NOT NULL,
cod_mun CHAR(7) NOT NULL,
nome_mun VARCHAR2(50) NOT NULL,
regiao VARCHAR2(150),
cod_meso_reg CHAR(4),
nome_meso_reg VARCHAR2(100) NOT NULL,
cod_mic_reg CHAR(5) NOT NULL,
nome_min_reg VARCHAR2(50) NOT NULL,
pib DECIMAL(12,3) NOT NULL,
populacao INTEGER NOT NULL,
pib_per_cap DECIMAL(12,3) NOT NULL
);


CREATE TABLE uf
(cod_uf CHAR(2) NOT NULL PRIMARY KEY,
 sigla_uf CHAR(2) NOT NULL,
 estado VARCHAR2(50) NOT NULL
);



select * from senso;

select * from uf;


-- operador where
select * from senso where nome_mun = 'Jundiaí'
and ano = '2014';


-- operador AND
SELECT * FROM SENSO WHERE COD_UF = '35' AND POPULACAO >50000 AND ANO = '2014' ORDER BY cod_mun ASC;

--OPERADOR BETWEEN
select * from senso where cod_uf ='35' and populacao between 5000 and 10000 and ano ='2014' order by populacao asc;

--operador in
select * from senso where cod_uf in ('35','12') and ano = '2014';

-- not in
select * from senso where cod_uf not in ('35','12') and ano ='2014';


-- operador like (que contenha "or" em qualquer lugar
select * from senso where nome_mun like ('%or%') and ano = '2014';

	
-- LIKE Encontra quaisquer valores que tenham "r" na segunda posição
select * from senso where nome_mun like ('_r%') and ano = '2014';
		
	
        
-- LIKE Localiza valores que começam com "A" e termina com "o"
select * from senso where nome_mun like ('A%o') and ano = '2014';
	

-- LIKE Localiza valores que começam com "A"
select * from senso where nome_mun like ('A%') and ano = '2014';

		
-- OPERADOR LIKE CORINGA __
select * from senso where nome_mun like ('_ra%') and ano = '2014';
	
-- OPERADOR NOT
	select ano, cod_uf, estado, nome_mun, populacao from senso where nome_mun not like ('A%')
    and cod_uf='35'
    and not populacao < 40000
    and ano = '2014'
    order by nome_mun asc;

	
	select ano,cod_uf,estado,nome_mun,populacao from senso
	where nome_mun not like ('A%')
	and cod_uf='35'
	and not populacao>40000
	and ano='2014';
	
	-- OPERADOR OR
	select * from senso
    where nome_mun like ('A%')
    and (cod_uf = '35' or cod_uf='15');
    
	
-- evidencia de erro	
	select * from senso
	where nome_mun like ('A%')
	and cod_uf='35' 
	and cod_uf='15';
	
  
	-- OPERADOR IS NOT NULL
	select * from senso
	where regiao is not null;


	-- OPERADOR IS NULL
	select * from senso
	where regiao is null;


	-- OPERADOR HAVING
    
    select cod_uf, estado, count(*) as qtd from senso
    where ano = '2014'
    group by cod_uf, estado having count(cod_mun) > 500;
    



	-- OPERADOR HAVING
	select cod_uf,estado,count(*)qtd
	from senso
	where ano='2014'
	group by cod_uf,estado having count(cod_mun)<=500
    order by 3 desc ;


	-- OPERADOR HAVING
    select cod_uf, estado, count(cod_mun) as qtd, sum (populacao)
    from senso
    where ano ='2014'
    group by cod_uf, estado having sum(populacao) > 5000000;

    
    select cod_uf, estado, count(cod_mun) as qtd_cidades, sum(populacao) as populacao
    from senso
    where ano = '2014'
    group by cod_uf, estado
    order by qtd_cidades desc;

	
	select cod_uf,estado,count(cod_mun)qtd,
	              sum(populacao)
	from senso
	where ano='2014'
	group by cod_uf,estado having sum(populacao)>5000000;
	
	
	-- OPERADOR HAVING
	
	select cod_uf,estado,count(cod_mun)qtd,
	              sum(populacao)
	from senso
	where ano='2014'
	group by cod_uf,estado having sum(populacao)<5000000;



-- outros exemplos extra aula

SELECT a.EMPLOYEE_ID, a.FIRST_NAME,a.JOB_ID, a.SALARY
FROM HR.EMPLOYEES a
WHERE a.SALARY BETWEEN 1000 AND 20000
AND a.JOB_ID = 'ST_CLERK';


SELECT a.EMPLOYEE_ID, a.FIRST_NAME,a.JOB_ID, a.SALARY
FROM HR.EMPLOYEES a
WHERE a.SALARY BETWEEN 1000 AND 5000
OR a.JOB_ID = 'ST_CLERK';

SELECT a.EMPLOYEE_ID, a.FIRST_NAME,a.JOB_ID, a.SALARY
FROM HR.EMPLOYEES a
WHERE a.SALARY > 1500
AND (a.JOB_ID = 'ST_MAN'
OR a.JOB_ID = 'SA_REP');
