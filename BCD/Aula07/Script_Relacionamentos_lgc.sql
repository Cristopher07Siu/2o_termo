-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
ID_cliente int auto increment primary key PRIMARY KEY,
Nome_cliente varchar (40) not null
)

CREATE TABLE Pedido (
ID_pedido int auto increment primary key PRIMARY KEY,
Quantidade /*erro: ??*/,
ID_cliente int auto increment primary key,
FOREIGN KEY(ID_cliente) REFERENCES Cliente (ID_cliente)
)

CREATE TABLE Produtos+Estoques (
ID_pedido int auto increment primary key,
Nome_Produto varchar (100) not null,
ID_estoque int auto increment primary key,
Valor decimal 10,2,
PRIMARY KEY(ID_pedido,ID_estoque)
)

CREATE TABLE Fornecedores (
Razao_social varchar (100),
ID_Fornecedores int auto_increment primary key PRIMARY KEY
)

CREATE TABLE Produtos (
Nome_Produtos varchar (100),
ID_Produtos int auto_increment primary key PRIMARY KEY
)

CREATE TABLE Item_Produto (
ID_Produtos int,
ID_Fornecedor int,
ID_Item int auto_increment primary key PRIMARY KEY,
Quantidade int
)

