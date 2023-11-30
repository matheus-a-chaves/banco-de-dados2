-- Tabela de Funcionários
CREATE TABLE Funcionarios (
    Id_funcionario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(100)
);

-- Tabela de Métodos de Pagamento
CREATE TABLE Metodos_Pagamento (
    Id_metodo_pagamento INT PRIMARY KEY,
    Nome_metodo VARCHAR(50),
    Descricao VARCHAR(255)
);

-- Tabela de Status do Pedido
CREATE TABLE Status_Pedido (
    Id_status_pedido INT PRIMARY KEY,
    Nome_status VARCHAR(50),
    Descricao VARCHAR(255)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    Id_cliente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Endereco VARCHAR(255)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    Id_produto INT PRIMARY KEY,
    Nome_produto VARCHAR(100),
    Preco DECIMAL(10, 2),
    Descricao VARCHAR(255)
);

CREATE TABLE Pedidos (
    Id_pedido INT PRIMARY KEY DEFAULT 0,
    Data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Id_cliente INT,
    Id_funcionario INT,
    Id_metodo_pagamento INT,
    Id_status_pedido INT,
    Criado_por_usuario VARCHAR(50),
    Data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Modificado_por_usuario VARCHAR(50),
    Data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente),
    FOREIGN KEY (Id_funcionario) REFERENCES Funcionarios(Id_funcionario),
    FOREIGN KEY (Id_metodo_pagamento) REFERENCES Metodos_Pagamento(Id_metodo_pagamento),
    FOREIGN KEY (Id_status_pedido) REFERENCES Status_Pedido(Id_status_pedido)
);

-- Tabela de Itens do Pedido
CREATE TABLE Itens_Pedido (
    Id_item_pedido INT PRIMARY KEY,
    Id_pedido INT DEFAULT 0,
    Id_produto INT,
    Quantidade INT,
    Preco DECIMAL(10, 2),
    FOREIGN KEY (Id_pedido) REFERENCES Pedidos(Id_pedido),
    FOREIGN KEY (Id_produto) REFERENCES Produtos(Id_produto)
);

-- Tabela de Histórico de Status do Pedido
CREATE TABLE Historico_Status_Pedido (
    Id_historico_status INT PRIMARY KEY AUTO_INCREMENT,
    Id_pedido INT DEFAULT 0,
    Id_status_pedido INT,
    Data_modificacao TIMESTAMP,
    FOREIGN KEY (Id_pedido) REFERENCES Pedidos(Id_pedido),
    FOREIGN KEY (Id_status_pedido) REFERENCES Status_Pedido(Id_status_pedido)
);