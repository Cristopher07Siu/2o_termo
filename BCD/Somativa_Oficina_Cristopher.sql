-- SOMATIVA

create database oficina_cris;

use oficina_cris;

create table Clientes (
ID_cliente int auto_increment primary key,
Nome varchar (60) not null,
CPF varchar (14) not null unique,
Endereco varchar (150) not null,
Email varchar (100) not null,
Telefone varchar (15) not null
);

create table Funcionarios (
ID_funcionario int auto_increment primary key,
CPF_funcionario varchar (14) not null unique,
cargos char (15) not null,
vendas varchar (60) not null
);

create table veiculoos (
ID_veiculos int auto_increment primary key,
nome_veiculo varchar (60) not null,
ano datetime,
vencimento datetime,
cor varchar (20) not null
);

create table servicos (
ID_servicos int auto_increment primary key,
Orcamento varchar (100) not null,
Horario_pedido datetime
);

create table Marcas (
ID_marcas int auto_increment primary key,
m_comum varchar (30) not null,
m_luxos varchar (30) not null
);

create table modelos (
ID_modelo int auto_increment primary key,
modelo_veiculo varchar (40) not null,
ano_modelo datetime
);

create table pecas (
ID_pecas int auto_increment primary key,
marca_pecas varchar (50) not null,
ano_pecas datetime,
tipo_pecas varchar (60) not null
);

create table fornecedores (
ID_fornecedores int auto_increment primary key,
Nome_fornecedor varchar (80) not null,
tipo_fornecedor varchar (60) not null,
ano_fornecedor datetime
);

create table ordem_de_servico (
ID_ordem_servico int auto_increment primary key,
Estimativa_data date,
Quantidade char(150) not null,
Observacao char(100),
Problema_cliente varchar(200) not null
);

create table pagamento (
ID_pagamento int auto_increment primary key,
Horario_PG time not null,
CPF varchar (14) not null unique,
Pedido varchar (20) not null,
nome varchar (40) not null
);

rename table modelos to modelos_fab;

alter table clientes add Emaail varchar(100);

alter table Funcionarios add Venda varchar (60) not null;

alter table veiculoos add Ano_veiculo datetime;

alter table servicos add Horario_Pediido datetime;

alter table Marcas add M_luxoos varchar(30) not null;

alter table ordem_de_servico add Problema_cliiente varchar(200) not null;

alter table pecas add Ano_peecas datetime;

alter table fornecedores add Ano_Foornecedor datetime;

alter table pagamento add PIX varchar(20) not null default "PIX";

alter table clientes drop column Emaail;

alter table Funcionarios drop column Venda;

alter table veiculoos drop column Ano_veiculo;

alter table servicos drop column Horario_Pedido;

alter table Marcas drop column M_luxos;

alter table ordem_de_servico drop column Problema_cliiente;

alter table pecas drop column Ano_peecas;

alter table fornecedores drop column Ano_foornecedor;

alter table pagamento drop column PIX;