-- Active: 1788351675248@@127.0.0.1@3306@castello_relacionamentos_cris
CREATE DATABASE IF NOT EXISTS Castello_Relacionamentos_Cris;
 USE Castello_Relacionamentos_cris;

CREATE Table Clientes (
ID_cliente int AUTO_INCREMENT PRIMARY KEY,
Nome_cliente VARCHAR (100) NOT NULL
);

CREATE Table Pedidos (
ID_pedidos INT AUTO_INCREMENT PRIMARY KEY,
ID_cliente int NOT NULL,
Data_pedido DATE NOT NULL,
valor_total DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (ID_cliente) REFERENCES clientes(ID_cliente)
);

CREATE Table Estoque (
id_estoque int AUTO_INCREMENT PRIMARY KEY,
id_produto int not NULL unique,
quantidade int NOT NULL,
FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE table produtos (
id_produto int AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR (100) not null,
preco DECIMAL (10, 2)
);

SELECT * FROM estoque;

SELECT * FROM produtos;

INSERT INTO produtos (nome_produto, preco) VALUES
('Produto A', 10.00),
('Produto B', 20.00),
('Produto C', 30.00);

-- desafios cardinalidade
-- Questão 01
-- Uma categoria pode possuir vários produtos. Cada produto pertence a apenas
-- uma categoria.

-- Resposta:
-- Categoria 1,1 e Produtos 1,n

-- Questão 02
-- 2. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um
-- funcionário.

-- Resposta:
-- Funcionário 1,1 e Pedidos 1,n

-- Questão 03
-- 3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser
-- comprado de vários fornecedores.

-- Resposta:
-- Fornecedor 1,n e Produtos 1,n

-- Questão 04
-- 4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar
-- vinculada a uma mesa.

-- Resposta:
-- Cliente 1,1 e Mesa 0,n

-- Questão 05
-- 5. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.

-- Resposta:
-- Pedido 1,n e Item 1,1