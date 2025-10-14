CREATE TABLE Unidade (
codunidade int,
nomunidade varchar(100),
PRIMARY KEY(codunidade));

CREATE TABLE Area (
codarea int,
nomarea varchar(50),
PRIMARY KEY (codarea));

CREATE TABLE Curso (
codcurso int,
nomcurso varchar(100),
codunidade int,
codarea int,
PRIMARY KEY (codcurso),
FOREIGN KEY(codarea) REFERENCES
Area(codarea),
FOREIGN KEY(codunidade)
REFERENCES
Unidade (codunidade));

CREATE TABLE Aluno (
codaluno int,
nomaluno varchar(100),
codcurso int,
PRIMARY KEY (codaluno),
FOREIGN KEY (codcurso) REFERENCES
Curso (codcurso));

CREATE TABLE Disciplina (
coddisci int,
nomdisci varchar(50),
PRIMARY KEY (coddisci));

CREATE TABLE Histórico (
codaluno int,
coddisci int,
semestre int,
nota numeric(5,2),
PRIMARY KEY (codaluno,coddisci,semestre),
FOREIGN KEY(codaluno) REFERENCES
Aluno (codaluno),
FOREIGN KEY(coddisci) REFERENCES
Disciplina (coddisci));

-- Listar os nomes dos alunos que estão matriculados em algum curso
-- mas que ainda não estão cursando disciplinas

select nomaluno, nomcurso
	from aluno, curso
	where aluno.codcurso = curso.codcurso
	and not exists (
    select *
    from historico
    where historico.codaluno = aluno.codaluno
);

-- criar uma visão que contenha os nomes dos cursos com mais de 200 

select nomcurso, count (*) from curso, aluno
	where aluno.codcurso = curso.codcurso
	group by nomcurso
	having count (*) >200;
