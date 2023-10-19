--- MOSTRA A QUANTIDADE DE VENDAS DOS PRODUTOS E O VALOR TOTAL DELAS DE FORMA DECRESCENTE ---
SELECT
    Produto.NOME_PRODUTO AS NomeDoProduto,
    COUNT(Itens_pedidos.ID_PRODUTO) AS QuantidadeVendida,
    SUM(Produto.PRECO) AS ValorTotalVendas
FROM Produto
INNER JOIN Itens_pedidos ON Produto.ID_PRODUTO = Itens_pedidos.ID_PRODUTO
GROUP BY Produto.NOME_PRODUTO
ORDER BY ValorTotalVendas DESC;

--- MOSTRA O CLIENTE QUE MAIS GASTOU ---

SELECT
    Cliente.NOME_CLIENTE AS "NOME DO CLIENTE",
    COUNT(Pedidos.ID_PEDIDO) AS "QUANTIDADE DE PEDIDOS",
    SUM(Produto.PRECO) AS "TOTAL GASTO"
FROM Cliente
INNER JOIN Pedidos ON Cliente.ID_CLIENTE = Pedidos.ID_CLIENTE
INNER JOIN Itens_pedidos ON Pedidos.ID_PEDIDO = Itens_pedidos.ID_PEDIDO
INNER JOIN Produto ON Itens_pedidos.ID_PRODUTO = Produto.ID_PRODUTO
GROUP BY Cliente.ID_CLIENTE
ORDER BY SUM(Produto.PRECO) DESC;

--- MOSTRA STATUS DO PEDIDO EM ANDAMENTO OU PENDENTE ---
SELECT
    Cliente.NOME_CLIENTE AS NomeDoCliente,
    Pedidos.ID_PEDIDO,
    Pedidos.STATUS,
    Produto.NOME_PRODUTO AS NomeDoProduto
FROM Cliente
INNER JOIN Pedidos ON Cliente.ID_CLIENTE = Pedidos.ID_CLIENTE
INNER JOIN Itens_pedidos ON Pedidos.ID_PEDIDO = Itens_pedidos.ID_PEDIDO
INNER JOIN Produto ON Itens_pedidos.ID_PRODUTO = Produto.ID_PRODUTO
WHERE Pedidos.STATUS = 'Em andamento' OR Pedidos.STATUS = 'Pendente'
ORDER BY Cliente.NOME_CLIENTE, Pedidos.ID_PEDIDO;

