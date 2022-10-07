-- Questões 1 --

-- Criar um banco de dados chamado AlunoProjeto. -- 
create database AlunoProjeto;

-- Selecionar esse banco de dados. --
use AlunoProjeto;

-- Criar as tabelas equivalentes à modelagem. --
create table projeto (
idprojeto int primary key auto_increment,
nome varchar (45),
descprojeto varchar (45)
);

create table Aluno (
RA varchar(8) primary key,
nome varchar (45),
telefone char (20),
FKprojeto int, 
constraint Fkprojetocons  foreign key (FKprojeto) references projeto (idprojeto),
FKrepresentante varchar(8),
constraint FKrepresentantescons foreign key (FKrepresentante) references Aluno (RA)
);

create table acompanhante (
idacompanhante int auto_increment,
nome varchar (45),
relacao varchar (45), 
FKaluno varchar(8),
constraint acompanhante foreign key (FKaluno) references Aluno (RA),
primary key (idacompanhante,FKaluno)
);

-- Inserir dados nas tabelas. --
insert into projeto values
(null, 'SPT', 'Sistema Integrador de bilhetes'),
(null, 'PPSAV', 'Aplicativo de resgate de pombos');

insert into aluno values 
('0121', 'Mike', '11 98762-0353',1, null),
('0122', 'Clarice', '11 09273-5456',1,'0121'),
('0123', 'Maria', '11 09284-3234',2,null),
('0124', 'Eunice', '11 02932-9384',2,'0123');

insert into acompanhante values
(null, 'João', 'amigo', '0121'),
(null, 'Cleber', 'primo', '0122'),
(null, 'Ayla', 'amiga', '0123'),
(null, 'Nancy', 'prima', '0124');

-- Exibir todos os dados de cada tabela criada, separadamente. --
select*from projeto;
select*from aluno;
select*from acompanhante;

-- Exibir os dados dos alunos e dos projetos correspondentes. --
select*from aluno join projeto on fkprojeto = idprojeto;

-- Exibir os dados dos alunos e dos seus acompanhantes. --
select*from aluno join acompanhante on fkaluno = ra;

-- Exibir os dados dos alunos e dos seus representantes. --
select * from aluno as a join aluno as r on r.ra = a.fkrepresentante;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta). --
select*from aluno join projeto on fkprojeto=idprojeto where projeto.nome = 'SPT';

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes. --
select*From aluno as a join projeto on fkprojeto=idprojeto join aluno as r on r.ra= a.fkrepresentante;


-- Questões 2 --

-- a) Criar um banco de dados chamado Campanha. --
create database Campanha;

-- b) Selecionar esse banco de dados. --
use Campanha;

-- c) Criar as tabelas correspondentes à sua modelagem. --
create table organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
cep varchar(15),
bairro varchar(45),
rua varchar(45),
email varchar(45), constraint chkemail check (email like '%@%'),
Fkorganizadorexperiente int,
foreign key (Fkorganizadorexperiente) references organizador (idOrganizador)
) auto_increment = 30;

create table campanha (
idcampanha int auto_increment,
categoria varchar (45),
instituicao varchar (45), constraint chkinstituicao check (instituicao in  ('Privada','Pública')),
datafinal date,
FKOrganizador int,
foreign key (FKOrganizador) references organizador (idOrganizador),
primary key (idcampanha,FKOrganizador) 
) auto_increment = 500;

-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente. --
insert into organizador values
(null,'Cleber', '09736-8747', 'Jardim Ingá', 'Rua Adolfo mendes','cleber@gmail.com',null),
(null,'Maycon', '04958-6049', 'Jardim Europa', 'Rua Cleopter Junior','maycon@gmail.com',30),
(null,'Jonys', '09384-8953', 'Jardim Luvas', 'Rua Cleopter Junior','jonys@gmail.com',30);

insert into campanha values
(null, 'alimento', 'Privada', '2022-11-30', '30'),
(null, ' produto de higiene', 'Pública', '2019-10-26', '31'),
(null, 'máscaras de proteção', 'Pública', '2023-11-21', '32');

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select*from organizador;
select*from campanha;

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas. --
select*From organizador as o join campanha as c on c.fkorganizador=o.idorganizador;

-- h) Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas. --
select*From organizador as o join campanha as c on c.fkorganizador=o.idorganizador where o.nome = 'Cleber';

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores. --
select * from organizador as n join organizador as e on n.fkorganizadorexperiente = e.idorganizador;

-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador orientador (informar o nome do organizador orientador na consulta). --
select*from organizador as n join organizador as e on n.fkorganizadorexperiente = e.idorganizador where e.nome= 'cleber';

-- l) Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores. --
select*From organizador as n join campanha as c on c.fkorganizador=n.idorganizador join organizador e on n.fkorganizadorexperiente = e.idorganizador;

-- m) Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador. --
select*From organizador as n join campanha as c on c.fkorganizador = n.idorganizador join organizador as e on n.FKorganizadorexperiente = e.idorganizador where n.nome= 'Jonys';
