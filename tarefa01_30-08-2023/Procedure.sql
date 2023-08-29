CREATE PROCEDURE BuscaLocacoesPorDataInicio(IN dataInicioParam DATE)
BEGIN
    SELECT
        Locacoes.Id,
        Locacoes.DataInicio AS  "Data Inicial",
        Locacoes.DataFim AS "Data Final",
        Cliente.Nome AS "Nome do Cliente",
        Funcionario.Nome AS "Nome do Funcionario"
    FROM
        Locacoes
    INNER JOIN
        Cliente ON Locacoes.ClienteCPF = Cliente.CPF
    INNER JOIN
        Funcionario ON Locacoes.FuncionarioCPF = Funcionario.CPF
    WHERE
        Locacoes.DataInicio = dataInicioParam;
END 

-- EXEMPLO DE CHAMADA --
CALL BuscaLocacoesPorDataInicio('2023-08-29');