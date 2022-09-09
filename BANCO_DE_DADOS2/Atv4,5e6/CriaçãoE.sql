CREATE TABLE estado(
    sigla_estado CHAR(2) CHECK (LENGTH(TRIM(sigla_estado)) = 2),
    nome varchar(40) UNIQUE,
    CONSTRAINT PK_EST PRIMARY KEY(sigla_estado)
);

CREATE TABLE cidade(
    cod_cidade SERIAL,
    nome varchar(40) UNIQUE,
    sigla_estado CHAR(2) NOT NULL,  
    CONSTRAINT PK_CID PRIMARY KEY(cod_cidade),
    CONSTRAINT FK_CID_EST FOREIGN KEY (sigla_estado) REFERENCES estado(sigla_estado) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE departamento(
    cod_departamento SERIAL,
    nome varchar(40) UNIQUE,
    descricaofuncional varchar(80),
    localizacao text,
    CONSTRAINT PK_DEPTO PRIMARY KEY(cod_departamento)
);

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
    CONSTRAINT FK_VEND_CID FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade) ON DELETE SET DEFAULT ON UPDATE SET NULL,
    CONSTRAINT FK_VEND_DEPTO FOREIGN KEY(cod_departamento) REFERENCES departamento(cod_departamento) ON DELETE NO ACTION ON UPDATE CASCADE
);

