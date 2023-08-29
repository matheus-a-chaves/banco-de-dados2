SELECT * FROM Cliente;
SELECT * FROM Funcionario;
SELECT * FROM Locacoes;
SELECT * FROM Veiculos;

-- QUANDO O CLIENTE FEZ A LOCAÇÃO --
SELECT
    Locacoes.Id,
    Locacoes.DataInicio,
    Locacoes.DataFim,
    Cliente.Nome AS NomeCliente
FROM
    Locacoes
    INNER JOIN Cliente ON Locacoes.ClienteCPF = Cliente.CPF;

-- QUANDO E COM QUEM O CLIENTE FEZ A LOCAÇÃO --
SELECT
    Locacoes.Id,
    Locacoes.DataInicio,
    Locacoes.DataFim,
    Cliente.Nome AS NomeCliente,
    Funcionario.Nome AS NomeFuncionario
FROM
    Locacoes
    INNER JOIN Cliente ON Locacoes.ClienteCPF = Cliente.CPF
    INNER JOIN Funcionario ON Locacoes.FuncionarioCPF = Funcionario.CPF;