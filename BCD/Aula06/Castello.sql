create database castellovers;

use castellovers;

create table if not exists alunos(
ID_alunos BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (60) not NULL,
CPF CHAR(14) not null unique,
status_aluno enum ('ativo', 'inativo', 'concluido') default 'ativo',
data_cadastro timestamp default current_timestamp
)

-- Visualizar todos os BD
show schemas;

-- Visualizar tabelas do BD
show TABLES;

-- Descrição de atributos da tabela aluno
describe alunos;

-- Apagar BD
drop DATABASE castellovers; 

