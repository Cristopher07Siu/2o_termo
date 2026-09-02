create database oficina_cris;

use oficina_cris;

create table if not exists Clientes (
ID_cliente int auto_increment primary key,
Nome varchar (60) not null,
CPF char (14) not null unique,
Endereco varchar (150) not null,
Email varchar (100) not null,
Telefone char (15) not null,
data_cadastro timestamp default current_timestamp
);

create table  if not exists veiculos(
ID_veiculo int AUTO_INCREMENT PRIMARY KEY,
descricao_problema text (100) not null,
placa char(8) not null unique,
cor varchar (20),
marca VARCHAR(20),
quilometragem INT
data_cadastro timestamp default current_timestamp
);

create table if not exists marcas (
ID_marcas INT AUTO_INCREMENT PRIMARY KEY,
nome_marca VARCHAR(50)NOT NULL,
pais_origem varchar (30) not null,
ano_lancamento YEAR
tipo_combustivel ENUM ('etanol', 'diesel', 'gasolina') DEFAULT 'etanol'
data_cadastro timestamp default current_timestamp
);

crate table if not EXISTS modelos (
ID_modelos INT AUTO_INCREMENT PRIMARY KEY,
nome_modelo varchar (30) not null,
tipo_modelo ENUM ('suv', 'compacto', 'sedan') default 'compacto',
ano_fabricacao YEAR not null,
potencia char (10),
data_cadastro timestamp default current_timestamp,
status_modelo enum ('ativo', 'inativo') DEFAULT 'ativo'
);
create table if not exists funcionarios (
ID_funcionario INT AUTO_INCREMENT PRIMARY KEY,
nome_funcionario varchar (40) not null,
CPF_funcionario char (14) not null unique,
telefone_funcionario char (15) not null,
cargo varchar (30) not null,
salario DECIMAL (10,2) not null,
data_cadastro timestamp default current_timestamp
);

create table if not exists servicos (
ID_servico INT AUTO_INCREMENT PRIMARY KEY,
tipo_servico varchar (100) not null,
valor_servico decimal (10,2) not null,
data_inicio datetime not null,
data_termino datetime not null,
descricao_servico text (500) not null
data_cadastro timestamp default current_timestamp
);

create table if not exists fornecedor (
ID_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
telefone CHAR (15) not null,
-- tempo_entrega YEAR
cnpj char (18) not null unique,
razao_social VARCHAR (100) not null,
endereco_fornecedor VARCHAR(150) not NULL,
status_fornecedor ENUM ('ativo', 'inativo') DEFAULT 'ativo'
data_cadastro timestamp default current_timestamp
);