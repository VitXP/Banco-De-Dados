-- Questão 1 --

-- Crie um banco de dados chamado Sprint2 --
create database sprint2;

-- Use o banco de dados Sprint2 --
use sprint2;

-- Criar a tabela --
create table Atleta (
idAtleta int primary key auto_increment,
nome varchar (40),
modalidade varchar (40),
qtdMedalha int
);

-- Inserir dados --
insert  into atleta (nome, modalidade, qtdmedalha) values
('Vitor','futebol', 100),
('Julia','volêi', 2),
('Lucas','Basquete', 8),
('Giovanna','Basquete', 35),
('Sara','volêi', 5),
('Ryan','futebol', 5);

-- Selecionar tabela --
select*from atleta;

create table País (
idPais int primary key auto_increment,
nome varchar (30),
capital varchar (40)
);

-- Inserir países --
insert into país (nome, capital) values
('Brasil', 'Brasília'),
('Canadá', 'Ottawa'),
('Inglaterra', 'Londres'),
('EUA', 'Washington');

select*from país;

-- Criar a chave estrangeira na tabela correspondente conforme modelagem --
alter table atleta add column FKpais int;
alter table atleta add foreign key (fkpais) references país (idPais);

-- Atualizar o país de todos os atletas --
update atleta set fkpais = 1 where idatleta =6;
update atleta set fkpais = 3 where idatleta =4;
update atleta set fkpais = 2 where idatleta =1;
update atleta set fkpais = 4 where idatleta =2;
update atleta set fkpais = 3 where idatleta =5;

-- Exibir os atletas e seu respectivo país --
select * from atleta join País
 on idPais= FKpais;

-- Exibir apenas o nome do atleta e o nome do respectivo país --
select atleta.nome, País.nome from atleta join país
on idpais=fkpais;


-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital --
select atleta.nome, País.nome, País.capital from atleta join país on idpais=fkpais;


 -- Questão 2 --

-- Criar tabela --
create table Musica (
idMusica int primary key auto_increment,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);

insert into Musica (titulo, artista, genero) values
('lets go', 'Claudinha', 'pop'),
('Barceluna', 'Maia', 'Indie'),
('Pokemon', 'Luna', 'Funk');


-- Criar tabela --
create table Album (
idAlbum int primary key auto_increment,
nome varchar (40),
tipo varchar (40), constraint chktipo check (tipo in ('digital', ' físico')),
dtLancamento date
);

insert into Album (nome, tipo, dtLancamento) values
('Love', 'digital', '2022-10-20'),
('Thunder','digital', '2022-08-26'),
('Stars', ' físico', '2010-10-23');


-- Exibir todos os dados das tabelas separadamente --
select*from album;
select * from musica;

-- Criar a chave estrangeira na tabela de acordo com a regra de negócio --
alter table Musica add column FKalbum int;
alter table Musica add foreign key (FKalbum) references Album (idAlbum);

-- Atualizar os álbuns de cada música --
update Musica set FKalbum = 13 where idMusica = 2;
update Musica set FKalbum = 14 where idMusica = 1;
update Musica set FKalbum = 15 where idMusica = 3;

-- Exibir as músicas e seus respectivos álbuns --
select * from Musica join album on idAlbum = FKalbum;

-- Exibir somente o título da música e o nome do seu respectivo álbum --
select musica.titulo, album.nome from musica join album on idAlbum = FKalbum;

-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo --
select musica.titulo, album.nome from musica join album on idAlbum = FKalbum
 where genero = 'pop';



