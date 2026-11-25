-- Active: 1795611473868@@127.0.0.1@3308@bancodedados360
DROP DATABASE IF EXISTS BancoDeDados360;
CREATE DATABASE BancoDeDados360;
USE BancoDeDados360;


CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    aluno_nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    aluno_email VARCHAR(120) NOT NULL UNIQUE
);


CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    curso_nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(500) NOT NULL,
    curso_carga_horaria INT NOT NULL
);


CREATE TABLE instrutor (
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    instrutor_nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);


CREATE TABLE turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    horario VARCHAR(100) NOT NULL,
    turma_data_inicio DATE NOT NULL,
    turma_data_fim DATE NOT NULL,
    id_curso INT NOT NULL,
    id_instrutor INT NOT NULL,


    CONSTRAINT fk_turma_curso
        FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    CONSTRAINT fk_turma_instrutor
        FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor)
);


CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    data_matricula DATE NOT NULL,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,


    CONSTRAINT uk_aluno_turma UNIQUE (id_aluno, id_turma),


    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    CONSTRAINT fk_matricula_turma
        FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);


INSERT INTO aluno (aluno_nome, cpf, telefone, aluno_email)
VALUES
('Bruno Dias', '123.456.789-01', '(11) 99999-1111', 'bruno@email.com'),
('Ana Francisca', '234.567.890-12', '(11) 99999-2222', 'ana@email.com'),
('Cristopher Costa', '345.678.901-23', '(11) 99999-3333', 'cristopher@email.com'),
('João Moreira', '456.789.012-34', '(11) 99999-4444', 'joao@email.com'),
('Khvicha Kvaratskhelia', '238.578.344-87', '(11) 99999-5555', 'kvarinho@email.com'),
('Virgil Van Dijk', '223.334.445-56', '(11) 99999-6666', 'vandijk@email.com'),
('Mohamed Alli', '667.778.889-07', '(11) 99999-7777', 'moalli@email.com'),
('Jürgen Klopp', '735.873.908-09', '(11) 99999-8888', 'kloppinho@email.com'),
('Fernanda Andrade', '565.676.987-33', '(11) 99999-9999', 'fernandaA@email.com'),
('Marie Curie', '987.654.321-00', '(11) 99999-1000', 'mariec@email.com');


INSERT INTO curso (curso_nome, descricao, curso_carga_horaria)
VALUES
('Desenvolvimento de Sistemas', 'Curso de programação e desenvolvimento de software', 1200),
('Redes de Computadores', 'Curso de infraestrutura e redes', 1000),
('Banco de Dados', 'Curso de gerenciamento e administração de bancos de dados', 800),
('Automação Industrial', 'Curso de automação e sistemas industriais', 1200),
('Analise de Dados com Excel e Power Bl', 'Capacita na organização, tratamento e visualização de dados', 60),
('Assistente de Logística', 'Ensina processos de recebimento, armazenagem e controle de estoque', 160),
('Assistente Financeiro e Contábil', 'Capacita no controle de contas a pagar e a receber', 120),
('Eletricista Instalador Residencial', 'Capacita para planejar, executar e manter instalações elétricas', 160),
('Soldador ao Arco Elétrico', 'Prepara para a união e corte de peças metalicas ferrosas e não ferrosas', 160),
('Inpestor de Qualidade', 'Prepara para realizar inspeções de recebimento', 160);


INSERT INTO instrutor (instrutor_nome, especialidade)
VALUES
('Gabriel Toledo', 'Desenvolvimento de Software'),
('Mathieu Herbaut', 'Redes de Computadores'),
('Danil Kryshkovets', 'Banco de Dados'),
('Lincoln Lau', 'Automação Industrial'),
('Oleksandr Kostyliev', 'Analise de Dados com Execel e Power Bl'),
('Nikola Kovač', 'Assistente de Logistica'),
('Llya Osipov', 'Assistente Financeiro e Contábil'),
('Kaike Cerato', 'Eletricista Instalador'),
('Robin Kool', 'Soldador ao Arco Eléttrico'),
('Dmitry Sokolov', 'Inpestor de Qualidade');


