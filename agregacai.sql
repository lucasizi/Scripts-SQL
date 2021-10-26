--AVG retorna a média dos valores em um grupo. valores nulos são ignorados.

select * from senso;

select AVG(populacao) as media from senso where ano = '2014';


-- AVG média por estado

select estado, avg(populacao) from senso
where ano ='2014'
group by estado
order by 2 desc;

--AVG média por estado com sigla estado
select a.estado, a.cod_uf, b.sigla_uf, avg(a.populacao) media
from senso a inner join uf b
on a.cod_uf = b.cod_uf
where ano = '2014'
group by a.estado, a.cod_uf, b.sigla_uf
order by 1;

--avg por regiao

select a.regiao, avg(a.populacao)
from senso a
where a.ano='2014'
group by a.regiao
order by 2 desc;


-- MIN retorna o valor minimo na expressão. Pode ser usado seguido de OVER

select min(a.populacao) from senso a
where a.ano='2014';

-- MIN por cidade
select a.nome_mun, a.estado, min(a.populacao) from senso a
where a.ano='2014'
group by a.nome_mun, a.estado
order by 3 desc;

-- count renorta o numero de itens de um grupo

select count(*) from senso a where a.ano='2014';

-- count retorna o numero de cidades por ano
select a.ano, count(*) qtd_cidades from senso a group by a.ano order by 1 asc;


-- descrobrir a quantidade de estados

select count(DISTINCT cod_uf) qtd_estados from senso;

-- quantidade de cidades em cada estado
select sum(populacao) população, count(distinct nome_mun) qtd_cidades, estado
from senso
where ano = '2014'
group by estado
order by 2 desc;

-- quantidade de cidades por região
select a.regiao, count(*) from senso a
where ano ='2014'
group by regiao
order by 2 desc;

-- informações da região
select a.estado
,avg(a.populacao)
,min(a.populacao)
,max(a.populacao)
,sum(a.populacao)
,count(*) qtd_cidades
from senso a
where ano ='2014'
group by a.estado
order by 6 desc;


-- apresentar nome da cidade com maior população de cada estados

select a.estado, a.nome_mun, a.populacao
from
(
    select b.estado, max(b.populacao) as populacao from senso b
    where b.ano='2014'
    group by b.estado
) b
join senso a
on a.estado = b.estado
and a.populacao = b.populacao
where a.ano='2014'
order by a.populacao desc;


-- apresentar nome da cidade com menor população de cada estados

select a.estado, a.nome_mun, a.populacao
from
(
    select b.estado, min(b.populacao) as populacao from senso b
    where b.ano='2014'
    group by b.estado
) b
join senso a
on a.estado = b.estado
and a.populacao = b.populacao
where a.ano='2014'
order by a.populacao desc;

-- comparando crescimento pop das cidades referentes a 2010 a 2014
select a.nome_mun, a.populacao as senso_2010, b.populacao as senso_2014, (100/a.populacao)*(b.populacao)-100 as percentual
from senso a
inner join senso b
on a.cod_mun=a.cod_mun
where a.ano='2010'
and b.ano='2014'
order by 4 desc;

-- comparando crescimento populacao por estado ref 2010 a 2014
select a.estado,
    sum(a.populacao) as senso_2010,
    sum(b.populacao) as senso_2014,
    (100/sum(a.populacao))*(sum(b.populacao))-100 as percentual
from senso a
inner join senso b
on a.cod_mun=b.cod_mun
where a.ano='2010'
and b.ano='2014'
group by a.estado
order by 4 desc;