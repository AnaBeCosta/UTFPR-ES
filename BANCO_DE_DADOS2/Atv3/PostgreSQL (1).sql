CREATE TABLE departamento( 
cod_departamento SERIAL PRIMARY KEY, 
nome varchar(30) NOT NULL UNIQUE, 
descricaofuncional varchar(80), 
localizacao text
); 



CREATE TABLE estado( 
sigla_estado CHAR(2) CHECK (LENGTH(TRIM(sigla_estado)) = 2) PRIMARY KEY, 
nome varchar(30) NOT NULL UNIQUE
); 


CREATE TABLE cidade( 
cod_cidade SERIAL PRIMARY KEY, 
nome varchar(30) NOT NULL UNIQUE, 
sigla_estado CHAR(2), 
CONSTRAINT FK_CID_EST FOREIGN KEY (sigla_estado)REFERENCES estado(sigla_estado) ON UPDATE CASCADE ON DELETE NO ACTION
); 


CREATE TABLE vendedor( 
cod_vendedor SERIAL, 
nome varchar(40) NOT NULL, 
datanascimento date, 
endereco varchar(60), 
cep char(8), 
telefone varchar(15), 
cod_cidade int2 default 1, 
funcao varchar(50), 
datacontratacao date, 
cod_departamento int2, 
CONSTRAINT PK_VEND PRIMARY KEY(cod_vendedor), 
CONSTRAINT FK_VEND_DEPTO FOREIGN KEY (cod_departamento) REFERENCES departamento (cod_departamento) ON UPDATE CASCADE ON DELETE SET NULL, 
CONSTRAINT FK_VEND_CID FOREIGN KEY (cod_cidade) REFERENCES cidade (cod_cidade) ON UPDATE CASCADE ON DELETE SET DEFAULT
); 



CREATE TABLE fornecedor( 
nomefantasia varchar(60), 
razaosocial varchar(60), 
ie varchar(20), 
cgc varchar(20), 
endereco varchar(40), 
telefone varchar(15), 
cod_cidade int2, 
CONSTRAINT FK_FORN_CID FOREIGN KEY(cod_cidade)REFERENCES cidade(cod_cidade) ON UPDATE CASCADE ON DELETE NO ACTION
); 
alter table fornecedor add column cod_fornecedor serial; 
alter table fornecedor add CONSTRAINT PK_FORN PRIMARY KEY (cod_fornecedor); 



CREATE TABLE pedido( 
cod_pedido serial PRIMARY KEY, 
datarealizacao date, 
dataentrega date, 
cod_fornecedor int2, 
valor NUMERIC(14,2), 
CONSTRAINT FK_PED_FORN FOREIGN KEY (cod_fornecedor)REFERENCES fornecedor(cod_fornecedor) ON DELETE NO ACTION ON UPDATE CASCADE
); 


CREATE TABLE Classe( 
cod_classe serial PRIMARY KEY, 
sigla varchar(30), 
nome varchar(30), 
descricao varchar(50)
); 


CREATE TABLE produto( 
cod_produto serial PRIMARY KEY, 
descricao varchar(30), 
unidademedida varchar(20), 
precovenda numeric(14,2), 
estoqueminimo numeric(14,2), 
cod_classe int2, 
CONSTRAINT FK_PROD_CLAS FOREIGN KEY(cod_classe) REFERENCES classe(cod_classe)ON UPDATE CASCADE ON DELETE NO ACTION
); 


CREATE TABLE cliente( 
cod_cliente serial PRIMARY KEY, 
endereco varchar(40), 
cep varchar(14), 
cod_cidade int2, 
telefone varchar(14), 
tipo_cliente varchar(8), 
datacadastro date, 
CONSTRAINT FK_CLI_CID FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade) ON DELETE NO ACTION ON UPDATE CASCADE
); 



CREATE TABLE cliente_fisica( 
cod_cliente int2 PRIMARY KEY, 
nome varchar(40), 
datanascimento date, 
cpf varchar(15), 
rg varchar(10), 
CONSTRAINT FK_CLI_FIS_CLI FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente) ON UPDATE CASCADE ON DELETE NO ACTION
); 


CREATE TABLE cliente_juridica( 
cod_cliente int2 PRIMARY KEY, 
nomefantasia varchar(50), 
razaosocial varchar(45), 
ie varchar(20), 
cgc varchar(20), 
CONSTRAINT FK_CLI_JUR_CLI FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente) ON UPDATE CASCADE ON DELETE NO ACTION
); 


