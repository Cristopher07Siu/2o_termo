-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE smartcoffee_atualizado

CREATE TABLE Estoque (
ID_Estoque int AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
Quantidade_minima Int not null,
Nome_insumo varchar (100),
kg int not null,
ml int not null,
un int not null,
Quantidade_Atual Int not null
)

CREATE TABLE Pedidos+Pagamento (
ID_Pedido int AUTO_INCREMENT PRIMARY KEY,
Horario_Pedido datetime,
Status int not null,
Tipo_Pedido varchar (100) not null,
Valor_Total Decimal(10, 2) not null,
ID_Delivery int,
ID_Pagamento int AUTO_INCREMENT PRIMARY KEY,
Data_Pagamento Datetime,

Valor_Total Decimal (10, 2) not null,
Horario_Pagamento Texto(1),
Status_Pagamento Int not null,
PIX Decimal (10, 2) not null,
Cartao Decimal (10, 2) not null,
Dinheiro Decimal (10, 2) not null,
PRIMARY KEY(ID_Pedido,ID_Pagamento)
)

CREATE TABLE Produtos (
ID_Produto int AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
Descricao varchar (200),
Preco_unitario decimal(10, 2),
Nome_Produto varchar (100),
Categoria varchar (150),
Quantidade int not null
)

CREATE TABLE Funcionario (
ID_Funcionario int AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
Nome Varchar (40),
Cargo varchar (50) not null,
Endereco varchar (200),
CPF_Funcionario varchar (11),
Data_adicao date,
salario decimal (10, 2) not null
)

CREATE TABLE Delivery (
Endere�o_Entrega varchar (200),
ID_Delivery int AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
Status_Entrega varchar (100),
Taxa_Entrega Decimal (10, 2),
Data_Hora_Saida datetime
)

CREATE TABLE Clientes+Programa Fidelidade (
Nome varchar (40),
CPF varchar (11),
Endereco char (200) not null,
Email varchar (100),
ID_Cliente int AUTO_INCREMENT PRIMARY KEY,
Telefone varchar(15) not null,
Data_Cadastro datatime not null,
ID_Fidelidade int AUTO_INCREMENT PRIMARY KEY,
Nome_cliente Texto(1),

Endereco Varchar (200),
CPF_Cliente varchar (11),
Nome_Social varchar (40),

Telefone char (15),
Data_Ultima_Atualizacao datetime,
Saldo_Pontos Decimal (10, 2) not null,
PRIMARY KEY(ID_Cliente,ID_Fidelidade)
)

CREATE TABLE Atende (
ID_Funcionario int,
ID_Cliente int
)

CREATE TABLE Realiza (
ID_Pedido int,
ID_Cliente int
)

CREATE TABLE Contem (
ID_Produto int,
ID_Pedido int
)

CREATE TABLE Entrega (
ID_Delivery int,
ID_Funcionario int
)

CREATE TABLE Consome (
ID_Estoque int,
ID_Produto int 
)

