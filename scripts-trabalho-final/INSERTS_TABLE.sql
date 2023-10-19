INSERT INTO Cliente(NOME_CLIENTE, EMAIL, TELEFONE) VALUES
('Matheus Chaves', 'matheuschaves@gmail.com', '123-456-7890'),
('Fatima dos Santos', 'fatima.santos@gmail.com', '987-654-3210'),
('Jessica de Fatima', 'jessicafatima@gmail.com', '555-555-5555');


INSERT INTO Produto(NOME_PRODUTO, DESCRICAO, PRECO) VALUES
('Smartphone Samsung Galaxy S21', 'Celular de última geração', 799.99),
('Notebook HP Envy', 'Notebook premium com tela touch', 1299.99),
('Fones de Ouvido Sony WH-1000XM4', 'Fones de ouvido com cancelamento de ruído', 299.99);


INSERT INTO Pedidos(ID_CLIENTE, DATA_PEDIDO, STATUS) VALUES
(1, '2023-10-18', 'Em andamento'),
(2, '2023-10-19', 'Concluído'),
(3, '2023-10-20', 'Pendente');


INSERT INTO Itens_pedidos(ID_PEDIDO, ID_PRODUTO) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(3, 1);






