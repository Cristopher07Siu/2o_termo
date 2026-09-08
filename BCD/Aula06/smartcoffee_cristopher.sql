-- Projeto SmartCoffee
create database smartcoffee_Cristopher;

use smartcoffee_cristopher;
create table cliente (
ID_cliente int auto_increment primary key,
CPF varchar(11)unique,
Telefone varchar(15) not null,
Nome varchar(60),
Endereco varchar(100) not null
);

create table funcionario (
ID_funcionario int auto_increment primary key,
CPF_funcionario varchar(14)unique,
Telefone varchar(15) not null,
Nome varchar(40) not null,
Endereco varchar(150) not null,
Cargo char not null
);

create table pedidos (
ID_pedido int auto_increment primary key,
CPF_cliente varchar(14)unique,
Telefone_cliente varchar(15) not null,
Nome_cliente varchar(40)not null,
Endereco_cliente varchar(150) not null,
total_pagar varchar(20) not null,
Horario_pagar date not null
);

create table programa fidelidade (
ID_fidelidade int auto_increment primary key,
nome_cliente varchar(40) not null,
Endereco varchar(150) not null,
nome_social varchar(100) not null,
Telefone varchar(15) not null
);

create table produto (
ID_produto int auto_increment primary key,
validade date,
tipo int,
quantidade varchar(100) not null,
nome varchar(100) not null,
preco varchar(100) not null
);

create table pagameto(
ID_pagamento int auto_increment primary key,
nome_pagamento varchar(40) not null,
CPF_pagamento varchar(14)unique,
pedido time,
metodo varchar(100) not null
);
medicopacientespacientes
