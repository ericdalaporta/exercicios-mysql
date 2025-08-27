CREATE TABLE Doença (
    coddoença INT PRIMARY KEY,
    nomdoença VARCHAR(50),
    descrição_doença VARCHAR(255)
);

CREATE TABLE Cidade (
    codcidade INT PRIMARY KEY,
    nome_cidade VARCHAR(50),
    num_habitantes INT
);


-- aqui no caso eh o relacionamento
CREATE TABLE Cidade_Doença (
    codcidade INT,
    coddoença INT,
    ano INT PRIMARY KEY,
    num_casos_cidade_doença INT,
    num_obitos INT,
    
    FOREIGN KEY (codcidade) REFERENCES Cidade(codcidade),
    FOREIGN KEY (coddoença) REFERENCES Doença(coddoença)
);
