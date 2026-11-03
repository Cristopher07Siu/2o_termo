-- Active: 1788351675248@@127.0.0.1@3306@smartcoffee_dml_cris
USE SMARTCOFFEE_DML_CRIS;

-- Inserindo dados no BD
-- DML: inserts, updates, delete

INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Adryan Costa', 'adryan@email.com', '19999999901', 'Limeira', TRUE),
('Ana Francisca', 'ana2@email.com', '1999999902', 'Lençois Paulista', TRUE),
('Anna Julia', 'anaj@email.com', '19999999903', 'Limeira', TRUE),
('Beatriz Barros', 'beatrizb@email.com', '1999999904', 'Limeira', TRUE),
('Beatriz Santana', 'beatrizs@email.com', '199999995', 'Limeira', TRUE),
('Bruno Dias', 'bruno2@email.com', '1999999906', 'Limeira', TRUE),
('Cristopher da Costa', 'cristopher@email.com', '199999907', 'Mogi Guaçu', TRUE),
('Davi Guerra', 'davi@email.com', NULL, 'Limeira', TRUE),
('Gabriel Lucio', 'gabriel@email.com', '1999999908', 'Limeira', TRUE),
('Gabriela Lima', 'gabriela2@email.com', '1999999909', 'Curitiba', TRUE),
('Giovana Santana', 'giovana@email.com', NULL, 'Juqueropólis', FALSE),
('Gustavo Couto', 'gustavo@email.com', '1999999910', 'Ipatinga', FALSE),
('Isabeli Souza', 'isabeli@email.com', NULL, 'Limeira', TRUE),
('Jacó de Souza', 'jaco@gmail.com', '19999999911', 'Limeira', TRUE),
('João Moreira', 'joao2@email.com', '19999999912', 'Limeira', TRUE),
('John Pierre', 'john@email.com', '19999999913', 'cap haiten', TRUE),
('Jonas Dawid', 'jonas@email.com', '1999999914', 'Rio de Janeiro', TRUE),
('Juan Pablo', 'juan@email.com', '1999999915', 'Limeira', TRUE),
('Julia Fernada', 'julia@email.com', '199999916', 'Limeira', TRUE);

-- Iserindo campos com chave estrangeia
INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Manteiga Giovana', 14.00, TRUE, 4);

-- Inserindo valores e buscando o último valor inserido
INSERT INTO pedido(data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'FINALIZADO', 14.00, 91)

SET @pedido = LAST_INSERT_ID();
;SELECT @pedido;

----------------------------------------------------------------

-- Atualizando ou Modificando dados no BD
-- EX 1: Atualizando informações individuais
UPDATE cliente
SET telefone = '19999888801'
WHERE id_cliente = 91;

UPDATE cliente
SET ativo = true
WHERE id_cliente = 18;

-- Nunca, jamais, never esqueçam de utilizar o where

-- Regra de ouro
-- Primeira Etapa
SELECT * FROM cliente
WHERE id_cliente = 91;

-- Segunda Etapa
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 19;

-- EX 2: Atualizando mais do que um campo
UPDATE cliente
SET telefone = '1999888016', 
    cidade = 'Campinas'
WHERE id_cliente = 91;

-- EX 3: Atualizando com condicionais
UPDATE produto
SET preco = preco * 2.50
WHERE id_categoria = 1;


-- Apagando dados
-- EX 1: Apagar dados sem conter informações
DELETE FROM cliente;

-- EX 2: Apagar dados com condições
DELETE FROM cliente
WHERE id_cliente = 18;

-- EX 3: Apagando dados de toda tabela
TRUNCATE TABLE cliente;

-- EX 4: Apagar de forma representativa ou lógica
UPDATE produto
SET ativo = FALSE
WHERE id_produto = 18;

-----------------------------------------------------------
-- Realizando passos para uma compra no SmartCoffee
-- Passo 1: Cadastrar um novo cliente
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Bruno A', 'brunoa@email.com', '1999123456', 'Piracicaba', TRUE);
SET @cliente = LAST_INSERT_ID();

-- Passo 2: Criar o pedido
INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(), 'Aberto',0.00,102);
SET @pedido = LAST_INSERT_ID();

-- Passo 3: Inserir itens no pedido
INSERT INTO item_pedido(id_pedido, id_produto,quantidade,preco_unitario) VALUES
(@pedido,4,1,73.13),
(@pedido,11,1,11.25);

-- Passo 4: Atualizar o total e status
UPDATE pedido
SET valor_total = 84.38,
    status = 'preparando'
WHERE id_pedido = @pedido

-- Passo 5: Resgistrar Pagamento
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido, 1, 84.38, NOW());



-- Consultar dados em tabelas BD
-- Consultar toda a tabela
SELECT * FROM cliente;
-- Consultar individual por ID
SELECT * FROM cliente
WHERE id_cliente = 91;