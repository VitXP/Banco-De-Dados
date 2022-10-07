-- Questão 1

-- Criar Banco de Dados --
Create database sprint1;

-- Selecionar Banco de dados--
use sprint1;

-- Criar tabela --
Create table Atleta (
IdAtleta int primary key,
Nome varchar (40),
Modalidade varchar (40),
qtdMedalha int
);

-- Selecionar Tablela--
Select * from atleta;

-- Inserir Dados--
Insert into atleta values
(1020, 'Alan', 'Natação', 2);

insert into atleta values
(1021, 'Paulo', 'Natação', 4),
(1022, 'Sarah', 'Vôlei', 6),
(1023, 'Sandra', 'Vôlei', 8),
(1024, 'Klara', 'Atletismo', 2),
(1025, 'Kiara', 'Atletismo', 10);

-- Selecionar Todos os dados da Tabela--
Select * from atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas --
select nome, qtdmedalha from atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade. --
select * from atleta
 where modalidade = 'atletismo';
 
 -- Exibir os dados da tabela ordenados pela modalidade --
 select * from atleta order by modalidade;
 
 --  Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente --
select * from atleta order by qtdMedalha desc;

--  Exibir os dados da tabela, dos atletas cujo nome contenha a letra s --
select * from atleta
 where nome like '%s%';
 
 -- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra. --
 select * from atleta
 where nome like 'k%';
 
 --  Exibir os dados da tabela, dos atletas cujo nome termine com a letra o. --
 select * from atleta
 where nome like '%o';
 
 -- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r. --
 select * from atleta
 where nome like '%r_';
 
 -- Eliminar a tabela --
 Drop table atleta;


-- Questão 2

-- Criar Banco de Dados --
create database sprint1;

-- Selecionar Banco de Dados Sprint1 --
use sprint1;

-- Criar Tabela --
create table Musica (
idMusica int primary key,
titulo varchar (40),
artista varchar (40),
genero varchar(40)
);

-- Inserir Dados --
insert into Musica values
(1011, 'Bones', 'Imagine Dragons', 'Pop Rock'),
(1012, 'Thunder', 'Imagine Dragons', 'Pop Rock'),
(1013, 'Count on Me', 'Bruno Mars', 'Pop'),
(1014, 'When I Was Your Man', 'Bruno Mars', 'Pop'),
(1015, 'Jesus Meu Guia É', 'Raiz Coral', 'Gospel'),
(1016, 'Tocou-me', 'Raiz Coral', 'Gospel'),
(1017, 'Everything sucks', 'Vaultboy', 'Pop'),
(1018, 'Supera', 'Marília Mendonça', 'Sertanejo');

-- Exibir todos os dados da tabela --
select * from Musica;

-- Exibir apenas os títulos e os artistas das músicas --
select titulo, artista from Musica;

-- Exibir apenas os dados das músicas de um determinado gênero --
select * from Musica
 where genero = 'Pop';
 
 -- Exibir apenas os dados das músicas de um determinado artista --
 select * from Musica
 where artista = 'Imagine Dragons';
 
 -- Exibir os dados da tabela ordenados pelo título da música --
 Select * from musica order by titulo;
 
 -- Exibir os dados da tabela ordenados pelo artista em ordem decrescente --
 select * from musica order by artista desc;
 
 -- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra --
 Select * from musica
  where titulo like 'w%';
  
  -- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra --
  select * from musica
  where artista like '%a';
  
-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra --
select * from musica
where genero like '_o%';

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra --
select * from musica
 where titulo like '%k_';
 
 --  Elimine a tabela --
 drop table musica;
  
-- Questão 3

 -- Criar Banco de Dados --
create database sprint1;

-- Selecionar Banco de Dados Sprint1 --
use sprint1;

-- Criar Tabela --
create table Filme (
idFilme int primary key,
título varchar (50),
genero varchar (40),
diretor varchar (40)
);

-- Selecionar Tabela -- 
select * from Filme;

-- Inserir Dados --
insert into Filme values
(11, 'A Origem dos Guardiões', 'Aventura', 'Peter Ramsey'),
(12, 'Shang-Chi e a Lenda dos Dez Anéis', 'Ação', 'Destin Cretton'),
(13, 'Thor: Ragnarok', 'Ação', 'Taika Waititi'),
(14, 'A Culpa É das Estrelas', 'Romance', 'Josh Boone'),
(15, 'Jumanji 2', 'Aventura', 'Jake Kasdan'),
(16, 'A Cinco Passos de Você', 'Romance', 'Justin Baldoni'),
(17, 'Annabelle', 'Terror', 'John R. Leonetti');
 
-- Exibir todos os dados da tabela. --
select  * from filme;

-- Exibir apenas os títulos e os diretores dos filmes --
select título, diretor from filme; 

