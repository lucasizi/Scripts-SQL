--Criação tabela 

create table alunos
(
id_aluno   int not null,
nome    varchar(20) not null,
primary key(id_aluno)
);

create table disciplina
(
id_disciplina   int not null,
nome_disc   varchar2(20),
primary key(id_disciplina)
);


create table matricula
(
id_aluno   int not null,
id_disciplina   int not null,
periodo varchar2(10),
primary key (id_aluno, id_disciplina),
foreign key (id_aluno) references alunos(id_aluno),
foreign key(id_disciplina) references disciplina(id_disciplina)
);

insert into alunos (id_aluno, nome) values(1,'Joao');
insert into alunos (id_aluno, nome) values(2,'Maria');
insert into alunos (id_aluno, nome) values(3,'Pedro');
insert into alunos (id_aluno, nome) values(4,'Tiago');
insert into alunos (id_aluno, nome) values(5,'Henrique');

insert into disciplina (id_disciplina, nome_disc) values (1,'Fisica');
insert into disciplina (id_disciplina, nome_disc) values (2,'Quimica');
insert into disciplina (id_disciplina, nome_disc) values (3,'Matematica');
insert into disciplina (id_disciplina, nome_disc) values (4,'Banco de Dados');
insert into disciplina (id_disciplina, nome_disc) values (5,'Programação');

insert into matricula values ('1','1','Noturno');
insert into matricula values ('1','2','Vesperino');
insert into matricula values ('1','3','Matutino');

insert into matricula values ('2','3','Noturno');
insert into matricula values ('2','4','Noturno');

insert into matricula values ('3','1','Noturno');
insert into matricula values ('3','3','Noturno');
insert into matricula values ('3','4','Noturno');

insert into matricula values ('5','1','Matutino');
insert into matricula values ('5','2','Vesperino');
insert into matricula values ('5','4','Noturno');

--Inner join
select a.id_aluno, a.nome, d.nome_disc, m.periodo
from alunos a
inner join matricula m
    on a.id_aluno = m.id_aluno
inner join disciplina d
    on m.id_disciplina = d.id_disciplina
        order by a.nome;
        
-- inner join com group by

select a.id_aluno, a.nome, count(d.id_disciplina) as qtd_disciplinas, count(m.periodo) as qtd_periodo
    from alunos a
    inner join matricula m
    on a.id_aluno = m.id_aluno
inner join disciplina d
    on m.id_disciplina = d.id_disciplina
    group by a.id_aluno, a.nome;
    
    
select a.employee_id, a.first_name, b.department_name, c.job_title
from HR.employees a
inner join HR.departments b on a.department_id = b.department_id
inner join HR.jobs c on a.job_id = c.job_id
order by 1;

-- Right join
select a.id_aluno, a.nome, d.nome_disc, m.periodo
from alunos a
right join matricula m
    on a.id_aluno = m.id_aluno
right join disciplina d
    on m.id_disciplina = d.id_disciplina
        order by a.nome;
        
        
-- left join
select a.id_aluno, a.nome, d.nome_disc, m.periodo
from alunos a
left join matricula m
    on a.id_aluno = m.id_aluno
left join disciplina d
    on m.id_disciplina = d.id_disciplina
        order by a.nome;
        
-- full join
select a.id_aluno, a.nome, d.nome_disc, m.periodo
from alunos a
full join matricula m
    on a.id_aluno = m.id_aluno
full join disciplina d
    on m.id_disciplina = d.id_disciplina
        order by a.nome;