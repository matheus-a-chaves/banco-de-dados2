--- MOSTRA A QUANTIDADE DE VENDAS DOS PRODUTOS E O VALOR TOTAL DELAS DE FORMA DECRESCENTE ---
SELECT
    P.Id_produto,
    P.Nome_produto,
    SUM(IP.Quantidade) AS Quantidade_Vendida,
    SUM(IP.Quantidade * P.Preco) AS Valor_Total
FROM
    Produtos P
JOIN
    Itens_Pedido IP ON P.Id_produto = IP.Id_produto
JOIN
    Pedidos PD ON IP.Id_pedido = PD.Id_pedido
WHERE
    PD.Id_status_pedido = (SELECT Id_status_pedido FROM Status_Pedido WHERE Nome_status = 'Entregue')
GROUP BY
    P.Id_produto, P.Nome_produto
ORDER BY
    Quantidade_Vendida DESC;

--- MOSTRA O CLIENTE QUE MAIS GASTOU ---
SELECT
    C.Id_cliente,
    C.Nome AS "NOME DO CLIENTE",
    SUM(IP.Quantidade) AS "QUANTIDADE DE ITENS",
    SUM(IP.Quantidade * P.Preco) AS "TOTAL GASTO"
FROM
    Clientes C
JOIN
    Pedidos PD ON C.Id_cliente = PD.Id_cliente
JOIN
    Itens_Pedido IP ON PD.Id_pedido = IP.Id_pedido
JOIN
    Produtos P ON IP.Id_produto = P.Id_produto
WHERE
    PD.Id_status_pedido = (SELECT Id_status_pedido FROM Status_Pedido WHERE Nome_status = 'Entregue' LIMIT 1)
GROUP BY
    C.Id_cliente, C.Nome
ORDER BY
    SUM(IP.Quantidade * P.Preco) DESC

-- INFORMAÇÕES GERAIS DO PEDIDO --
SELECT
    PD.Id_pedido,
    PD.Data_pedido,
    C.Nome AS Nome_cliente,
    F.Nome AS Nome_funcionario,
    MP.Nome_metodo AS Metodo_pagamento,
    SP.Nome_status AS Status_pedido,
    P.Nome_produto,
    IP.Quantidade,
    P.Preco,
    IP.Quantidade * P.Preco AS Valor_Total_Item
FROM
    Pedidos PD
JOIN
    Clientes C ON PD.Id_cliente = C.Id_cliente
JOIN
    Funcionarios F ON PD.Id_funcionario = F.Id_funcionario
JOIN
    Metodos_Pagamento MP ON PD.Id_metodo_pagamento = MP.Id_metodo_pagamento
JOIN
    Status_Pedido SP ON PD.Id_status_pedido = SP.Id_status_pedido
JOIN
    Itens_Pedido IP ON PD.Id_pedido = IP.Id_pedido
JOIN
    Produtos P ON IP.Id_produto = P.Id_produto
ORDER BY
    PD.Data_pedido DESC, PD.Id_pedido, IP.Id_item_pedido;