-- Exibir apenas os dados dos filmes de um determinado gênero --
select * from filme
 where genero = 'Romance';
 
 -- Exibir apenas os dados dos filmes de um determinado diretor --
 select * from filme
  where diretor = 'Peter Ramsey';
  
  -- Exibir os dados da tabela ordenados pelo título do filme --
  select * from filme order by título;
  
  -- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente --
  select * from filme order by diretor desc;
  
  -- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra --
  select * from filme
   where título like 'A%';
   
  -- Exibir os dados da tabela, dos filmes cujo artista (Diretor) termine com uma determinada letra --
   select * from filme
    where diretor like '%i';
    
  -- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra --
  select * from filme
 where genero like '_o%';
 
 -- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra --
  select * from filme
   where título like '%l_';
   
   -- Elimine a tabela --
   Drop table Filme;

-- Questão 4

-- Criar Banco De Dados --
create database sprint1;

-- Selecionar Banco De Dados --
use sprint1;

-- Criar Tabela --
create table Professor (
 idProfessor int primary key,
 nome varchar (40),
 especialidade varchar (40),
 dtNasc date
 );
 
 -- Inserir dados na tabela --
 insert into Professor values
 (1, 'Valdemir', 'Matemática', '1978-09-18'),
 (2, 'Maria', 'Matemática', '1967-02-10'),
 (3, 'Klara', 'Filosofia', '2001-04-11'),
 (4, 'Nilton', 'Filosofia', '1994-12-28'),
 (5, 'Lindaura', 'Sociologia', '1987-07-10'),
 (6, 'Marta', 'Sociologia', '1987-01-31'),
 (7, 'Darsi', 'Português', '1987-11-30');
  
  -- Exibir todos os dados da tabela --
 select * from Professor;
 
 -- Exibir apenas as especialidades dos professores --
 select especialidade from professor;
 
 -- Exibir apenas os dados dos professores de uma determinada especialidade --
select * from professor
where especialidade = 'Filosofia';

-- Exibir os dados da tabela ordenados pelo nome do professor --
Select * from professor order by nome;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente --
select * from professor order by nome desc;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra --
select * from professor
 where nome like 'D%';
 
 -- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra --
 select * from professor
  where nome like '%r';
  
  -- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra --
  select * from professor
   where nome like '_l%';
   
   -- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra --
   select * from professor
    where nome like '%r_';
    
    -- Elimine a tabela --
    Drop table professor;

-- Questão 5

-- Criar bancco de dados --
create database sprint1;

-- Selecionar Tabela --
use sprint1;

-- Criar Tabela --
create table Curso (
idCurso int primary key auto_increment,
nome varchar (50),
sigla varchar (3),
coordenador varchar (50)
);

-- Inserir dados na tabela --
insert into Curso (nome, sigla, coordenador) values
('Vitor', 'ADS', 'Rose'),
('Clara', 'ADS', 'Rose'),
('Marcelo', 'CCO', 'Fernanda'),
('João', 'CCO', 'Fernanda'),
('Alfredo', 'SSI', 'Claúdio'),
('Lethicia', 'SSI', 'Claúdio'),
('Lívia', 'ADS', 'Claúdio');

-- Selecionar toda tabela --
select* from Curso;

-- Exibir apenas os coordenadores dos cursos --
select coordenador from curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla --
select* from curso
 where sigla = 'ADS';
 
 -- Exibir os dados da tabela ordenados pelo nome do curso --
select* from curso order by sigla;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente --
select* from curso order by coordenador desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra --
select* from curso
 where nome like 'v%';
 
 
-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra --
select* from curso
where nome like '%o';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra --
select* from curso
where nome like '_a%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra --
select* from curso
 where nome like '%i_';
 
 -- Elimine a tabela --
 drop table curso;

-- Questão 6

-- Criar database --
create database sprint1;

-- Selecionar database --
use sprint1;

-- Criar tabela --
create table Revista (
idRevista int primary key auto_increment,
nome varchar (40),
categoria varchar (30)
);

-- inserir dados na tabela --
insert into Revista (nome, categoria) values
('Maria', 'Moda'),
('Rose', 'Esporte'),
('Caleb', 'Drama'),
('Zayan', 'Eventos');

-- Exibir todos os dados da tabela --
select * from Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente --
update revista set categoria= 'Musical'
  where idRevista =1;

update revista set categoria= 'Drama'
 where idRevista =2;
 
 update Revista set categoria ='Esporte'
 where idRevista =3;
 
-- Insira mais 3 registros completos --
insert into Revista (nome, categoria) values
('Lucas','Eventos'),
('Julia','Moda'),
('Alan','Esporte');

-- Exibir novamente os dados da tabela --
select* from Revista;

-- Exibir a descrição da estrutura da tabela --
desc Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres --
alter table Revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria --
desc Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15) --
alter table Revista add column periodicidade varchar (15);

-- Exibir os dados da tabela --
desc Revista;

-- Excluir a coluna periodicidade da tabela --
alter table Revista drop column periodicidade;

-- Excluir banco de dados --
drop database sprint1;












  


 
 



 




 
 

 
 

 
