--1
SELECT * from produto;

--2
SELECT cod_fornecedor , nomefantasia , endereco , telefone , cod_cidade from fornecedor;

--3
SELECT Vendedor.cod_vendedor, Vendedor.nome, Vendedor.funcao, Vendedor.endereco,
Cidade.nome, Estado.nome
FROM Vendedor, Cidade, Estado
WHERE Vendedor.cod_cidade = Cidade.cod_cidade AND Estado.sigla_estado =
Cidade.sigla_estado;

--4
SELECT cliente_fisica.nome from cliente_fisica , cliente where cliente.endereco = 'Rua
Marechal Floriano, 56';

--5
SELECT Venda.cod_notafiscal, Venda.datavenda, Vendedor.nome
FROM Venda, Vendedor
WHERE Venda.cod_vendedor = Vendedor.cod_vendedor AND Venda.status = ‘Despachada’;

--6
SELECT * FROM Cliente_juridica;

--7
SELECT nomefantasia, endereco, telefone, nome, sigla_estado FROM cliente_juridica w
JOIN cliente u on w.cod_cliente = u.cod_cliente
JOIN cidade y ON u.cod_cidade = y.cod_cidade WHERE u.datacadastro BETWEEN
'2015/01/01' and '2018/07/07';

--8
SELECT DISTINCT nome FROM vendedor u
JOIN venda s ON u.cod_vendedor = s.cod_vendedor
INNER JOIN cliente_juridica e ON e.cod_cliente = s.cod_cliente
WHERE e.nomefantasia = 'Gelinski';

--9
SELECT numero_lote, datavalidade, w.descricao FROM produto w
JOIN lote l ON l.cod_produto = w.cod_produto
JOIN classe y ON y.cod_classe = w.cod_classe
WHERE l.datavalidade < '2022/08/31';demo

--10
SELECT Departamento.nome, Vendedor.nome
FROM Departamento, Vendedor
WHERE Departamento.cod_departamento = Vendedor.cod_departamento;