create table cliente (
    cod_cliente serial,
    endereco varchar(60),
    cod_cidade int2 NOT NULL,
    cep character(8),
    telefone varchar(15),
    tipo char(1),
    datacadastro date DEFAULT current_date,
    CONSTRAINT PK_CLI PRIMARY KEY(cod_cliente),
    CONSTRAINT FK_CLI_CID FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE cliente_fisica (
    cod_cliente int2,
    nome varchar(50) NOT NULL,
    datanascimento date,
    cpf varchar(11) UNIQUE,
    rg varchar(8) UNIQUE,
    CONSTRAINT PK_CLI_FIS PRIMARY KEY(cod_cliente),
    CONSTRAINT FK_CLISFIS_CLI FOREIGN KEY(cod_cliente) REFERENCES cliente(cod_cliente) ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE TABLE cliente_juridica (
    cod_cliente int2,
    nomefantasia varchar(80) NOT NULL,
    razaosocial varchar(80) UNIQUE,
    ie varchar(20),
    cgc varchar(20) UNIQUE,
    CONSTRAINT FK_CLI_JUR PRIMARY KEY(cod_cliente),
    CONSTRAINT FK_CLIJUR_CLI FOREIGN KEY(cod_cliente) REFERENCES cliente(cod_cliente) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE classe (
    cod_classe SERIAL,
    sigla varchar(12) UNIQUE,
    nome varchar(40) NOT NULL,
    descricao varchar(80),
    CONSTRAINT PK_CLAS PRIMARY KEY(cod_classe)
);

CREATE TABLE produto (
    cod_produto SERIAL,
    descricao varchar(40) NOT NULL,
    unidademedida varchar(2) CHECK(unidademedida IN('Kg','Lt','Mt')) ,
    embalagem varchar(12) DEFAULT 'Pacote',
    cod_classe int2 NOT NULL,
    precovenda numeric(14,2),
    estoqueminimo numeric(14,2),
    CONSTRAINT PK_PROD PRIMARY KEY(cod_produto),
    CONSTRAINT FK_PROD_CLAS FOREIGN KEY(cod_classe) REFERENCES classe(cod_classe) ON DELETE NO ACTION ON UPDATE CASCADE 
);


CREATE TABLE lote (
    numero_lote int2,
    cod_produto int2 NOT NULL,
    quantidadeadquirida int2 NOT NULL,
    quantidadevendida int2,
    precocusto numeric(14,2),
    datavalidade date,
    CONSTRAINT PK_LOTE PRIMARY KEY(numero_lote,cod_produto),
    CONSTRAINT FK_LOTE_PROD FOREIGN KEY(cod_produto) REFERENCES produto(cod_produto) ON DELETE NO ACTION ON UPDATE CASCADE 
);

CREATE TABLE fornecedor (
    cod_fornecedor serial,
    nomefantasia varchar(30) NOT NULL,
    razaosocial varchar(50) UNIQUE,
    ie varchar(20),
    cgc varchar(20) UNIQUE,
    endereco varchar(60),
    telefone varchar(15),
    cod_cidade int2 NOT NULL,
    CONSTRAINT PK_FOR PRIMARY KEY(cod_fornecedor),
    CONSTRAINT FK_FOR_CID FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade) ON DELETE NO ACTION ON UPDATE CASCADE 
);

CREATE TABLE pedido (
    cod_pedido serial,
    datarealizacao date NOT NULL DEFAULT current_date,
    dataentrega date,
    cod_fornecedor int2 NOT NULL,
    valor numeric(14,2),
    CONSTRAINT PK_PED PRIMARY KEY(cod_pedido),
    CONSTRAINT FK_PED_FOR FOREIGN KEY(cod_fornecedor) REFERENCES fornecedor(cod_fornecedor) ON DELETE NO ACTION ON UPDATE CASCADE 
);

CREATE TABLE pedidoproduto (
    cod_pedido int2,
    cod_produto int2,
    quantidade numeric(14,2) CHECK(quantidade >0),
    CONSTRAINT PK_PED_PROD PRIMARY KEY(cod_pedido,cod_produto),
    CONSTRAINT FK_PEDPROD_PED FOREIGN KEY(cod_pedido) REFERENCES pedido(cod_pedido) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_PEDPROD_PROD FOREIGN KEY(cod_produto) REFERENCES produto(cod_produto) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE contaspagar (
    cod_titulo int2,
    datavencimento date,
    parcela int2,
    cod_pedido int2,
    valor numeric(14,2),
    datapagamento date,
    localpagamento varchar(50),
    juros numeric(14,2),
    correcaomonetaria numeric(14,2),
    CONSTRAINT PK_CP PRIMARY KEY(cod_titulo,datavencimento),
    CONSTRAINT FK_CP_PED FOREIGN KEY(cod_pedido) REFERENCES pedido(cod_pedido) ON DELETE NO ACTION ON UPDATE CASCADE 
);

CREATE TABLE venda (
    cod_notafiscal int2,
    cod_cliente int2 NOT NULL,
    cod_vendedor int2 NOT NULL,
    datavenda date DEFAULT current_date,
    enderecoentrega varchar(60),
    status varchar(30),
    CONSTRAINT PK_VENDA PRIMARY KEY(cod_notafiscal),
    CONSTRAINT FK_VENDA_CLI FOREIGN KEY(cod_cliente) REFERENCES cliente(cod_cliente) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_VENDA_VENDEDOR FOREIGN KEY(cod_vendedor) REFERENCES vendedor(cod_vendedor) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE vendaproduto (
    cod_notafiscal int2,
    numero_lote int2,
    cod_produto int2,
    quantidade numeric(14,2) CHECK(quantidade > 0),
    CONSTRAINT PK_VENDPROD PRIMARY KEY(cod_notafiscal,numero_lote,cod_produto),
    CONSTRAINT FK_VENDPROD_VENDA FOREIGN KEY(cod_notafiscal) REFERENCES venda(cod_notafiscal) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_VENDPROD_LOTE FOREIGN KEY(numero_lote,cod_produto) REFERENCES lote(numero_lote,cod_produto) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE contasreceber (
   cod_titulo int2,
   datavencimento date,
   cod_notafiscal int2 NOT NULL,
   parcela int2,
   valor numeric(14,2),
   datapagamento date,
   localpagamento varchar(50),
   juros numeric(14,2),
   correcao_monetaria numeric(14,2),
   CONSTRAINT PK_CR PRIMARY KEY(cod_titulo,datavencimento),
   CONSTRAINT FK_CR_VENDA FOREIGN KEY(cod_notafiscal) REFERENCES venda(cod_notafiscal) ON DELETE NO ACTION ON UPDATE CASCADE
);

INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('PA', 'Para');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('RN', 'Rio Grande do Norte');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('AM', 'Amazonas');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('AC', 'Acre');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('MT', 'Mato Grosso do Sul');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('BA', 'Bahia');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('CE', 'Ceara');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('PR', 'Parana');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('SC', 'Santa Catarina');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('SP', 'Sao Paulo');
INSERT INTO ESTADO (SIGLA_ESTADO, NOME) VALUES ('RS', 'Rio Grande do Sul');


--ALTER SEQUENCE CIDADE_COD_CIDADE_SEQ RESTART WITH 1
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Belem','PA');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Natal','RN');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Manaus','AM');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Rio Branco','AC');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Pitanga','PR');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Maring�','PR');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Palmeirinha','PR');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Cascavel','PR');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Foz do Igua�u','PR');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('S�o Paulo','SP');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Baur�','SP');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Rio de Janeiro','RJ');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Buzios','RJ');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Florian�polis','SC');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Blumenal','SC');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Rondon�polis','MT');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Primavera','MT');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Porto Seguro','BA');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Porto Alegre','RS');
INSERT INTO CIDADE (NOME, SIGLA_ESTADO) VALUES ('Gramado','RS');

