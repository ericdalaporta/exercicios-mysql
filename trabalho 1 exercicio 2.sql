/* TRABALHO 1, EXERCÍCIO 2 */

CREATE TABLE GRUPO
(
  CODGRUPO INT,
  NOMGRUPO VARCHAR(100),
  DESC_GRUPO VARCHAR(255),
  PRIMARY KEY (CODGRUPO)
);

CREATE TABLE PRODUTO
(
  CODPROD INT,
  NOMPROD VARCHAR(200),
  CODGRUPO INT,
  PRIMARY KEY (CODPROD),
  FOREIGN KEY (CODGRUPO) REFERENCES GRUPO (CODGRUPO)
);

CREATE TABLE CIDADE
(
  CODCID INT,
  NOMCID VARCHAR(100),
  PRIMARY KEY (CODCID)
);

CREATE TABLE CIDADE_PRODUTO
(
  CODPROD INT,
  CODCID INT,
  DATA_LEVANTAMENTO date,
  PRIMARY KEY (DATA_LEVANTAMENTO, CODPROD, CODCID),
  FOREIGN KEY (CODPROD) REFERENCES PRODUTO (CODPROD),
  FOREIGN KEY (CODCID) REFERENCES CIDADE (CODCID)
);

-- Inserindo o grupo "Grãos" conforme a solicitação
INSERT INTO GRUPO (CODGRUPO, NOMGRUPO, DESC_GRUPO)
VALUES (1, 'Grãos', 'Os grãos');

-- Vou adicionar os outros agora

INSERT INTO GRUPO (CODGRUPO, NOMGRUPO, DESC_GRUPO)
VALUES (2, 'Higiene', 'Muita higiene uau');

-- Verificando se a inserção funcionou
SELECT * FROM GRUPO;



-- Agora vou adicionar dentro da tabela PRODUTO algumas coisas

INSERT INTO PRODUTO (CODPROD, NOMPROD, CODGRUPO)
VALUES (20, 'Arroz', '1');

INSERT INTO PRODUTO (CODPROD, NOMPROD, CODGRUPO)
VALUES (30, 'FEIJAOZAO', '1');

INSERT INTO PRODUTO (CODPROD, NOMPROD, CODGRUPO)
VALUES (40, 'Limpador de bosta', '2');

SELECT * FROM PRODUTO;

-- Listar o nome dos produtos do grupo 1
select nomprod from produto where codgrupo = 1;

-- Listar os nomes dos produtos com os nomes dos seus grupos
select nomprod, nomgrupo
	from produto, grupo
where produto.codgrupo = grupo.codgrupo; -- Ver o que ele fez aqui porque eu não entendi