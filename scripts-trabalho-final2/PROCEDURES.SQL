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

DELIMITER ;

-- CHAMADA
CALL AdicionarPedido(1, 2, 1, 1);