INSERT INTO DEPARTAMENTO (cod_departamento, nome, descricaofuncional, localizacao) VALUES(default, 'RH', 'Recursos Humanos', 'Predio D, Sala 23');
INSERT INTO DEPARTAMENTO VALUES (default, 'CT', 'Contabilidade', 'Predio A, Sala 12');
INSERT INTO DEPARTAMENTO VALUES (default, 'DC', 'Doc�ncia', 'Predio B, Sala 7');
INSERT INTO DEPARTAMENTO VALUES (default, 'FI', 'Finan�as', 'Pr�dio C, Sala 2');
INSERT INTO DEPARTAMENTO VALUES (default, 'PR', 'Produ��o', 'Pr�dio E, Sala 1');
INSERT INTO DEPARTAMENTO VALUES (default, 'VD', 'Vendas', 'Predio H, Salas 1,2,3');

INSERT INTO CLIENTE (cod_cliente, endereco, cep, cod_cidade, telefone, tipo, datacadastro) VALUES (default, 'Rua Saldanha Marinho, 876', '85100000',1,'(42)623-5214', '1', '22/09/2014');
INSERT INTO CLIENTE (cod_cliente, endereco, cep, cod_cidade, telefone, tipo, datacadastro) VALUES (default, 'Av. Moacir Julio Silvestri, 3456', '85010365', 1,'(42)624-8796', '2','03/10/2014');
INSERT INTO CLIENTE (cod_cliente, endereco, cep, cod_cidade, telefone, tipo, datacadastro) VALUES (default, 'Rua Presidente Zacarias, 76', '85100020',1,'(42)622-3214', '1','02/01/2015');
INSERT INTO CLIENTE (cod_cliente, endereco, cep, cod_cidade, telefone, tipo, datacadastro) VALUES (default, 'Rua Marechal Floriano, 56', '89100000',6,'(44)333-5214', '2','15/03/2016');
INSERT INTO CLIENTE (cod_cliente, endereco, cep, cod_cidade, telefone, tipo, datacadastro) VALUES (default, 'Rua Marechal Floriano, 56', '82100000',3,'(47)893-2714', '1','01/10/2016');
INSERT INTO CLIENTE (cod_cliente, endereco, cep, cod_cidade, telefone, tipo, datacadastro) VALUES (default, 'Av. Dom Pedro I, 345', '89100030',15,'(45)271-9874', '2','01/01/2017');
INSERT INTO CLIENTE (cod_cliente, endereco, cep, cod_cidade, telefone, tipo, datacadastro) VALUES (default, 'Rua Cezumar Rocha, 456', '82234030',20,'(34)9984-3874', '1','07/07/2018');