INSERT INTO turma (horario, turma_data_inicio, turma_data_fim, id_curso, id_instrutor)
VALUES
('08:00 às 12:00', '2026-12-01', '2027-06-30', 1, 1),
('13:00 às 17:00', '2026-12-01', '2027-05-30', 2, 2),
('18:00 às 22:00', '2027-01-10', '2027-04-30', 3, 3),
('08:00 às 12:00', '2027-01-15', '2027-07-15', 4, 4),
('07:30 às 12:00', '2027-01-18', '2027-02-05', 5, 5),
('13:00 às 17:00', '2027-01-18', '2027-03-16', 6, 6),
('14:00 às 18:00', '2027-02-01', '2027-03-16', 7, 7),
('15:00 às 19:00', '2027-02-15', '2027-04-13', 8, 8),
('16:00 às 20:00', '2027-03-01', '2027-04-27', 9, 9),
('18:00 às 22:00', '2027-03-15', '2027-05-11', 10, 10);


INSERT INTO matricula (data_matricula, id_aluno, id_turma)
VALUES
('2026-11-20', 1, 1),
('2026-11-20', 2, 2),
('2026-11-21', 3, 3),
('2026-11-21', 4, 4),
('2026-11-22', 1, 3),
('2026-11-22', 2, 4),
('2026-11-23', 5, 5),
('2026-11-23', 6, 6),
('2026-11-24', 7, 7),
('2026-11-24', 8, 8),
('2026-11-25', 9, 9),
('2026-11-25', 10, 10),
('2026-11-25', 3, 5),
('2026-11-25', 5, 1);


SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM instrutor;
SELECT * FROM turma;
SELECT * FROM matricula;


SELECT
    matricula.id_matricula,
    aluno.aluno_nome AS aluno,
    aluno.aluno_email AS email,
    curso.curso_nome AS curso,
    curso.curso_carga_horaria AS carga_horaria,
    instrutor.instrutor_nome AS instrutor,
    turma.horario,
    turma.turma_data_inicio,
    turma.turma_data_fim,
    matricula.data_matricula
FROM matricula
INNER JOIN aluno ON matricula.id_aluno = aluno.id_aluno
INNER JOIN turma ON matricula.id_turma = turma.id_turma
INNER JOIN curso ON turma.id_curso = curso.id_curso
INNER JOIN instrutor ON turma.id_instrutor = instrutor.id_instrutor;

SELECT 
    c.curso_nome AS Curso,
    COUNT(m.id_matricula) AS Total_Alunos
FROM curso c
LEFT JOIN turma t ON c.id_curso = t.id_curso
LEFT JOIN matricula m ON t.id_turma = m.id_turma
GROUP BY c.id_curso, c.curso_nome
ORDER BY Total_Alunos DESC;

SELECT curso_nome, curso_carga_horaria, descricao
FROM curso
WHERE curso_carga_horaria > 500
ORDER BY curso_carga_horaria DESC;


UPDATE curso 
SET curso_nome = 'Inspetor de Qualidade' 
WHERE id_curso = 10;

UPDATE instrutor 
SET especialidade = 'Inspetor de Qualidade' 
WHERE id_instrutor = 10;

UPDATE curso 
SET curso_nome = 'Análise de Dados com Excel e Power BI' 
WHERE id_curso = 5;

DELETE FROM matricula 
WHERE id_aluno = 4 AND id_turma = 4;

DELETE FROM matricula WHERE id_turma = 10;

DELETE FROM turma WHERE id_turma = 10;

DELETE FROM aluno 
WHERE id_aluno = 4;

SELECT 
    m.id_matricula,
    a.aluno_nome,
    c.curso_nome,
    t.horario,
    m.data_matricula
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
JOIN turma t ON m.id_turma = t.id_turma
JOIN curso c ON t.id_curso = c.id_curso
ORDER BY m.id_matricula;

START TRANSACTION;


UPDATE turma
SET horario = '09:00 às 13:00'
WHERE id_turma = 1;


COMMIT;


CREATE INDEX idx_data_matricula ON matricula(data_matricula);


EXPLAIN SELECT * FROM matricula WHERE data_matricula = '2026-11-20';