-- Questão 1 --

create database Pet;
use Pet;

create table Cliente (
idCliente int primary key auto_increment,
Nome varchar (45),
Sobrenome varchar (45),
telefonefixo char(20),
telefonecel char(20),
cep char (45),
Bairro varchar (45),
Logradouro varchar (45)
);

create table Pet (
idPet int auto_increment,
Animal varchar(40), constraint chkAnimal check (Animal in ('Gato', 'Cachorro', 'Largato')),
Nome varchar(50),
Raça varchar (50),
Datanascimento date,
Fkcliente int,
foreign key (Fkcliente) references Cliente (idCliente),
primary key (idPet,Fkcliente)
)auto_increment =101;

-- Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente, e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo menos 2 clientes diferentes que tenham o mesmo sobrenome.
Insert into cliente (Nome,Sobrenome,telefonefixo,telefonecel,cep,Bairro,Logradouro) values
('Alice', 'Xavier', '11 94681-0521', '11 96451-0871', '05766-270', 'Jardim Olinda', 'Rua Caraíva'),
('Adriana', 'Xavier', '11 83748-0541', '11 91391-9751', '94568-260', 'Jardim Iporanga', 'Rua Marques'),
('Caio', 'Mendes', '11 87463-9837', '11 67489-0521', '05760-435', 'Jardim Rosa', 'Rua Alfred');

insert into pet (Animal,Nome,Raça,Datanascimento,FKcliente) values
('Cachorro','Lunna','Yorkshire','2021-07-20',1),
('Cachorro','Milly','Yorkshire','2019-07-20',1),
('Gato','Poddy','Persa','2019-07-20',2),
('Largato','John','Amphisbaenidae','2019-07-20',3);

select*from pet;
select*from cliente;

-- - Altere o tamanho da coluna nome do cliente --
alter table pet modify column nome varchar(100);
desc pet;

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo:cachorro) --
select*from pet where animal ='Cachorro';

-- - Exibir apenas os nomes e as datas de nascimento dos pets --
select nome,Datanascimento from pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select*from pet order by nome;

--- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select*From cliente order by bairro desc;

-- - Exibir os dados dos pets cujo nome comece com uma determinada letra.
select*from pet where nome like 'm%';

-- - Exibir os dados dos clientes que têm o mesmo sobrenome.
select*from cliente where sobrenome = 'Xavier';

-- - Alterar o telefone de um determinado cliente.
update cliente set telefonefixo= '11 98765-0829' where idCliente=2;

-- - Exibir os dados dos clientes para verificar se alterou.
select*from cliente;
select*from pet;

-- - Exibir os dados dos pets e dos seus respectivos donos.
select*from cliente join pet on FKcliente = idCliente;

-- - Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente --
select*from cliente join pet on fkcliente = idcliente where cliente.nome = 'Alice';

-- - Excluir algum pet.
delete from pet where idPet= '104';

-- Exibir os dados dos pets para verificar se excluiu
select*from pet;

-- - Excluir as tabelas --
drop table pet, cliente;


-- Questão 2 --
create database armazenar;
use armazenar;

create table pessoa (
Idpessoa int primary key auto_increment,
nome varchar (45),
Datanascimento date,
profissao varchar (45)
);

create table gasto (
idGasto int auto_increment,
dataGasto date,
valor decimal,
descricao VARCHAR(45),
FKpessoa int,
foreign key (FKpessoa) references pessoa (Idpessoa),
primary key (idGasto,FKpessoa)
);

-- Insira dados nas tabelas --
insert into pessoa (nome, Datanascimento, profissao) values 
('Alan', '1998-08-26', 'Streamer'),
('Maethe', '1990-05-30', 'Streamer'),
('Celbit', '1992-04-02', 'Youtuber'),
('Malena', '1992-02-02', 'Atriz');

insert into gasto (dataGasto, valor, descricao, FKpessoa) values
('2022-01-17', 20, 'Deezer', 1),
('2022-01-17', 80.75, 'Paladins', 1),
('2022-01-17', 120, 'Lol', 3),
('2022-01-17', 55, 'Pizza', 3),
('2022-01-17', 200, 'sky', 4),
('2022-01-17', 10, 'Pipoca', 1);

-- Exiba os dados de cada tabela individualmente --
select*from pessoa;
select*from gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
select nome, profissao from pessoa order by nome;
Select valor, descricao from gasto where valor > 20;

-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select*from pessoa join gasto on fkpessoa = idpessoa;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select pessoa.nome, gasto.valor, gasto.descricao from pessoa join gasto on fkpessoa= idpessoa where pessoa.nome = 'Malena';

-- Atualize valores já inseridos na tabela.
update pessoa set nome= 'Kaio' where idpessoa= 1;
update pessoa set profissao= 'Professora' where idpessoa= 4;
update gasto set valor= 250 where idGasto= 3;

