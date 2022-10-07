-- Questão 1 --

-- Criar banco de dados
create database sprint1;
use sprint1;

-- Criar tabela
create table professor (
idProfessor int primary key auto_increment,
nome varchar (50),
sobrenome varchar (30),
especialidade1 varchar (40),
especialidade2 varchar (40)
);

-- Inserir dados
insert into professor (nome, sobrenome, especialidade1, especialidade2) values
('Clara', 'Xavier', 'Algoritimos', 'letras'),
('Caleb', 'Mendes', 'Inglês', 'letras'),
('João', 'Clarck', 'Banco de Dados', 'Geologia'),
('Alisson', 'Silva', 'Letras', 'Algoritimos'),
('Alice', 'Petrocine', 'espanhol', 'Algoritimos'),
('Adriana', 'Pereira', 'Geologia', 'Banco de Dados');

-- Exibir tabelas
select*from professor;

-- Criar tabela
create table Disciplina (
idDisc int primary key auto_increment,
nomeDisc varchar (45)
);

-- Inserir dados
insert into Disciplina (nomeDisc) values
('Matemática'),
('português'),
('Geografia');

-- Exibir tabelas
select*from Disciplina;
select*from professor;


-- Configurar a chave estrangeira --
alter table Disciplina add column FKprofessor int;
alter table Disciplina add foreign key (FKprofessor) references Professor (idProfessor);

-- Atualizar dados
update Disciplina set FKprofessor = '1' where idDisc = 1;
update Disciplina set FKprofessor = '2' where idDisc = 2;
update Disciplina set FKprofessor = '3' where idDisc = 3;

-- Unir as duas tabelas
select * from Disciplina join professor  on FKprofessor= idProfessor;

-- Exibir os professores e suas respectivas disciplinas --
select Disciplina.nomeDisc, professor.nome from Disciplina join Professor
  on FKprofessor= idProfessor;


-- Exibir apenas o nome da disciplina e o nome do respectivo professor --
select Disciplina.nomeDisc, professor.nome from Disciplina join Professor
  on FKprofessor= idProfessor where nome  = 'clara';

-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome --
select Disciplina.nomeDisc, professor.nome, professor.sobrenome from Disciplina join Professor
  on FKprofessor= idProfessor;

-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado professor, ordenado de forma crescente pela especialidade1 --
select Disciplina.nomeDisc, professor.especialidade1 from Disciplina join Professor
  on FKprofessor= idProfessor order by professor.especialidade1;
  
  

-- Questão 2 --

-- -- Criar tabela
create table Curso (
idCurso int primary key auto_increment,
nome varchar (50),
sigla varchar (3),
coordenador varchar (50)
);

-- Inserir dados
insert into curso (nome, sigla, coordenador) values
('Análise e desenvolvimento de sistemas', 'ads', 'Caio'),
('ciências da comunicação', 'cco', 'Alan'),
('Sistemas da informação', 'sis', 'Caleb');

-- -- Criar tabela
create table Aluno (
idAluno int primary key auto_increment,
nome varchar (60) not null,
email varchar (60), constraint chkemail check (email like ('%@%'))
);

insert into Aluno (nome,email) values 
('Alana','alana@gmail.com.br'),
('Maik','maick@gmail.com.br'),
('Clara','clara@gmail.com.br'),
('Lyan','lyan@gmail.com.br');

-- Exibir tabelas--
select* from aluno;
select* from curso;

-- Adicionar coluna fkaluno e foreign key
alter table aluno add column FKcurso int;
alter table aluno add foreign key (FKcurso) references curso (idCurso);

-- Atualizar dados
update aluno set FKcurso = 3 where idAluno = 1;
update aluno set FKcurso = 3 where idAluno = 2;
update aluno set FKcurso = 1 where idAluno = 3;
update aluno set FKcurso = 2 where idAluno = 4;

-- JOIN entre as duas tabelas
select * from aluno join curso  on FKcurso= idCurso;


-- JOIN com WHERE entre as duas tabelas
select aluno.nome, curso.nome from aluno join curso  on FKcurso= idCurso 
 where aluno.nome like '%a';
