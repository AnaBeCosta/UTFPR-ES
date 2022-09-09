--1
DELETE FROM Estado WHERE sigla_estado = ‘SP’

--2
CREATE TABLE vendedor (
cod_vendedor serial,
nome varchar(50) NOT NULL,
datanascimento date,
endereco varchar(60),
cep character(8),
telefone varchar(15),
cod_cidade int2 DEFAULT 1 NOT NULL,
funcao varchar(40),
datacontratacao date,
cod_departamento int2 NOT NULL,
CONSTRAINT PK_VEND PRIMARY KEY(cod_vendedor),
CONSTRAINT FK_VEND_CID FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade)
ON DELETE SET DEFAULT ON UPDATE SET NULL,
--Por causa da constraint definida o valor na tabela do vendedor será setado como null
  
--3
--Ele não irá alterar pois é uma chave estrangeira e a constraint possui uma restrição.

--4
--Ocorreu um erro devido a tabela cidade ser a tabela pai de fornecedores, onde possui uma fk. A solução seria utilizar o ON CASCATE, desta forma a fk será eliminada nas demais tabelas.

--5
ALTER TABLE [nome da tabela filho] ALTER COLUMN [registro na tabela filho que é FK
da tabela pai] SET NULL;
  
--6
TRUNCATE Estado;
 
--7
DROP TABLE Estado;
  
