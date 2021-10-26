CREATE TABLE funcionario
( 
matricula int   not null    primary key,
nome    varchar2(50) not null,
sobrenome   varchar2(50) not null,
endereco     varchar2(50),
cidade   varchar2(50),
pais     varchar2(50),
data_nasc   date
);

create sequence id_func2
start with 1
increment by 1
nocache;

CREATE TABLE salario
(
matricula   int not null,
salario DECIMAL(10,2) not null,
foreign key(matricula) references funcionario(matricula)
);

create table audit_salario
(
transacao   int not null,
matricula   int not null,
data_trans  timestamp   not null,
sal_antigo  decimal(10,2),
sal_novo    decimal(10,2),
usuario varchar2(20)    not null,
primary key(transacao),
foreign key(matricula) references funcionario(matricula)
);


create sequence id_tran
start with 1
increment by 1
nocache;


create index ix_func1    on funcionario(data_nasc);

create index ix_func2   on funcionario(cidade,pais);


alter table funcionario add genero char(1);

alter table funcionario rename column genero to sexo;

alter table funcionario modify sexo varchar(1);
