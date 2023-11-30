DELIMITER //

CREATE PROCEDURE AdicionarPedido(
    IN p_Id_cliente INT,
    IN p_Id_funcionario INT,
    IN p_Id_metodo_pagamento INT,
    IN p_Id_status_pedido INT
)
BEGIN
    DECLARE v_Criado_por_usuario VARCHAR(50);

    -- Obter o nome do funcionário que está criando o pedido
    SELECT Nome INTO v_Criado_por_usuario FROM Funcionarios WHERE Id_funcionario = p_Id_funcionario;

    -- Inserir um novo pedido na tabela Pedidos
    INSERT INTO Pedidos (Id_cliente, Id_funcionario, Id_metodo_pagamento, Id_status_pedido, Criado_por_usuario)
    VALUES (p_Id_cliente, p_Id_funcionario, p_Id_metodo_pagamento, p_Id_status_pedido, v_Criado_por_usuario);

    -- Obter o ID do último pedido inserido
    SET @v_NovoPedidoId = (SELECT LAST_INSERT_ID());

    -- Adicionar um registro ao Histórico de Status do Pedido
    INSERT INTO Historico_Status_Pedido (Id_pedido, Id_status_pedido, Data_modificacao)
    VALUES (@v_NovoPedidoId, p_Id_status_pedido, CURRENT_TIMESTAMP);
END //

CREATE PROCEDURE AtualizarStatusPedido(
    IN p_Id_pedido INT,
    IN p_Novo_Status INT
)
BEGIN
    -- Verificar se o pedido existe
    IF EXISTS (SELECT 1 FROM Pedidos WHERE Id_pedido = p_Id_pedido) THEN
        -- Adicionar um registro ao Histórico de Status do Pedido
        INSERT INTO Historico_Status_Pedido (Id_pedido, Id_status_pedido, Data_modificacao)
        VALUES (p_Id_pedido, p_Novo_Status, CURRENT_TIMESTAMP);
        
        -- Atualizar o status do pedido na tabela Pedidos
        UPDATE Pedidos
        SET Id_status_pedido = p_Novo_Status,
            Modificado_por_usuario = 'Sistema',
            Data_modificacao = CURRENT_TIMESTAMP
        WHERE Id_pedido = p_Id_pedido;
        
        SELECT 'Status do Pedido Atualizado com Sucesso!' AS Resultado;
    ELSE
        SELECT 'Pedido não encontrado.' AS Resultado;
    END IF;
END //

CREATE PROCEDURE ListarPedidosPorCliente(
    IN p_Id_cliente INT
)
BEGIN
    -- Selecionar todos os pedidos do cliente
    SELECT Pedidos.*, Status_Pedido.Nome_status
    FROM Pedidos
    JOIN Status_Pedido ON Pedidos.Id_status_pedido = Status_Pedido.Id_status_pedido
    WHERE Pedidos.Id_cliente = p_Id_cliente;
END //

-- Exemplos de chamada

CALL AdicionarPedido(1, 2, 1, 1);

CALL AtualizarStatusPedido(1, 2);

CALL ListarPedidosPorCliente(1);

DELIMITER ;