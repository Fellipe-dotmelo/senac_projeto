-- criando banco de dados - locação de veículos
CREATE DATABASE LocacaoVeiculos;
GO

USE LocacaoVeiculos;
GO

-- criando tabelas
CREATE TABLE tb_km (
    ANO INT,
    Ano1 INT,
    DATAREDUZIDA DATE,
    ICONE VARCHAR(255),
    ID_CLIENTE INT,
    KILOMETRO_PERCORRIDO FLOAT,
    MARCA VARCHAR(255),
    CONSTRAINT PK_tb_km PRIMARY KEY (ID_CLIENTE, ANO)
);

--selecionando todos os registros da tabela tb_km
SELECT * FROM tb_km;

--apagando dado nulo inexistente
ALTER TABLE tb_km
DROP COLUMN Ano1;


CREATE TABLE tb_clientes (
    ID INT PRIMARY KEY,
    NOME VARCHAR(255),
    CIDADE VARCHAR(255),
    CARGO VARCHAR(255),
    QuantidadeClientes INT
);

SELECT * FROM tb_clientes;


-- Relacionamentos
-- Relacionamento entre tb_km e tb_clientes
ALTER TABLE tb_km
ADD CONSTRAINT FK_tb_km_tb_clientes
FOREIGN KEY (ID_CLIENTE)
REFERENCES tb_clientes(ID);

-- Inner Join (Registros que têm correspondência em ambas as tabelas)
SELECT km.*, cl.*
FROM tb_km km
INNER JOIN tb_clientes cl
ON km.ID_CLIENTE = cl.ID;

-- criando view para uso no power bi do inner join aciam
CREATE VIEW vw_km_clientes AS
SELECT  km.*, cl.*
FROM tb_km km
INNER JOIN tb_clientes cl
ON km.ID_CLIENTE = cl.ID

select * from vw_km_clientes

-- Left Join (Todos os registros de tb_km e correspondências de tb_clientes)
SELECT km.*, cl.*
FROM tb_km km
LEFT JOIN tb_clientes cl
ON km.ID_CLIENTE = cl.ID;

-- criando view para uso no power bi do left join acima
CREATE VIEW vw_km_cliente_tem AS
SELECT km.*, cl.*
FROM tb_km km
LEFT JOIN tb_clientes cl
ON km.ID_CLIENTE = cl.ID;

select * from vw_km_cliente_tem