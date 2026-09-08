-- comentarios
-- Comando para criar banco de dados
create database Biblioteca_BC;

-- apagar bancos de dados
drop database exemplo;

-- Apagar tabelas do banco
-- drop table clientes

-- Ativar Banco de Dados
use biblioteca_bc;

-- Criar tabelas
	create table clientes (
	ID_cliente int auto_increment primary key,
	Nome varchar (60) not null,
	CPF varchar(14) not null unique,
	Endereco varchar (150) not null,
	Email varchar (100) not null,
	Telefone varchar (15) not null
	);


