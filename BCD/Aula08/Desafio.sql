-- Active: 1788351675248@@127.0.0.1@3306@smartcoffee_dml_cris
-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Cristopher
-- Turma: DEVIE Data: 30/09/2026
-- Base: smartcoffee_dml
-- ============================================================

-- PARTE A - INSERT
USE smartcoffee_dml_cris;

-- 1.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Cristopher C', 'Cristopherc@email.com', '19994762822', 'Limeira', TRUE);
SET @cliente = LAST_INSERT_ID();


INSERT INTO cliente (nome,email,telefone, cidade, ativo) VALUES
('Gilson Castro', 'gilson@email.com', '19998765231', 'Carapicuiba', FALSE);
SET @cliente = LAST_INSERT_ID();

-- 2.
INSERT INTO categoria (nome) VALUES
('Especiais da Casa');
SET @categoria = LAST_INSERT_ID();

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Cerveija Amanteigada', 20.00, TRUE, 3);