INSERT INTO Cliente_Juridica VALUES (1,'Superpao','Grupo Superpao Cia Ltda', '1472312424', '78345377623');
INSERT INTO Cliente_Juridica VALUES (3,'Gelinski','Im�os Gelisnki Ltda', '12576312424', '3364645377623');
INSERT INTO Cliente_Juridica VALUES (5,'Lamigu�','ZMH Cia Ltda', '47234532312424', '1223377623');
INSERT INTO Cliente_Juridica VALUES (7,'Hospital e Maternidade SJT','Siqueira & Kulka', '472312424', '8345377623');

INSERT INTO Cliente_Fisica VALUES (2,'Antonio Maria Santos','5/5/1979', '452312424', '76745377');
INSERT INTO Cliente_Fisica VALUES (4,'Maria Salete Marcondes','04/12/1971', '2646312424', '78676745');
INSERT INTO Cliente_Fisica VALUES (6,'Jane Santos','04/02/1985', '47452312424', '45377623');

INSERT INTO FORNECEDOR (Cod_Fornecedor,NomeFantasia,RazaoSocial,IE,CGC,Endereco,Cod_Cidade,Telefone) VALUES (default,'Incepa','Irm�os Linderb Ltda','125478963','98745658','Av Pedro Simoes, 456', 2,'(45)98745124');
INSERT INTO FORNECEDOR (Cod_Fornecedor,NomeFantasia,RazaoSocial,IE,CGC,Endereco,Cod_Cidade,Telefone) VALUES (default,'Malucelli','Malucelli Cia Ltda','47585212589','225145752','Rua Pe. Chagas, 3465', 4,'(41)125-4478');
INSERT INTO FORNECEDOR (Cod_Fornecedor,NomeFantasia,RazaoSocial,IE,CGC,Endereco,Cod_Cidade,Telefone) VALUES (default,'Tudo Lar','Hamerski Materiais de Constru��o','121575878','2154987','Rua Vicente Machado, 345', 2,'(45)478-9854');


INSERT INTO VENDEDOR (Cod_Vendedor,Cod_Cidade,Nome,DataNascimento,Endereco,CEP,Telefone,Funcao,DataContratacao,Cod_Departamento) 
VALUES(default,2,'Tereza Mello','12/02/1961','Rua Pedro Cabral, 45','85010600','(42)629-4789','Vendedor Fixo', '01/03/2014', 6);
INSERT INTO VENDEDOR (Cod_Vendedor,Cod_Cidade,Nome,DataNascimento,Endereco,CEP,Telefone,Funcao,DataContratacao,Cod_Departamento) 
VALUES(default,1,'Joanidez Becher','08/12/1962','Av Tamandar�, 567','85010365','(42)623-5487', 'Vendedor Ambulante', '12/03/2014', 6);
INSERT INTO VENDEDOR (Cod_Vendedor,Cod_Cidade,Nome,DataNascimento,Endereco,CEP,Telefone,Funcao,DataContratacao,Cod_Departamento)
VALUES(default,20,'Julio Cesar Bara','25/03/1985','Rua das Flores, 79','82010987','(44) 987-6541', 'Gerente de Vendas', '10/01/2014', 2);
INSERT INTO VENDEDOR (Cod_Vendedor,Cod_Cidade,Nome,DataNascimento,Endereco,CEP,Telefone,Funcao,DataContratacao,Cod_Departamento) 
VALUES(default,20,'Juliana Bara','12/01/1965','Rua das Flores, 79','82010987','(44) 987-6541', 'Supervisora de Vendas', '07/05/2015', 2);
INSERT INTO VENDEDOR (Cod_Vendedor,Cod_Cidade,Nome,DataNascimento,Endereco,CEP,Telefone,Funcao,DataContratacao,Cod_Departamento) 
VALUES(default,7,'Marta Rodrigues','03/08/1975','Rua das Oliveria, 279','85060987','(41) 654-6911', 'Vendedor Fixa', '1/10/2015', 1);
INSERT INTO VENDEDOR (Cod_Vendedor,Cod_Cidade,Nome,DataNascimento,Endereco,CEP,Telefone,Funcao,DataContratacao,Cod_Departamento) 
VALUES(default,13,'Marcos Roberto Nascimento','03/08/1975','Av. Juca Tibes, 945','8706897','(47) 664-4532', 'Vendedor Fixo', '17/01/2016', 1);

