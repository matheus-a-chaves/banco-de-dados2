-- Registra o usuario que fez a ultima modificação na tabela de pedidos
DELIMITER //

CREATE TRIGGER before_update_pedidos
BEFORE UPDATE ON Pedidos FOR EACH ROW
BEGIN
    -- Se Modificado_por_usuario não foi fornecido durante a atualização, defina-o para o usuário atual
    IF NEW.Modificado_por_usuario IS NULL THEN
        SET NEW.Modificado_por_usuario = CURRENT_USER();
    END IF;

    -- Atualize a data de modificação
    SET NEW.Data_modificacao = CURRENT_TIMESTAMP;
END //

DELIMITER ;

-- Cria um novo historico na tabala Historico_Status_Pedido
DELIMITER //

CREATE TRIGGER AfterUpdatePedido
AFTER UPDATE ON Pedidos
FOR EACH ROW
BEGIN
    -- Verifica se houve alteração no status do pedido
    IF NEW.Id_status_pedido != OLD.Id_status_pedido THEN
        -- Adiciona um novo registro ao histórico de status
        INSERT INTO Historico_Status_Pedido (Id_pedido, Id_status_pedido, Data_modificacao)
        VALUES (NEW.Id_pedido, NEW.Id_status_pedido, CURRENT_TIMESTAMP);
    END IF;
END //

DELIMITER ;

-- Não deixa ele inserir outro status caso já esteja finalizado(3)
DELIMITER //

CREATE TRIGGER BeforeUpdatePedido
BEFORE UPDATE ON Pedidos
FOR EACH ROW
BEGIN
    -- Verifica se o status está sendo alterado para "Em Processamento" ou "A Caminho"
    IF NEW.Id_status_pedido IN (1, 2) AND OLD.Id_status_pedido = 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é permitido voltar o status para "Em Processamento" ou "A Caminho" após o status "Entregue".';
    END IF;
END //

DELIMITER ;

-- Atualizando o pedido para ativar as triggers
UPDATE Pedidos
SET Id_status_pedido = 3 
WHERE Id_pedido = 2;



