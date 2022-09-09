--1
--A tabela cidade será atualizada com o novo valor setado na tabela estado

--2
--A ação não pode ser concluída , pois a constraint indicada diz que On Update definir a dado como nulo , mas cod_cidade foi definida para não permitir nulo "cod_cidade int2 DEFAULT 1 NOT NULL

--3
UPDATE fornecedor SET nomefantasia = ‘teste’ WHERE cod_fornecedor = 1;

--4
UPDATE PedidoProduto SET quantidade = 101 [ WHERE cod_produto = 1 AND cod_pedido =
100 ];

--5
UPDATE cliente_fisica SET datanascimento = ‘12-12-1988’ WHERE cpf = ‘2646312424’;

--6
UPDATE cidade set cod_cidade = '123'
WHERE cod_cidade = '4';

--7
UPDATE venda SET cod_notafiscal = '500'
WHERE cod_notafiscal = '2346';
