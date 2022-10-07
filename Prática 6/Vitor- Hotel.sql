create database  Continuada2;
use  Continuada2;

create table Hotel (
idHotel int primary key auto_increment,
nome varchar (45),
logradouro varchar (45),
bairro varchar (45),
cep char (8),
HotelMatriz int,
foreign key (HotelMatriz) references Hotel (idHotel)
);

create table Quarto (
idQuarto int auto_increment,
nome varchar (45),
andar int,
tipo varchar (45), constraint chktipo check (tipo in  ('cama casal','cama solteiro')),
fkhotel int, 
foreign key (fkhotel) references hotel (idHotel),
primary key (idQuarto,fkhotel)
);

insert into Hotel values 
(null,'Hotel Monge','Rua caraiva','Jardim Olinda','05766260',null),
(null,'Hotel Karal','Rua karal','Jardim karal','06524860',1),
(null,'Hotel Peps','Rua Peps','Jardim Peps','52766850',1),
(null,'Hotel Munca','Rua Munca','Jardim Munca','05769850',1),
(null,'Hotel Socorro','Rua socorro','Jardim socorro','08567425',1);

insert into Quarto values
(null, 'caule',3,'cama solteiro',1),
(null, 'chulé',12,'cama casal',2),
(null, 'mole',7,'cama solteiro',3),
(null, 'manto',20,'cama casal',4),
(null, 'plis',8,'cama casal',5);


-- a) Exibir todos os dados das tabelas separadamente. 
select*from hotel;
select*from quarto;

-- b) Exibir os dados dos hotéis e seus respectivos quartos.
select*From hotel as h join quarto as q on q.fkhotel=h.idhotel;

-- c) Exibir apenas o nome do hotel e o nome dos respectivos quartos do tipo 'solteiro';
select h.nome as hotel, q.nome as quarto from hotel as h join quarto as q on q.fkhotel=h.idhotel where q.tipo= 'cama solteiro';

-- d) Exibir os dados dos hotéis e sua respectiva matriz;
select*From hotel as h join hotel as m on m.HotelMatriz= h.idhotel;

-- e) Exibir apenas o nome e o andar de um determinado quarto que contém uma determinado caracter;
select nome, andar From quarto where  idquarto = 5;

-- f) Atualize o tipo de algum quarto. Exiba novamente os dados da tabela após a atualização. 
update quarto set tipo = 'cama casal' where idquarto=4;
select*From quarto;

-- g) Exclua algum quarto da tabela. Exiba novamente os dados da tabela após a exclusão. 
delete from quarto where idquarto=3;

-- h) Exibir os dados dos hotéis, sua respectiva matriz e quartos. Pode escolher os campos e apelidálos caso seja necessário. 
select*From hotel as h join hotel as m on m.HotelMatriz= h.idhotel join quarto as q on q.fkhotel=h.idhotel;

drop database Continuada2;