INSERT INTO CLASSE VALUES (default,'AC','Acabamentos','Materiais de Acabamento');
INSERT INTO CLASSE VALUES (default,'FE','Ferragens','Ferragens em Geral');
INSERT INTO CLASSE VALUES (default,'MC','Marcenaria','Materias para Marcenaria');
INSERT INTO CLASSE VALUES (default,'TE','Telhado','Acabamentos para Telhados');
INSERT INTO CLASSE VALUES (default,'BA','Basicos','Materiais para B�sicos');

INSERT INTO PRODUTO (descricao,unidademedida,cod_classe,precovenda,estoqueminimo, embalagem) VALUES('Cimento', 'Kg', 5, 18.00, 500,'Saco');
INSERT INTO PRODUTO (descricao,unidademedida,cod_classe,precovenda,estoqueminimo, embalagem) VALUES('Cal', 'Kg', 5, 8.00, 600,'Saco');
INSERT INTO PRODUTO (descricao,unidademedida,cod_classe,precovenda,estoqueminimo, embalagem) VALUES('Areia', 'Mt', 5, 14.00, 1000, 'Pacote');
INSERT INTO PRODUTO (descricao,unidademedida,cod_classe,precovenda,estoqueminimo, embalagem) VALUES('Ferro', 'Kg', 2, 10.00, 1000, '');
INSERT INTO PRODUTO (descricao,unidademedida,cod_classe,precovenda,estoqueminimo, embalagem) VALUES('Azuleijo', 'Mt', 1, 20.00, 100, 'Caixa');
INSERT INTO PRODUTO (descricao,unidademedida,cod_classe,precovenda,estoqueminimo, embalagem) VALUES('Prego', 'Kg', 3, 5.00, 500, 'Pacote');
INSERT INTO PRODUTO (descricao,unidademedida,cod_classe,precovenda,estoqueminimo, embalagem) VALUES('Telha Barro', 'Kg', 4, 50.00, 500, 'Caixa');

INSERT INTO Pedido VALUES (default, '18/01/2018', '16/03/2018', 1, 3000);
INSERT INTO Pedido VALUES (default, '01/01/2018', '20/02/2018', 1, 51234.98);
INSERT INTO Pedido VALUES (default, '15/03/2018', '06/03/2018', 1, 234.65);
INSERT INTO Pedido VALUES (default, '12/03/2018', '03/08/2018', 2, 1345.00);
INSERT INTO Pedido VALUES (default, '05/05/2018', '06/03/2018', 2, 1100 );
INSERT INTO Pedido VALUES (default, '07/07/2018', null, 2, 5000);
INSERT INTO Pedido VALUES (default, '07/01/2018', '02/03/2018', 2, 345.98);
INSERT INTO Pedido VALUES (default, '01/07/2018', '01/03/2018', 2, 3400);
INSERT INTO Pedido VALUES (default, '06/01/2018', '01/02/2018', 3, 21000);
INSERT INTO Pedido VALUES (default, '10/02/2018', '11/02/2018', 3, 200);
INSERT INTO Pedido VALUES (default, '06/01/2018', '01/02/2018', 3, 345.98);
INSERT INTO Pedido VALUES (default, '04/01/2018', '01/02/2018', 3, 345);
INSERT INTO Pedido VALUES (default, '08/01/2018', '01/06/2018', 2, 32387);

