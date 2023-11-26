-- Inserção de dados na tabela Funcionarios
INSERT INTO Funcionarios (Id_funcionario, Nome, Cargo) VALUES
(1, 'João Silva', 'Atendente'),
(2, 'Maria Oliveira', 'Gerente'),
(3, 'Pedro Santos', 'Caixa');

-- Inserção de dados na tabela Metodos_Pagamento
INSERT INTO Metodos_Pagamento (Id_metodo_pagamento, Nome_metodo, Descricao) VALUES
(1, 'Cartão de Crédito', 'Pagamento com cartão de crédito'),
(2, 'Boleto Bancário', 'Pagamento via boleto'),
(3, 'Dinheiro', 'Pagamento em dinheiro');

-- Inserção de dados na tabela Status_Pedido
INSERT INTO Status_Pedido (Id_status_pedido, Nome_status, Descricao) VALUES
(1, 'Em Processamento', 'Pedido em processamento'),
(2, 'A Caminho', 'Pedido a caminho'),
(3, 'Entregue', 'Pedido entregue');

-- Inserção de dados na tabela Clientes
INSERT INTO Clientes (Id_cliente, Nome, Telefone, Email, Endereco) VALUES
(1, 'Ana Souza', '123456789', 'ana@example.com', 'Rua A, 123'),
(2, 'Carlos Lima', '987654321', 'carlos@example.com', 'Rua B, 456'),
(3, 'Fernanda Santos', '111223344', 'fernanda@example.com', 'Rua C, 789');

-- Inserção de dados na tabela Produtos
INSERT INTO Produtos (Id_produto, Nome_produto, Preco, Descricao) VALUES
(1, 'Produto 1', 19.99, 'Descrição do Produto 1'),
(2, 'Produto 2', 29.99, 'Descrição do Produto 2'),
(3, 'Produto 3', 39.99, 'Descrição do Produto 3');

-- Inserção de dados na tabela Pedidos
INSERT INTO Pedidos (Id_pedido, Data_pedido, Id_cliente, Id_funcionario, Id_metodo_pagamento, Id_status_pedido, Criado_por_usuario, Data_criacao, Modificado_por_usuario, Data_modificacao) VALUES
(1, '2023-11-25 10:00:00', 1, 1, 1, 1, 'Usuario1', '2023-11-25 10:00:00', 'Usuario1', '2023-11-25 10:00:00'),
(2, '2023-11-26 12:30:00', 2, 2, 2, 2, 'Usuario2', '2023-11-26 12:30:00', 'Usuario2', '2023-11-26 12:30:00'),
(3, '2023-11-27 15:45:00', 3, 3, 3, 3, 'Usuario3', '2023-11-27 15:45:00', 'Usuario3', '2023-11-27 15:45:00');

-- Inserção de dados na tabela Itens_Pedido
INSERT INTO Itens_Pedido (Id_item_pedido, Id_pedido, Id_produto, Quantidade, Preco) VALUES
(1, 1, 1, 2, 39.98),
(2, 1, 2, 1, 29.99),
(3, 2, 3, 3, 119.97);

-- Inserção de dados na tabela Historico_Status_Pedido
INSERT INTO Historico_Status_Pedido (Id_historico_status, Id_pedido, Id_status_pedido, Data_modificacao) VALUES
(1, 1, 1, '2023-11-25 10:30:00'),
(2, 1, 2, '2023-11-25 11:00:00'),
(3, 1, 3, '2023-11-25 11:30:00');
