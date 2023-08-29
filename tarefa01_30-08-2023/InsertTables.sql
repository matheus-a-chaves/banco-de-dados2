INSERT INTO
  Cliente(CPF, Nome, DataNasc, Telefone, Endereco, Email)
VALUES
  (
    '5899099099',
    'Fatima Jessica Matheus',
    '2008-7-04',
    '99830607',
    'Rua joao 2',
    'sept@ufpr.br'
  );


INSERT INTO
  Funcionario(
    CPF,
    Nome,
    Endereco,
    DataNasc,
    Telefone,
    Email,
    Login,
    Senha
  )
VALUES
  (
    '5899099088',
    'Jessica Fatima Matheus',
    'Rua joao 2',
    '2008-7-04',
    '99830607',
    'sept@ufpr.br',
    'jess@ufpr.br',
    '8c92n3o0'
  );


INSERT INTO
  Veiculos (Placa, Marca, Modelo, Ano, Disponivel, Cor, ValorHora)
VALUES
  (
    'ABC1234',
    'Toyota',
    'Corolla',
    2022,
    TRUE,
    'Prata',
    50.75
  );


INSERT INTO
  Locacoes (
    DataInicio,
    DataFim,
    VeiculoPlaca,
    ClienteCPF,
    FuncionarioCPF
  )
VALUES
  (
    '2023-08-29',
    '2023-09-05',
    'ABC1234',
    '5899099099',
    '5899099088'
  );