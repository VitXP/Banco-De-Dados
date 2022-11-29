-- a) Criar um banco de dados chamado Venda
create database Venda;

-- b) Selecionar esse banco de dados.
use Venda;

-- c) Criar as tabelas correspondentes à sua modelagem
create table endereco (
idEndereco int primary key auto_increment,
logradouro varchar(45),
numero int,
bairro varchar(45),
cidade varchar(45),
cep char (8)
);

create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45), constraint chkemail check (email like '%@%'),
fkEndereco int,
constraint Enderecos foreign key (fkEndereco) references endereco (idEndereco),
fkIndicacao int,
constraint iIndicados foreign key (fkIndicacao) references cliente (idCliente)
);



create table venda (
idvenda  int auto_increment,
totalVenda decimal (5,2),
data date,
fkCliente int,
constraint cliente foreign key (fkCliente) references cliente (idCliente),
primary key (idvenda,fkCliente)
);

create table produto (
idproduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
preco decimal (4,2),
ValorDesconto decimal(4,2),
quantidadeProduto int
);

-- Criar a nossa tabela associativa
create table notaFiscal (
fkvenda int,
foreign key (fkvenda) references venda (idvenda),
fkProduto int,
foreign key (fkProduto) references produto (idproduto),
fkCCliente int,
foreign key (fkCCliente) references venda (fkCliente),
primary key (fkvenda, fkProduto),
descricao varchar(45)
);

-- d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada cliente, e mais de um cliente sendo indicado por outro cliente.
insert into endereco values 
(null,'Rua Alfredo',440,'Olinda','São Paulo','05677298'),
(null,'Rua lavitar',020,'Maianomar','Bahia','05789298'),
(null,'Rua Clemendro',040,'Pial','Ceara','9542000');

insert into cliente values
(1, 'Alana','alana@gmail.com.br',1,null),
(2, 'Marcos','marcos@gmail.com.br',1,1),
(3, 'Adriana','adriana@gmail.com.br',2,2),
(4, 'Alice','alice@gmail.com.br',2,3);

insert into venda values 
(null,300.23,'2020-03-20',1),
(null,100.00,'2020-03-20',2),
(null,400.00,'2020-03-20',3),
(null,110.20,'2020-03-20',4);

insert into produto values
(1,'Espelho','Se olhe mais',50.00,10.00,2),
(2,'Corda','Pule muito',20.50,15.20,1),
(3,'Havaianas','O melhor calçado',60.00,5.00,1),
(4,'Cheapes','A melhor batata',10.00,null,2),
(5,'Boneca','Barbie',90.00,20.00,5);

insert into notaFiscal values
(1,2,1,'Debito'),
(2,4,2,'Debito'),
(3,3,3,'credito'),
(4,1,4,'Debito'),
(4,5,4,'Debito');

-- e) Exibir todos os dados de cada tabela criada, separadamente.

select* from endereco;
select* from cliente;
select* from venda;
select* from produto;
select* from notaFiscal;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- Realizado

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
select*From venda as v join cliente as c on v.fkCliente = c.idCliente join endereco as e on e.idendereco = c.fkendereco;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
select*From venda as v join cliente as c on v.fkCliente = c.idCliente join endereco as e on e.idendereco = c.fkendereco  where c.nome ='Adriana';


-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
select c.nome, c.email, i.nome as Indicações, e.logradouro, e.numero, e.bairro, e.cidade, e.cep  From cliente as c join cliente as i on c.idcliente=i.fkindicacao join endereco as e on e.idendereco = c.fkendereco;

-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador (informar o nome do cliente que indicou na consulta).
select c.nome as indicado, c.email , i.nome as Indicador, i.email, e.logradouro, e.numero, e.bairro, e.cidade, e.cep from cliente as c join cliente as i on c.idcliente=i.fkindicacao join endereco as e on e.idendereco = c.fkendereco where i.nome = 'Alice';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
select*From venda as v join cliente as c on v.fkCliente = c.idCliente join notaFiscal  on fkvenda = idvenda join produto on fkproduto=idproduto join endereco on idendereco = fkendereco;


-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
select venda.data as 'Data da Venda', produto.nome as 'Nome do produto', produto.quantidadeProduto as 'Quantidade do produto Vendida' from venda  join notaFiscal  on fkvenda = idvenda join produto on fkproduto=idproduto where idVenda = 1;

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
select produto.nome as 'Nome do produto', produto.preco as 'Valor do Produto' , sum(quantidadeProduto) as 'Quantidade de Produtos Vendidos'  From produto order by produto.nome;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
insert into cliente values
(null, 'Diogo', 'diogo@gmail.com.br',3,1);
select*from cliente;
select*From NotaFiscal;
select*From cliente as c  join endereco as e on e.idendereco = c.fkendereco  left join venda as v on c.idcliente = v.fkcliente;  


-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
select min(preco) 'Valor mínimo do produto', max(preco) 'Valor máximo do produto' from produto;

-- q) Exibir a soma e a média dos preços dos produtos;
select sum(preco)  'Soma dos preços dos produtos', round(avg(preco),2) 'Média dos preços dos produtos' from produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
 select count(preco) 'Quantidade de preços acima da média' from produto where preco > (select round(avg(preco),2) from produto);

-- s) Exibir a soma dos preços distintos dos produtos;
select sum(distinct preco) 'Soma dos preços distintos dos produtos' from produto;

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;alter
select sum(preco) 'Soma dos preços dos produtos'
 from produto
 join venda on idvenda = fkCliente group by idvenda = 1;