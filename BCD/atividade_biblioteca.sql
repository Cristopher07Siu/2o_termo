-- comando para criar bd
-- 1
create database biblioteca_cristopher;
create database if not exists biblioteca_cristopher;

-- comando para apagar
drop database biblioteca_cristopher;

-- 2
-- Atualizar schemas

-- comando apagar tabel
 drop table clientes;

-- comando para criar tabela
create table clientes (
ID_cliente int auto_increment primary key,
CPF varchar(14) not null unique,
Nome varchar(60) not null,
Telefone varchar(15) not null,
Endereco varchar(100),
data_nascimento date not null
);

create table if not exists clientes;
create table clientes (
ID_cliente int auto_increment primary key,
CPF varchar(14) not null unique,
Nome varchar(60) not null,
Telefone varchar(15) not null,
Endereco varchar(100),
data_nascimento date not null,
status_cliente enum ('pendente', 'ativo', 'nativo') default "ativo",
data_cadastro timestamp default current_timestamp
);



create table funcionario (
ID_funcionario int auto_increment primary key,
ponto datetime,
Nome_funcionario varchar(60) not null,
cargo char(15) not null,
vendas_funcionario varchar(60) not null
);


-- 3
-- comando para ativar bd
use biblioteca_cristopher;

-- comando para alterar e corrigir
-- adicionar um campo (atributo) novo
alter table clientes add email varchar(100);

-- visualizar tabelas no bd
show tables;

-- modifivar tipo de dados

-- visualizar tipo de dados ou campos
alter table clientes modify email varchar(100);

-- renomear tabelas
rename table clientes to cliente;

-- excluir atributo
alter table cliente drop column email;


-- Limpar dados da tabela
truncate table clientes;


