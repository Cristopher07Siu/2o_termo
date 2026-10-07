-- Active: 1788351675248@@127.0.0.1@3306@smartcoffee_dml_cris
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Edson Wladimir', 'edson@email.com', '19999888244', 'Paris', TRUE);

-- Exemplo de estrutura simples de SELECT
SELECT coluna
FROM tabela;

-- EX 1: SELECT Para consultar todas as colunas
SELECT * FROM cliente;

-- EX 2: Consultando por colunas
SELECT nome, email FROM cliente;

-- EX 3: Inserindo apelidos nas colunas -- alias
SELECT nome AS cliente
FROM cliente;

SELECT nome AS cliente, telefone AS contato, ativo AS STATUS
FROM cliente;

SELECT nome, preco, preco * 0.90 AS Preço_promocional
FROM produto;

-- EX 4: Distinct - Eliminar repetições
SELECT cidade FROM cliente;

SELECT DISTINCT cidade
from cliente;
-- Sem DISTINCT o item irá aparecer várias vezes
-- Com o DISTINCT o item irá aparecer apenas uma vez

-- EX 5: Filtro em registros
SELECT nome, preco
FROM produto
WHERE preco > 10;
-- Retorna valores acima de 10 reais em seus preços

SELECT nome, preco
FROM cliente
WHERE ativo = TRUE;
-- Retorna produtos ativos

SELECT id_pedido, data_pedido, valor_totala
FROM pedido
WHERE valor_total >= 25.00
-- Retorna pedidos acimqwa e detrminado valor

-- Operadores de comparação
-- = igual
-- <> ou ! = diferente
-- > maior que
-- >= maior ou igual
-- < menor que
-- <= menor ou igual

-- EX 6: Uso de and, or e not
-- and - todas as codições precisam ser verdadeiras
SELECT nome, preco
FROM produto
WHERE preco >= 8.00 and preco <= 20,00

-- or - Pelo menos uma condiação verdadir
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' or cidade = 'Piracicaba;'

-- not - Negar não trazer resultado que foi apresentado
SELECT nome, cidade
FROM cliente
WHERE not cidade = 'Limeira';

-- Juntos - and e or
SELECT nome, cidade, ativo AS STATUS
FROM cliente
WHERE ativo = TRUE
and (cidade = 'Limeira' or cidade = 'limeira');

-- EX 7: Pesquisando por intervalo -- between
SELECT nome, preco
FROM produto where preco BETWEEN 8.00 and 15.00;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23-09-22 23:59:59';

-- EX 8: IN com várias possibilidades
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Americana', 'Piracicaba');

SELECT nome, cidade
FROM cliente
WHERE cidade not in ('Limeira', 'Campinas');

-- EX 9: Exemplo com textos ou pesquisar por textos - LIKE
-- coringas
-- % vários caracteres
-- _ exatamente um caracter

SELECT nome
FROM produto
WHERE nome LIKE 'Cafe%';
-- Retornar produtos que possuem palavras café e que começam com ela

SELECT nome
FROM produto
WHERE nome LIKE '%Chocolate%';
-- retornar produtos que possuem a palavra chocolate

SELECT nome
FROM produto
WHERE nome LIKE '%Silva';
-- Retornar nomes que terminam com silva

SELECT nome
FROM produto
WHERE nome LIKE '_afé%';

-- EX 10: NULL - Ausência de valor
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE IS NOT FULL;

-- EX 11: order by - ordenar resultados
-- ASC sigifica crescente
-- DESC significa decrescente


SELECT nome, preco
FROM produto
ORDER BY preco DESC;

SELECT cidade, nome
FROM cliente
ORDER BY cidade ASC, nome DESC;

-- EX 12: LIMIT - Limitado a quantidade de linha
SELECT nome, preco
FROM produto
ORDER BY preco DESC
limit 8;

SELECT nome, preco
FROM produto
ORDER BY nome
LIMIT 5 OFFSET 5;

-- EX 13: Cálculo de colunas e valores projetáveis
SELECT nome, preco, preco * 1.10 AS preco_atualizado
FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario as Total_compra
FROM item_pedido;

-- EX 14: Funções para consulta
-- Textos
SELECT UPPER(nome) AS Nome_Cliente, LOWER(email) AS Email_Minusculo
FROM cliente;

SELECT CONCAT(nome. ' - ', cidade) AS Cliente_cidade
FROM cliente;

-- Números
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;

-- Datas
SELECT id_pedido, data_pedido, DATE(data_pedido) AS data, DAY(data_pedido) AS dia, MONTH(data_pedido) AS mês, YEAR(data_pedido) AS ano
FROM pedido;

-- Substituindo o NULL no resultado - coalesce
SELECT nome, COALESCE(telefone, 'Não Informado') AS Contato
FROM cliente;

-- EX 15: Funções de agragação - SUM, AVG, MIN, MAX, COUNT
-- count - contar quantidade de registros
-- sum - soma de valores
-- avg - média de valores
-- min - menor valor
-- max - maior valor

SELECT COUNT(*) AS Total_clientes
FROM cliente;
-- Resultado de quantidade de cliente

SELECT AVG(preco) AS Média_Precos
FROM produto;
-- Média do valor dos produtos

SELECT MIN(preco) AS Promoção, MAX(preco) AS Reajuste, AVG (preco) AS Média_Precos
FROM produto;
-- Resumo de preços

SELECT SUM(valor_total) AS Faturamento_Mensal
FROM pedido
WHERE status = 'FINALIZADO';
-- Total de pedidos finalizados

-- EX 16: GROUP BY - Agrupar dados
SELECT cidade, COUNT(*) AS qtde_cidades
FROM cliente
GROUP BY cidade;
-- Consulta por grupos de cidades

SELECT id_categoria, COUNT(*) AS qtde_produtos
FROM produto
GROUP BY id_categoria;
-- Quantidade por categoria

-- EX 17: HAVING - Filtro por Grupo
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >=2;
-- DICA: Usar o HAVING e nao esquecer o GROUP BY

---------------------------------------------------------------------------------
-- EX 18: Consulta Completa
SELECT colunas
FROM tabela
WHERE condicao
GROUP BY colunas_agrupar
HAVING condicao
ORDER BY colunas
LIMIT quantidade;

-- Dica para seguir em ordem lógica para uma consulta parcial ou completa
--------------------------------------------------------------------------------