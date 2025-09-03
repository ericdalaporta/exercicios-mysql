CREATE TABLE MARCA (
	codmarca int,
	nommarca varchar (50),
	PRIMARY KEY (codmarca)
);

CREATE TABLE MODELO (
	codmodelo int,
	nommodelo varchar (100),
	codmarca int,
	PRIMARY KEY (codmodelo),
	FOREIGN KEY (codmarca) REFERENCES MARCA (codmarca) 
);

CREATE TABLE CIDADE (
	codcidade int,
	nomecidade varchar (100),
	siglaestado varchar (2),
	PRIMARY KEY (codcidade)
);

CREATE TABLE REVENDA (
	codrev int,
	nomrev varchar(100),
	fone varchar(20),
	endereco varchar(100),
	codcidade int,
	codmarca INT,
	PRIMARY KEY (codrev),
	FOREIGN KEY (codcidade) REFERENCES CIDADE (codcidade),
	FOREIGN KEY (codmarca) REFERENCES MARCA (codmarca)
);

CREATE TABLE VENDE (
	codmodelo int,
	codrev int,
	dataano date,
	quantidade int,
	PRIMARY KEY (codmodelo),
	FOREIGN KEY (codmodelo) REFERENCES MODELO (codmodelo),
	FOREIGN KEY (codrev) REFERENCES REVENDA (codrev)
);

INSERT INTO MARCA (codmarca, nommarca) VALUES (1, 'Chevrolet');
INSERT INTO MARCA (codmarca, nommarca) VALUES (2, 'Ford');
INSERT INTO MARCA (codmarca, nommarca) VALUES (3, 'Volkswagen');

INSERT INTO CIDADE (codcidade, nomecidade, siglaestado) VALUES (101, 'São Paulo', 'SP');
INSERT INTO CIDADE (codcidade, nomecidade, siglaestado) VALUES (102, 'Rio de Janeiro', 'RJ');
INSERT INTO CIDADE (codcidade, nomecidade, siglaestado) VALUES (103, 'Santa Maria', 'RS');

INSERT INTO REVENDA (codrev, nomrev, fone, endereco, codcidade, codmarca)
VALUES (201, 'Revenda SP Motors', '11-9999-8888', 'Rua Augusta, 123', 101, 1);
INSERT INTO REVENDA (codrev, nomrev, fone, endereco, codcidade, codmarca)
VALUES (202, 'Revenda Carioca', '21-9888-7777', 'Av. Atlântica, 456', 102, 2);
INSERT INTO REVENDA (codrev, nomrev, fone, endereco, codcidade, codmarca)
VALUES (203, 'Revenda Gaucha', '51-9777-6666', 'Rua da Praia, 789', 103, 3);

-- aparece o nome da revenda e cidade, 2 tabelas
SELECT nomrev, nomecidade
FROM REVENDA, CIDADE
WHERE REVENDA.codcidade = CIDADE.codcidade; -- where p filtrar onde codcidade sao iguais nas 2 table

-- aparece o nome da revenda, cidade dela e a marca que ela vende, 3 tabelas
SELECT nomrev, nomecidade, nommarca
FROM REVENDA, CIDADE, MARCA
WHERE REVENDA.codcidade = CIDADE.codcidade AND REVENDA.codmarca = MARCA.codmarca;