select*from pessoa;
select*from gasto;


-- Exclua um ou mais registros de alguma tabela.
 delete from gasto where idgasto=6;
 
 

-- Questão 3 --

-- Criar um banco de dados chamado PraticaFuncionario.
create database PraticaFuncionario;

-- Selecionar esse banco de dados
use PraticaFuncionario;

-- Criar as tabelas correspondentes à sua modelagem.
create table setor (
idsetor int primary key auto_increment,
nome varchar (45),
numerodoandar varchar (45)
);

create table funcionario (
idfuncionario int primary key auto_increment,
nome varchar (45),
telefone char(20), 
Salario decimal (6,2), constraint chksalario check (salario > 0),
fksetor int,
foreign key (fksetor) references setor (idsetor)
)auto_increment=100;

create table acompanhantes (
idacompanhantes int auto_increment,
nome varchar (45),
relacao varchar (45),
datanascimento date,
fkfuncionario int,
foreign key (fkfuncionario) references funcionario (idfuncionario),
primary key (idacompanhantes,fkfuncionario)
)auto_increment =10;

-- Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.
insert into setor (nome, numerodoandar) values
('rh','2'),
('Marketing','1');


insert into funcionario (nome,telefone,salario,fksetor) values
('Alan', '11 94681-0291', '10.00', 1),
('Maria', '11 96574-0981', '34.00', 1),
('Ayla', '11 98746-9011', '90.00', 2),
('Cleber', '11 94521-0291', '120.00', 2);

insert into acompanhantes (nome,relacao,datanascimento,fkfuncionario) values
('Maethe','amiga','2020-01-20',100),
('Clark','Namorado','2010-09-10',101),
('Joan','Prima','2019-02-15',102),
('Maxis','irmão','2004-02-01',103);

-- Exibir todos os dados de cada tabela criada, separadamente.

select *from setor;
select*from funcionario;
select*from acompanhantes;

-- Exibir os dados dos setores e dos seus respectivos funcionários.
select*from setor join funcionario on fksetor = idsetor;

-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
select*from setor join funcionario on fksetor=idsetor where setor.nome = 'rh';

-- Exibir os dados dos funcionários e de seus acompanhantes.
select*from funcionario join acompanhantes on  fkfuncionario=idfuncionario;

-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select*from funcionario join acompanhantes on fkfuncionario=idfuncionario where funcionario.nome = 'Alan';

-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
select*from setor join funcionario on fksetor = idsetor join acompanhantes on fkfuncionario=idfuncionario ;


-- Questão 4 --

-- a) Criar um banco de dados chamado Treinador.
create database treinador;

-- b) Selecionar esse banco de dados.
use treinador;

-- c) Criar as tabelas correspondentes à sua modelagem.

create table treinador (
idtreinador int primary key auto_increment,
nome varchar (45),
telefone char (20),
email varchar (45), constraint chkemail check (email like ('%@%')),
fktreinadorexperiente int,
foreign key (fktreinadorexperiente) references treinador (idtreinador)
);

create table nadador (
idnadador int primary key auto_increment,
nome varchar (45),
estado varchar (45),
datadenascimento date,
fkTreinador int,
foreign key (fkTreinador) references treinador (idtreinador)
)auto_increment=100;


-- d) Inserir dados nas tabelas, de forma que exista mais de um nadador para algum treinador, e mais de um treinador sendo orientado por algum treinador mais experiente.

insert into treinador (nome,telefone,email,fktreinadorexperiente) values
('Marta','11 98765-0982','marta@locaweb.com.br', null),
('Alan','11 95426-0982','Alan@locaweb.com.br', '1'),
('Klara','11 94837-9020','Klara@locaweb.com.br', '1'),
('Julia','11 93842-2039','marta@locaweb.com.br', '1');

insert into nadador (nome,estado,datadenascimento,fktreinador) values
('clara','SP','2000-01-20','1'),
('Junior','RJ','2010-04-30','2'),
('Miriam','SP','2001-02-23','3'),
('Alan','MG','1999-06-17','4');

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select*from treinador;
select*from nadador;

-- f) Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select*from treinador join nadador on  fktreinador=idtreinador;

-- g) Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
select treinador.idtreinador, treinador.nome, nadador.idnadador, nadador.nome, nadador.estado, nadador.datadenascimento from treinador join nadador on fktreinador=idtreinador where treinador.nome = 'Klara';

-- h) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores
select*From treinador as t join treinador as x on t.fktreinadorexperiente=x.idtreinador;

-- i) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém somente de um determinado treinador orientador (informar o nome do treinador na consulta).
select*From treinador as t join treinador as x on t.fktreinadorexperiente=x.idtreinador where t.nome='Alan';

-- j) Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
select*from treinador as t join nadador as n on  t.fktreinador=t.idtreinador;

select*from treinador


-- k) Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador.



