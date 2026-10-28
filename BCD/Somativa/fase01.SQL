-- Active: 1788351675248@@127.0.0.1@3306@biblioteca_som2_cris
CREATE DATABASE IF NOT EXISTS biblioteca_som2_cris;

USE biblioteca_som2_cris;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR (120) NOT NULL UNIQUE,
    telefone VARCHAR (20),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR (150) NOT NULL,
    autor VARCHAR (120) NOT NULL,
    isbn CHAR (13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT DEFAULT 0,
    CONSTRAINT check (quantidade_disponivel >=0)
);

CREATE TABLE emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' check (status_emprestimo = 'ABERTO'),
    id_usuario INT,
    id_livro INT,
    constraint fk_nome_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    constraint fk_titulo_livro FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);


ALTER Table livro add editora VARCHAR(100);

INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Adoninhas Rocha', 'adoninha@email.com', '19999999990', TRUE),
('Bojan Krkic', 'bojan@email.com', '19999999991', TRUE),
('Cristiano Ronaldo', 'cristiano@email.com', NULL, TRUE),
('David Beckham', 'david@email.com', '19999999992', TRUE);

INSERT INTO livro(titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES
('Crepúsculo', 'Stephenie Meyer', '978859078304', 2005, 20),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', '8532511015', 2000, 50),
('A Culpa É das Estrelas', 'John Green', '9788580572261', 2012, 5),
('O Diabo Veste Prada', 'Lauren Weisberger', '0767914767', 2003, 40),
('Ponyo, Volume 1', 'Hayao Miyazaki', '9781421530772', 2009, 90),
('As Crônicas de Nárnia - Coleção de Luxo: O Leão, a Feiticeira e o Guarda-roupa', 'C.S. Lewis', '6555114746', 2023, 120);

INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro) VALUES
('2026-10-20 08:00:07', '2026-10-21', '2026-11-06', 'ABERTO', 1, 5),
('2026-10-21 08:07:32', '2026-10-22', '2026-11-07', 'ABERTO', 2,6),
('2026-10-23 14:50:32', '2026-10-23', '2026-11-08', 'ABERTO', 4,1);

SELECT * FROM usuario;

UPDATE usuario
SET telefone = '19999888801'
WHERE id_usuario = 1;

INSERT INTO livro(titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES
('A Biblioteca da Meia-Noite: 1', 'Matt Haig', '9786558380542', 2021, 30);
SET @livro = LAST_INSERT_ID();
 --id do david não estara vinculado a um emprestimo de livro apenas cadastrado com cliente, agora quando tento excluir dará um erro.

UPDATE livro
set quantidade_disponivel = 122
WHERE id_livro = 6;

UPDATE livro
SET quantidade_disponivel = 32
WHERE id_livro = 7;

INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Eric Garçia', 'eric@email.com', '19999999995', TRUE);
SET @usuario = LAST_INSERT_ID();

DELETE FROM usuario
WHERE id_usuario = 2;

SELECT  titulo, autor, quantidade_disponivel
FROM livro;

SELECT titulo, quantidade_disponivel
FROM livro
ORDER BY quantidade_disponivel DESC;

SELECT titulo
FROM livro
WHERE titulo LIKE 'Crepúsculo%';

SELECT ano_publicacao
FROM livro
where ano_publicacao BETWEEN 2015 and 2025;

SELECT quantidade_disponivel, COUNT(*) AS quantidade_disponivel
FROM quantidade_disponivel
GROUP BY quantidade_disponivel
HAVING COUNT(*) >= 2;

SELECT MIN(preco) AS menor_preco
FROM produto;

SELECT AVG(preco) AS média_preco
FROM produto;

SELECT SUM(preco) AS maior_preco
FROM produtos;