Insert Into PedidoProduto VALUES (5,1, 10);
Insert Into PedidoProduto VALUES (5,5, 23);
Insert Into PedidoProduto VALUES (5,2, 3);
Insert Into PedidoProduto VALUES (5,6, 33);
Insert Into PedidoProduto VALUES (5,3, 2);
Insert Into PedidoProduto VALUES (5,4, 3);
Insert Into PedidoProduto VALUES (4,1, 23);
Insert Into PedidoProduto VALUES (4,2, 5);
Insert Into PedidoProduto VALUES (4,6, 2);
Insert Into PedidoProduto VALUES (4,5, 7);
Insert Into PedidoProduto VALUES (3,5, 45);
Insert Into PedidoProduto VALUES (2,3, 12);
Insert Into PedidoProduto VALUES (1,2, 8);
Insert Into PedidoProduto VALUES (3,3, 5);
Insert Into PedidoProduto VALUES (3,1, 3);
Insert Into PedidoProduto VALUES (1,6, 3);

INSERT INTO ContasPagar (Cod_Titulo, DataVencimento, Parcela, Cod_Pedido, Valor) 
       VALUES (10001, '03/03/2018', 1, 2, 2500); 
INSERT INTO ContasPagar (Cod_Titulo, DataVencimento, Parcela, Cod_Pedido, Valor) 
       VALUES (10001, '04/03/2018', 2, 2, 2500); 
INSERT INTO ContasPagar (Cod_Titulo, DataVencimento, Parcela, Cod_Pedido, Valor, DataPagamento, LocalPagamento, Juros, CorrecaoMonetaria) 
       VALUES (10101, '04/08/2018', 1, 1, 345, '05/08/2001', 'Itau', 17, 12); 
INSERT INTO ContasPagar (Cod_Titulo, DataVencimento, Parcela, Cod_Pedido, Valor, DataPagamento, LocalPagamento) 
       VALUES (10104, '02/08/2018', 1, 13, 10456, '9/02/2003', 'Caixa Empresa'); 
INSERT INTO ContasPagar (Cod_Titulo, DataVencimento, Parcela, Cod_Pedido, Valor, DataPagamento, LocalPagamento) 
       VALUES (10104, '03/08/2018', 2, 13, 10456, '8/03/2003', 'Caixa Eleltr�nico BB'); 
INSERT INTO ContasPagar (Cod_Titulo, DataVencimento, Parcela, Cod_Pedido, Valor)  
       VALUES (10116, '03/01/2018', 1, 11, 10456); 
INSERT INTO ContasPagar (Cod_Titulo, DataVencimento, Parcela, Valor)  
       VALUES (11346, '04/08/2018', 1, 100); 
INSERT INTO ContasPagar (Cod_Titulo, DataVencimento, Parcela, Valor)  
       VALUES (11346, '05/02/2018', 2, 100); 


Insert Into Lote VALUES (1,1,300, 200, 15.00, '29/05/2018');
Insert Into Lote VALUES (2,1,120, 20,  14.50, '20/05/2019');
Insert Into Lote VALUES (3,1,1000, 10000,  14.00, '01/05/2019');
Insert Into Lote VALUES (1,2,3000, 560, 5.00, '06/03/2018');
Insert Into Lote VALUES (2,2,20, 13,  4.50, '05/05/2020');
Insert Into Lote VALUES (3,2,1900, 1234,  4.00, '03/03/2020');
Insert Into Lote VALUES (1,3,1900, 456,  10.00, '03/03/2021');
Insert Into Lote VALUES (1,4,900, 35,  6.00, '01/01/2019');
Insert Into Lote VALUES (2,4,2300, 200,  8.00, '03/02/2019');
Insert Into Lote VALUES (1,5,1900, 456,  10.00, '09/04/2019');
Insert Into Lote VALUES (2,5,345, 6,  9.00, '12/03/2019');
Insert Into Lote VALUES (3,5,230, 56,  10.50, '11/08/2018');
Insert Into Lote VALUES (1,6,1700, 568,  3.00, '08/02/2020');
Insert Into Lote VALUES (1,7,3400, 6000,  25.00, '19/08/2019');


