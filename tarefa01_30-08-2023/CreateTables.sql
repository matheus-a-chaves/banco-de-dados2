CREATE TABLE
  Cliente(
    CPF VARCHAR(11),
    Nome VARCHAR(50),
    DataNasc DATE,
    Telefone VARCHAR(8),
    Endereco VARCHAR(50),
    Email VARCHAR(50),
    CONSTRAINT CPF_CLI_PK PRIMARY KEY(CPF)
  );


CREATE TABLE
  Funcionario(
    CPF VARCHAR(11),
    Nome VARCHAR(50),
    Endereco VARCHAR(50),
    DataNasc DATE,
    Telefone VARCHAR(11),
    Email VARCHAR(50),
    Login VARCHAR(20),
    Senha VARCHAR(10),
    CONSTRAINT CPF_FUNC_PK PRIMARY KEY(CPF)
  );


CREATE TABLE
  Veiculos(
    Placa VARCHAR(7),
    Marca VARCHAR(10),
    Modelo VARCHAR(10),
    Ano INT(4),
    Disponivel BOOLEAN,
    Cor VARCHAR(10),
    ValorHora FLOAT,
    CONSTRAINT VEI_PK PRIMARY KEY(Placa)
  );


CREATE TABLE
  Locacoes(
    Id SERIAL,
    DataInicio DATE,
    DataFim DATE,
    VeiculoPlaca VARCHAR(7),
    ClienteCPF VARCHAR(11),
    FuncionarioCPF VARCHAR(11),
    CONSTRAINT LOC_PK PRIMARY KEY(ID),
    CONSTRAINT LOC_VEI_FK FOREIGN KEY(VeiculoPlaca) REFERENCES Veiculos(Placa),
    CONSTRAINT LOC_FUN_FK FOREIGN KEY(FuncionarioCPF) REFERENCES Funcionario(CPF),
    CONSTRAINT LOC_CLI_FK FOREIGN KEY(ClienteCPF) REFERENCES Cliente(CPF)
  );