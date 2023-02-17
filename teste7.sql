create or replace function as f_aluno
on

select a.nome, a.id_aluno, b.id_disciplina, b.periodo, c.nome_disc
from alunos a
inner join matricula b
on a.id_aluno=b.id_aluno
inner join disciplina c
on b.id_disciplina=c.id_disciplina;

