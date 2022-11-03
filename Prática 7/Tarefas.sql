-- Criar Banco De Dados
create database Aulas;

-- Selecionar Banco De Dados
use Aulas;

-- Criar Tabelas
create table grupo (
idGrupo int primary key auto_increment,
nomeDoGrupo varchar(45),
descricao varchar(45)
);

create table aluno (
ra int primary key,
nome varchar(45),
email varchar(45), constraint chkemail check (email like '%@%'),
fkGrupo int,
foreign key (fkGrupo) references grupo (idGrupo)
);


create table professor (
idProfessor int primary key auto_increment,
nome varchar (45),
disciplina varchar (45)
) auto_increment= 10000;


create table avaliacao (
fkgrupo int,
foreign key (fkgrupo) references grupo (idGrupo),
fkprofessor int,
foreign key (fkprofessor) references professor (idProfessor),
primary key (fkgrupo, fkprofessor),
DataHorário datetime,
nota decimal (4,2)
);

-- Inserir dados 

insert into grupo values
(null, 'GrandVinum', 'Controle de umidade e temperatura dos vinhos'),
(null, 'BrighTech', 'Controle de Luz');

insert into aluno values
(100, 'Mayra', 'mayra@gmail.com', '1'),
(101, 'Alan', 'alan@gmail.com', '1'),
(102, 'Clara', 'clara@gmail.com', '2'),
(103, 'Pietro', 'pietro@gmail.com', '2');

insert into professor values 
(null, 'Vivian','BD'),
(null, 'Fernanda','PI'),
(null, 'Paulo','BD');

insert into avaliacao values
(1,10000, '2022-06-10 23:18:12',9.70),
(1,10001, '2022-06-10 10:32:54',9.99),
(2,10001, '2022-06-10 12:43:43',8.80),
(2,10002, '2022-06-10 18:50:13',5.40);

-- Selecionar tabelas 
select*From aluno;
select*From grupo;
select*From professor;
select*From avaliacao;

-- 5) Exibir os dados dos grupos e os dados de seus respectivos alunos
select*from grupo as g join aluno as a on g.idGrupo = a.fkGrupo; 

-- 6)  Exibir os dados de um determinado grupo e os dados de seus respectivos alunos
select*from grupo as g join aluno as a on g.idGrupo = a.fkGrupo where idGrupo = 1;

-- 7) Exibir a média das notas atribuídas aos grupos, no geral
select avg(nota) 'Média das notas de todos os grupos' from avaliacao;

-- 8) Exibir a nota minima e máxima que foi atribuída aos grupos, no geral.
select min(nota) 'Nota minima', max(nota) 'Nota máxima' from avaliacao;

-- 9)Exibir a soma das notas dadas aos grupos, no geral
select sum(nota) 'Soma das notas'from avaliacao;

-- 10) Exibir os dados dos professores que avaliaram cada grupo , os dados dos grupos , a data e o horário das avaliações
select*from professor join avaliacao on idprofessor= fkprofessor join grupo on fkgrupo =idgrupo;

-- 11) Exibir os dados dos professores que avaliaram um determinado grupo , os dados dos grupos , a data e o horário das avaliações
select*from professor join avaliacao on idprofessor= fkprofessor join grupo on fkgrupo =idgrupo where idgrupo =1;

-- 12) Exibir o nome dos grupos que foram avaliados por um determinado professor
select nomeDoGrupo  as 'Grupos que foram avaliados pela professora Fernanda' from professor join avaliacao on idprofessor= fkprofessor join grupo on fkgrupo =idgrupo  where nome ='fernanda';

-- 13)Exibir os dados dos grupos , os dados dos alunos, os dados dos professores e a data e o horário das avaliações
select*from grupo as g join aluno as a on a.fkgrupo= g.idGrupo join avaliacao as av on av.fkgrupo = g.idgrupo;
 
-- 14) exibir a quantidade de notas distintas
select sum(distinct nota) from avaliacao;

-- 15) exibir a identificação dos professores, a média das notas e a soma das notas agrupadas por professor
select idProfessor as 'Identificaçao dos professores', avg(nota) as 'Média das notas', sum(nota) as 'Soma das notas' from  professor  join avaliacao on idprofessor= fkprofessor join grupo on fkgrupo =idgrupo group by idprofessor; 


-- 16)  exibir a identificação do grupo, a média das notas e a soma das notas agrupadas por grupo
select nomeDoGrupo as 'Identificaçao dos grupos', avg(nota) as 'Média das notas', sum(nota) as 'Soma das notas' from  professor  join avaliacao on idprofessor= fkprofessor join grupo on fkgrupo =idgrupo group by idgrupo; 

-- 17) Exibir a identificação do professor, a menor nota e a maior nota atribuída, agrupada por professor
select idProfessor as 'Identificaçao dos professores', min(nota) as 'Menor nota', max(nota) as 'Maior nota' from  professor  join avaliacao on idprofessor= fkprofessor join grupo on fkgrupo =idgrupo group by idprofessor; 

-- 18)  Exibir a identificação do grupo, a menor nota e a maior nota atribuída, agrupada por grupo
select nomeDoGrupo as 'Identificaçao dos grupos', min(nota) as 'Menor nota', max(nota) as 'Maior nota' from  professor  join avaliacao on idprofessor= fkprofessor join grupo on fkgrupo =idgrupo group by idgrupo; 
