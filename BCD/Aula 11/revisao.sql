-- Active: 1794917537243@@127.0.0.1@3308@biblioteca_senai_cristopher
--  Estrutura inicial - DDL
DROP DATABASE if EXISTS biblioteca_senai_cristopher;

CREATE DATABASE IF NOT EXISTS biblioteca_senai_cristopher;

USE biblioteca_senai_cristopher;
----------------------------------------------------------------------

-- Fase 1 - DDL
CREATE TABLE USUARIO (
    id_usuario INT AUTO_INCREMENT,
    nome VARCHAR (100) not null,
    email VARCHAR (120) not null UNIQUE,
    telefone VARCHAR (20),
    ativo BOOLEAN DEFAULT true,

    constraint pk_id_usuario PRIMARY KEY (id_usuario),
    constraint uq_email unique (email)
);

CREATE TABLE if not exists livro (
    id_livro int AUTO_INCREMENT,
    titulo varchar (150) not null,
    autor VARCHAR (120) NOT NULL,
    isbn CHAR(13) not null unique,
    ano_publicacao INT,
    quantidade_disponivel int DEFAULT 0 check (quantidade_disponivel >= 0),

    constraint pk_livro PRIMARY KEY (id_livro),
    constraint uq_isbn unique (isbn)
);

CREATE TABLE emprestimo (
    id_emprestimo int AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista date not NULL,
    data_devolucao date,
    status_emprestimo varchar(20) DEFAULT 'ABERTO' check (status_emprestimo in ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    id_usuario int not null,
    id_livro int not null,

    CONSTRAINT pk_emprestimo PRIMARY KEY (id_emprestimo),
    constraint fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    constraint fk_livro FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);

create table categoria (
    id_categoria int AUTO_INCREMENT,
    nome VARCHAR (100) not null unique,
    id_livro int not null,

    constraint pk_categoria PRIMARY KEY (id_categoria),
    constraint uq_categoria_nome unique (nome),
    constraint fk_categoria_livro FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);


ALTER Table livro add editora varchar(100);

-- Fase 2 - DML
insert into usuario (nome, email, telefone, ativo) values
 ('bruno', 'bruno@email.com', '12345487', TRUE),
('clarice', 'clarice@email.com', '12345467', TRUE);

insert into livro (titulo, autor, isbn, ano_publicacao) VALUES
('harry potter', 'j.k rowlling', '12314567897', 1997, 30);

insert into categoria (nome, id_livro) values
('fantasia', 1)

select * from usuario;

update usuario
set telefone = '000000'
where id_usuario = 2

UPDATE livro
set quantidade_disponivel = quantidade_disponivel + 2
where ano_publicacao >=1990

INSERT into usuario (nome, email, telefone, ativo) VALUES
('TEMPORARIO', 'TEMPORARIO@EMAIL.COM', NULL, TRUE);

SELECT * FROM usuario;

DELETE FROM usuario
where id_usuario = 3;
-- A chave estrangeira está restringindo a exclusão do usuário

insert into emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro) VALUES
(now(), '2026-11-17', NULL, 'ABERTO', 1,1);

-- Fase 3 - DQL
SELECT titulo, autor, quantidade_disponivel from livro;

SELECT titulo, autor FROM livro
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel desc;

select titulo, autor from livro
where titulo like '%harry';

SELECT titulo, autor ano_publicacao from livro
where ano_publicacao between 1990 and 2025;

select COUNT(*) AS quantidade, sum(quantidade_disponivel) AS soma, AVG(quantidade_disponivel) as media, max(quantidade_disponivel) as maximo, min(quantidade_disponivel) as minimo FROM livro;