CREATE TABLE venda( 
cod_notafiscal serial PRIMARY KEY, 
cod_cliente int2, 
cod_vendedor int2, 
datavenda date, 
enderecoentrega varchar(30), 
status varchar(15), 
CONSTRAINT FK_VEN_CLI FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente) ON UPDATE CASCADE ON DELETE NO ACTION, 
CONSTRAINT FK_VEN_VEND FOREIGN KEY (cod_vendedor) REFERENCES vendedor(cod_vendedor) ON UPDATE CASCADE ON DELETE NO ACTION
); 


CREATE TABLE contasreceber( 
cod_titulo serial, 
datavencimento date, 
cod_notafiscal int2, 
numeroparcela varchar(5), 
valor numeric(14,2), 
datapagamento date, 
localpagamento varchar(40), 
jusos varchar(10), 
correcaomonetaria varchar(10), 
PRIMARY KEY (cod_titulo, datavencimento), 
CONSTRAINT FK_CONTASRECEBER_VEND FOREIGN KEY(cod_notafiscal) REFERENCES venda(cod_notafiscal) ON UPDATE CASCADE ON DELETE NO ACTION
); 


CREATE TABLE pedidooproduto( 
cod_pedido int2 default 1, 
cod_produto int2 default 1, 
quantidade varchar(10), 
PRIMARY KEY(cod_pedido, cod_produto), 
CONSTRAINT FK_PROD_PED FOREIGN KEY(cod_pedido) REFERENCES pedido(cod_pedido), 
CONSTRAINT FK_PROD_PROD FOREIGN KEY(cod_produto) REFERENCES produto(cod_produto) 
ON UPDATE CASCADE ON DELETE NO ACTION
); 


CREATE TABLE lote( 
numero_lote serial, 
cod_produto int2, 
quantidadeadquirida int, 
quantidadevendida int, 
precocusto numeric(14,2), 
datavalidade numeric(14,2), 
PRIMARY KEY(numero_lote, cod_produto), 
CONSTRAINT LOTE_PROD FOREIGN KEY(cod_produto)REFERENCES produto(cod_produto) ON UPDATE CASCADE ON DELETE NO ACTION
); 


CREATE TABLE vendaproduto( 
numero_lote int2, 
cod_notafiscal int2, 
cod_produto int2, 
quantidade int, 
PRIMARY KEY (numero_lote, cod_notafiscal, cod_produto), 
CONSTRAINT VEN_PROD_LOTE FOREIGN KEY (numero_lote,cod_produto) REFERENCES lote(numero_lote,cod_produto) ON UPDATE CASCADE ON DELETE NO ACTION, 
CONSTRAINT VEN_PROD_VENDA FOREIGN KEY (cod_notafiscal) REFERENCES venda(cod_notafiscal) ON UPDATE CASCADE ON DELETE NO ACTION, 
CONSTRAINT VEN_PROD_PROD FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto) ON UPDATE CASCADE ON DELETE NO ACTION
); 

--1
ALTER TABLE Cliente DROP COLUMN tipo_cliente;
ALTER TABLE Cliente ADD COLUMN tipo CHAR(1);
ALTER TABLE Cliente RENAME COLUMN tipo TO TipoCliente;
ALTER TABLE Cliente ALTER COLUMN TipoCliente SET DEFAULT 'F';
ALTER TABLE Cliente ALTER COLUMN TipoCliente SET NOT NULL;

--2
ALTER TABLE Produto ADD CONSTRAINT UnidadeSI CHECK (UnidadeMedida IN ('Kg','Mt', 'Lt'));

--3
ALTER TABLE Produto ADD Embalagem VARCHAR(30) DEFAULT ('Pacote');

--4
ALTER TABLE cliente_fisica ALTER COLUMN rg SET NOT NULL;
ALTER TABLE cliente_fisica ALTER COLUMN cpf SET not NULL;

--5
ALTER TABLE cliente ALTER COLUMN datacadastro set DEFAULT CURRENT_DATE;

--6
ALTER TABLE PedidoOProduto ALTER COLUMN quantidade SMALLINT;

--7
ALTER TABLE Vendedor ALTER COLUMN cod_cidade SET NULL;