INSERT INTO Venda VALUES (2345, 2, 3, '10/02/2018', 'Rua Santos Eldelbrand, 32', 'Despachada');
INSERT INTO Venda VALUES (2346, 2, 3, '11/02/2018', 'Rua Santos Eldelbrand, 32', 'Despachada');
INSERT INTO Venda VALUES (2334, 1, 3, '12/03/2018', 'Rua Janaina Sanches, 287', 'Despachada');
INSERT INTO Venda VALUES (1235, 1, 4, '5/03/2018', 'Rua Janaina Sanches, 287', 'Despachada');
INSERT INTO Venda VALUES (3578, 3, 3, '6/02/2018', 'Rua Pergola, 467', 'Despachada');
INSERT INTO Venda VALUES (3575, 3, 6, '10/01/2018', 'Rua Pergola, 467', 'Despachada');
INSERT INTO Venda VALUES (4534, 3, 3, '08/03/2018', 'Rua Lopes Vieira, 1287', 'A mandar');
INSERT INTO Venda VALUES (7346, 5, 4, '10/03/2018', 'Rua Abio Marilte, 347', 'Despachada');
INSERT INTO Venda VALUES (8346, 5, 4, '11/08/2018', 'Rua Abio Marilte, 347', 'Despachada');


INSERT INTO VENDAPRODUTO VALUES(2345, 3,1,34);
INSERT INTO VENDAPRODUTO VALUES(2345, 2,2,6);
INSERT INTO VENDAPRODUTO VALUES(2345, 3,2,8);
INSERT INTO VENDAPRODUTO VALUES(2346, 2,5,12);
INSERT INTO VENDAPRODUTO VALUES(2334, 1,3,98);
INSERT INTO VENDAPRODUTO VALUES(2334, 2,4,5);
INSERT INTO VENDAPRODUTO VALUES(1235, 3,5,5);
INSERT INTO VENDAPRODUTO VALUES(1235, 1,6,4);
INSERT INTO VENDAPRODUTO VALUES(3578, 1,1,5);
INSERT INTO VENDAPRODUTO VALUES(3575, 3,5,2);
INSERT INTO VENDAPRODUTO VALUES(4534, 1,7,17);
INSERT INTO VENDAPRODUTO VALUES(4534, 3,5,9);
INSERT INTO VENDAPRODUTO VALUES(7346, 2,5,13);
INSERT INTO VENDAPRODUTO VALUES(8346, 2,5,13);

INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor)
       VALUES(1001,2346, '10/02/2018',1, 1234); 
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor) 
       VALUES(1010,2345, '11/02/2018',2, 1234); 
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor) 
       VALUES(3456, 2346, '20/01/2018',1, 2034); 
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor) 
       VALUES(3467, 2334, '04/03/2019',1, 400); 
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor) 
       VALUES(3567, 1235, '05/03/2019',2, 400); 
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor) 
       VALUES(3567, 8346, '06/03/2020',3, 400); 
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor, DataPagamento, Juros) 
       VALUES(1000, 3575, '06/05/2019',1, 789, '06/06/2003', 4); 
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor)
       VALUES(2450, 3578, '03/06/2018',1, 700);
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor, DataPagamento, LocalPagamento)
       VALUES(2222, 3575, '03/01/2018',1, 456, '10/03/2003', 'Banco Brasil');
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor, DataPagamento, LocalPagamento)
       VALUES(3333, 4534, '04/08/2018',1, 345, '8/04/2003', 'Banco do Brasil');
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor, DataPagamento, LocalPagamento)
       VALUES(3333, 4534, '05/08/2018',2, 345, '8/05/2003', 'Banco Itau');
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor, DataPagamento, LocalPagamento, Juros)
       VALUES(6767, 7346, '03/07/2018',1, 450, '17/05/2003', 'Caixa Empresa', 98);
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor)
       VALUES(989, 8346, '09/07/2018',1, 3450);
INSERT INTO CONTASRECEBER (cod_Titulo, Cod_NotaFiscal, DataVencimento, Parcela, Valor)
       VALUES(8989, 8346, '16/07/2018',2, 3450);









